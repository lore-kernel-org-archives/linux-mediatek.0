From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4] mm/page_owner: clamp read count to PAGE_SIZE
Date: Tue, 6 Nov 2018 13:51:21 -0800
Message-ID: <20181106135121.dd015f188709c4ccb2bff52c@linux-foundation.org>
References: <1541091607-27402-1-git-send-email-miles.chen@mediatek.com>
        <20181101144723.3ddc1fa1ab7f81184bc2fdb8@linux-foundation.org>
        <FD1082D9-916E-47A4-95D3-59F308AD6D55@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <FD1082D9-916E-47A4-95D3-59F308AD6D55@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Kucharski <william.kucharski@oracle.com>
Cc: miles.chen@mediatek.com, Michal Hocko <mhocko@suse.com>, Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Michal Hocko <mhocko@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, 1 Nov 2018 18:41:33 -0600 William Kucharski <william.kucharski@oracle.com> wrote:

> 
> 
> > On Nov 1, 2018, at 3:47 PM, Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > -	count = count > PAGE_SIZE ? PAGE_SIZE : count;
> > +	count = min_t(size_t, count, PAGE_SIZE);
> > 	kbuf = kmalloc(count, GFP_KERNEL);
> > 	if (!kbuf)
> > 		return -ENOMEM;
> 
> Is the use of min_t vs. the C conditional mostly to be more self-documenting?

Yup.  It saves the reader from having to parse the code to figure out
"this is a min operation".
