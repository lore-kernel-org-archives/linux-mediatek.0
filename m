Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB79AC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 17:52:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686C5221EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 17:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7kKZACW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686C5221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Oi8HhkxUfSEDpCxBZp/ZNhT3wpK4Td7n1MA8uacRKo=; b=m7kKZACWozrxytoTzCdu/86FZ
	htp8hksG34QlR+o5OAEv+U574VHew0yLI7jKDyFAl95fiOfJ9pr2MzMwSmV1NDMdz5NR6zLopkhcv
	VQ8SgGw3MTdHAXx1WD4p38es3FYkj80A/QSSF0jzSuHvFdYP1jM33RRi8m40sKVFDlaGYPMsnB5rb
	ZxeHGAV5CokCoymo6UK1PCHQQYzX3CG7+aXoS5dL71YzHaZw0xUQs7MPzemVYuo1KRhiJDB5TkaYn
	QkXlZ4KpZFYKnEH6rQ4B3hTANyNuATsDe8fhjFIVjVZFi9IPQreh3vintKz4HmDRvQM0SwSSykCAX
	inCYersJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLrt1-0002MU-9b; Fri, 25 Sep 2020 17:51:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLrsw-0002Ki-85; Fri, 25 Sep 2020 17:51:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 0096729D5F4
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Xia Jiang <xia.jiang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v12 07/29] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
In-Reply-To: <20200814071202.25067-9-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
 <20200814071202.25067-9-xia.jiang@mediatek.com>
