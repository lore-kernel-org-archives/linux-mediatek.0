From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/1] tracing: Fix event_trace_printk loss on
 printk_format.
Date: Tue, 12 Feb 2019 20:41:13 -0500
Message-ID: <20190212204113.5ecaa2a1@gandalf.local.home>
References: <1549971717-4693-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549971717-4693-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andress Kuo <andress.kuo@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 12 Feb 2019 19:41:57 +0800
Mars Cheng <mars.cheng@mediatek.com> wrote:

> From: Andress Kuo <andress.kuo@mediatek.com>
> 
> If fmt on event_trace_printk is not a constant, It means that something not
> guaranteed, so the compiler optimizes the fmt out, and then the
> __trace_printk_fmt section is not filled. if __trace_printk_fmt is not
> filled, the kernel will not allocate the special buffers needed for the
> event_trace_printk() and then not shown in the file output
> sys/kernel/debug/tracing/print_formats.
> 
> Adding a "__used" to the variable in the __trace_printk_fmt section on
> event_trace_printk() will keep it around, even though it is set to NULL.
> This will keep the string from being printed in the
> sys/kernel/debug/tracing/printk_formats section.
> 
> We can also refer to commit 3debb0a9ddb1 ("tracing: Fix trace_printk()
> to print when not using bprintk()")that it had similar issue on path of
> trace_printk().

Honestly, I don't even remember why that macro was created. I think
it's a remnant from the creation of the trace events. I think the best
solution is just to nuke it. It shouldn't be used anymore.

I'll dig a bit deeper into the history of that macro, but I'm thinking
it shouldn't exist anymore.

[ /me returns from walking down memory lane ]

Wow, that brings back some wild memories. Yes, that macro must die, and
I wish the history of it could die along with it ;-) The horror of the
old ways I tell you. The event_trace_printk() was the original way we
displayed events! No real formatting, no parsing my userspace tools. It
was just a glamorized printk. It was called TRACE_FORMAT() which was
deprecated by today's TRACE_EVENT().

That macro should have been removed by commit b8e65554d80b4.

Please just send a patch to delete that macro. Let's not be maintaining
it. It gives me nightmares.

-- Steve

> 
> Signed-off-by: Andress Kuo <andress.kuo@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  include/linux/trace_events.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
> index 8a62731..26bd7c4 100644
> --- a/include/linux/trace_events.h
> +++ b/include/linux/trace_events.h
> @@ -551,7 +551,7 @@ extern int trace_define_field(struct trace_event_call *call, const char *type,
>  	__trace_printk_check_format(fmt, ##args);			\
>  	tracing_record_cmdline(current);				\
>  	if (__builtin_constant_p(fmt)) {				\
> -		static const char *trace_printk_fmt			\
> +		static const char *trace_printk_fmt __used		\
>  		  __attribute__((section("__trace_printk_fmt"))) =	\
>  			__builtin_constant_p(fmt) ? fmt : NULL;		\
>  									\
