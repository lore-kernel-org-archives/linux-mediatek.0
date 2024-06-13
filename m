Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE89C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrKmU6eRMRuPqBLgOvID9Wsb8PYxyp8mNSsce2VFhn8=; b=ZauFF/mjLz7qx4nZW37oXk4tln
	qWLGTvvVnrzWWMzvM+ZK/mecwetx6m8BYn80/jJqmxCnNCzHamT/YEJJjIKe42EWN7KiQ2pzvGZEh
	TurMR59W20CYePZmrTXQ2Jfuz4VuYzI4G/r+1+j/nI8vmcZ+Ie3BtW/ihsEwXpO4IGuf/aDYVDKW2
	KRKIh5pUWlS5iPNr96cg8GqKJrHXMRskc+tKfA1oeUIhpSBcNR9Gd3FOrrryrbU3YOTJ0FQqoDpV8
	JtUnr/idsRc2012EmPW/RRjemq4FCmq91Z8RpdbtjnwuLQ3XHFF7LFytz+Q018zgAMI5vFnUbxHH2
	4+9v6Atw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHqbv-00000000LtG-0XCy;
	Thu, 13 Jun 2024 19:59:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHqbq-00000000Lr8-1X7y;
	Thu, 13 Jun 2024 19:59:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a6267778b3aso142783366b.3;
        Thu, 13 Jun 2024 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718308785; x=1718913585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrKmU6eRMRuPqBLgOvID9Wsb8PYxyp8mNSsce2VFhn8=;
        b=WWJzQ9+yRxJkdiXQfTW601mKPXXK46v4nuuwd7szpHjBWXKxSq1BUxMC5vkGgGc/L5
         HGFWwgyfiTSTF+F2W4/5J3GOlLC5uA5nO+vwHiwk+gah2vXwU2K0hBPRtbz0pwGw/72b
         EzOnhux0yzUb/NdTkm65vYul38Ihk/OapHD8n3DjJpvaHJCNmF3wC+ezmef/uhhaZ3wc
         EGR4wLxyV7FtN0SDTxc868dkA7cT+KjBhMRewv9/NFJPvu3dOCYkJeggbQzyU6FjTnsp
         EjIoJTC2xSIKehySbR/DvQOV0Iu2zyCYEkolXmwaRYj5yymX4YhbonayB2daD383z+8o
         DviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308785; x=1718913585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrKmU6eRMRuPqBLgOvID9Wsb8PYxyp8mNSsce2VFhn8=;
        b=JBhRSSB3Dh5uaHrLyS9y+P1RvjItxvjVUQWbXMcHEniwi4MTcuy1Fv9CfdZN2sG/KO
         iGwj4gF0rVF4i87XF9I1ziWdd7u8QyeiFxS065gSjGbC54ujQ+Ybr5wj4cXRXXxhDbdb
         4giEJqNPUvw4kZTEsoCJnKxbxhs6Uow8gLSXZUilrMIM2cgvh2HJkVvZJCnlsIbGPlTj
         7iZhIltEkTWADifaMdoFJkZa31Lf5zS1UCf4y358gKKwPQW0kAXvYUZQiCLSjgTroKIU
         P6Ci8OBOZZnTMJjGynnjl664yfai80xGhczX5gmUxsQoF1gMkQKfCK38rlZMlS3zkM0X
         utYg==
X-Forwarded-Encrypted: i=1; AJvYcCVhuS2anrH+INO6+QwTtd4WKY+h/nuWx0+poMTerLIdmZYMySLI6Ge+rXyDJPMIB934qaY+qdYx2cZSf0oCqTzWKYNIMkN9gMTcX/9X3+ROCKy6TjpTq3GS5eIAv9ZFTgJ0mkozv8byMmpV+wcpSCquGF7yFGNsBmo=
X-Gm-Message-State: AOJu0Ywj2fagKADahsvEbkTqjAlUofSwL0FtfE2yBfydUh90ANm4ZTpr
	Z72Z6PTWdSvamgAbwFsto1maD7c0GeCY5iAPkcnzlHXhBTKPq413
X-Google-Smtp-Source: AGHT+IGDHbDv4ms/P9PrBJz0EAT3HdckMfVEcUXEXk7o27MmRrafM56asxH7zm3TtHDjNE3yVy061w==
X-Received: by 2002:a17:906:1c55:b0:a6f:3210:ac1d with SMTP id a640c23a62f3a-a6f60de0e05mr47496966b.63.1718308784463;
        Thu, 13 Jun 2024 12:59:44 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c858sm103092566b.206.2024.06.13.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:59:44 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988: add efuse block
Date: Thu, 13 Jun 2024 21:59:33 +0200
Message-Id: <20240613195933.31089-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240613195933.31089-1-zajec5@gmail.com>
References: <20240613195933.31089-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_125946_444088_23CCA88A 
X-CRM114-Status: UNSURE (   9.68  )
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

MT7988 (AKA MediaTek Filogic 880) uses efuse for storing calibration
data.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 7690a83911af..c9649b815276 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -231,6 +231,13 @@ clock-controller@11f40000 {
 			#clock-cells = <1>;
 		};
 
+		efuse@11f50000 {
+			compatible = "mediatek,mt7988-efuse", "mediatek,efuse";
+			reg = <0 0x11f50000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		clock-controller@15000000 {
 			compatible = "mediatek,mt7988-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.35.3


