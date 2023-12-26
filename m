Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93ECC46CD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Dec 2023 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XQX9ADRpW0fV0acmqNA3+e/T+xSUGBzzTRQ8O4YnQM=; b=i3qKpb/U/QzeUc1wZ9+3YhMMKP
	oKMu88vtCTsA1Rl1AV2hIsWfhEYh7RS784IjQKJzOrySJL4rYQ1oHngu0ItZde3z0QzEbjXQqMGfF
	iQ6bRqFdQ84jtXyERw7ctxhidBbP2u5oP7AL+MzGkioo9cPRrM0aPsuhqazrdpgT3k2qwUGc6SKrJ
	Iau3RfNIgmtZG7IXGKLWsSev1Y92TocdRRZL5CQITIHbwyaF1VLuzBXCJte49qhJ2FtmfvfTBPz2M
	jGt2ccasypAmrtN+4wuUluoLLZk5yLfZtQlRIpraVeHAnUC88tk1uS4YKyDHshqeDIhHtfcN+CJFl
	GdMiqOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI4xj-00C61P-1s;
	Tue, 26 Dec 2023 10:47:03 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rI4xg-00C60t-0V
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Dec 2023 10:47:01 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7cc6c88fb12so1477309241.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703587616; x=1704192416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XQX9ADRpW0fV0acmqNA3+e/T+xSUGBzzTRQ8O4YnQM=;
        b=Ri6Wgd86n5LKBl32ZbTN0IR+iAufHCGaykf64XNcWZ5egUJCXR9/b/WkpMq08EgruB
         MGEyJUAxTuoi3eP4VEPkHYFqieVzGk//wTv9du1VR6EL/+quq/HStZkrIcClJppdNG+0
         TerwBsqa0H7xre86lHuHSsJXIQLh4LKOwINns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703587616; x=1704192416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XQX9ADRpW0fV0acmqNA3+e/T+xSUGBzzTRQ8O4YnQM=;
        b=wgV0M6jmqnsVj/U+a+92k9sDJoiUKiPRUum41jSeFvzm0GRVw1rmGtVAxw1QbH42mU
         zs8jHdnVJpnquCeUWkv4yqfWsMiF9fP8FxdRUCb9e/g4ufccCyFGlKECi1bW7WbYX0YZ
         ezZgdyGpoPZeqGbdd1oK/TxIvfOSzOGBYxf6gLT86/Z8JFsRHdsmOIUVdFHrjoxHxytB
         ah2C1HmaDkTjAupAO9+DmjFsDnK770fiV58rbUAJFtlQX7ROXjl4E3rWYXF9+55Wr5/R
         20+Mvij9TUF9ds7LJUfz/BXv9nGLVav747tuss+Bx+VawvmtzUgmZBRsU7wCZOLtRDoh
         9GKw==
X-Gm-Message-State: AOJu0YzghsL4M0GtlAlpgmqryyzyC60/pps9OAQPV/Gns9CUUtOXDDlE
	g2npdpjyIy3IaRmd3UWkeBUTlWFc3jcG0DfV2cxe0UfVFg==
X-Google-Smtp-Source: AGHT+IE+uxvz0SzfoJPmIBMweyIIuyW/bpeUSZuQ6AyEgHnipnUPuPSuCQtFvjkuKXBvRFYSaX6Ufw==
X-Received: by 2002:ac5:c956:0:b0:4b7:49f9:c6f4 with SMTP id s22-20020ac5c956000000b004b749f9c6f4mr674157vkm.4.1703587616319;
        Tue, 26 Dec 2023 02:46:56 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id r23-20020ab06f57000000b007cc1dab5d97sm375496uat.8.2023.12.26.02.46.55
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 02:46:55 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cc6c88fb12so1477306241.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 02:46:55 -0800 (PST)
X-Received: by 2002:a05:6102:5593:b0:464:77f1:f34a with SMTP id
 dc19-20020a056102559300b0046477f1f34amr3642595vsb.24.1703587614863; Tue, 26
 Dec 2023 02:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com> <20231220135722.192080-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220135722.192080-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 26 Dec 2023 18:46:18 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng+kkJS-g3FHe4SC-r1a6hegj3=Any07TCdvTU_apvZNg@mail.gmail.com>
Message-ID: <CAC=S1ng+kkJS-g3FHe4SC-r1a6hegj3=Any07TCdvTU_apvZNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/mediatek: dsi: Use GENMASK() for register mask definitions
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_024700_196219_2FE73D7A 
X-CRM114-Status: GOOD (  14.08  )
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

Hi Angelo,

