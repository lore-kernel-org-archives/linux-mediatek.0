Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB0EC47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ebCavULEeyT/NmLcH8invXwvVhmIdOGSS9McWBMZcg=; b=0pIkpcvBghotlDhTFzUts+Dp6J
	YP86Ed/GHzViilll56WkX4AaM7dkabCkPbPZPyhOexFboqLm+5nwVG6Z8ehDxCTHW2PhGg+Go7T7l
	LXj0V2ssur9LqSr/HLGgNn1Th64c64eCBmqm33weremH8QQluQYAHOjk9rdugxvTZwTnpIIYQqukV
	KGcNCwwO1JdLy5qF53s3GLegIMPTxdyvD6AgIhkNo1hjj7hBjvrhhen4vIGgSqACtMOAalhkea/3A
	Rf3Ouawyhi5THwUWx0xQmASbumjp8+VGJTz6OXd3O8JHkWSliGnQ+bKW0XKZp/0gHq/F7aF1A/Lej
	CoPZN1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuHr-00CHYK-1E;
	Mon, 22 Jan 2024 13:24:27 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuHo-00CHXT-2Q;
	Mon, 22 Jan 2024 13:24:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50e67f70f34so3026472e87.0;
        Mon, 22 Jan 2024 05:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705929861; x=1706534661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ebCavULEeyT/NmLcH8invXwvVhmIdOGSS9McWBMZcg=;
        b=IQ3tyX0UVtbnFTOziYZY8MBoHbkZqcTmeo+/4Tou4f1pZiE/hAbNJSuzMCE9n9eJJS
         y3fTvhAwfAOT+7yW+ZjRa8XcTOFkoJimg09grjYbK6RS14DFY6CChqGVXmGRfMGqqCoI
         BATCwOg7CidC+V0yd+SOXRvytfp4HOGIxOfqJ/MGABMAxOaYvZMPHR3I+jgt+H72o8hX
         FsQLhdQAszcByjstIKORh50g7UemApCpO6NcL+eldjcxLkj7RD1Du4HWXtugq4NKc7eU
         tMk9vb6V4NIukP/BNzbN/VJeaK32eqFlPLMArs2Z4B8AHU6Jl9Gic2XV9HAmMGUjHxcC
         53QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705929861; x=1706534661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ebCavULEeyT/NmLcH8invXwvVhmIdOGSS9McWBMZcg=;
        b=YFWTPdWshhFf6xe1afNNznuARxd2xd2c+mPLPBZ46jS8whbzBSsG0rJMqYgoyAVBIW
         7QiEYfAXJ1k87X7GKqcsQ9pKPyFrd67eW4/fCUq5mFrQCmPbwtLVvfI+QgVLuiypcW11
         zUAMLF4Q9FtCUK215cTj5/Dv3HrchGHNb/94aPtdnvNl4PaUS6Dwxxk+AaRT2RnRImiJ
         Yr6/gAMOFZOaO58GhnJuvn4RpjhSbhAvAgWz1ZIs5E5fUjS+eY6ILJ7UWfs16uTU5bV8
         bGHaSulautwLmfItRf3LMoO4eRPBXLDIMQxKL5iQeRDFWgsJfKYrogaFRNRN/FRcZXge
         1TIA==
X-Gm-Message-State: AOJu0YzivFGyYB/f0PR7LmUoGn18tBfBU/o0q4Ukd/t5tOw1DjA/mE7s
	0NRhufT9vOuirHDbdHHAkkNdlIeEic58IXUv7HihPjZZimPXKhAI
X-Google-Smtp-Source: AGHT+IHkqDxdGIwLvaLv3tVXDkHxcPy43PdnlSgk0RImB4b0VF1UUD4kLrDGMQseJGHCPoZLADE7gw==
X-Received: by 2002:a05:6512:b11:b0:50e:7e29:b0e9 with SMTP id w17-20020a0565120b1100b0050e7e29b0e9mr1848540lfu.73.1705929861126;
        Mon, 22 Jan 2024 05:24:21 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id w25-20020a17090633d900b00a28479fcb8esm13398980eja.103.2024.01.22.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:24:20 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
Date: Mon, 22 Jan 2024 14:23:57 +0100
Message-Id: <20240122132357.31264-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_052424_814681_8FDFE03F 
X-CRM114-Status: GOOD (  10.82  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This fixes:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /: memory@40000000: 'device_type' is a required property
        from schema $id: http://devicetree.org/schemas/memory.yaml#
arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /: memory@40000000: 'device_type' is a required property
        from schema $id: http://devicetree.org/schemas/memory.yaml#

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index a1f42048dcc7..850b3e277368 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -75,6 +75,7 @@ led-1 {
 
 	memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
+		device_type = "memory";
 	};
 
 	reg_1p8v: regulator-1p8v {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 2dc1bdc74e21..5c26021fc4cf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -57,6 +57,7 @@ key-wps {
 
 	memory@40000000 {
 		reg = <0 0x40000000 0 0x20000000>;
+		device_type = "memory";
 	};
 
 	reg_1p8v: regulator-1p8v {
-- 
2.35.3


