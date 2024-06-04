Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF75C25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBxhYOUHGPOJj+Oh+TP9e12XKFk5G9K5xOSnQRpIOaQ=; b=yhOgdjhgIfhNJFm7Wx9BuVN9WI
	FnkORfdXPaSufF2ihBSfXoDpFWiJcl7lMKqNFSNsOy8qLsClmFprWXNeHJ+MVLAD7mKVaRi5qhfXN
	vaHpjf34WSA6ZKJtTNGcvj1sTKBI5VevKvrbBx6E/dMMfSItKznOKmk8PdukV5VJIp3ilrLSXoNoC
	PdpLYj2M+ad6fF1rHMNHEWnWHAfx9V3DlKl7O/V+nBWG5RNgga9tVw30g/hsIri3iMZ9YsyOLRhDM
	blBcP1JkdRc9vY33reAuL7Llclo6aStUClmu+LlPYroW9XyyrSEFq8esYcowGhb3BSyTf13Mf/2L9
	EXwjn0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENtL-00000001PpB-3gmc;
	Tue, 04 Jun 2024 06:43:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENtH-00000001Pnd-46MP;
	Tue, 04 Jun 2024 06:43:29 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so5695066a12.3;
        Mon, 03 Jun 2024 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717483401; x=1718088201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBxhYOUHGPOJj+Oh+TP9e12XKFk5G9K5xOSnQRpIOaQ=;
        b=lhJHrAgbdQV23yfWxJ/BpdTq9X7S4AeCV2i1tO5QiYDHz8YFBuTDhJdmiT9K6XrLMe
         3JnuPZfrBDj2L61bCx3bRkFntrehXpe0nTbAvBsKObE9CUAQ857aJ2HxDUUgtMcZR9NF
         YZgLL5a0MNk5rfALmQqypxv9Z+JvcvT0FIqqzl/UkHTFyDVxix7fPGKIOKdaehMp0Z7F
         gdN4MoL0ct+CSiaiGkRUkryPsEJF+58GXNym06FBgznnVXtLCzsjRd79palY4KBlHZHl
         ddVBpohbnRMorIpyCltG1vAoYycbHMZOFvKUEkzrFvW2zVyh/koVjYi4SLvNt5YEGQIG
         Q4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717483401; x=1718088201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBxhYOUHGPOJj+Oh+TP9e12XKFk5G9K5xOSnQRpIOaQ=;
        b=ADbdinAUmlEYHLB0r/hrnfHc7QZw3zBYP/CLdB0WPjZvQ4lqoxfhWpk93ML/3ITncE
         Pk+zW3IB45vXjtaVi2ydWg348DXX7j+lB4naieSPzdB185fWNMV03y9F3D8hqArvkr3N
         8FhSeDY2P4wDPUSS3BmF4tEK3pBxbXGri8TNH3MUv0qSBOCxwM4e7RQ4TsF9Fgegzqik
         OCgC7CAzFsmwKEI3MxeuCCSzxKMoy6o+YQprKD5JOR4khCr7Vs9M3jJH8utVKcZCk8OG
         V0oVX4G8bLpODARX0I+sTgjMtgHlKP1CPHqDhp+6boPaQzROjIzR0kaN0YYjGjd2DGtZ
         JmPg==
X-Forwarded-Encrypted: i=1; AJvYcCXxVP6EhhhzLJhnA2w67FhXgko/7om0hb3rFExf8JkS4okuxaJOeV01SMGCUEPgd+FUA4RdUwD85gjLTU+60EU6VJv8Ngzl0p162JFDQoEgKUxST0rtBlW136j/15go/zoXo7RF+9sNMpMYAVRyiW2RDpTigjGZRoU=
X-Gm-Message-State: AOJu0YzHH+59qC1dhJCzg8M2amB/3tqfAIjxPThLTjyiC7FEo5ilQXlO
	G+X04NNknOu+M706+DVPvgYyrjs7KoH3QwqSnIQCBRXup7tRrhdK
X-Google-Smtp-Source: AGHT+IFQqMxzojH0qBL1dQPA5ajhEaM/7SsZT+d1V8pDXCIjCCyjz5OqW9edI1UsR6hLYnhJ0ND2jQ==
X-Received: by 2002:a17:907:7811:b0:a66:7b79:3573 with SMTP id a640c23a62f3a-a682022f8a8mr871437466b.25.1717483401084;
        Mon, 03 Jun 2024 23:43:21 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a685b935b5csm547744066b.206.2024.06.03.23.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 23:43:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] arm64: dts: mediatek: mt7988: add PWM controller
Date: Tue,  4 Jun 2024 08:43:01 +0200
Message-Id: <20240604064302.487-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_234328_261519_53FE86A4 
X-CRM114-Status: UNSURE (   9.48  )
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

MT7988 has on-SoC controller that can control up to 8 PWM interfaces.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 3eb5396dea22..27098f724b7a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -105,6 +105,25 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pwm@10048000 {
+			compatible = "mediatek,mt7988-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
+				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
+				      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
-- 
2.35.3