On Wed, Dec 20, 2023 at 9:57=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change magic numerical masks with usage of the GENMASK() macro
> to improve readability.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 46 ++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index a2fdfc8ddb15..23d2c5be8dbb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -58,18 +58,18 @@
>
>  #define DSI_TXRX_CTRL          0x18
>  #define VC_NUM                         BIT(1)
> -#define LANE_NUM                       (0xf << 2)
> +#define LANE_NUM                       GENMASK(5, 2)
>  #define DIS_EOT                                BIT(6)
>  #define NULL_EN                                BIT(7)
>  #define TE_FREERUN                     BIT(8)
>  #define EXT_TE_EN                      BIT(9)
>  #define EXT_TE_EDGE                    BIT(10)
> -#define MAX_RTN_SIZE                   (0xf << 12)
> +#define MAX_RTN_SIZE                   GENMASK(15, 12)
>  #define HSTX_CKLP_EN                   BIT(16)
>
>  #define DSI_PSCTRL             0x1c
> -#define DSI_PS_WC                      0x3fff
> -#define DSI_PS_SEL                     (3 << 16)
> +#define DSI_PS_WC                      GENMASK(14, 0)
> +#define DSI_PS_SEL                     GENMASK(19, 16)

GENMASK(17, 16)
>
>  #define PACKED_PS_16BIT_RGB565         (0 << 16)
>  #define LOOSELY_PS_18BIT_RGB666                (1 << 16)
>  #define PACKED_PS_18BIT_RGB666         (2 << 16)
> @@ -109,26 +109,27 @@
>  #define LD0_WAKEUP_EN                  BIT(2)
>
>  #define DSI_PHY_TIMECON0       0x110
> -#define LPX                            (0xff << 0)
> -#define HS_PREP                                (0xff << 8)
> -#define HS_ZERO                                (0xff << 16)
> -#define HS_TRAIL                       (0xff << 24)
> +#define LPX                            GENMASK(7, 0)
> +#define HS_PREP                                GENMASK(15, 8)
> +#define HS_ZERO                                GENMASK(23, 16)
> +#define HS_TRAIL                       GENMASK(31, 24)
>
>  #define DSI_PHY_TIMECON1       0x114
> -#define TA_GO                          (0xff << 0)
> -#define TA_SURE                                (0xff << 8)
> -#define TA_GET                         (0xff << 16)
> -#define DA_HS_EXIT                     (0xff << 24)
> +#define TA_GO                          GENMASK(7, 0)
> +#define TA_SURE                                GENMASK(15, 8)
> +#define TA_GET                         GENMASK(23, 16)
> +#define DA_HS_EXIT                     GENMASK(31, 24)
>
>  #define DSI_PHY_TIMECON2       0x118
> -#define CONT_DET                       (0xff << 0)
> -#define CLK_ZERO                       (0xff << 16)
> -#define CLK_TRAIL                      (0xff << 24)
> +#define CONT_DET                       GENMASK(7, 0)
> +#define DA_HS_SYNC                     GENMASK(15, 8)

This is new, so please introduce it in a separate patch if intended.

The rest looks good to me.

Regards,
Fei


>
> +#define CLK_ZERO                       GENMASK(23, 16)
> +#define CLK_TRAIL                      GENMASK(31, 24)
>
>  #define DSI_PHY_TIMECON3       0x11c
> -#define CLK_HS_PREP                    (0xff << 0)
> -#define CLK_HS_POST                    (0xff << 8)
> -#define CLK_HS_EXIT                    (0xff << 16)
> +#define CLK_HS_PREP                    GENMASK(7, 0)
> +#define CLK_HS_POST                    GENMASK(15, 8)
> +#define CLK_HS_EXIT                    GENMASK(23, 16)
>
>  #define DSI_VM_CMD_CON         0x130
>  #define VM_CMD_EN                      BIT(0)
> @@ -138,13 +139,14 @@
>  #define FORCE_COMMIT                   BIT(0)
>  #define BYPASS_SHADOW                  BIT(1)
>
> -#define CONFIG                         (0xff << 0)
> +/* CMDQ related bits */
> +#define CONFIG                         GENMASK(7, 0)
>  #define SHORT_PACKET                   0
>  #define LONG_PACKET                    2
>  #define BTA                            BIT(2)
> -#define DATA_ID                                (0xff << 8)
> -#define DATA_0                         (0xff << 16)
> -#define DATA_1                         (0xff << 24)
> +#define DATA_ID                                GENMASK(15, 8)
> +#define DATA_0                         GENMASK(23, 16)
> +#define DATA_1                         GENMASK(31, 24)
>
>  #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
>
> --
> 2.43.0
>
>

