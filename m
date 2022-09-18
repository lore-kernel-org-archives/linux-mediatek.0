Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E299CC32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 03:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0/uMKLaM8SkhtqE7jeGrtxqpiQGTd4JR1SqE2rgMqM=; b=LslZmWStW3PXFnmuYs9EWd400E
	BqjrH72TEKZy5+5/wXFv3F/1tobZpCSE6KNssTxK7fM9E4ZyLKl3TY3Sfkbc+XfWFaqu1jCVEx0KA
	/idZip7FxXuUACBlB53XAhmj1OpQxT5C5SfEfJGuAV32enah5aSWW/7Akh7PgRUAB/6HaHvoqe80N
	oUFqlRnxbB+9Z/UzjRjbVqm+rWDiEtCSihzUUfoFFOKmJ2Krm0sUQ1TbiCN5d9sat8xYoEySFIiSq
	CdvzYNcUcz/B1hQ8Ko/LVjMMhHOZzSyELLYaz9pA40BV4mMbw0LyhQkvBqh2o1vIPsej+OwgtGLun
	EKvKjRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZkm2-00BgPq-AT; Sun, 18 Sep 2022 03:15:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZklm-00BgEx-UG; Sun, 18 Sep 2022 03:15:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C5603B80E46;
	Sun, 18 Sep 2022 03:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776E0C433D6;
	Sun, 18 Sep 2022 03:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663470895;
	bh=5PJlL3K4WjDO4Ia3Zw/qBaxPGabUG64NDC3dMQGI5Ds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oSPO0Kdcf69Jxj57UDgpsi3UVOfFLHldhVXMIE5kE6gjMs+83qvCFmfkHpTmQLRIt
	 xc7kmS/7ts3IoYjCGan9aTnfO4lJhms4j4zoy/Afq3sLXZJWubCA29XKd9GEKzXTME
	 ynM1+YK2MMTjLq8Ga2gNLYpAGa73VlHW8cUfGjFiKSBm7cNbcknBq4URHwZbw16knC
	 +rsJ3RXzi+fp+s8w083qvOv/prFlTykXM6K35pF/pAOhHQYOfBWKmd8XkS4CfOtUQC
	 2PR/7aLRr1aN2cwbAEhcKhFRtm0NTiCq+aICqDoMb2oEoqGn19NlCAIODtrrrHK+mi
	 iNtFpfw8mgBNg==
Received: by mail-ot1-f41.google.com with SMTP id w10-20020a056830410a00b00655d70a1aeaso5225880ott.3;
        Sat, 17 Sep 2022 20:14:55 -0700 (PDT)
X-Gm-Message-State: ACrzQf0MUWIoxLRdHK63tnmBnuMEI9HK3QuyMVsGlo4c967b3si1Ao5n
	y5A/Hv8C/BQBfzlVHvCNIgmSfaJkMq8EUD9OIA==
X-Google-Smtp-Source: AMsMyM6zKLFoJQ32qnUyE1JLvYUKM4ikV31GxwKs2esyNQgk2pwlix/NyhX/rOQFhXGBqYTqoklKd0ohzXIEysLouX0=
X-Received: by 2002:a05:6830:2781:b0:65a:4e1:b3d2 with SMTP id
 x1-20020a056830278100b0065a04e1b3d2mr269930otu.77.1663470894681; Sat, 17 Sep
 2022 20:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com> <20220916133821.27980-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20220916133821.27980-3-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:14:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+r9yFC3swQK+HoYZ7KE8UjPq_agHoQpQ0s0cit_LLFQ@mail.gmail.com>
Message-ID: <CAAOTY_9+r9yFC3swQK+HoYZ7KE8UjPq_agHoQpQ0s0cit_LLFQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: dp: Remove unused register definitions
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Guillaume Ranquet <granquet@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jitao Shi <jitao.shi@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	liangxu.xu@mediatek.com, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_201459_283436_3DB7640E 
X-CRM114-Status: GOOD (  13.42  )
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

Hi, Bo-Chen:

Bo-Chen Chen <rex-bc.chen@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Some definitions in mtk_dp_reg.h are not used, so remove these
> redundant codes.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/medi=
atek/mtk_dp_reg.h
> index 096ad6572a5e..84e38cef03c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -153,8 +153,6 @@
>  #define CH_STATUS_1_DP_ENC0_P0_MASK                    GENMASK(15, 0)
>  #define MTK_DP_ENC0_P0_3094                    0x3094
>  #define CH_STATUS_2_DP_ENC0_P0_MASK                    GENMASK(7, 0)
> -#define MTK_DP_ENC0_P0_30A0                    0x30a0
> -#define DP_ENC0_30A0_MASK                              (BIT(7) | BIT(8) =
| BIT(12))
>  #define MTK_DP_ENC0_P0_30A4                    0x30a4
>  #define AU_TS_CFG_DP_ENC0_P0_MASK                      GENMASK(7, 0)
>  #define MTK_DP_ENC0_P0_30A8                    0x30a8
> @@ -171,8 +169,6 @@
>  #define MTK_DP_ENC0_P0_312C                    0x312c
>  #define ASP_HB2_DP_ENC0_P0_MASK                                GENMASK(7=
, 0)
>  #define ASP_HB3_DP_ENC0_P0_MASK                                GENMASK(1=
5, 8)
> -#define MTK_DP_ENC0_P0_3130                    0x3130
> -#define MTK_DP_ENC0_P0_3138                    0x3138
>  #define MTK_DP_ENC0_P0_3154                    0x3154
>  #define PGEN_HTOTAL_DP_ENC0_P0_MASK                    GENMASK(13, 0)
>  #define MTK_DP_ENC0_P0_3158                    0x3158
> @@ -206,8 +202,6 @@
>  #define SDP_PACKET_TYPE_DP_ENC1_P0_MASK                        GENMASK(4=
, 0)
>  #define SDP_PACKET_W_DP_ENC1_P0                                BIT(5)
>  #define SDP_PACKET_W_DP_ENC1_P0_MASK                   BIT(5)
> -#define MTK_DP_ENC1_P0_328C                    0x328c
> -#define VSC_DATA_RDY_VESA_DP_ENC1_P0_MASK              BIT(7)
>  #define MTK_DP_ENC1_P0_3300                    0x3300
>  #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_VAL             2
>  #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK            GENMASK(9, 8)
> --
> 2.18.0
>

