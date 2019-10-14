From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/2] kasan: detect negative size in memory operation
 function
Date: Mon, 14 Oct 2019 08:05:06 -0700
Message-ID: <20191014150506.GX32665@bombadil.infradead.org>
References: <20191014103632.17930-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191014103632.17930-1-walter-zh.wu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Oct 14, 2019 at 06:36:32PM +0800, Walter Wu wrote:
> @@ -110,8 +111,9 @@ void *memset(void *addr, int c, size_t len)
>  #undef memmove
>  void *memmove(void *dest, const void *src, size_t len)
>  {
> -	check_memory_region((unsigned long)src, len, false, _RET_IP_);
> -	check_memory_region((unsigned long)dest, len, true, _RET_IP_);
> +	if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
> +	!check_memory_region((unsigned long)dest, len, true, _RET_IP_))

This indentation is wrong.  Should be:
+	if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
+	    !check_memory_region((unsigned long)dest, len, true, _RET_IP_))

(also in one subsequent function)
