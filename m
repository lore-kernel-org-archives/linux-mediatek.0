Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F4CC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVKrwpOU8w8n3bWP7IaMbuZSC96tHGg2G6FEzlrVdlk=; b=TYr2vj9JLrUwOi1aep61AITRHh
	MNDg61J2eRmdybP0mXPXkaKvMf6Y2+2NHsM7vxV0oSd5GgfRPw/AoeAq2IQhTGN1JYrHYt3XCjVb0
	ZTMhwwr58LWdfhsERRnsIuTTBhF+BFHr8a3z7f2KNHtLXmBnCn6IJsyCrZ54NIGfYNkEEWgaye+mo
	170o8VTJwQXHH4o5mbr9n9hAtmZUWA46LUsD1spox7Ii3YKy01zBYUDlMGchovmyCWc2hI1USacbT
	8WX/ID6PM+1MFmpY9HxaHRmnL3WEyRzp46JBXGrjcOkXvPt+h030/Hn0WNKsJ2YHJtnlPzJTyDHAT
	wJ35pnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HR-0000000GQJ9-3LbW;
	Mon, 03 Jun 2024 10:51:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HI-0000000GQER-469H
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 10:51:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-421140314d5so37068345e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717411860; x=1718016660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVKrwpOU8w8n3bWP7IaMbuZSC96tHGg2G6FEzlrVdlk=;
        b=w9AmrdLkl08N5DDnTCaNLAkfYcl6OsMdEJWXSunYIuotC3Zf/Q8W5k50OsNhS6kdpZ
         i2BMCDazU2Qb9WxuU6+tf0YM+dffa8gkP1SjecdwOQzKuSPx73bd4FfO4Uvh2CEJBMz9
         nuQalYJMkk7KstvMAFHFfaO21+0DrA60fIBb681GItU2zXv6FwpxLBVu2L/UvXYARSm6
         YdnrzZdZhPBg70kuB15TyMUnqaU/D97/0u2MSxG0y31lCqaFuwH6g6y7C48kqq15pDoV
         cHV0aoLwT0UrRjT9R4+HS/uDkItT/8PWoce+In/otpPnCGmwKiGOl93ZmkMIXDJLaO2o
         E+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411860; x=1718016660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVKrwpOU8w8n3bWP7IaMbuZSC96tHGg2G6FEzlrVdlk=;
        b=q5njqYpr8CmdAo9YCeYy6+JzxNDu4V6z0hLgzFHuTW2OR8XGi3+Dsz+zVnWzLk201/
         1HdFXkmQbI2nbYVEuAMor/Gq97t9yAMJUb9z8dRYZhZk+T4qK9yyGP4SzdvQe4rZR65y
         pnbVUjIxQI5lkm4Vz3h3I4MMsofNHQlj42AXwYa6ZbiYgDgjR/W9CMonJbpwB5yRPKeg
         6pZo+K3EVpmdGTOpG75NGro3yksVwo98+P1a2IxrI7p4Ve3gx9SoBq9IjL18R/95JvDg
         E9t67xRcPhL1I/ulXziFfYkPUnbEVyQ8y8ClWFgCUoDHuFvajfTk+nPz5IIdIyJUD7d4
         L2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8FXkQmi8B3HKTGAS0gqHwBIZ1vkNFT+heLazefZAvzC3CqjC2tr3Qi9DFBv1dHw/1Q++SgkT63NJulNwnJzZHdfKVVlR+x1Jdn3fCzfsMBqLU
X-Gm-Message-State: AOJu0Yw/f2Su8kc/8tgrIKVj0pqBomZS9OmEjfNIvthpMwjbcS35Q4UD
	uFEC9mQk+4sdU2ksgq6kVHJBP29eo1quHQ8Np6dLcpNnLHTzTWtC6H2W/3uozBY=
X-Google-Smtp-Source: AGHT+IEHJzmkYk1x/64Dttgql0TFeN0LlRnjrwKSBmUBZV11he1EW14HwlQNANH8IEcojrIBxI1yZg==
X-Received: by 2002:a05:600c:3b15:b0:421:925:6655 with SMTP id 5b1f17b1804b1-4212e046201mr66085115e9.1.1717411859616;
        Mon, 03 Jun 2024 03:50:59 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm95372535e9.19.2024.06.03.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:50:59 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 03 Jun 2024 12:50:48 +0200
Subject: [PATCH v7 1/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definition for MT8186
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-mtk-thermal-mt818x-dtsi-v7-1-8c8e3c7a3643@baylibre.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
In-Reply-To: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717411855; l=2060;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=IZPrvRPbGNSCghjb/r1UV5NLYTSYSWHR7o/UY4dQ/l8=;
 b=H0YGfuOx97A32AYKnSb54my+ipnwNHN3gyXGwn1w1+Gowhq81ksSoJwKx5VAgIuDuFdYqw47N
 vgPxSRvm45PD22rChAtElT+XIOrWc0ylFv5Ds4cGkpg6i0UnRDm/xCa
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_035101_088176_5DA60CB4 
X-CRM114-Status: GOOD (  15.07  )
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

Fix a thermal zone name for consistency with the other SoCs:
MFG contains GPU, the latter is more specific and must be used here.

The naming must be fixed "atomically" so compilation does not break.
As a result, the change is made in the dt-bindings and in the LVTS
driver within a single commit, despite the checkpatch warning.

The definition can be safely modified here because it is used only
in the LVTS driver, which is modified accordingly, and has not yet
been included in a released kernel.

Fixes: a2ca202350f9 ("dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8186")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c             | 2 +-
 include/dt-bindings/thermal/mediatek,lvts-thermal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0bb3a495b56e..506eed52db1e 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1436,7 +1436,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data_ctrl[] = {
 			  .cal_offsets = { 29, 30, 31 } },
 			{ .dt_id = MT8186_ADSP,
 			  .cal_offsets = { 34, 35, 28 } },
-			{ .dt_id = MT8186_MFG,
+			{ .dt_id = MT8186_GPU,
 			  .cal_offsets = { 39, 32, 33 } }
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 0),
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index bf95309d2525..85d25b4d726d 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -24,7 +24,7 @@
 #define MT8186_BIG_CPU1	5
 #define MT8186_NNA		6
 #define MT8186_ADSP		7
-#define MT8186_MFG		8
+#define MT8186_GPU		8
 
 #define MT8188_MCU_LITTLE_CPU0	0
 #define MT8188_MCU_LITTLE_CPU1	1

-- 
2.37.3


