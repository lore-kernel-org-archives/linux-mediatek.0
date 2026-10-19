Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CCECCF2E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=; b=CIm7kzCpjdas8m2alSToil/6SI
	zyH+9AMojskBsSbFMp7msmyB1UaLBx4gu/G8hiV3g4FJxofA9lByoqQcNiT2/Lvfpodl2mR8b2vkT
	jPZhm0zeIceJDPReepG4XFDtiM0rWPU80UgX3gvmz8V/VtuVs5d7amHdJtlnqvAwfUY19ILck8SX6
	Ii0dAOz9fhVcn5izMqOoDP0ddApT6Giv/rnEK6RIO0Rbu7SHkApcPaPUnkt/DlKgwgFosDmQq0xWi
	4GJpRmNEtz7QJQIoGSLsR+koNXf+EzejNW/klrjAfheoj0TrOm/7ZX+GRTxSWf+/Oh6yYk7cfzxFj
	EKzmfMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYh-00000007Oof-45O4;
	Mon, 19 Oct 2026 12:33:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYe-00000007OmB-2Ham
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 12:33:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48de72fc832so1540596f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413219; x=1793018019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=;
        b=mDBEmicqX9i9R0UO7Jm2jwKHfRxxZNeJIgxib5+4huLuoz9NK2IJneAPZQdNGie7tn
         /stdJquT0KAAqZYE+CvkDaHDMV0BrAw4z/yYWtiMkcl3NePnZMgtsp07CHoB5BSr6M8E
         DX3Xrl23f0OgxW/m4L0QSn4AGoZ+ipSdMcxt1Y3Sg75QZd98kc6Z1useHmJVcE/F+FkC
         l+Cpv3oqzPQD+YWGdph/FD01DZ+BB8qug4zZ7OHwi/Aw3P145r2Z4LkChSHpWl3PxXPL
         0d3V5qUHI1Xzl+RpwlCfqrquOSfV1o6kVPFwwODxFXVLE/tvBwBcS1kVdtcrlOOw5/k+
         rW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413219; x=1793018019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=;
        b=uYfjgT/oYxTHSrspo6EJ6RGzJfnR4q66PCYsc7Xdze+aok1wYpZVy95L/cbFXXC4wS
         ArHnBfXkvdAlHa4NHFDjyYe+F/oyrL1WX651r/5U7LTFGigZGQ8nKtUclhZznCIky67A
         kB1IN4W4mmdB1MYSeO9Jvawfy4mGqHwTu8mTvBKwUHa8R1BZj/CkRXteVWppTXyEjsRd
         acOxND3OIkxzKE48eOvYHFS168OlPkZkdOp2F/C0/ojyt/VNVXhQRKHUBkS/nZVFPXWk
         0if9e12ibr+0nHPLMm/0JH7XgeoTrS4cOYkTeuf6/Q1bHuttHmcUODM8FPdnHc7avyN1
         sovA==
X-Forwarded-Encrypted: i=1; AKwUvBztYM+dl0ASFqCHnoWS3D5CpuTbpVX5llvpuiymvtiR76H6mflu5AapVBbVZCN7z5n0k7s9lbihhKcftRZ4kQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJmAzfl0640RVAP/biIezmfzjN1OPY+zafAx7oZP+KBkGn7Q4k3
	uW4wJjJSQHhC96rCvt35pJwXnaCvuyHMnnlgA5jrLj2qGluNI/3W3GWfWs+BBKBD1J4=
X-Gm-Gg: AYBFou1Vak+BcoH7l8UZWzQAdUVSrC6g7ZzpqIMVPkB+4lO7fplN+nUn26KK1zpcrgT
	g+ftTTbrlMm8KrKfpoA8HBEIuaFhUvCajHYdlWWw5nRWsfc+3weTJuwNa/yNjh4dZkTTs5Ce0BT
	/wcFiDrFrSik3qOu8kP4G+C24X2H+MV/DaEcQrzwJ/RooPw4LxBPzuC01KyoZ5XK5t71umfey40
	WnnySXUh+oGhjGhxh2CeYdR3ZANVv9jqTqYca3xCdMlJpIawqVghWf/r+Et00cmnCRFTTMFBofn
	aK22Tj59WSQfKx+cKLhJbJuAv4In1p0vfj1XL3tpqTZQhN++p75m0hWgBNwkYwoUfbLjpwWDlUC
	CEeBsLlaP1fS66mlQ3BFaemfX6y990GLqxEScJcZIU6pfF23U8K8l/XYYmz9Yl+qpl/LCeqhWEt
	YRsZ3eHZsdr1WSSPao7KPkqDrx6GQnwg6MStte8fPKgce8MOk05L4tUXIAQJNQoUvK4ILk5otkk
	NvZdupVacs5FXPfDupn0F/3EuAUyOu6EIXullQ783lNjBRXSwetYWCo47HLRWNLMlUDp3KgXxAh
	yAepK4RK3Q2pvd/oGA9tFVVDYOArkm4L8gM77+LreQlS6cu4npRYM/A=
X-Received: by 2002:a5d:5e03:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48e07fbc4camr16385796f8f.54.1792413218623;
        Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 19 Oct 2026 14:33:56 +0200
Subject: [PATCH 2/2] pmdomain: mediatek: mt8365: add missing define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-2-dfd445dc3763@baylibre.com>
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053340_605157_6A597DF4 
X-CRM114-Status: GOOD (  10.93  )
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

Add missing define for BIT(25) inside MT8365_POWER_DOMAIN_MFG
declaration.

No functional changes expected.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 3 ++-
 include/linux/soc/mediatek/infracfg.h         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
index 3775e4dc2c91..e360fe142027 100644
--- a/drivers/pmdomain/mediatek/mt8365-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -126,7 +126,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_bits = GENMASK(9, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_cfg = {
-			MT8365_BUS_PROT_INFRA_WR_TOPAXI(BIT(25)),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1),
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index d2cfa09f81ba..ddc53675529e 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -14,6 +14,7 @@
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB			BIT(14)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0				BIT(21)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1				BIT(22)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG				BIT(25)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1				0x258
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_SET				0x2a8
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR				0x2ac

-- 
2.56.0


