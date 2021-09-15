Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EB3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A89A61209
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A89A61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uv/oSIXNCkOhfAWoBHbFPrZhFSkViiRFSN7MOnhnVE4=; b=XOcU1FdvCIKKet7aH5WbHZns9n
	yaRYi02h9P7mo34hsB0GZXItWeCZAhsJF4zl6v5MB4trcHPofRGnokZJAUmaqXmoXTYfz07I94+wq
	o1Q9lQA2zi+gwzY/JS2n7fPSiyuJCUPmTdH01nPlslop2cEOs4+Z0Iij73aGpCZ9snw5YFYS+HJte
	wS4CdKB9YXk5PGuSQ3pt9Ip7TpBBIJcZEHoi2gQfy20yF2e7j+WhtQUbN4KGUdptKgClH6YZmrn55
	LGB4N23pNctfxiNQJeZZXLBFfPrTM2Y10F57zHOh6r3cJQSufN3qZQEnSLiRml1z4POFuMRpSaD+l
	+K40EUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUvi-009BHm-EU; Wed, 15 Sep 2021 13:26:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUve-009BGQ-NW
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631712381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vvyx60UfzJ4ItiONFPeVtHfShOzXnDQM5IO5+QWnICI=;
 b=DsmWsXCxeyMv31MykZQ2xXPQCWd8WKqBYtwphwUgThFEhgdpctgEV07355JoiE/4YtE4pS
 sy6++ISB9Rs23z4i3H303Qjl+qea4k5KYxbbp5QYy4dH0IlKEQvCacFfEs3nunruiTiI9V
 ZR0EtF0EJ+KKia0vV95eHf+f8QthLP4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-t4iDiHbkMxqc2aA3bdWYqg-1; Wed, 15 Sep 2021 09:26:20 -0400
X-MC-Unique: t4iDiHbkMxqc2aA3bdWYqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so1620224eda.6
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PLNVfP4T56EFi98NbmMuurxnOngj+c1xtiUUquS4Kac=;
 b=iCH3x4b1XAgTJnQN/8rsmFXNzQ0OupY0j2e8irGXNSNylN6EZMk3DvJqsA32EToqIc
 fqa79hcOtVA9FSKTb4FkxonGqiXbg0co8I1NVUc1R8LlSTNEVM1siWOHVHahWDFEyMvK
 GutXyTG+tevrrhhzkvaV+kZ+wcJpT2IN5Ys93T+c/UJWtibMCHXGD7LiOZQgg7L8+fm4
 Ygg167duzRwICF2WU/htwvAJlsft6XPGrUiD2ScHOFEfTdYtVrjqpdZIDeObG2uFpLm8
 Gb3LrtHBIH9iM9LxnCpzEkEYaUM1xhAsLSE/poAtAaNlQkNNc+U0xO/z4X+YUOZSWVsU
 FrTg==
X-Gm-Message-State: AOAM533Z+fsOhEUyjqCMz+/9W55oQUDM6NuyJ8KtGtk6e/SebijltrBT
 Drcb1/46AUBZWM2U6ReZXrjx8JrRtylQSVB5RiLOyqwwnHYr8WSctjdEF6Di/JOp5+FqG4Q8NBO
 o053pUuCfs7cOjsWjqekdqt1ATxPlRitX
X-Received: by 2002:a17:907:7844:: with SMTP id
 lb4mr24775789ejc.381.1631712378918; 
 Wed, 15 Sep 2021 06:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt6btJTnB/MBnZDYz3YNkoYdJaAuuF29sX8HGUXrIZC88DNOFBJGOfJ3yoFBmrIMW+oTuAXA==
X-Received: by 2002:a17:907:7844:: with SMTP id
 lb4mr24775774ejc.381.1631712378640; 
 Wed, 15 Sep 2021 06:26:18 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id h10sm7382419edf.85.2021.09.15.06.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:26:18 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:26:15 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jemele@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 10/16] mt76: mt7921: use physical addr to unify
 register access
Message-ID: <YUH0d5nPfS+6uejD@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <856edf387e8e7f444d0eaf95ffac0616571146d1.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <856edf387e8e7f444d0eaf95ffac0616571146d1.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_062622_897708_7F37BD24 
X-CRM114-Status: GOOD (  17.85  )
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
Content-Type: multipart/mixed; boundary="===============1879266967154187259=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1879266967154187259==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mzLskt4Q02/YFtkH"
Content-Disposition: inline