Date: Fri, 25 Sep 2020 20:53:09 +0300
Message-ID: <87lfgx4ube.fsf@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_135154_465613_EEF70F87 
X-CRM114-Status: GOOD (  28.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

I'm having a problem with this patch which landed in linux-next.

On Fri, 14 Aug 2020, Xia Jiang <xia.jiang@mediatek.com> wrote:
> From: Pi-Hsun Shih <pihsun@chromium.org> 
> 
> Add two functions that can be used to stop new jobs from being 
> queued / continue running queued job. This can be used while a 
> driver using m2m helper is going to suspend / wake up from 
> resume, and can ensure that there's no job running in suspend 
> process. 
> 
> BUG=b:143046833 TEST=build 
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org> Signed-off-by: 
> Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org> --- v12: add this 
> relied patch to the series --- 
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 41 
>  ++++++++++++++++++++++++++ include/media/v4l2-mem2mem.h 
>  | 22 ++++++++++++++ 2 files changed, 63 insertions(+) 
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c 
> b/drivers/media/v4l2-core/v4l2-mem2mem.c index 
> 62ac9424c92a..ddfdb6375064 100644 --- 
> a/drivers/media/v4l2-core/v4l2-mem2mem.c +++ 
> b/drivers/media/v4l2-core/v4l2-mem2mem.c @@ -43,6 +43,10 @@ 
> module_param(debug, bool, 0644); 
>  #define TRANS_ABORT		(1 << 2)   
> +/* The job queue is not running new jobs */ +#define 
> QUEUE_PAUSED		(1 << 0) + + 
>  /* Offset base for buffers on the destination queue - used to 
>  distinguish 
>   * between source and destination buffers when mmapping - they 
>   receive the same * offsets but for different queues */ 
> @@ -84,6 +88,7 @@ static const char * const m2m_entity_name[] = 
> { 
>   * @job_queue:		instances queued to run * 
>   @job_spinlock:	protects job_queue * @job_work: 
>   worker to run queued jobs. 
> + * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED. 
>   * @m2m_ops:		driver callbacks */ 
>  struct v4l2_m2m_dev { 
> @@ -101,6 +106,7 @@ struct v4l2_m2m_dev { 
>  	struct list_head	job_queue; spinlock_t 
>  job_spinlock; struct work_struct	job_work; 
> +	unsigned long		job_queue_flags; 
>   const struct v4l2_m2m_ops *m2m_ops; }; 
> @@ -263,6 +269,12 @@ static void v4l2_m2m_try_run(struct 
> v4l2_m2m_dev *m2m_dev) 
>  		return; }  
> +	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) { + 
> spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags); + 
> dprintk("Running new jobs is paused\n"); +		return; + 
> } + 
>  	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue, 
>  struct v4l2_m2m_ctx, queue); m2m_dev->curr_ctx->job_flags |= 
>  TRANS_RUNNING; 
> @@ -504,6 +516,7 @@ void v4l2_m2m_buf_done_and_job_finish(struct 
> v4l2_m2m_dev *m2m_dev, 
>   if (WARN_ON(!src_buf || !dst_buf)) goto unlock; 
> +	v4l2_m2m_buf_done(src_buf, state); 

This line looks out of place in this commit and is causing a lot 
of warnings (1 per frame). Any reason in particular why we need 
this?

[   87.825061] ------------[ cut here ]------------ [   87.829695] 
WARNING: CPU: 0 PID: 0 at 
drivers/media/common/videobuf2/videobuf2-core.c:986 
vb2_buffer_done+0x208/0x2a0 [   87.840302] Modules linked in: [ 
87.843364] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W 
5.9.0-rc6-next-20200924+ #472 [   87.852407] Hardware name: NXP 
i.MX8MQ EVK (DT) [   87.856942] pstate: 20000085 (nzCv daIf -PAN 
-UAO -TCO BTYPE=--) [   87.862953] pc : 
vb2_buffer_done+0x208/0x2a0 [   87.867224] lr : 
v4l2_m2m_buf_done_and_job_finish+0x94/0x140 [   87.872882] sp : 
ffff80001183bd50 [   87.876195] x29: ffff80001183bd50 x28: 
ffff8000115d1500  [   87.881512] x27: ffff80001128e018 x26: 
ffff00009fb4a828  [   87.886828] x25: ffff0000a4e13a08 x24: 
0000000000000080  [   87.892143] x23: 0000000000000005 x22: 
ffff0000a253bc00  [   87.897457] x21: ffff00009fb4aa98 x20: 
ffff00009fb4a800  [   87.902772] x19: ffff0000a24f0000 x18: 
0000000000000000  [   87.908086] x17: 0000000000000000 x16: 
0000000000000000  [   87.913400] x15: 0000000000000000 x14: 
0000000000000500  [   87.918714] x13: 0000000000000003 x12: 
0000000000000000  [   87.924028] x11: 0000000000000040 x10: 
ffff800011658520  [   87.929340] x9 : ffff800010998464 x8 : 
ffff0000a5800270  [   87.934655] x7 : 0000000000000000 x6 : 
ffff00009fb4aa20  [   87.939969] x5 : ffff80001183bd10 x4 : 
0000000000000000  [   87.945285] x3 : 0000000000000000 x2 : 
0000000000000000  [   87.950599] x1 : 0000000000000005 x0 : 
0000000000000005  [   87.955914] Call trace: [   87.958364] 
vb2_buffer_done+0x208/0x2a0 [   87.962288] 
v4l2_m2m_buf_done_and_job_finish+0x94/0x140 [   87.967601] 
hantro_job_finish+0xa8/0xe0 [   87.971524] 
hantro_irq_done+0x58/0x90 [   87.975275] 
imx8m_vpu_g1_irq+0x8c/0x160 [   87.979201] 
__handle_irq_event_percpu+0x68/0x2a0 [   87.983905] 
handle_irq_event_percpu+0x3c/0xa0 [   87.988347] 
handle_irq_event+0x50/0xf0 [   87.992185] 
handle_fasteoi_irq+0xc0/0x180 [   87.996283] 
generic_handle_irq+0x38/0x50 [   88.000296] 
__handle_domain_irq+0x6c/0xd0 [   88.004393] 
gic_handle_irq+0x60/0x12c [   88.008143]  el1_irq+0xbc/0x180 [ 
88.011287]  arch_cpu_idle+0x1c/0x30 [   88.014864] 
do_idle+0x220/0x270 [   88.018093]  cpu_startup_entry+0x30/0x70 [ 
88.022019]  rest_init+0xe0/0xf0 [   88.025250] 
arch_call_rest_init+0x18/0x24 [   88.029347] 
start_kernel+0x7a4/0x7e0 [   88.033013] CPU: 0 PID: 0 Comm: 
swapper/0 Tainted: G        W         5.9.0-rc6-next-20200924+ 
#472 [   88.042056] Hardware name: NXP i.MX8MQ EVK (DT) [ 
88.046585] Call trace: [   88.049034]  dump_backtrace+0x0/0x1b0 [ 
88.052697]  show_stack+0x20/0x70 [   88.056014] 
dump_stack+0xd0/0x12c [   88.059418]  __warn+0xfc/0x180 [ 
88.062474]  report_bug+0xfc/0x170 [   88.065875] 
bug_handler+0x28/0x70 [   88.069276]  brk_handler+0x70/0xe0 [ 
88.072681]  do_debug_exception+0xcc/0x1e0 [   88.076776] 
el1_sync_handler+0xd8/0x140 [   88.080697]  el1_sync+0x80/0x100 [ 
88.083926]  vb2_buffer_done+0x208/0x2a0 [   88.087852] 
v4l2_m2m_buf_done_and_job_finish+0x94/0x140 [   88.093162] 
hantro_job_finish+0xa8/0xe0 [   88.097083] 
hantro_irq_done+0x58/0x90 [   88.100831] 
imx8m_vpu_g1_irq+0x8c/0x160 [   88.104753] 
__handle_irq_event_percpu+0x68/0x2a0 [   88.109456] 
handle_irq_event_percpu+0x3c/0xa0 [   88.113899] 
handle_irq_event+0x50/0xf0 [   88.117734] 
handle_fasteoi_irq+0xc0/0x180 [   88.121832] 
generic_handle_irq+0x38/0x50 [   88.125841] 
__handle_domain_irq+0x6c/0xd0 [   88.129937] 
gic_handle_irq+0x60/0x12c [   88.133686]  el1_irq+0xbc/0x180 [ 
88.136827]  arch_cpu_idle+0x1c/0x30 [   88.140403] 
do_idle+0x220/0x270 [   88.143630]  cpu_startup_entry+0x30/0x70 [ 
88.147553]  rest_init+0xe0/0xf0 [   88.150782] 
arch_call_rest_init+0x18/0x24 [   88.154879] 
start_kernel+0x7a4/0x7e0 [   88.158542] ---[ end trace 
847145312866dff5 ]---

