Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD737C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuuqWS/zETzQP4dBpV3f94YH5YVYzrmMgulqqtiHf0Y=; b=J5mp5Wf/PNCudUHC8Mps2RkxNv
	qZOBX8F/lQQ3wBPKdO26Dhrakw8ItDq2Vy8Nzpzo55Ok0nAPI2e2P7sW904x79gmG7otYXYsKKoal
	k1yW/hOnKnFNzGpN0uZazQkM8Rx3jRH6UerS4NUR+HplcHkRR0uFdhf+zkFRlDQo6yHDyuXFcx4mP
	Va2GTUpVeYS144tewov/+LafFvWazlB1XA+74tlOyctLRMaIjy7guRmHaPgS3wO+q18loUSLM36G+
	nrShrYdkyBJXx3iEYgctt2f0DqhYNBwOE64OhLjWQ5imHhZKZ4ITnZKGFmrkn9PNh4XiwTlRlYotU
	MB5Qjg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFo4-00000003FxX-28fx;
	Fri, 26 Jan 2024 06:35:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFo1-00000003Fw9-14X1
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 06:35:14 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ddcfbc5a5fso156010b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 22:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706250911; x=1706855711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuuqWS/zETzQP4dBpV3f94YH5YVYzrmMgulqqtiHf0Y=;
        b=Rp9lvfKHITQXTrPXd0vGm1DWBIUpNNJyIqz0bHkLfzc83YB94dy5RiNrXjGzqGSCru
         waRaLVcwtGXd05MoTBlWvloMtZ4GcPqcXWDdpf3xcPEn7a829ISkfj+sSiMjJdAVDRUO
         sG/4mzJbhEuOK9LDeuxl6guEYOXDUpthvgDUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706250911; x=1706855711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuuqWS/zETzQP4dBpV3f94YH5YVYzrmMgulqqtiHf0Y=;
        b=puqdyP6U8GH0YB0ZoEINJsDXrUDyad2oE4csyTrLGSgvnkbQ0d+hyOYe0bklD/F5CA
         O9rtzr2LaPteKqBqs0JNHItAM7bcqW4yz7egod4BxQq7Zn6kT3RRzg9YmYkGRCHj8uTV
         zixO0tyhVZsNmvV50VXujLC6323NU4MxfTUEdfkm4HnHJuOavFCoAkpcTmxpaN2jHcnk
         fsN0wN80SXwm1DXsRk3ZEsOCZqiDWcB1ChnQrKZbu8myTddNIu5mu49jgasRRgjk2iI0
         7lSoijcwxsxyHN/+iZQ2ZMY39tcWnQJShKduZKtj3g5TdN8JeoKNvWTJrffpQAG45WLL
         kvQg==
X-Gm-Message-State: AOJu0YxI86CfmSnmigT3lHeK/OZ3leVuY6qZHscbhNfjC20ucrDCTLcV
	Gfp7E/glGbG5xHAkJDldkP1ljionA+k67xHMCScTTcCT5F5cnZBEkPzH0374CA==
X-Google-Smtp-Source: AGHT+IFs+9WlKz8MghdgDvZcD36shY1/fh3wT7sOOIqi0oykByBuVo1+tb7sfuf0UIIKn6b50YL6fQ==
X-Received: by 2002:a05:6a20:d805:b0:19c:8eb9:5d51 with SMTP id iv5-20020a056a20d80500b0019c8eb95d51mr101790pzb.43.1706250911400;
        Thu, 25 Jan 2024 22:35:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id ka3-20020a056a00938300b006db13a02921sm488735pfb.183.2024.01.25.22.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 22:35:11 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node
Date: Fri, 26 Jan 2024 14:34:58 +0800
Message-ID: <20240126063500.2684087-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126063500.2684087-1-wenst@chromium.org>
References: <20240126063500.2684087-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_223513_374735_6E73ED9F 
X-CRM114-Status: GOOD (  11.95  )
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

Bluetooth is not a random device connected to the MMC/SD controller. It
is function 2 of the SDIO device.

Fix the address of the bluetooth node. Also fix the node name and drop
the label.

Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v1:
- Collected reviewed-by

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
index a2e74b829320..6a7ae616512d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
@@ -82,7 +82,8 @@ pins-clk {
 };
 
 &mmc1 {
-	bt_reset: bt-reset {
+	bluetooth@2 {
+		reg = <2>;
 		compatible = "mediatek,mt7921s-bluetooth";
 		pinctrl-names = "default";
 		pinctrl-0 = <&bt_pins_reset>;
-- 
2.43.0.429.g432eaa2c6b-goog


