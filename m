Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9EFC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rOWiDGoZ3cg9dnynIRWTsyteioX53Ouu76F3VV4WZDg=; b=BI21rz0Id28oiII3vZHkkV9cIv
	NN/e6JEpfjxZLKrHB/tkt38az5Oef7ewEaJml3XbPyXrsiu20rj+ton94NMQT/gRZHUGUMk2WGXfQ
	ogG7C1dFcns8PweKJ2MbGudZC3T3Iq8Ivz/3zxGwxqXpgOZZ4MvScRuUaRsL2PKUXT68xRCcBMP+m
	+mwS+BaSUZDLT/kKtP1D53mcOBCcFuO1VJOz+ziY6f80OTWkcP+Dt53M23AVWvryIl+gMgLf9Ji1g
	T+ZlN9yO6CskurWdSe0hX8tiASSpg/Hs0B6U1YnkqCXv1kvhWKP8XbXfeG5IsMlrMPH9JdiQjphfJ
	0BxbiDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGr9t-000000078bB-2Tt6;
	Tue, 11 Jun 2024 02:22:49 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGr9q-000000078aI-1I3R
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jun 2024 02:22:48 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3d21c4eec2dso339385b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 19:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1718072562; x=1718677362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOWiDGoZ3cg9dnynIRWTsyteioX53Ouu76F3VV4WZDg=;
        b=lN/FFmb+g7CeFVufeZoD7kHB59S/L+B0wp+e8rwENLZCdWT5lAYU8TDjaIpe3is/ZJ
         Q7ZdKQLaqZ+/sfdlvZ0SyYNE3I7iaweIcUG5kvSxY669rGabWsSzgmE/308v0MvvRd8M
         dgoFqMOlZU60qjg9CI00ULufOcdLWfdbYGWP12Ir3l7zpmuxAF993laXZSn9v7vDE5PB
         H4kbkGkOWU3JxPn3FAZY07L/5OFsCWwldgrrExb4fxOp5gmUdkIEx7pnFQhodrUY/rBq
         c1xLFOkG1r2boWiYMd3qoZWOiFbdvXX41z9As7kLNV05XflMMtMIQZQsrdRM6aB9mnWv
         6dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718072562; x=1718677362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOWiDGoZ3cg9dnynIRWTsyteioX53Ouu76F3VV4WZDg=;
        b=C6peakcgTkOYCDhnhJj52OOH/0cGcl1idDCY1EtTkGVKUr9rvxqtRkLAUDhqP4eIwT
         CiAOhiEj9X1B4Iydnovlnyr+Tc9dWNiFQGQq7VRvNIhp9spyAA/DbOlbRXrRP4zwJSI5
         BwKMUmMZGbxmeec0CsOg9oApOmkxWM1IowKEWT59HSEKZxXcXFr9BlEnhaJGWcpK80m3
         1nmNvOxqZWDvc1QZQrrUARHpjC4ehbORx5jv+cSe2Hgaxlf/SfW/Z3EnelnWlUWl9S+z
         ZOKLqXdhYKU7SpzKGqqlnMGaX/w70C1PgdLq2SPb26IaCJcSWGITDYoLYGh5Lque/Z9h
         ZCqA==
X-Forwarded-Encrypted: i=1; AJvYcCVFH2BxtKRRcA1yJG+YEFumQn6pjlHgCPb2jb94WfJwHGv9qotJVDhRwA5PaMNklX5IkBt4GJfaZ4MUN3xOx11Am69cyfxPRZjk6jk0k1uhJKrK
X-Gm-Message-State: AOJu0Yw+Gh/bnLA+vSwSsfRB0092V9LNIzW5NDxxjZ2Gx3QYcv1t5CxQ
	GN/b2eDdYlvis4gVuv8O9yYGOf8TsjXoqASO70wVyhN5Vf8LcjEj0ffBV3Kq474=
X-Google-Smtp-Source: AGHT+IH54UnImHOBfDjxg/a/aqysYcwTv7IDKcLuDx7VweoZ916Hrr9pYkdYYvKpgl1/Gy1pVhimIw==
X-Received: by 2002:a05:6808:218f:b0:3d2:1f88:3e7a with SMTP id 5614622812f47-3d21f88464bmr9449264b6e.39.1718072562390;
        Mon, 10 Jun 2024 19:22:42 -0700 (PDT)
Received: from zhou.. ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042f5584e9sm3953561b3a.12.2024.06.10.19.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 19:22:42 -0700 (PDT)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: maso.huang@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v1] ASoC:  support machine driver with TAS2781
Date: Tue, 11 Jun 2024 10:22:27 +0800
Message-Id: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_192246_494332_A2D2E592 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

Support amp TAS2781 for mt8188 platform

Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..07f67f96c889 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -233,6 +233,7 @@ config SND_SOC_MT8188_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC
 	select SND_SOC_MAX98390
+	select SND_SOC_TAS2781_I2C
 	select SND_SOC_NAU8315
 	select SND_SOC_NAU8825
 	select SND_SOC_RT5682S
-- 
2.34.1


