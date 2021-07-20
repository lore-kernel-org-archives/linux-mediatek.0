Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F59C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 05:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092C7610F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 05:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092C7610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYeyxutZqJpR2XdyFRhffsWbZS7Sa2dhUpzHZyO+zek=; b=qC8eMfsncQLd7R
	vE/fi3waAKiCqNL0gCGj9XY8bW6TbtfMu9vSsoZLVBvA6w9Eo+Wsi2tGpF0NiaAeDGvwJZLq1awl9
	0E+8OZuoswfn8Isk+ycqj6mDkPgHkUXEZCX5B/MYRe5pKvpgGs1eVaRyet36AaKdSoLSE8yTQRaf7
	DLjsmF7kUHTuUt0Vtg/eaJVWUP2JqokQgLikoig7dcz42TplMgnWbLqxz/ygUjWzldH9UojYbVFnR
	zwXcybLsdIeNlTPSBCs7rZRaPwyoR/50JkHzVN6ps2zDzjGsq3i6Qhy24Yr/Zjh8jwuS8vA4MYbfk
	XrT2ObQFyjkBhCZibWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5hsn-00Bs2u-RD; Tue, 20 Jul 2021 05:01:29 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5hsZ-00Bs12-HY
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 05:01:18 +0000
Received: by mail-il1-x129.google.com with SMTP id r16so18077851ilt.11
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Jul 2021 22:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sdFmRaMOmgHuGWvIA23Uxlb55xudqfFv81rs6+IjDL8=;
 b=ev1KPypUlq3y0Q4/dy0N6VoE6A7j4QNY+od7m8kBCzEroX+XGVjvgM4EjjxV9Tse0k
 tYpASYDiB4O80BGdwAp9NKlwF1WBPnoLL5GIw4wqt6OimddHmlmr/PD4S03FNEeHnsDq
 ns9+32yAu01J8lLJKvy5Tt42o2zvu2IMmYY/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sdFmRaMOmgHuGWvIA23Uxlb55xudqfFv81rs6+IjDL8=;
 b=KyLzDDXdR4uoKoaiXVbBxQ7HxfSXwlb0duyfA+h8VFnpqjl7avq+JO+3VUFS3nrVik
 H3TJhBecC1Vr+cRlefGlOD+HWVZVtonE9fUBgG0grqFt/88GMxA2Op9MnPpkipuSACUb
 pGqxfIF4SUyB4jI5udSSqkgxeyzzg0scg9zuDsmdAHhGgnuwsqH6lf3kZi9DArDbP0JZ
 ojAIuCVlptwynOBY7FuG2SL8M9K6b4D556K2qhN+OJWMZNY49mfX7iST4XMdRRSuwjXu
 S6EWghw1wFtf5E4PVCA3kN5QUpBQ6nqbrFll5KGhw053vqSrQFDQe8UvKX5JYGtjhF2v
 yROQ==
X-Gm-Message-State: AOAM530YqmpU6Kea0NQWPh25S2BbWnSvhSUrLW3bNbiy+rQvbg5KS/t4
 U0c7IHI31tK1ckZ3/Bt+M6gEPo2I8lsv9Zh2SApd0w==
X-Google-Smtp-Source: ABdhPJxvZdJx3bv0pe2kdZh0PN0L4BVAX2MZFdn/Gb2Ux/JNOFo8roz4c1a5MLWVtRCFH1YMiTt1HHEqW3KZXcnUX08=
X-Received: by 2002:a92:d305:: with SMTP id x5mr20065108ila.150.1626757274018; 
 Mon, 19 Jul 2021 22:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <1626683082-29570-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626683082-29570-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626683082-29570-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 20 Jul 2021 13:00:48 +0800
Message-ID: <CAJMQK-jsbudDCj2TjS13_z--5j+2heUgLYsCTQ23Xd7T4wUZYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: add dither 6 setting
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_220115_649482_336F63A1 
X-CRM114-Status: GOOD (  19.43  )
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

On Mon, Jul 19, 2021 at 4:24 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> in the first version dither patch
> https://patchwork.kernel.org/project/linux-mediatek/patch/1553667561-25447-13-git-send-email-yongqiang.niu@mediatek.com/
> dither 6 setting is included in that patch
I think you don't need to link the first version here.

> bit 1 is lfsr_en( "Enables LFSR-type dithering"), need enable
> bit 2 is rdither_en(Enables running order dithering), need disable
> in this issue
> https://partnerissuetracker.corp.google.com/issues/190643544
Can you describe the issue in text instead of pasting a link that is
not accessible to everyone?

>
> dither 6 setting missed in set dither common patch
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c?h=next-20210430&id=a6b7c98afdcad0f149010ae028b24f2d0dc24cdb

If this is fixing a previous patch, please add Fixes: tag instead of
pasting a link here.


>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 99cbf44..7dd8e05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -26,6 +26,7 @@
>  #define DISP_OD_CFG                            0x0020
>  #define DISP_OD_SIZE                           0x0030
>  #define DISP_DITHER_5                          0x0114
> +#define DISP_DITHER_6                          0x0118
>  #define DISP_DITHER_7                          0x011c
>  #define DISP_DITHER_15                         0x013c
>  #define DISP_DITHER_16                         0x0140
> @@ -135,6 +136,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
>
>         if (bpc >= MTK_MIN_BPC) {
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> +               mtk_ddp_write(cmdq_pkt, 0x3002, cmdq_reg, regs, DISP_DITHER_6);
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
>                 mtk_ddp_write(cmdq_pkt,
>                               DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
