Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9821093181
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rt3SxBW0V55mE3ZmJ8qpfzk3BnmJicdPxBkCzXkfF2Y=; b=01piKUyl5bqSyEsZQ5VV/uDVYI
	m4Mwz/KAyCwEPwKgyz61eUkPA+yN4q9ZLy4dv7wpYFUcmMg9qynwLQW/W8+UftckCeXUVJPA6H609
	W5G3up4EZ6cKF0jtbz1JqvqE0dMopqdiBOOjZ8Y5LFeJnIyzw9jHoNGee+iPHmFGZU5Ujjg7Ekzdo
	gdoP9nXqE68LfO1nfIxrGBNljgpocbaQcxuyVlJcD+lU3rhaMXAD9dPxnWPVlVoczvzj6pjCcWQgt
	urQL0J1lsumOyBZE1JXwUTCZhbNem19KWM75JskshVwwN/Tk1DHaaCb8lCBCdT/zQ3HZCF7IfF8dT
	WiYDQAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UEM-0000000CFfP-3DZL;
	Fri, 20 Mar 2026 07:25:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UEB-0000000CFXJ-1ri8
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:25:04 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8296dabef74so1286474b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991502; x=1774596302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rt3SxBW0V55mE3ZmJ8qpfzk3BnmJicdPxBkCzXkfF2Y=;
        b=LAryY/yPSK8PzQTuyrwcHPXliAr+t3sjgK56Mfdr9minwOVQXHXOk7hEmLCTQXtYSw
         NzACVPZT4LXIc5T749Gm42HhgLjDrpztv4A5AS6g1HToSz5pg52jfc19eXGfYis7fhNL
         8xSqc6zw2DDmef8+iafWbj3C4uD7vv2LkH+os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991502; x=1774596302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rt3SxBW0V55mE3ZmJ8qpfzk3BnmJicdPxBkCzXkfF2Y=;
        b=CDTRxrossMkHrsvTi0Nhrg3rZ0w+o2W8ii/mKDuWly3AeStSnfTa2xholb6Ay8wXsG
         bnFOZn/40ae8h/fxl/sSn95qARWKuVIDRbI0c5vIOSagrSE49iNRC8LaSUBY57bjnqzX
         dwHdixYbUSv3Nd3ABFoiu/Limpx4IIGesBE7Kfrxm5JBoiVQTZO6+sAekchB0XXNnKTC
         TqYZmbKmV8ZFzB0Mw6b70flThTBT8LuhhxLg0LSJ0HZSkEXYrin0bRW2xvVATKbSa7U+
         8wBcKyH4OFSGAOy/8aypE7dPUC/FgqfjkOUZnBq7pcN5rtn7D38DEZ9dTt+T1XDunL96
         g3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXMzSt2avSIzrgkp9eK5wwLGVsYZLEvu8FL3htEB3xpWchINDSzzWP7J/oEOUWzTSNW9UB2HcH8OM0tlS0adg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKq+IRZtmLyKByVUSAyrV1gNgHcyYMHUD1DbzaFAVOoqdJt6xw
	XAOOPn1lImlfYwlnOpRAXV75V0aRRuflbkotrpOI/ldK89LHJrXm6HaNp3kZBU1hFg==
X-Gm-Gg: ATEYQzwR9I580CHtEkGVwDWlfAMGt6EDrAvneEmVhdZuRQ5hBooX3ILmti+Pj8YQdQ7
	6uo90/f0fBnCtzWnqTVhC8YQoVf0/w0ZxWrkfaxDhB7mpxSA0VSE8U6f7zyKMnwrXkp/RX8rxiS
	h4STYX4RGJrzJEEzc5avj/OMhU/ufI83XV3+wt+FYAYoT85jd5NVE+SSonpX2kyw/t4VfveHAPw
	vsiPLzAeoDI8HzZpmqzDyJHeN0sYQNZPZodnOLtO/EukkVhtIpeb0ZgaAS15KZVb7ODLm1gNkRy
	aNcvXso3uaU6htKa40Kpfs30QAXZJvMSBAG9YvifikuTdhsomGG470zLF7MccrV3zGruxRR2FGg
	rkZeWD+A/B2Q11B6xfSU2RKnWzjZzCDN9tIHvdUw7NaWaPTMs6RESKzFL6W92ZOvEsvlQCdjZZF
	TFKcX7qvMPWWj01NHVYcafc/Z2hyruFp+5Ll5XHToDeGZIc2bF2YdLOvKmf6omTqhwS2Cf5O51q
	wkdXXZr
X-Received: by 2002:a05:6a00:2c95:b0:829:924c:348b with SMTP id d2e1a72fcca58-82a8c337596mr1620097b3a.45.1773991502417;
        Fri, 20 Mar 2026 00:25:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:25:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] regulator: dt-bindings: mt6359: Add regulator supplies
Date: Fri, 20 Mar 2026 15:24:36 +0800
Message-ID: <20260320072440.2403318-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072440.2403318-1-wenst@chromium.org>
References: <20260320072440.2403318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002503_483948_F59390FF 
X-CRM114-Status: UNSURE (   9.76  )
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

On the MT6359 each buck regulator has a separate supply. LDOs are split
into 4 groups with independent supplies. There is also a supply for the
buck regulator control logic.

Add descriptions for all of them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index f307a7ed30ac..faa0ccc9189d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -14,6 +14,44 @@ description: |
   according to its regulator type, buck_<name> and ldo_<name>.
   MT6359 regulators node should be sub node of the MT6397 MFD node.
 
+properties:
+  vsmps-supply:
+    description: Supply for buck regulator control logic
+  vsys-ldo1-supply:
+    description: Supply for LDOs vcn33_1_bt, vcn33_2_bt, vio28, vfe28, vibr
+  vsys-ldo2-supply:
+    description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfck, vrfck_1,
+      vemc, vsim1, vsim2, vusb
+  vsys-vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-vgpu11-supply:
+    description: Supply for buck regulator vgpu11
+  vsys-vmodem-supply:
+    description: Supply for buck regulator vmodem
+  vsys-vpa-supply:
+    description: Supply for buck regulator vpa
+  vsys-vproc1-supply:
+    description: Supply for buck regulator vproc1
+  vsys-vproc2-supply:
+    description: Supply for buck regulator vproc2
+  vsys-vpu-supply:
+    description: Supply for buck regulator vpu
+  vsys-vs1-supply:
+    description: Supply for buck regulator vs1
+  vsys-vs2-supply:
+    description: Supply for buck regulator vs2
+  vs1-ldo1-supply:
+    description: Supply for LDOs vaud18, vcamio, vm18, vufs
+  vs1-ldo2-supply:
+    description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+  vs2-ldo1-supply:
+    description:
+      Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+  vs2-ldo2-supply:
+    description: Supply for LDOs va09, va12, vcn13, vrf12
+  vio18-supply:
+    description: Supply internally routed from LDO vio18 output
+
 patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
-- 
2.53.0.959.g497ff81fa9-goog


