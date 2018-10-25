From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm/page_owner: use vmalloc instead of kmalloc
Date: Thu, 25 Oct 2018 12:27:01 -0700
Message-ID: <20181025192701.GK25444@bombadil.infradead.org>
References: <1540492481-4144-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540492481-4144-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: miles.chen@mediatek.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Oct 26, 2018 at 02:34:41AM +0800, miles.chen@mediatek.com wrote:
> The kbuf used by page owner is allocated by kmalloc(),
> which means it can use only normal memory and there might
> be a "out of memory" issue when we're out of normal memory.
> 
> Use vmalloc() so we can also allocate kbuf from highmem
> on 32bit kernel.

... hang on, there's a bigger problem here.

static const struct file_operations proc_page_owner_operations = {
        .read           = read_page_owner,
};

read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
{
...
                return print_page_owner(buf, count, pfn, page,
                                page_owner, handle);
}

static ssize_t
print_page_owner(char __user *buf, size_t count, unsigned long pfn,
                struct page *page, struct page_owner *page_owner,
                depot_stack_handle_t handle)
{
...
      kbuf = kmalloc(count, GFP_KERNEL);

So I can force the kernel to make an arbitrary size allocation, triggering
OOMs and forcing swapping if I can get a file handle to this file.
The only saving grace is that (a) this is a debugfs file and (b) it's
root-only (mode 0400).  Nevertheless, I feel some clamping is called
for here.  Do we really need to output more than 4kB worth of text here?
