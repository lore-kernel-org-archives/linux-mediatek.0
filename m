Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A85C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 07:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF5C60230
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 07:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF5C60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEIHFmTioQk8uNOBszkZczoKYym3MiHRKbE1koaIWS8=; b=t1zzKei9IsigVy
	EZDleKD4K2M8bZWRs0Jr98SokPU7qHPlbQ+a5+I6RCYLaiDapLHp2E3CiMLS4g9UMOtA25JyZHGPJ
	TL7hBaRYKRFeAVOr4pkR3flSkrDXMwI3Yfx2LRMgSkLiZWTummU2WQ5OowppRo+ZCWngIclcoDn0W
	gZtbTRfClOVEAtv/btxgV9weVaa8ghxCpRbnvInTb/zCzvgWWjlF3zTVuDiT0xl3hcZMTdVGjd7in
	Eg7OsWzkSXa/RbN7HBLuuHLB3UI3JGcxmPsZdL1fOBv19Vr+2m1hIeOquKty+UQz/rb9E+IT6oxeO
	L9fdMyrftxFkCMeiTfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2qML-006LDm-GH; Mon, 12 Jul 2021 07:28:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2qMI-006LBv-PR; Mon, 12 Jul 2021 07:28:08 +0000
X-UUID: 110591268a634a76b668bd4f73f61441-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RaHR82D17SfxYYxbMS4VegTIpCJoSq06AsIDCLpUfYU=; 
 b=OJ++dcyktadjb9gMSdjrbHgWMwtj5tl6Niat8K1goIZ++yGT3QsWXxzDuSSCiPlYz22xkVZvF39RRVfL67MGPhH0oKyMckft8Vjosl6VXRO8cxBoaKu2mwQJktRx4mU75gJy4ytblCh3w8l3OC87t44rULenK0VBOzMWR67SMaw=;
X-UUID: 110591268a634a76b668bd4f73f61441-20210712
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 754523131; Mon, 12 Jul 2021 00:28:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 00:27:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 15:27:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 15:27:55 +0800
Message-ID: <1626074875.7221.15.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 07/14] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
From: mtk12024 <yunfei.dong@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Jul 2021 15:27:55 +0800
In-Reply-To: <CA+Px+wUjJwksVfU6N8VZ9WMw-F-DHu67XwvDvMoiMcUBKF=P6Q@mail.gmail.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-8-yunfei.dong@mediatek.com>
 <CA+Px+wUjJwksVfU6N8VZ9WMw-F-DHu67XwvDvMoiMcUBKF=P6Q@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_002806_864089_EE2B4B3A 
