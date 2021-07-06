Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C526C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A21F61A14
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A21F61A14
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cq3nqoFAQoxRsn/pPZm5jcThoOj6Atk5+oYqow4slxw=; b=tPvE0FhHv3UzQi
	iM41KIDFYxiQs7mT+MFjRwjCm6bu3439TKDQhJB0brCjdqnR2fOsfmmpdV6+Pj1dJi947wOlw0Pt1
	bs2juXWqv8FU9RNyizz1M/8CQsHm/aW3ESlBS+y//79Yr59tTMyFeadb3NBrFE4H/PHxKKC0IXboK
	W4Ria9zPYgFDlgVR/AWxG2/J9zjepXpEa6M8bJGSLMaIjDjEppTz0iaqepiG2Emi7vzkv/dZfuOvS
	BuKttrYOtdvNBLVg3kuIwye9hzdSSchaE40u2A9I+CEJPXI6zQLNXCtI0/EV+nIy7udGztFhR0jt4
	KD24JDVCX+9BN6KycVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0iqr-00B9yf-86; Tue, 06 Jul 2021 11:02:53 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ipE-00B9Cy-Hr
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:01:14 +0000
Received: by mail-il1-x134.google.com with SMTP id b18so830515ilf.8
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kvBujR3c3TvHs4rJ1CKzRPrcuCVUy+R3S/pzO7+bJds=;
 b=vt3nO1YJYK2mbF4b07jhZqUkfFIxt0ck8MTi5rNSFoUBj+uFv4aRZWw8W2Ml5AlLxk
 IBJTtlPQYEp7nWRClNj3glvDeVZ6e7jeAUtGMN2xS23FTI2IbP3Z2fCk/DsKiZKFTCY+
 wwCi3c+jJsxjixMNwJbBkYb41v229v3nj8ZH03zRMnmOqanas1PGRkZOimScxUbvFBm9
 /ntCWNtqwHvMmyOOBzHPMMzCUZ2UM+ND0pH5nSZH2tX3KWoOVC+lqIzD0dsPAJeOUemq
 bTZZMr5MdJK41ahXs7cpaRGGQ+eRbIcgNwBFHoE3rmRFIxkEAgfQu1cWTONXzJjX/jkg
 NOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kvBujR3c3TvHs4rJ1CKzRPrcuCVUy+R3S/pzO7+bJds=;
 b=t+zPf4OTo0TuZ4FghWqd9EBBUPncmkRScXJ+sxD+YUkkguvjiyMJFAEPphyfNs8v21
 JrcFoTeADSJBosSsO5JvG6ceDJwNpqR9ZqC+VMbZyU7485N+uNBOw0WGFVSY5lhA4LvM
 ZSkX/FaNpWQ1PYICh4rOAIz1zl7UZgJ88LT1O1hu69sVC7dNM4kZuIUTYxdR9FF3SDHA
 o3J1re3r44mtAhXIrK64yOgtWA6Rh0IM74tUhwbh0K2Qgu3vHXOwla3JiOX4yJflNbQB
 xEHjoG9EFME/JuvOy105oB9BWustvhJOHczAK+QKJboV1qx2AK4bduCqCP6IGcC2DspX
 nAhA==
X-Gm-Message-State: AOAM530HZkrztQ5eUkDvO+Z4cOQJss+S5Nigth9UgcwgCKUOTF+yGqwu
 h0SoKt/KUm//V0BeA4yWMx8kHvj7KZZY32DeQyYr4g==
X-Google-Smtp-Source: ABdhPJzRbRkiGYUFPhDAfHS61HWOcbGhKPv72HKYRsn+Pi3oY0xKoMEYgTUXE+U8XZn4rjZBlt0oZwDUf0K+sUHvGGk=
X-Received: by 2002:a92:dd05:: with SMTP id n5mr13596206ilm.72.1625569271156; 
 Tue, 06 Jul 2021 04:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-10-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-10-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:01:00 +0800
Message-ID: <CA+Px+wWkS-PMVa4DGc9df8p8QLDFEvQXbOhYJb-rqk5P-C_+7A@mail.gmail.com>
Subject: Re: [PATCH v2,
 9/9] media: mtk-jpegenc: Refactor jpegenc device run interface
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
X-CRM114-CacheID: sfid-20210706_040112_629581_67F58A08 
X-CRM114-Status: GOOD (  12.89  )
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

On Wed, Jun 30, 2021 at 3:32 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> modify jpegenc device run func interface and add worker for encode
The description makes less sense.

> +static void mtk_jpegenc_worker(struct work_struct *work)
>  {
> -       struct mtk_jpeg_ctx *ctx = priv;
> +       struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
> +               jpeg_work);
>         struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +       struct mtk_jpeg_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
>         struct vb2_v4l2_buffer *src_buf, *dst_buf;
>         enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
>         unsigned long flags;
> -       int ret;
> +       struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
> +       int ret, i, hw_id = 0;
hw_id doesn't need to be initialized.

> +retry_select:
> +       hw_id = mtk_jpeg_select_hw(ctx);
> +       if (hw_id < 0) {
> +               ret = wait_event_interruptible(jpeg->hw_wq,
> +                               (atomic_read(hw_rdy[0]) ||
> +                               atomic_read(hw_rdy[1])) > 0);
Hard-coded refers to hw_rdy[0] and hw_rdy[1] here?

> -       mtk_jpeg_enc_reset(jpeg->reg_base);
> -
> -       mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> -       mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf);
> -       mtk_jpeg_set_enc_params(ctx, jpeg->reg_base);
> -       mtk_jpeg_enc_start(jpeg->reg_base);
> -       spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> +       spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +       mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base[0]);
> +       mtk_jpeg_set_enc_dst(ctx,
> +                            comp_jpeg[hw_id]->reg_base[0],
> +                            &dst_buf->vb2_buf);
> +       mtk_jpeg_set_enc_src(ctx,
> +                            comp_jpeg[hw_id]->reg_base[0],
> +                            &src_buf->vb2_buf);
> +       mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base[0]);
> +       mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base[0]);
Why it uses reg_base[0]?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
