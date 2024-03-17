Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA2C54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqwAYXgZcepvHlePhp28/MtjgzY7DKHyuuJEXxpcBH4=; b=yO4O2h7iqRNg2wvsgieGC06SQ1
	r9hoyy5laFtDy3eE9xtTQ+9XbXtRjUYvwCBl4VmpKtaRd4SsC/Fg+Huhb7dorHyqe6qPieSOYy9fR
	TEhKln26CMpMxfr6XdLt7l/B5J9YfB40FQEc+FT1nEv4Zf8YKUQVP6pT6RfSUQpE/lBowJz3rZVZf
	ufxVFPd+n5B7Q7lsbK7D0cIoAUOvndrx9Flox84qibuYrxxJWyCrNF/AHcSXj64UJdNDHoJMmfYUa
	bhNDz+GLsfXK2HixpeELvQaoTHwbxD0gmuBtEP1pY6UBOFFBZqH2SR0FG1Zick08bhNNE/hUIGMO8
	BxRN3M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjy-00000006c4Q-2bB0;
	Sun, 17 Mar 2024 22:12:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjQ-00000006bgI-0f5m;
	Sun, 17 Mar 2024 22:11:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-513d717269fso3491980e87.0;
        Sun, 17 Mar 2024 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710713501; x=1711318301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqwAYXgZcepvHlePhp28/MtjgzY7DKHyuuJEXxpcBH4=;
        b=l5FgibSyz/cJLnKsmRjmPUkk5cg+iL89won3+I+9lQKrBCvNII/xSj6t3PL0Du2YBp
         jN5oQe8zyRtAmfTG4do+of2Ou0jfBTm97NzEOIqf33ugdG+XQZFI2K/r0pStA+nij2J6
         uTRX1QU9FiTE3MImJKGJjImQWiYYZ+0Qdlp7TzU7b4WJVDh5zeErTPP5lK8wrc+wVbl7
         rc8qJ8FDtl6bd3QIk4W/ip/WD6LP/GuNVC92XYY2l4414IV09OHitKQmn03RKhkPJI6y
         atS5GgXX35U2RSbh5sjmRtScT0gB+8ZLSiXBUSk/yEZCv/iw0bEKUhVa84FQHKZBgW4i
         4zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710713501; x=1711318301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqwAYXgZcepvHlePhp28/MtjgzY7DKHyuuJEXxpcBH4=;
        b=Am8XMlJ2j7HgF3JgpPSNtZEhKRRvF2TcGaXwlyxhBIH0tzfoIZ929wchTqqEzNWECM
         MtvrZzLjaMXk7nNAsDiOIoDNfi6txiToxsIW1dLgHwTmI7K1N7iAtVvYt5TELzo56/oH
         3qeAxYCo97ZrSLtPYN+HOwWRoBoALhqTj+C1R6Kfon3JcSdxcjEGqFOnVzJ8VwpV46rE
         Eb9ZJfSEuVbh5RYE41qWJ2w6MB8ht/FD8imsqSMQw9ov/vJRXktKw0jn7HeIdjMbOQKv
         5pUYxnPOKgzuKlgLgslhDBQuZ1d0HqYs/f1LeU5/Nv8CadW0VqHEkdM8IfkC7YfgfXgF
         BKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVcO2kepGglW8O06QoHxJF5rGAzb8PxOPXn28DNpE3x29COeXuUD9Dx47sUzgb4/JQQ1VCiJWoYyu51tSkJFuAxTe8mmyyI4rs1PWijLKwx5vOjTvVqleUHsPZ3f6UVWhEOADK0Kv77UTCsa+G3AwHg6pDJKVIqp0=
X-Gm-Message-State: AOJu0Yw/61GI0ND+KrkaTseoXboAjQuA4kcatcq7Z8uIUTwGNlld5B1L
	fEIIbFK8+jcH04/kNVzO13xhyLiSGcrFKnPYhS4Fau79zMnXW699
X-Google-Smtp-Source: AGHT+IHPS5hTFALXlpvYUPk63ag5W1eoin3JPAlIpLno70ePcqta80cRb8eG7XXorItWH+2r4mheVQ==
X-Received: by 2002:a05:6512:3134:b0:513:ca36:83a6 with SMTP id p20-20020a056512313400b00513ca3683a6mr6323979lfd.23.1710713500673;
        Sun, 17 Mar 2024 15:11:40 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b00513d8e5a088sm973049lfe.140.2024.03.17.15.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:11:40 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	"David S . Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 4/4] arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
Date: Sun, 17 Mar 2024 23:10:50 +0100
Message-Id: <20240317221050.18595-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317221050.18595-1-zajec5@gmail.com>
References: <20240317221050.18595-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_151152_243874_51C715FE 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Binding doesn't specify "reset-names" property and Linux driver also
doesn't use it.

Fix following validation error:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: thermal@1100b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
        from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#

Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 8e46480b5364..917fa39a74f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -513,7 +513,6 @@ thermal: thermal@1100b000 {
 			 <&pericfg CLK_PERI_AUXADC_PD>;
 		clock-names = "therm", "auxadc";
 		resets = <&pericfg MT7622_PERI_THERM_SW_RST>;
-		reset-names = "therm";
 		mediatek,auxadc = <&auxadc>;
 		mediatek,apmixedsys = <&apmixedsys>;
 		nvmem-cells = <&thermal_calibration>;
-- 
2.35.3


