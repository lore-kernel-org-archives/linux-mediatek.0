Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD2C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u46I6go/saTRIVVfpJob0gPVrpMrbJdeJpSXHHVVJQQ=; b=y0wW2Z3S6r1NJQmsMn257tQVxc
	ea52SWWPhUoY7eTgo6mPIzJRH+T5FZ8hhJDqR8shsK5emGj0TRp87fwQ5LljK1m871Sb0sFTfXVGA
	ZsFiaN7nM3wUhgi5cW5ECQ5kMi1X4Fh1qfFC9hprfz6BGxmvCf1V2YiFtvyh87QGFQSrulInXnIwp
	+muJW1mB/o2fB7M/t/eiqmOQqAZjCifzHtXlT+CQYf6/ef5srV038H/AqT4Fs34lyysEzrH81X2cO
	3sFLsHh/rc90eWXSJS3nG3agczgmcXuzUyatd1P15zjRvzom3UwkysKui2deyVT5LygkgDVxWchep
	LiKOxceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKbS-005YNb-DE; Wed, 16 Nov 2022 15:45:30 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKbP-005YJw-RN
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 15:45:29 +0000
Received: by mail-yb1-xb33.google.com with SMTP id b131so20753049yba.11
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u46I6go/saTRIVVfpJob0gPVrpMrbJdeJpSXHHVVJQQ=;
        b=SgN/WkakGEHfrc/+/Zer8Bi4Bvl+Q4PKwpqGfiz/x3kj2OQxojmQtm0SvkAgbZb4ah
         1d9M8akX+xN3kORy+gQi1FweYbODOY8tktpwjl413BDsBTSaXcI0L9EoD3KLwRQQndbf
         aEB6Lts0HAFHwutWx7Wnuwj1cegrYdM1EQjII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u46I6go/saTRIVVfpJob0gPVrpMrbJdeJpSXHHVVJQQ=;
        b=BOvI7K2cmdGs6nlWxVKcJZDqyfNT0QGynhXcuF/XMPnjVhFWO28edLiff3rqQa1SQU
         ilXl2uWUxqiY7DDqkK0doen3fR8KMeH7SiUvxamJeerJukpBDwqVxq8SA/K2mdaFvlzY
         +R4ijmaoGmHiXYXDfdcGI9fGVuDKrRIC/rRdIG0U1ViAciNKoIbllKLBXag7g5eaMN8W
         5zkG4X2eda2AIXxzM/BTRxMQiLh+fvi1ey+DLpeUk3sdijnJvGAg679+zr6SI9CdktYg
         ncierTvuC2si6oSr0kJ+sgBovu3rDcmJp20OU6NLwX9pOgSQFWVDa47W6bT7jm4sasQW
         mS5g==
X-Gm-Message-State: ANoB5pl3pjdxOcR1NzCHNkAb2xXJyNEepVZ/yE9+UyaUUh+Y0xP6e6/V
	uUCb2KHFApyd7/VaFqoyf3QI1Pb9u+1AnJht8Ubnkg==
X-Google-Smtp-Source: AA0mqf6TjNeRj9uOCEi4E77KeqyvFXUaQvgB+JF/BfhLS/pPYGblneEtNkSsZ6z5rmJYuAfKccPMeoPDVszPeUXDro0=
X-Received: by 2002:a25:aac8:0:b0:6d0:707:9b8c with SMTP id
 t66-20020a25aac8000000b006d007079b8cmr22308755ybi.538.1668613525641; Wed, 16
 Nov 2022 07:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20221012191226.1646315-1-greenjustin@chromium.org> <CAAOTY__e43sEkXCc=F0oFopqm=4N22zpbVBqLpLqj1fc1Sn1wg@mail.gmail.com>
In-Reply-To: <CAAOTY__e43sEkXCc=F0oFopqm=4N22zpbVBqLpLqj1fc1Sn1wg@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 16 Nov 2022 10:45:14 -0500
Message-ID: <CAHC42RfKHwULZ_4O8y=S8NQgOadrqYtF93VQmp9qcJxEjFRtaA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, p.zabel@pengutronix.de, 
	airlied@linux.ie, matthias.bgg@gmail.com, daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_074527_921612_2EF18E5B 
X-CRM114-Status: GOOD (  18.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Kuang,

> > +       mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);
> >         mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
> >                               DISP_REG_OVL_CON(idx));
> > -       mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
> > +       mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb, &ovl->cmdq_reg, ovl->regs,
> >                               DISP_REG_OVL_PITCH(idx));
>
> Is this general for all MediaTek SoC? If so, separate this to an
> independent patch. Otherwise, use a device variable to separate this
> setting.

Yes and no. Technically all MediaTek SoCs have two separate registers
for the pitch, each are 16 bits, so this code is technically always
needed. However, because the lsb register is 16 bit, this issue has
never come up, because nobody has tried to display a plane that was
16384 ARGB pixels across. In fact, I think most MediaTek SoCs have a
resolution limit of 4K. The reason this issue comes up now is because
"pitch" is calculated differently for AFBC frames, and actually refers
to the size in bytes of one row of AFBC blocks. Should I still
separate this into an independent patch?

> >  }
> > @@ -492,6 +567,15 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
> >         .smi_id_en = true,
> >  };
> >
> > +static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>
> In this binding document, mt8195 ovl is compatible to mt8133 ovl.
> Please confirm that mt8195 is not identical with mt8133.

Do you mean MT8183? If so, we do not have any documentation indicating
that the MT8183 supports AFBC. Do you have some reason to believe
otherwise?

> Usually the pitch needs alignment. So I guess the formula is
>
> hdr_pitch = ALIGN(width_in_blocks * AFBC_HEADER_BLOCK_SIZE,
> AFBC_HEADER_ALIGNMENT);
> hdr_size = hdr_pitch * height_in_blocks;

The documentation does not indicate that the pitch needs alignment
beyond the AFBC header block size.

> Could you explain the meaning of hdr_pitch?

hdr_pitch refers to the size in bytes of one row of AFBC header
blocks. AFBC is a proprietary compressed frame buffer format, but from
what public information we have, it appears to be block compressed
data stored in 2 contiguous planes. The first is called the "header"
plane, and the second is called the "body" plane. The header plane
contains metadata for each block of pixel data, and the body plane
contains sparse compressed block data.


I'll send another patch with the other changes you mentioned.

Thanks!
Justin