X-CRM114-Status: GOOD (  31.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tzung-Bi,

Thanks for your detail feedback.
I add the description according to your each comments.

On Fri, 2021-07-09 at 17:39 +0800, Tzung-Bi Shih wrote:
> On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > @@ -464,6 +469,11 @@ struct mtk_vcodec_enc_pdata {
> >   * comp_dev: component hardware device
> >   * component_node: component node
> >   * comp_idx: component index
> > + *
> > + * core_read: Wait queue used to signalize when core get useful lat buffer
> > + * core_queue: List of V4L2 lat_buf
> To be neat, replace "Wait" to "wait" and "List" to "list".
Will fix.
> > +int vdec_msg_queue_init(
> > +       struct mtk_vcodec_ctx *ctx,
> > +       struct vdec_msg_queue *msg_queue,
> > +       core_decode_cb_t core_decode,
> > +       int private_size)
> > +{
> > +       struct vdec_lat_buf *lat_buf;
> > +       int i, err;
> > +
> > +       init_waitqueue_head(&msg_queue->lat_read);
> > +       INIT_LIST_HEAD(&msg_queue->lat_queue);
> > +       spin_lock_init(&msg_queue->lat_lock);
> > +       msg_queue->num_lat = 0;
> > +
> > +       msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> > +               ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> > +
> > +       err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
> > +       if (err) {
> > +               mtk_v4l2_err("failed to allocate wdma_addr buf");
> > +               return -ENOMEM;
> > +       }
> > +       msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
> > +       msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
> > +
> > +       for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> > +               lat_buf = &msg_queue->lat_buf[i];
> > +
> > +               lat_buf->wdma_err_addr.size = VDEC_ERR_MAP_SZ_AVC;
> > +               err = mtk_vcodec_mem_alloc(ctx, &lat_buf->wdma_err_addr);
> > +               if (err) {
> > +                       mtk_v4l2_err("failed to allocate wdma_err_addr buf[%d]", i);
> > +                       return -ENOMEM;
> > +               }
> > +
> > +               lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
> > +               err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
> > +               if (err) {
> > +                       mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
> > +                       return -ENOMEM;
> > +               }
> > +
> > +               lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
> > +               if (!lat_buf->private_data) {
> > +                       mtk_v4l2_err("failed to allocate private_data[%d]", i);
> > +                       return -ENOMEM;
> > +               }
> > +
> > +               lat_buf->ctx = ctx;
> > +               lat_buf->core_decode = core_decode;
> > +               vdec_msg_queue_buf_to_lat(lat_buf);
> > +       }
> Doesn't it need to call mtk_vcodec_mem_free() and kfree() for any failure paths?
When allocate memory fail, will call deinit function auto, then free all allocated memory.
> > +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> > +       struct mtk_vcodec_dev *dev)
> > +{
> > +       struct vdec_lat_buf *buf;
> > +       int ret;
> > +
> > +       spin_lock(&dev->core_lock);
> > +       if (list_empty(&dev->core_queue)) {
> > +               mtk_v4l2_debug(3, "core queue is NULL, num_core = %d", dev->num_core);
> > +               spin_unlock(&dev->core_lock);
> > +               ret = wait_event_freezable(dev->core_read,
> > +                       !list_empty(&dev->core_queue));
> > +               if (ret)
> > +                       return NULL;
> Should be !ret?
According the definidtion, when condition is true, return value is 0.
#define wait_event_freezable(wq_head, condition)				\
({										\
	int __ret = 0;								\
	might_sleep();								\
	if (!(condition))							\
		__ret = __wait_event_freezable(wq_head, condition);		\
	__ret;									\
}) 
> > +void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
> > +       struct vdec_lat_buf *buf)
> > +{
> > +       spin_lock(&dev->core_lock);
> > +       list_add_tail(&buf->core_list, &dev->core_queue);
> > +       dev->num_core++;
> > +       wake_up_all(&dev->core_read);
> > +       mtk_v4l2_debug(3, "queu buf addr: (0x%p)", buf);
> Typo.
> 
> > +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
> > +{
> > +       long timeout_jiff;
> > +       int ret, i;
> > +
> > +       for (i = 0; i < NUM_BUFFER_COUNT + 2; i++) {
> > +              timeout_jiff = msecs_to_jiffies(1000);
> > +              ret = wait_event_timeout(msg_queue->lat_read,
> > +                    msg_queue->num_lat == NUM_BUFFER_COUNT, timeout_jiff);
> > +              if (ret) {
> > +                     mtk_v4l2_debug(3, "success to get lat buf: %d",
> > +                            msg_queue->num_lat);
> > +                     return true;
> > +              }
> > +       }
> Why does it need the loop?  i is unused.
Core maybe decode timeout, need to wait all core buffer process
completely.
> > +void vdec_msg_queue_deinit(
> > +       struct mtk_vcodec_ctx *ctx,
> > +       struct vdec_msg_queue *msg_queue)
> > +{
> > +       struct vdec_lat_buf *lat_buf;
> > +       struct mtk_vcodec_mem *mem;
> > +       int i;
> > +
> > +       mem = &msg_queue->wdma_addr;
> > +       if (mem->va)
> > +               mtk_vcodec_mem_free(ctx, mem);
> > +       for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> > +               lat_buf = &msg_queue->lat_buf[i];
> > +
> > +               mem = &lat_buf->wdma_err_addr;
> > +               if (mem->va)
> > +                       mtk_vcodec_mem_free(ctx, mem);
> > +
> > +               mem = &lat_buf->slice_bc_addr;
> > +               if (mem->va)
> > +                       mtk_vcodec_mem_free(ctx, mem);
> > +
> > +               if (lat_buf->private_data)
> > +                       kfree(lat_buf->private_data);
> > +       }
> > +
> > +       msg_queue->init_done = false;
> Have no idea what init_done does in the code.  It is not included in
> any branch condition.
When call vdec_msg_queue_init will set this parameter to true.
> > +/**
> > + * vdec_msg_queue_init - init lat buffer information.
> > + * @ctx: v4l2 ctx
> > + * @msg_queue: used to store the lat buffer information
> > + * @core_decode: core decode callback for each codec
> > + * @private_size: the private data size used to share with core
> > + */
> > +int vdec_msg_queue_init(
> > +       struct mtk_vcodec_ctx *ctx,
> > +       struct vdec_msg_queue *msg_queue,
> > +       core_decode_cb_t core_decode,
> > +       int private_size);
> Would prefer to have *msg_queue as the first argument (also applies to
> all operators of vdec_msg_queue).
Can fix.
> > +/**
> > + * vdec_msg_queue_get_core_buf - get used core buffer for lat decode.
> > + * @dev: mtk vcodec device
> > + */
> > +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> > +       struct mtk_vcodec_dev *dev);
> This is weird: vdec_msg_queue's operator but manipulating mtk_vcodec_dev?
vdec_msg_queue is used to share message between lat and core, for each
instance has its lat msg queue list, but all instance share one core msg
queue list. When try to get core buffer need to get it from core queue
list. Then queue it to lat queue list when core decode done.
> > +
> > +/**
> > + * vdec_msg_queue_buf_to_core - queue buf to the core for core decode.
> > + * @dev: mtk vcodec device
> > + * @buf: current lat buffer
> > + */
> > +void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
> > +       struct vdec_lat_buf *buf);
> Also weird.
> 
> > +/**
> > + * vdec_msg_queue_buf_to_lat - queue buf to lat for lat decode.
> > + * @buf: current lat buffer
> > + */
> > +void vdec_msg_queue_buf_to_lat(struct vdec_lat_buf *buf);
> It should at least accept a struct vdec_msg_queue argument (or which
> msg queue should the buf put into?).
All buffer is struct vdec_lat_buf, used to share info between lat and core queue list.
> > +/**
> > + * vdec_msg_queue_update_ube_rptr - used to updata the ube read point.
> Typo.
> 
> > +/**
> > + * vdec_msg_queue_update_ube_wptr - used to updata the ube write point.
> Typo.
> 
> > +/**
> > + * vdec_msg_queue_deinit - deinit lat buffer information.
> > + * @ctx: v4l2 ctx
> > + * @msg_queue: used to store the lat buffer information
> > + */
> > +void vdec_msg_queue_deinit(
> > +       struct mtk_vcodec_ctx *ctx,
> > +       struct vdec_msg_queue *msg_queue);
> Would prefer to have *msg_queue as the first argument.
Yes, can fix.
> 
> The position of struct vdec_msg_queue is weird.  It looks like the msg
> queue is only for struct vdec_lat_buf.  If so, would vdec_msg_queue be
> better to call vdec_lat_queue or something similar?
> 
> It shouldn't touch the core queue in mtk_vcodec_dev anyway.  Is it
> possible to generalize the queue-related code for both lat and core
> queues?
Lat queue list is separately for each instance, but only has one core
queue list.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
