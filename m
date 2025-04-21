Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB18C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 10:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=; b=0C1r5LK2aF76iWw3M5z+SnQxxo
	HCVqOx6JJ1rIffdwZOHc5GSvwUa3SsdudPlnob0/jamCs7OdxrsKEhS0To973SkNO6r2H2WEMO3Nm
	qPW/iBzbrJL0BFQTaOzgHcZJLmV+ZeJvPqYvVlSuAzBkvdbb+ql5gcBwUUldwg04HipibpiLkQZY+
	uANHcmcMInKaKpUGVdYPOjjcI9pw9SXOvZoKgtvHPCN7qhDJWVkdj+fERjSR/ivoGTdrXAmYE2q0m
	Q0KaRFVPOVMg1zaO4YnA1j1crJg08HZgwTsxwAIgPq7ACoftJB/MAFbAZfxRYAi8aYCd+cQsNsqWl
	zC7PAlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oM6-000000045hY-06cm;
	Mon, 21 Apr 2025 10:26:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9Y-000000044CU-0QAJ
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-227a8cdd241so44163885ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230407; x=1745835207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=;
        b=aDf97gXWLdsv4R26fgToZiWzRKw2Cfw0FcKr5v9hzf1SlchpnCSMZ/Ccn1whIRul3u
         vF9X5W1V/LMUDBHyaHkx/lUcK6VL4Uqc+njhxWcmYyIerI4LpmOUjIp/FiG7WqZDACYE
         61/1c3pzJ1q3VOoWPsPc1zlyT1WQUMzKl8AQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230407; x=1745835207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=;
        b=WOx38Pt/cCcuE0e6WZBZHExk4bipQ8ICWfhS942PepA8fQXBtxw2lpJvp6saQR2tet
         t8WvptCJ5aUhEClO90sMtw5f9ybcQpaHbxIKWf85SePou6E0cUvz6bkKd5HD7OfuXkAT
         QXS10VWP0mnza44gPMh/y/6adkkyWRBE9ub7upq5aMQOFoUIDTPWkICsDD1t5Msx27xK
         x9vjBa75PEzEWP6Wjpv8e9gas+BpkLELm6C5SYu9zXm6NZllhhRHkQf3niNCzfBn+vAT
         LoVK2IN7BDuXVtKPOwHZeS0zuaGL8gWZ69cgFNd4VGB6+HcxXiOuaB01p2zoPVu25j9j
         WEfg==
X-Forwarded-Encrypted: i=1; AJvYcCUYjVAWSi7asXhdxSXv0yAn94IIZhHopQxgRdbhMODee/Dy/Y2GISPv1v1u8FrJ5lUnp6vsPAx472M3L3N5/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZyZgfn+/NxxEgzImhKD/rlMwh37r5pX3izdQAVl/01t/irCth
	gAJstDwB1V+Sp02MMxVGxgmsJKggJqljJoWgth7z69gTZuFyk6dAu1W7zsRCmQ==
X-Gm-Gg: ASbGnctu83SJheTw2Ek5+wxubevZ7Y4IO51iFasZVIFMUq5AIZgiT4ukhB8+dgypAEj
	Y0wWaDNUfsBlqWkG5mWXml4RhW/5TouFb8eym3S0T2Nx7xMupUBw27fExN1wsesv/n7gTr3AOxa
	XU4CgkVEl5GsF7dOBw5x2kgC9yXi2UVbOi6zli4+4RQi+7ic0XR0kYBoBgqjDby+luZYYxiwQtm
	Y/1hMSgBnlGWvnzEH4+rP6mISgIcEB0qzCBwmoDqQx/vUvb3dX27zA8cUixEhCcorv7RshOeZmA
	l9D0tVKG/lT79XSm+uXgLs39v6zo39s6/9q51hWqE4PS8CY55dFWUYArjz4cvJvS4CLWCg==
X-Google-Smtp-Source: AGHT+IHuFSunYBioxk4Fk/97b/EXhuCRKPWNocxu/A5uMoJPd3zI4mtSEWbcD0F9jrilaVzVx5rPjA==
X-Received: by 2002:a17:903:41c7:b0:220:faa2:c911 with SMTP id d9443c01a7336-22c535a4b39mr151608295ad.14.1745230407602;
        Mon, 21 Apr 2025 03:13:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Mon, 21 Apr 2025 18:12:45 +0800
Message-ID: <20250421101248.426929-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031328_136315_97157714 
X-CRM114-Status: GOOD (  11.41  )
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

Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
families) have second source trackpads that need to be probed.
The power supply for these are always on and their reset/enable
lines are not exposed.

Add them to the probing list.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased and resolved conflicts with "spherion" trackpad prober
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 019578bc7ad0..10dbaede0541 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,spherion",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,steelix",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,voltorb",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	},
 };
 
-- 
2.49.0.805.g082f7c87e0-goog


