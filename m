Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84A7C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:35:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5310E60FE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5310E60FE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4g+PSjX+mxOD9b832yZZokOs2T7Cm7ihcvWAuFNz+o=; b=DezqcQnL+9rmONSoovOmx5m2l
	dTfEUoOklxMD8LRofZM4/wUmdJZsehSlfhBnolNVcnkI3UH8MaXOUSVTdstvir0r2FoKXM2kklJqs
	BtZ8OqKozZ0KvA8cIPXBoZReo1CuJKfH+BIbG7JSvw9IQbLnS1hRwcvl+/oLxRckZ/fEG0crN0djm
	XxooqsyAuSHsHA0Om9Oufjyl7o/4vh3m3ZUtIdgCDs1qoBDOpfeYRvtywzFd3Ulw4T8aaA5UJ1qMd
	XQRVVSjxyTdUSL5VIUmoAJ7Oitngb0BxuUVHD/XDXxYuinIrDvPQ4UAPvsUGStdsG6VODyB0VBplp
	a3gWEQMRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOR1-009Lw7-DU; Mon, 19 Apr 2021 07:35:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOPB-009LJB-KY
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=; b=rOSNxGeGWy25aQWIcwNcX9KWfx
 ZgF2ROKb2QpyL5OiEI7UgpYXvyGPP7e0GdpENpigoCNvfyKBHTeNBddp8rmWVx3pCeT0hRuf/wPd/
 LfjBf74QZdKkXZbHOVXAjjn1u7EoRez7z+hDDxDuS09dQWHwn9OY4YUX7Q57AwW+80aRTn32k2lDq
 d4Cb5iqJB7R/3cTgFMtEq4XW+9bLspirTnd+o6wQsGNm5PfC9G1K0FkGckhFt2DgJ+O7V8x6l9uOf
 U3Ew31QUALuPtQfdNmgMTO5oZHdtkPDSgQ0pt+ogeOb3QCSi3Rfm5wuY24ARssi1QlOmSv/Rc39nT
 wsp9Ixow==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP5-00B8NO-Cr
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:33:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso7588117wmq.2
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=ZL4CqRjEM25VfPQ91mxKikXxoGFcWs5V1j8nRUuzj1LuXfZwD+rcZUBC19BuehGTtr
 /jXy3BDxC93xAAtPnfoY7UsF8/c2ygJ0ei15efmQ+vjFGTGg2ACxp+az8DUBkHj7U24B
 GevTlMbtm7rIUrN8ZdbmTcpNEiOR9SjfNVenUwqN8KQ/ltddApEwLrfpImQtrwGTJEjh
 fngb4LerqOOcvGPNxq2mf+fSitFXKbwuOE3JDgaacF3qJo7f1rtRrPOKEesDuNdCQsfq
 sjlnBAD2LbnjH7BxcsTQcSgMZOFur10IOlnEqJr5nvt2x06fGuynWHVz/7X0Fwpk+SVC
 ISLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=arYYibRHNLxvUMpMlSLKpTdMumg/EdSoebHeyHuMMCKil+diejQindN70z2zurYDVJ
 7B2aZ65+fv45ygqSWZbuSyY2Vd+fyay5LYhu7NGiivEBRV2w3EclslO2qUHU73BYysqZ
 m1TJk6InZ8u170BBu+v6DHgjeFkXa3CvqTZjB2NSII8Wv09UtOveGIEv5/bcdVijZTBq
 NBw/sOvR/Dun7two0eoafOrIG7x0SfttouXFRbUO5VYkyVKAmwo4cqmuhdBcKYbrJxNS
 uLvAxDEgJ7HiqzJxY+kCFWIUCvnBbsNrfUmcSlNTO5AuroprXO9NKmpSuFxiHyRHwuCj
 KQ5A==
X-Gm-Message-State: AOAM5311IU0diclaogFKjRPN9Ee+YOI30jrwDL/h2TErXtRZ3tNZDz05
 H4JQ7Iec9lj9LjQ45x6QDqVlWw==
X-Google-Smtp-Source: ABdhPJzGQL1OhlR8+hi1vO6S/bHuXkKUrxWtipf9az5y2tpodd03GfcTaLLiX/r6QDId8mHxWWHkQw==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr20099187wmc.41.1618817585523; 
 Mon, 19 Apr 2021 00:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v3 5/5] gpu/drm: mediatek: hdmi: add MT8167 configuration
Date: Mon, 19 Apr 2021 09:32:44 +0200
Message-Id: <20210419073244.2678688-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=1cCt+CaaWnX35LcUAeqH/AEy6pDlaztP4tTWRAOEW/o=;
 m=teArBpVk0i7hN2a9Z6e7zXDAZkWNF5zds9OXrfPJoB0=;
 p=K8BqlJdCG5wZ6jJdNp1bjexbIQG0ke7ZpzDma32UUOk=;
 g=6cc1cbbc495832f0509ff603f4cf0aef4bc07664
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdEMxxAAwQG
 a+P54dAPqlMY8zUbqvNt5ka/vcf7mcAprjgN/KlWL1AGezCSgcDrg14v3AenQoy0qGmKNTOWWXNgy
 KUDxzxqqLMN8026Rbu9qA7UYiXBATnDffnboSbdDIp1pq9BNmPxcXh3TxJaY4hhellGfM/mayJOEM
 ShU8TTCZNqloDOMVg70ASdsuanBjdHAvdnuej0NkHyzRyExEXen3COBwjIR3XfxQOeTk2a1SKk1ZI
 ODSa0Z/WrffKry0RNauAowcFc1HEMWJOA/WOzpy5XhkNhYUgXOGUkE9mP46T0FBqk/rPEPlNLRm8g
 tngkf1Q0yr7pnW6EIsO5n7UeYMDz8d2oxXzjyu96SVYyhyu9FvA616lLwSuSRNj3WcS49t/aEYXe0
 yLcdRpQrsYCcEJXv4CmL+2DM6CG9CvIcfDkB8BomaihadIG9o71Y623796hJw/N5QzCli31vz3+xO
 HmARnkiHXlLrCHCuEhgHauJcbR2qtsrUPB7uagYIR5GjSFDfr9MOfTohL6/sPjWEUFHznhilRdd+1
 j2LapJBSbUHjoIiGiPDw5xfzhYeZP/MFKaFQqb4Zyk/OBgeAJTTgLYByTyez5xIcTTc0SJ7m1mQYt
 jbm09ErtlMy9clPUBh0c9ZiMu/j/oo6Z0LH9Rfu5P27shuGK4WybCEhfHVkBAU24=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003307_454943_EF4CE239 
X-CRM114-Status: GOOD (  11.56  )
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

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes,
so add a configuration entry linked to the MT8167 compatible.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index bc50d97f2553..c1651a83700d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1787,10 +1787,18 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 };
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
 	{ .compatible = "mediatek,mt8173-hdmi",
 	},
 	{}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
