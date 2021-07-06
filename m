Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74BDC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AF3361A06
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AF3361A06
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Gg3gkPcDXuYjAoQ9VXX0nGqrIFGmOMZE9EaUN/PEmE=; b=a0qnNnvZeq7QKB
	+p6wtIQL1OEUz0tzwF2KAZLhryXbwZwEpne8PF3cTDA6jwsbbYlYGADww7tWrnOSJEtnRh9ttMCmG
	K352OG2GCiTcGeQsJVw/UISIbFGfA3kHrWwc7FYqY2qyW59Ganh3jM6/cHr0GYVHejfypC2fZrZm4
	oYGD+Etjr0PisVd22JiA519aDk32ZgkSPCHDBq1PCFNlb7aiGxGbP9yd0KnbN8vCWTg85TW9uWxyN
	zhLEPx2+sQaJX9IDXjJITmpvQKq5XSEh2eFTIcyUBxMKA8vgu7Hf7IbnaO6odP+5T19c8a56MkYoW
	k6JPaD9z9OW7su/DlwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ipj-00B9QV-7k; Tue, 06 Jul 2021 11:01:43 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ioy-00B94p-1n
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:00:58 +0000
Received: by mail-il1-x130.google.com with SMTP id j12so9239381ils.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mf1V7YBSH0+8w/rbv+rSEQ/3yayHw9nqaQvqX58hsvw=;
 b=Mwluy9OSv9pZApWbLchbl6PRMI+pLr/JEGuuPBMJqtHNX5qBYpBYXSu8ehRp0I13Ko
 VBnBg1714BD4gYCQu9Vx1kN5uzs5CnOyjy3RbuiIl7ftNTZpht73dIei2KlktRQ8fRUQ
 P6W2vGPS8rqim7p2BtKEGPz/Vl1VWXhB52nbS6h8/Ymqc8apj+hS6CR+W4OpjBn6bY2G
 sn08YhYH9WlmPKXavGRxBJRgUGDKBNO/Wiumdto8z6t8ox6nHOBEWOGIouWsDk1ph4ve
 5ECczqd+yWPUkNb+S+K5N5Gc0Ac54nw2A0ObdV/8vYZTWOItI1nZLgWchj2epOu2tVjO
 P3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mf1V7YBSH0+8w/rbv+rSEQ/3yayHw9nqaQvqX58hsvw=;
 b=hbDbtaywPOKslf8hngiM9SxYRIRbC3Uy8qpzKaXzeKpLoaBBsAB4Abrm/NAKPuWbLR
 r5yIDC0CA7F1cwF6poa0V6nuRBSat6wZ5pegCyNdBvMdUzQ03cb11IZKeFa0KN2X6BbG
 B6IUKdD5899JONqtwuVGsdWTzM5LF0nEKx64IW8TyG233sq8qYmcGB3xcGVNP8R+wYd6
 hglPvqXJ3KkzqGPrkVMx0YxzDGjVUDBHsk2Au4CClG/i/jCU6US/QuawQrrfyFfQR/hn
 R/jU9U/zUg1RinXA4JTsBelQjYBJIrDCoX1r8Wf5pC12hGI1S/LP88N+kej94IeaTxsY
 1dHg==
X-Gm-Message-State: AOAM533eCw4aiQ8XdVKUw4tL3WOQjHhiFWYaMJprMjNOKqKhk7hSYUWG
 WP8HaT8slvaXNuzzGypiWlpmmWjtwqM7i8pFt3hFTg==
X-Google-Smtp-Source: ABdhPJxuFDnjDo6bNOl1cUk7qCNSdqyn0JG/dKa+dgAOq9yGktXZ8eP3bmILJYjEVsjAlyHZqWFmJg+GneOpnPEdI2k=
X-Received: by 2002:a05:6e02:1a2a:: with SMTP id
 g10mr12177660ile.204.1625569254711; 
 Tue, 06 Jul 2021 04:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:43 +0800