Regards,
Adrian

>  	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
>  	if (!dst_buf->is_held) {
>  		v4l2_m2m_dst_buf_remove(m2m_ctx);
> @@ -528,6 +541,34 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  }
>  EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
>  
> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> +{
> +	unsigned long flags;
> +	struct v4l2_m2m_ctx *curr_ctx;
> +
> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> +	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> +	curr_ctx = m2m_dev->curr_ctx;
> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +
> +	if (curr_ctx)
> +		wait_event(curr_ctx->finished,
> +			   !(curr_ctx->job_flags & TRANS_RUNNING));
> +}
> +EXPORT_SYMBOL(v4l2_m2m_suspend);
> +
> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> +	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +
> +	v4l2_m2m_try_run(m2m_dev);
> +}
> +EXPORT_SYMBOL(v4l2_m2m_resume);
> +
>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		     struct v4l2_requestbuffers *reqbufs)
>  {
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 98753f00df7e..5a91b548ecc0 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -304,6 +304,28 @@ v4l2_m2m_is_last_draining_src_buf(struct v4l2_m2m_ctx *m2m_ctx,
>  void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
>  			       struct vb2_v4l2_buffer *vbuf);
>  
> +/**
> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> + * to finish
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> + * wait for current running job to finish.
> + */
> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> +
> +/**
> + * v4l2_m2m_resume() - resume job running and try to run a queued job
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Called by a driver in the resume hook. This reverts the operation of
> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> + * there is any.
> + */
> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> +
>  /**
>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
>   *
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