--mzLskt4Q02/YFtkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 15, Sean Wang wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Use physical address to unify the register access and reorder the
> entries in fixed_map table to accelerate the address lookup for
> MT7921e.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/dma.c   | 19 ++++++++--------
>  .../net/wireless/mediatek/mt76/mt7921/regs.h  | 22 +++++++++----------
>  2 files changed, 21 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/dma.c
> index be24241fb8e6..f31c4aef8b27 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> @@ -85,6 +85,14 @@ static u32 __mt7921_reg_addr(struct mt7921_dev *dev, u=
32 addr)
>  =09=09u32 mapped;
>  =09=09u32 size;
>  =09} fixed_map[] =3D {
> +=09=09{ 0x820d0000, 0x30000, 0x10000 }, /* WF_LMAC_TOP (WF_WTBLON) */
> +=09=09{ 0x820ed000, 0x24800, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_MIB) */
> +=09=09{ 0x820e4000, 0x21000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_TMAC) */
> +=09=09{ 0x820e7000, 0x21e00, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_DMA) */
> +=09=09{ 0x820eb000, 0x24200, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_LPON) */
> +=09=09{ 0x820e2000, 0x20800, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_AGG) */
> +=09=09{ 0x820e3000, 0x20c00, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_ARB) */
> +=09=09{ 0x820e5000, 0x21400, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_RMAC) */
>  =09=09{ 0x00400000, 0x80000, 0x10000}, /* WF_MCU_SYSRAM */
>  =09=09{ 0x00410000, 0x90000, 0x10000}, /* WF_MCU_SYSRAM (configure regis=
ter) */
>  =09=09{ 0x40000000, 0x70000, 0x10000}, /* WF_UMAC_SYSRAM */

not related to this patch, but since you are chaing it can you please add a
space at the end of the line above? Thanks :)

Regards,
Lorenzo

> @@ -99,22 +107,15 @@ static u32 __mt7921_reg_addr(struct mt7921_dev *dev,=
 u32 addr)