Message-ID: <CA+Px+wVLtRWsqZ3Nbd5rPrh_4dScay6BhPLCwjQaCkU8F5McuA@mail.gmail.com>
Subject: Re: [PATCH v2,
 5/9] media: mtk-jpegenc: Generalize jpeg encode irq interfaces
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040056_120765_E6E6D370 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Generalizes jpeg encode irq interfaces to support different hardware.
There are some missing pieces for using the code.  I guess the patch
needs to be submitted with other patches or needs to further be
divided.

> + * mtk_jpeg_enc_param:  General jpeg encoding parameters
> + * @enc_w:             image width
> + * @enc_h:             image height
> + * @enable_exif:       EXIF enable for jpeg encode mode
> + * @enc_quality:       destination image quality in encode mode
> + * @enc_format:                input image format
> + * @restart_interval:  JPEG restart interval for JPEG encoding
> + * @img_stride:                jpeg encoder image stride
> + * @mem_stride:                jpeg encoder memory stride
> + * @total_encdu:       total 8x8 block number
They are not well-aligned.

> +struct mtk_jpeg_enc_param {
> +       u32 enc_w;
> +       u32 enc_h;
> +       u32 enable_exif;
> +       u32 enc_quality;
> +       u32 enc_format;
> +       u32 restart_interval;
> +       u32 img_stride;
> +       u32 mem_stride;
> +       u32 total_encdu;
> +};
They are not used.

> +       u32 bs_size;
> +       int flags;
They are not used.

> +       struct mtk_jpeg_enc_param enc_param;
> +       struct mtk_jpeg_ctx *curr_ctx;
They are not used.

> +void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
> +{
> +       struct mtk_jpeg_ctx *ctx;
> +       struct vb2_v4l2_buffer *dst_buffer;
> +       struct list_head *temp_entry;
> +       struct list_head *pos;
> +       struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> +       unsigned long flags;
> +
> +       ctx = jpeg->hw_param.curr_ctx;
> +       if (!ctx) {
> +               dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
> +               return;
> +       }
> +
> +       dst_buffer = jpeg->hw_param.dst_buffer;
> +       if (!dst_buffer) {
> +               dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
> +               return;
> +       }
The caller "mtk_jpegenc_hw_irq_handler()" doesn't even check ctx and
dst_buffer.  Does mtk_jpeg_put_buf() need to validate them?

> +       spin_lock_irqsave(&ctx->done_queue_lock, flags);
> +       list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
> +       while (!list_empty(&ctx->dst_done_queue) &&
> +              (pos != &ctx->dst_done_queue)) {
Why does it need to compare `pos != &ctx->dst_done_queue`?  On a
related note, at the first time, pos will be some garbage data from
stack.

> +irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
No code is using mtk_jpegenc_hw_irq_handler.  Have no enough context
to review the code.

> +       src_buf = jpeg->hw_param.src_buffer;
> +       dst_buf = jpeg->hw_param.dst_buffer;
> +       ctx = jpeg->hw_param.curr_ctx;
> +       master_jpeg = ctx->jpeg;
Could they be inlined to above where the variables are declared?

> +enum mtk_jpeg_hw_state {
> +       MTK_JPEG_HW_IDLE = 0,
> +       MTK_JPEG_HW_BUSY = 1,
MTK_JPEG_HW_BUSY is not used.

> @@ -124,13 +135,18 @@ struct mtk_jpeg_dev {
>         struct v4l2_m2m_dev     *m2m_dev;
>         void                    *alloc_ctx;
>         struct video_device     *vdev;
> -       void __iomem            *reg_base;
>         struct device           *larb;
>         struct delayed_work job_timeout_work;
>         const struct mtk_jpeg_variant *variant;
>
> +       void __iomem *reg_base[MTK_JPEGENC_HW_MAX];
> +       int jpegenc_irq;
jpegenc_irq is not used.

> @@ -189,6 +205,12 @@ struct mtk_jpeg_ctx {
>         u8 enc_quality;
>         u8 restart_interval;
>         struct v4l2_ctrl_handler ctrl_hdl;
> +
> +       struct list_head dst_done_queue;
> +       spinlock_t done_queue_lock;     /* spinlock protecting done queue */
> +       u32 total_frame_num;
total_frame_num is not used.


Need to double confirm: why sometimes the code uses
jpeg->reg_base[MTK_JPEGENC_HW0] but sometimes jpeg->reg_base[0]?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
