Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF18C44515
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=; b=swrcCG+YOGHsJe4zIA1UnJDC59
	t0XNRiJXpF0t1dfsYreQ2wBvUcA5963Oy+peuO0dqYJVhqX9Qj6xYIXNGszOfwpyhuRYLVr7HK209
	QqREhnYkLjB0k6XndH1a2afRLwA6//9vAwEQ94PCmcCMogV4FtOJb/1P0k0+zi69njP/hm1UzffAB
	PCGsb+ATdgPn64tNGidEPlqOnpwmmTdqiT1JiMNJ85BhDMTN3qBPLHwPObr8BzkLFJ2j2JdT9ffzJ
	qy/hoSKEqgLmdZYge8hLcAI/d00UfvrxcT/YipLJGmw/HTRSl+qdd73gf7+OZ4tURQzUGU0wPgxF8
	ELfhOfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPig-00000000Ft9-2PR4;
	Thu, 16 Jul 2026 17:17:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPic-00000000FpU-2f99
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 17:17:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ceb096e675so63701955ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222274; x=1784827074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=cvzcg8G8A9RHhaBuG/wKh/Slw3gaCnQnvZmKaWnTJLZmgf8/fRzzyrMT6oQgWenY2k
         OHRziQGGcPHRIixItpsMj5M8CMQIlluNblDwpUgtn3wZV8udKP4jOKRjq29QojxHSHsc
         KgojIMVsnABYJ0bFzWZCJndUWsdpg1O8Wyd6J2SXnkHJ20KqQFuJH/GRILyINt6MkZIo
         2AFiY5zHlhjrk9sq4FwVdXSWnq3BVgIszfUn+7tnYKMFl21DcORrgq31nFTnADmy3OAM
         9cSqHrcLrzjLgzvkwoiVmWNMm281D4/rkx5i3AeVai3yN6dW+53Bz/UKaLvnWzmSmWMK
         M9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222274; x=1784827074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=JyD/ExzX1PV6qGNf0c3eCTvha9x8Z+Qb7v/rg40LApDOIeaQzxA5BDjVxzHuvHor+Q
         XX5MvyZlTGUvCJLuiazn3ary1z/hLO2rqSor+HLMiggqFU+XXtO+JCSN3Tpc6gB0AMDe
         7U12vaVtseo3r7zGQYA5QSHnIdZ7p7vDr6VsZNB7oa9uC93aI8VWKxFMsFtIZyhhGDRY
         v1wSftD+QZhpd/+4VmUf7EtaliqpqVTQLsKsQa31VVUx5vj7/En/WUtu3k4/z7QNc0+P
         +rWNKj6Ck+unr4hRLdWqolCgOcvy0pEwEq9nyLSpsPgNO8tDYtn7YoBhoxi6B7YnwXoV
         CgBg==
X-Forwarded-Encrypted: i=1; AHgh+RojQt5+HT5i153o3chmDe4Yz2iOW9lQDVuEmzscfJlENciEfracmgmYeMWMEdTxRP9irNF4M6OpL2E7mrZgAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAjywotPjkZD8lMbuLL+p+Up/cfShP4I98/GsIjag/RZgmgWFQ
	ceuBgs1NOnje48s/fbTmt7+kuGHbvQ5OXvn5vRiGnkD62fJveaEoospB
X-Gm-Gg: AfdE7ckYmRZ9hpO85eKvg6XkOXxR08aJZOCZ/9GVx4IQWAbdBUrBddCFvXU7bAY2yx6
	oLsLEn/sQU9J/0/gt/LsAdIJBJuUzKZ9K4AJq5Ev7NlRWAffAedBbdvW/jUUhe7xVk2l/jY7Yt/
	cm1gs4HtxdGgIL0+1AdHzbU22U/o0Yj3FRkSsFU3O00qNPcKTCHEUZFXMqg4e5ZbK8X9DLmdRyq
	1Iu3cmyofS2XkOnoD3bMXq4pflvJXySPPJPcdbWBodfa9oT8XFEhc1434Ynfq5kIn21wcDIi9N0
	o2fOGZ3yP8rKZLz3xBkW7STqy74xvY2/viFSNVdPrNAKirwOxXjceNZrRUnkchYrEZjnV5jwEuO
	2j2UGkW23YZcfWT1Jq9ZTYFzH60VH9KEJiR6DB3pO9SKLfwvKmNzpt341Q+tY0ryu5E67d+/6Ae
	ejAQ5EBH9k+JYxSCWWYtZpdCHuX8YHDHq24Q==
X-Received: by 2002:a17:903:1cb:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf03c36420mr81705655ad.18.1784222273587;
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
Date: Fri, 17 Jul 2026 02:17:31 +0900
Message-ID: <20260716171733.300885-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101754_865703_285E837D 
X-CRM114-Status: GOOD (  10.97  )
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

Add compatible string for MediaTek MT6589 PWRAP.
Also update the description since MT6589 has pwrap bridge.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a487ed39e6cb 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -19,8 +19,8 @@ description:
 
   IP Pairing
 
-  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
-  The signals of these pins are routed over the SPI bus using the pwrap
+  On MT6589 and MT8135, the pins of some SoC internal peripherals can be on the
+  PMIC. The signals of these pins are routed over the SPI bus using the pwrap
   bridge. In the binding description below the properties needed for bridging
   are marked with "IP Pairing". These are optional on SoCs which do not support
   IP Pairing
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6589-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap
-- 
2.54.0