>  =09=09{ 0x81020000, 0xc0000, 0x10000 }, /* WF_TOP_MISC_ON */
>  =09=09{ 0x820c0000, 0x08000, 0x4000 }, /* WF_UMAC_TOP (PLE) */
>  =09=09{ 0x820c8000, 0x0c000, 0x2000 }, /* WF_UMAC_TOP (PSE) */
> -=09=09{ 0x820cc000, 0x0e000, 0x2000 }, /* WF_UMAC_TOP (PP) */
> +=09=09{ 0x820cc000, 0x0e000, 0x1000 }, /* WF_UMAC_TOP (PP) */
> +=09=09{ 0x820cd000, 0x0f000, 0x1000 }, /* WF_MDP_TOP */
>  =09=09{ 0x820ce000, 0x21c00, 0x0200 }, /* WF_LMAC_TOP (WF_SEC) */
>  =09=09{ 0x820cf000, 0x22000, 0x1000 }, /* WF_LMAC_TOP (WF_PF) */
> -=09=09{ 0x820d0000, 0x30000, 0x10000 }, /* WF_LMAC_TOP (WF_WTBLON) */
>  =09=09{ 0x820e0000, 0x20000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_CFG) */
>  =09=09{ 0x820e1000, 0x20400, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_TRB) */
> -=09=09{ 0x820e2000, 0x20800, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_AGG) */
> -=09=09{ 0x820e3000, 0x20c00, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_ARB) */
> -=09=09{ 0x820e4000, 0x21000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_TMAC) */
> -=09=09{ 0x820e5000, 0x21400, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_RMAC) */
> -=09=09{ 0x820e7000, 0x21e00, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_DMA) */
>  =09=09{ 0x820e9000, 0x23400, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_WTBLOFF) *=
/
>  =09=09{ 0x820ea000, 0x24000, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_ETBF) */
> -=09=09{ 0x820eb000, 0x24200, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_LPON) */
>  =09=09{ 0x820ec000, 0x24600, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_INT) */
> -=09=09{ 0x820ed000, 0x24800, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_MIB) */
>  =09=09{ 0x820f0000, 0xa0000, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_CFG) */
>  =09=09{ 0x820f1000, 0xa0600, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_TRB) */
>  =09=09{ 0x820f2000, 0xa0800, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_AGG) */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regs.h
> index 26fb11823762..cb6069024320 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
> @@ -14,7 +14,7 @@
>  #define MT_MCU_INT_EVENT_SER_TRIGGER=09BIT(2)
>  #define MT_MCU_INT_EVENT_RESET_DONE=09BIT(3)
> =20
> -#define MT_PLE_BASE=09=09=090x8000
> +#define MT_PLE_BASE=09=09=090x820c0000
>  #define MT_PLE(ofs)=09=09=09(MT_PLE_BASE + (ofs))
> =20
>  #define MT_PLE_FL_Q0_CTRL=09=09MT_PLE(0x1b0)
> @@ -26,7 +26,7 @@
>  =09=09=09=09=09       ((n) << 2))
>  #define MT_PLE_AMSDU_PACK_MSDU_CNT(n)=09MT_PLE(0x10e0 + ((n) << 2))
> =20
> -#define MT_MDP_BASE=09=09=090xf000
> +#define MT_MDP_BASE=09=09=090x820cd000
>  #define MT_MDP(ofs)=09=09=09(MT_MDP_BASE + (ofs))
> =20
>  #define MT_MDP_DCR0=09=09=09MT_MDP(0x000)
> @@ -49,7 +49,7 @@
>  #define MT_MDP_TO_WM=09=09=091
> =20
>  /* TMAC: band 0(0x21000), band 1(0xa1000) */
> -#define MT_WF_TMAC_BASE(_band)=09=09((_band) ? 0xa1000 : 0x21000)
> +#define MT_WF_TMAC_BASE(_band)=09=09((_band) ? 0x820f4000 : 0x820e4000)
>  #define MT_WF_TMAC(_band, ofs)=09=09(MT_WF_TMAC_BASE(_band) + (ofs))
> =20
>  #define MT_TMAC_TCR0(_band)=09=09MT_WF_TMAC(_band, 0)
> @@ -74,7 +74,7 @@
>  #define MT_TMAC_TRCR0(_band)=09=09MT_WF_TMAC(_band, 0x09c)
>  #define MT_TMAC_TFCR0(_band)=09=09MT_WF_TMAC(_band, 0x1e0)
> =20
> -#define MT_WF_DMA_BASE(_band)=09=09((_band) ? 0xa1e00 : 0x21e00)
> +#define MT_WF_DMA_BASE(_band)=09=09((_band) ? 0x820f7000 : 0x820e7000)
>  #define MT_WF_DMA(_band, ofs)=09=09(MT_WF_DMA_BASE(_band) + (ofs))
> =20
>  #define MT_DMA_DCR0(_band)=09=09MT_WF_DMA(_band, 0x000)
> @@ -82,7 +82,7 @@
>  #define MT_DMA_DCR0_RXD_G5_EN=09=09BIT(23)
> =20
>  /* LPON: band 0(0x24200), band 1(0xa4200) */
> -#define MT_WF_LPON_BASE(_band)=09=09((_band) ? 0xa4200 : 0x24200)
> +#define MT_WF_LPON_BASE(_band)=09=09((_band) ? 0x820fb000 : 0x820eb000)
>  #define MT_WF_LPON(_band, ofs)=09=09(MT_WF_LPON_BASE(_band) + (ofs))
> =20
>  #define MT_LPON_UTTR0(_band)=09=09MT_WF_LPON(_band, 0x080)
> @@ -93,7 +93,7 @@
>  #define MT_LPON_TCR_SW_WRITE=09=09BIT(0)
> =20
>  /* MIB: band 0(0x24800), band 1(0xa4800) */
> -#define MT_WF_MIB_BASE(_band)=09=09((_band) ? 0xa4800 : 0x24800)
> +#define MT_WF_MIB_BASE(_band)=09=09((_band) ? 0x820fd000 : 0x820ed000)
>  #define MT_WF_MIB(_band, ofs)=09=09(MT_WF_MIB_BASE(_band) + (ofs))
> =20
>  #define MT_MIB_SCR1(_band)=09=09MT_WF_MIB(_band, 0x004)
> @@ -142,7 +142,7 @@
>  #define MT_MIB_ARNG(_band, n)=09=09MT_WF_MIB(_band, 0x0b0 + ((n) << 2))
>  #define MT_MIB_ARNCR_RANGE(val, n)=09(((val) >> ((n) << 3)) & GENMASK(7,=
 0))
