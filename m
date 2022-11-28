Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRCP5i+kS7Z6U29Z84RcTfhHLs05Gmm0hutojax5sCQ=; b=3le394GWz3XE7rU5riW78/Pm0f
	t6cPwlLjlkeoA/dBeIOJGoTkIwAgvYKNkdSqh/XLy1tJODJyHDZb0nmUowpqHDjvejB+Of2Pk84kv
	0TOlqx3AXpq92QsnrlGPaIttkWxlbqCzhGDKIxAXO+tHOXHNzdxnali13iHEoY3yhU0cUuuezT6pL
	k05QYna4ypVNl+puDM7e9e9xVQojj0dxLLBk98SIMkQ25g3x72jUsBG3oHIdmm0qC/wWnA2ig1PAf
	7xG0kow9iMtLMQib7i2ijbfsrG0IY+RueIlbToRBUUb+/DSQIf5vtuf5/VsSVkXJnWOnzlBz1UiWp
	MV1Q0anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozmP1-004bcZ-Md; Mon, 28 Nov 2022 22:15:03 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozmOq-004bam-LW
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 22:14:54 +0000
Received: by mail-il1-x12d.google.com with SMTP id h17so5749391ila.6
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 14:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRCP5i+kS7Z6U29Z84RcTfhHLs05Gmm0hutojax5sCQ=;
        b=j8VmxmloAfeZxEA3bXqzHAqH4WWzlyvDlESJv713QjFWvS1Hn8f7Ue3yiGK6JHS/Ue
         Zh4TzPaicWn/3R0FGXzTUisHAPSpFYj2QVIQjjccPUTBGCOh31fWgWZmgg1nf5dgXnb5
         ePvpR9jbLcUt2+vJDPVM5E3gfYIj6NrTmNdYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRCP5i+kS7Z6U29Z84RcTfhHLs05Gmm0hutojax5sCQ=;
        b=FwyN6CE+cyYkSkzl07sOluKjKXuAF2akrwYcjEGeKXUAs9uIBd/WInb8xOrAe0redl
         sBUyxtSSIH4f93sDMRlD4QJNAXDQ+dWGgM/BOEUxu2XVkwoXW5t3R+R0P4BiDGnG0dtb
         Felx4jXr22942TERQOiMQ8PjTNZ/y3Ny5O/XMa5GOLSL/IYXaRuFiDB0aJ3AfOz6uAv+
         IvnsTpDV7olI6QOEw6Qb7U2DkcH8zi5ObDFnekuSjB1719HioErbLJrkO8UvGoZBbTY9
         7a3iBY8t2dJVV02EmeV3XNLZMKizig/Qd95iWgeRzW9H6rWgA5i1LyZSKf2g7R1mxSIy
         kE3Q==
X-Gm-Message-State: ANoB5pmP2RVAN9Ef7CJyPUCAIPXYV5uFNBbpgCh78ZAlOF0PFDo6FLEU
	33cCSqXuhdt6rRkAdD5ohbv55HRfor25N4iA
X-Google-Smtp-Source: AA0mqf6DwYFxHu+TNhzUGkLkt46QZ9IwB6BWTeSL6irEorH2M5mrqCtXTiNTgNg/QM/0K7V45qapag==
X-Received: by 2002:a92:b50c:0:b0:302:f954:e74 with SMTP id f12-20020a92b50c000000b00302f9540e74mr8673035ile.220.1669673690352;
        Mon, 28 Nov 2022 14:14:50 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id x13-20020a6bda0d000000b006df29131a2csm4786679iob.28.2022.11.28.14.14.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 14:14:49 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id r81so8759209iod.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 14:14:49 -0800 (PST)
X-Received: by 2002:a05:6638:11d3:b0:389:ebdc:8f4 with SMTP id
 g19-20020a05663811d300b00389ebdc08f4mr530772jas.27.1669673688675; Mon, 28 Nov
 2022 14:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20221125-mtk-iommu-v1-0-bb5ecac97a28@chromium.org> <9e81fb3cc4f315f330c610dfb16bad50b7241f4c.camel@mediatek.com>
In-Reply-To: <9e81fb3cc4f315f330c610dfb16bad50b7241f4c.camel@mediatek.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 23:14:37 +0100
X-Gmail-Original-Message-ID: <CANiDSCv_ZBLFTp42AZz9Td_JCR0MKLooW2gtFo3woT-dOQtm8w@mail.gmail.com>
Message-ID: <CANiDSCv_ZBLFTp42AZz9Td_JCR0MKLooW2gtFo3woT-dOQtm8w@mail.gmail.com>
Subject: Re: [PATCH] iommu/mediatek: Fix crash on isr after kexec()
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "will@kernel.org" <will@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_141452_721804_D2201C70 
X-CRM114-Status: GOOD (  25.47  )
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

Hi Yong


On Mon, 28 Nov 2022 at 07:44, Yong Wu (=E5=90=B4=E5=8B=87) <Yong.Wu@mediate=
k.com> wrote:
>
> On Fri, 2022-11-25 at 17:28 +0100, Ricardo Ribalda wrote:
> > If the system is rebooted via isr(), the IRQ handler might be
> > triggerd
> > before the domain is initialized. Resulting on an invalid memory
> > access
> > error.
> >
> > Fix:
> > [    0.500930] Unable to handle kernel read from unreadable memory at
> > virtual address 0000000000000070
> > [    0.501166] Call trace:
> > [    0.501174]  report_iommu_fault+0x28/0xfc
> > [    0.501180]  mtk_iommu_isr+0x10c/0x1c0
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > To: Yong Wu <yong.wu@mediatek.com>
> > To: Joerg Roedel <joro@8bytes.org>
> > To: Will Deacon <will@kernel.org>
> > To: Robin Murphy <robin.murphy@arm.com>
> > To: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: iommu@lists.linux.dev
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/iommu/mtk_iommu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2ab2ecfe01f8..17f6be5a5097 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -454,7 +454,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void
> > *dev_id)
> >               fault_larb =3D data->plat_data-
> > >larbid_remap[fault_larb][sub_comm];
> >       }
> >
> > -     if (report_iommu_fault(&dom->domain, bank->parent_dev,
> > fault_iova,
> > +     if (dom && report_iommu_fault(&dom->domain, bank->parent_dev,
> > fault_iova,
>
>
> Which SoC does this issue happen? Does this issue is happened in the
> upstream kernel or the downstream kernel?

I am using chromeos-5.10 and chromeos-5.15 (which are pretty much upstream)=
.

I have seen this issue at least with MT8195 and MT8183


>
> Normally each port enable the iommu defaultly. Let's print the error
> log even though "dom" is null to check which port fail here. then
> analyse the port's behavior.
>
> if (!dom || report_iommu_fault(xx))
>      dev_err_ratelimited(xx)

sending a v2 with the change.

Thanks!


>
> >                              write ? IOMMU_FAULT_WRITE :
> > IOMMU_FAULT_READ)) {
> >               dev_err_ratelimited(
> >                       bank->parent_dev,
> >
> > ---
> > base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> > change-id: 20221125-mtk-iommu-13023f971298
> >
> > Best regards,



--=20
Ricardo Ribalda

