Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B16DC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 04:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T+F3MEmVUPzwWL0/FLP/CCB6bmOFJ8TO+NbHdWfRAjA=; b=BSn5JeGcQTP09H
	oHXJxjQq37vccqZLCc7O/koN8CVqExoRXLlaDIOwnQ74NiBFQa5yLckdnMsy7//iv0BFQoYdh7WfS
	WnLecUbVLXOBrQgkI6BzeEw2NYEIvPfwORDUtWk1lYYT/SbjMS7wrP5nn8YHI4hG6+SseyfkypKpL
	9PEId7rhJbZQq9cf+aelia3HxHsgdP1hDslbDsYvHFGKPNZwsbVrv28F5++TLE1VYGEaAphfabFNr
	/AGuabJAjSp8jMlkK2rbE0Qxit8ngaOlcXMo9viyAhnJHHCDST70oHMlANgsPJn/CxPanEpOKFjZL
	iMO0hSrBY4Xq6PfUDXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq45C-0000000GmZu-1A7V;
	Fri, 29 Mar 2024 04:43:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq458-0000000GmY2-3AvO
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 04:43:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1dff837d674so13808025ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 21:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711687385; x=1712292185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+F3MEmVUPzwWL0/FLP/CCB6bmOFJ8TO+NbHdWfRAjA=;
        b=llkcICXSTObbNAuF81bKKVoL9ki87mbBdxuMv8Den3vwDT9VU7qtTrUm24unt6P86K
         AVaLSvBigTnhJSfBApDo17BT0KEGlRSfUGj36Y72krL3v/VW6pzBnJupWoqELKXEtjcT
         /S/0IKO24S8pmOSZcY63tMGKCZLKlPes8K1dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687385; x=1712292185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+F3MEmVUPzwWL0/FLP/CCB6bmOFJ8TO+NbHdWfRAjA=;
        b=RsrY87eVdXrezU+IlgRJHYxe0SXF2uedws/X3wOO0ZvW2J40xe/aamo+ZWe+DRHcr0
         WhijDkIyAofAAklHXywji/3f69CVyP5D2aXjOzPbzs0k7KtuXNbAa6Z1SU1CIAiWZCvb
         ktu3rrSE4DOJoy+6zXR/RvrICTeTv0z6xjLnEXBWfuo5bX8WJCvmcrblPIQMuxcjFSiy
         hSAC7ngcBnEOYdVd0Xmu/RJazXA1Nlma9m6XYHpoMI6bDG+4ApJRVLm0uP9RU8fGdvdR
         seTe5qBOsPN9/q4tDxg9cpreFS/57pbOf9JXslMm1cVmuE7unO7zwc7Wca7wNUfWYhzN
         /yLw==
X-Forwarded-Encrypted: i=1; AJvYcCWQYQKRhmyMyLK2RtrSH08ci2YKYW7EcbkwmFqd3sQEU7N8snm/l3UyCwyd7eUMXPNg1fbc14V8RW6bppMb206yeVybBdSv11S6TllNoi9VNi/Z
X-Gm-Message-State: AOJu0YwSS2H8JGb/7DXXJUqnLjPiEstEE5MlZNX89otofEjm145OUyEj
	u+vBYpVUrSaNSqYYDezQ4YuUvbaW/FlQdNk0wnxzxtp9ThoeIPk+lJ8f97mYRA==
X-Google-Smtp-Source: AGHT+IHCedueif2FtQVSxLOhPhqWgRritaTfZsBJlDn+eEkw34EDb+pABQ0tVdwsWrtdeb23F+EOuQ==
X-Received: by 2002:a17:903:2442:b0:1de:f18c:cdd with SMTP id l2-20020a170903244200b001def18c0cddmr1744816pls.3.1711687385018;
        Thu, 28 Mar 2024 21:43:05 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:89c9:dcae:ddce:1350])
        by smtp.gmail.com with ESMTPSA id q6-20020a17090311c600b001dd744f97d0sm2502345plh.273.2024.03.28.21.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:43:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2] pmdomain: mediatek: Add MT8188 buck isolation setting
Date: Fri, 29 Mar 2024 12:38:40 +0800
Message-ID: <20240329044142.3095193-1-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214310_982955_CD8177EB 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Johnson Wang <johnson.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Johnson Wang <johnson.wang@mediatek.com>

From: Johnson Wang <johnson.wang@mediatek.com>

Add buck isolation setting to ADSP_AO, CAM_VCORE and IMG_VCORE power
domains in MT8188 for proper buck isolation control in power domain
on/off.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
[1] was reviewed but didn't get accepted at the time.
This rebases [1] on next-20240327 with revised commit message.

[1]: https://lore.kernel.org/all/20230315114505.25144-1-johnson.wang@mediatek.com/

 drivers/pmdomain/mediatek/mt8188-pm-domains.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mt8188-pm-domains.h b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
index 06834ab6597c..007235be9efe 100644
--- a/drivers/pmdomain/mediatek/mt8188-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
@@ -175,6 +175,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.ctl_offs = 0x35C,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
+		.ext_buck_iso_offs = 0x3EC,
+		.ext_buck_iso_mask = BIT(10),
 		.bp_cfg = {
 			BUS_PROT_WR(INFRA,
 				    MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP1,
@@ -187,7 +189,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_2_CLR,
 				    MT8188_TOP_AXI_PROT_EN_2_STA),
 		},
-		.caps = MTK_SCPD_ALWAYS_ON,
+		.caps = MTK_SCPD_ALWAYS_ON | MTK_SCPD_EXT_BUCK_ISO,
 	},
 	[MT8188_POWER_DOMAIN_ADSP_INFRA] = {
 		.name = "adsp_infra",
@@ -524,6 +526,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.ctl_offs = 0x3A4,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
+		.ext_buck_iso_offs = 0x3EC,
+		.ext_buck_iso_mask = BIT(12),
 		.bp_cfg = {
 			BUS_PROT_WR(INFRA,
 				    MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP1,
@@ -541,7 +545,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
 				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY |
+			MTK_SCPD_EXT_BUCK_ISO,
 	},
 	[MT8188_POWER_DOMAIN_IMG_MAIN] = {
 		.name = "img_main",
@@ -591,6 +596,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.ctl_offs = 0x3A0,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
+		.ext_buck_iso_offs = 0x3EC,
+		.ext_buck_iso_mask = BIT(11),
 		.bp_cfg = {
 			BUS_PROT_WR(INFRA,
 				    MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP1,
@@ -618,7 +625,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
 				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY |
+			MTK_SCPD_EXT_BUCK_ISO,
 	},
 	[MT8188_POWER_DOMAIN_CAM_MAIN] = {
 		.name = "cam_main",
-- 
2.44.0.478.gd926399ef9-goog