> =20
> -#define MT_WTBLON_TOP_BASE=09=090x34000
> +#define MT_WTBLON_TOP_BASE=09=090x820d4000
>  #define MT_WTBLON_TOP(ofs)=09=09(MT_WTBLON_TOP_BASE + (ofs))
>  #define MT_WTBLON_TOP_WDUCR=09=09MT_WTBLON_TOP(0x200)
>  #define MT_WTBLON_TOP_WDUCR_GROUP=09GENMASK(2, 0)
> @@ -152,7 +152,7 @@
>  #define MT_WTBL_UPDATE_ADM_COUNT_CLEAR=09BIT(12)
>  #define MT_WTBL_UPDATE_BUSY=09=09BIT(31)
> =20
> -#define MT_WTBL_BASE=09=09=090x38000
> +#define MT_WTBL_BASE=09=09=090x820d8000
>  #define MT_WTBL_LMAC_ID=09=09=09GENMASK(14, 8)
>  #define MT_WTBL_LMAC_DW=09=09=09GENMASK(7, 2)
>  #define MT_WTBL_LMAC_OFFS(_id, _dw)=09(MT_WTBL_BASE | \
> @@ -160,7 +160,7 @@
>  =09=09=09=09=09FIELD_PREP(MT_WTBL_LMAC_DW, _dw))
> =20
>  /* AGG: band 0(0x20800), band 1(0xa0800) */
> -#define MT_WF_AGG_BASE(_band)=09=09((_band) ? 0xa0800 : 0x20800)
> +#define MT_WF_AGG_BASE(_band)=09=09((_band) ? 0x820f2000 : 0x820e2000)
>  #define MT_WF_AGG(_band, ofs)=09=09(MT_WF_AGG_BASE(_band) + (ofs))
> =20
>  #define MT_AGG_AWSCR0(_band, _n)=09MT_WF_AGG(_band, 0x05c + (_n) * 4)
> @@ -191,7 +191,7 @@
>  #define MT_AGG_ATCR3(_band)=09=09MT_WF_AGG(_band, 0x0f4)
> =20
>  /* ARB: band 0(0x20c00), band 1(0xa0c00) */
> -#define MT_WF_ARB_BASE(_band)=09=09((_band) ? 0xa0c00 : 0x20c00)
> +#define MT_WF_ARB_BASE(_band)=09=09((_band) ? 0x820f3000 : 0x820e3000)
>  #define MT_WF_ARB(_band, ofs)=09=09(MT_WF_ARB_BASE(_band) + (ofs))
> =20
>  #define MT_ARB_SCR(_band)=09=09MT_WF_ARB(_band, 0x080)
> @@ -201,7 +201,7 @@
>  #define MT_ARB_DRNGR0(_band, _n)=09MT_WF_ARB(_band, 0x194 + (_n) * 4)
> =20
>  /* RMAC: band 0(0x21400), band 1(0xa1400) */
> -#define MT_WF_RMAC_BASE(_band)=09=09((_band) ? 0xa1400 : 0x21400)
> +#define MT_WF_RMAC_BASE(_band)=09=09((_band) ? 0x820f5000 : 0x820e5000)
>  #define MT_WF_RMAC(_band, ofs)=09=09(MT_WF_RMAC_BASE(_band) + (ofs))
> =20
>  #define MT_WF_RFCR(_band)=09=09MT_WF_RMAC(_band, 0x000)
> --=20
> 2.25.1
>=20

--mzLskt4Q02/YFtkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUH0dAAKCRA6cBh0uS2t
rPdBAP95pHqkybRW6MJB9pPokTJxmJofmKsxc57b4APEs707IQEA401b4jLd0TyH
rwwBIwHKVCd5PEkitoKi+4IX4OGm+Qg=
=pEdz
-----END PGP SIGNATURE-----

--mzLskt4Q02/YFtkH--



--===============1879266967154187259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1879266967154187259==--


