Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE9CC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm+Gp9pR9IMXXhQFxyLYqm/RbZlHJZIdJ3yAH5kvq7Y=; b=ceHuY9Zjyl+/5O8Vpqg1pkhTVX
	hAFkq2XJa/Pc2YMWEJWsqzW7pslwk8cGuSu3Yr3bDlZiPDpKjWa3rU/keiLcAsgIoag0UELQYlNWl
	l2ZIc0M2EZ0dXFnGyYfgp476kVQen1pE5LLdnYVkduu4HcjNeP8D4iyPn7uiHm3ZIBRJNu3QYZXSc
	IgFUhb53g6B7xurC+EBNqVmKFzzcMZQLIVe6LO9pGdOdAVSBIxUGPLVjUnXkHmiei5npyQ0Tr8qG+
	DQ3wLeMa0utQU+d3pIV9owNUkvrkkez0dQEU6NNpf34RDWjKDsyNIMId59K8s0ZgmYyIa9y6H31zs
	+CSzBtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJywZ-000GdT-10; Mon, 23 Jan 2023 15:41:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyYq-000747-Uz
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 15:16:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q5so6472976wrv.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gm+Gp9pR9IMXXhQFxyLYqm/RbZlHJZIdJ3yAH5kvq7Y=;
        b=TX4Y/4P8Xhe1h9XM0PVorL+OzHG/rDPGMpkSrrgxxUPGlKc+czJQoRpd6sdv0KFnjL
         bxOtBmmFlq2jUmz+XsEUREyIt4JY2zPK8G9aJk438fXVqSzQpdGKPt6a++Zwj+p385AX
         ZGV8C7BQJVQ7iuS1U17IXue8Iqa/vwy0/dlmC00RjpGuhBw3gR++RIlqnHRACBz3poQO
         Ukw8pywqsSGNEscgAsFUUmVewPEfDCTB3ww4eIvU1Bv+djDTWoo0QdQO2knscugsL/rt
         NF0YgtrGPFEKEI9DZvLqVCxaDZO6VIfW4TwFVBn9/z9klLUZakG8OSqF7Xl2ooU1KVe/
         Ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gm+Gp9pR9IMXXhQFxyLYqm/RbZlHJZIdJ3yAH5kvq7Y=;
        b=Zk6O7eCnwsIqQzsYQHgx80nv03Sx8gfEoxh0mL5TcxbZ37XIOewhWxWZ5pLem0JLEX
         U1AJaNeAc3MKK3uDJzp9wvW6W/0QJivCTTz6U4HqAiQJrK//cj26SVLdcVf/oTr3ZgHv
         L8Sr4G9Yc8RHtQudYRfozbA08DNPiWPOigvo+9bCc4bzHJVSJZ0wFvxmFdVMs5+WL5ZV
         roxj9uyDfGUwSaDlz0sfw7LFpY3X1sO/3q7hJkHgaG25rMYDmQQObIGVjite/LFMoglm
         KXepMRSO6SAySCk9ZqKHxYACWAN6Om+N72gwO9TVADSvrvWDIOMP85Cv4cCUPCpP75a+
         hK+w==
X-Gm-Message-State: AFqh2krP/TF9b4r+NDwc9S07vjVkQpJPg0raJTEsBZKFKUhwfT3INzy5
	Vu7FlkWBMjK2u0pvF1xVvtfoCg==
X-Google-Smtp-Source: AMrXdXsOrds413JqL7J/87edldEW0DET/5EYJMlOr3g1/6+tV4yilZkdowNpQSk3rGo59FDk1iRRRA==
X-Received: by 2002:a5d:6084:0:b0:242:733b:af28 with SMTP id w4-20020a5d6084000000b00242733baf28mr21564299wrt.5.1674486999487;
        Mon, 23 Jan 2023 07:16:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6e83000000b00289bdda07b7sm4529287wrz.92.2023.01.23.07.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:16:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8183: drop double interrupts
Date: Mon, 23 Jan 2023 16:16:34 +0100
Message-Id: <20230123151634.370011-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
References: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071641_105269_B0D4C7BF 
X-CRM114-Status: UNSURE (   9.10  )
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

The DTSI comes with interrupts property, so it must be removed if
interrupts-extended are used:

  mt8183-kukui-jacuzzi-cozmo.dtb: serial@11003000: More than one condition true in oneOf schema:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 821a51e458c5..fbe14b13051a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -963,6 +963,7 @@ &uart1 {
 	pinctrl-0 = <&uart1_pins_default>;
 	pinctrl-1 = <&uart1_pins_sleep>;
 	status = "okay";
+	/delete-property/ interrupts;
 	interrupts-extended = <&sysirq GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>,
 			      <&pio 121 IRQ_TYPE_EDGE_FALLING>;
 
-- 
2.34.1


