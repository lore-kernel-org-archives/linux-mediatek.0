Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CEFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9uvubG4e7GuXy/HEqPlxlpTn/mAzNZtQZkDQ9dVw+U=; b=Vvthf+YbaVsOU3YxuD/Y+lId7O
	LMgomWP/ag9i1gx8j+qAoIRgmVC/yU+IdBPW3/y4TnkWQhbY9t6rSxgiIp+qee8M+jGEWeRslleC5
	OGZ7jfl3E0v4Mq16eD3/T8J+buGXJ/KJKSxnsza9u0T7hSE0Qc26+vTZTgCBW3j/NHQXhukaZD6JM
	D69yszQUoEzZWtdVy5C81BB8wppm1nBr09RxdUef/5fnL4riHSvv5YRITp8ww1gmRpbi8ZKpRhwnG
	XZWqD+COTO86D2cqb4jDdUEnrGE99oBHgSX/Zp+4BPHOlLtpY9XvjNx4fIpsTN8Jy1IURdhlEw2VQ
	6wXdoSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKuz-0000000AMOT-3Ht0;
	Mon, 29 Jul 2024 07:35:41 +0000
Received: from smtp61.i.mail.ru ([95.163.41.99])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKuJ-0000000AMFG-46AB;
	Mon, 29 Jul 2024 07:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=L9uvubG4e7GuXy/HEqPlxlpTn/mAzNZtQZkDQ9dVw+U=; t=1722238499; x=1722328499; 
	b=FGwegc1xIirycFK5/y7s/AvEOId5GJFFgNrxDR/niXPd74FPCxGmKdPmeyq0CVyBYpsLat27mmu
	cDOQt3Ix1sfcB2zrcG+ia8uPcIazQTGpkFpS/mi/hP7a0I5jqf3xP2uOgDz+6yWuvT7UhcSEu1yiA
	yJpumGicKkn4POPrWow=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKuF-00000000275-38KR; Mon, 29 Jul 2024 10:34:56 +0300
From: Arseniy Velikanov <me@adomerle.xyz>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@vivo.com,
	jiasheng@iscas.ac.cn,
	mars.cheng@mediatek.com,
	owen.chen@mediatek.com,
	macpaul.lin@mediatek.com,
	zh.chen@mediatek.com,
	argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Arseniy Velikanov <me@adomerle.xyz>
Subject: [PATCH 1/5] dt-bindings: clock: mt6765: Add missing PMIC clock
Date: Mon, 29 Jul 2024 11:34:24 +0400
Message-ID: <20240729073428.28983-2-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729073428.28983-1-me@adomerle.xyz>
References: <20240729073428.28983-1-me@adomerle.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-868bf69f6c-zg7fr; auth=pass smtp.auth=me@adomerle.xyz smtp.mailfrom=me@adomerle.xyz
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C6F0D221D1B7CB84E2160E2B5FE815AD3B182A05F538085040EF34FD0AB11A37C53DE06ABAFEAF67050A0C1D41407711BE303324A9B5BFDD3258986F725C2A4283
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE793089AEA09EF102BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745B6F93C788775E78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8EAFA047CD450D65583832EE758E1DF54FD86F243095BA4A5CC7F00164DA146DAFE8445B8C89999728AA50765F7900637028599BB38096F4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2A98E5A6551E3E5117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF055A3127ECEB1CB3BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B61FFDF4B5E34157C176E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C5E1C53F199C2BB95B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5F5DB60828C4BA8AE5002B1117B3ED6961D04A7459567D2FFBFF4097FFC9E796F823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC35B71914E27C0DF66C6FC9A8988FE5A15CC854EA8CCEF6E2AD8E098005480FBB0F06D2F9487D0FC67C7AAC6E25A2086F0B81A1E795561CBFEDD108130C0427CA96BF36F8852DE3522BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6Uopk33/Q/B+g==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB548372E88CF31825DAB951B70A5BD4BD8EADFCC5A6732EA59FF1FEA02A07AA46D63B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_003500_223809_283E6629 
X-CRM114-Status: UNSURE (   7.15  )
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

Add PWRAP clock binding and shift the following ones

Fixes: eb7beb65ac30 ("clk: mediatek: add mt6765 clock IDs")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 include/dt-bindings/clock/mt6765-clk.h | 131 +++++++++++++------------
 1 file changed, 66 insertions(+), 65 deletions(-)

diff --git a/include/dt-bindings/clock/mt6765-clk.h b/include/dt-bindings/clock/mt6765-clk.h
index eb97e568518e..5d3a603a0d36 100644
--- a/include/dt-bindings/clock/mt6765-clk.h
+++ b/include/dt-bindings/clock/mt6765-clk.h
@@ -161,71 +161,72 @@
 #define CLK_TOP_NR_CLK			126
 
 /* INFRACFG */
-#define CLK_IFR_ICUSB			0
-#define CLK_IFR_GCE			1
-#define CLK_IFR_THERM			2
-#define CLK_IFR_I2C_AP			3
-#define CLK_IFR_I2C_CCU			4
-#define CLK_IFR_I2C_SSPM		5
-#define CLK_IFR_I2C_RSV			6
-#define CLK_IFR_PWM_HCLK		7
-#define CLK_IFR_PWM1			8
-#define CLK_IFR_PWM2			9
-#define CLK_IFR_PWM3			10
-#define CLK_IFR_PWM4			11
-#define CLK_IFR_PWM5			12
-#define CLK_IFR_PWM			13
-#define CLK_IFR_UART0			14
-#define CLK_IFR_UART1			15
-#define CLK_IFR_GCE_26M			16
-#define CLK_IFR_CQ_DMA_FPC		17
-#define CLK_IFR_BTIF			18
-#define CLK_IFR_SPI0			19
-#define CLK_IFR_MSDC0			20
-#define CLK_IFR_MSDC1			21
-#define CLK_IFR_TRNG			22
-#define CLK_IFR_AUXADC			23
-#define CLK_IFR_CCIF1_AP		24
-#define CLK_IFR_CCIF1_MD		25
-#define CLK_IFR_AUXADC_MD		26
-#define CLK_IFR_AP_DMA			27
-#define CLK_IFR_DEVICE_APC		28
-#define CLK_IFR_CCIF_AP			29
-#define CLK_IFR_AUDIO			30
-#define CLK_IFR_CCIF_MD			31
-#define CLK_IFR_RG_PWM_FBCLK6		32
-#define CLK_IFR_DISP_PWM		33
-#define CLK_IFR_CLDMA_BCLK		34
-#define CLK_IFR_AUDIO_26M_BCLK		35
-#define CLK_IFR_SPI1			36
-#define CLK_IFR_I2C4			37
-#define CLK_IFR_SPI2			38
-#define CLK_IFR_SPI3			39
-#define CLK_IFR_I2C5			40
-#define CLK_IFR_I2C5_ARBITER		41
-#define CLK_IFR_I2C5_IMM		42
-#define CLK_IFR_I2C1_ARBITER		43
-#define CLK_IFR_I2C1_IMM		44
-#define CLK_IFR_I2C2_ARBITER		45
-#define CLK_IFR_I2C2_IMM		46
-#define CLK_IFR_SPI4			47
-#define CLK_IFR_SPI5			48
-#define CLK_IFR_CQ_DMA			49
-#define CLK_IFR_FAES_FDE		50
-#define CLK_IFR_MSDC0_SELF		51
-#define CLK_IFR_MSDC1_SELF		52
-#define CLK_IFR_I2C6			53
-#define CLK_IFR_AP_MSDC0		54
-#define CLK_IFR_MD_MSDC0		55
-#define CLK_IFR_MSDC0_SRC		56
-#define CLK_IFR_MSDC1_SRC		57
-#define CLK_IFR_AES_TOP0_BCLK		58
-#define CLK_IFR_MCU_PM_BCLK		59
-#define CLK_IFR_CCIF2_AP		60
-#define CLK_IFR_CCIF2_MD		61
-#define CLK_IFR_CCIF3_AP		62
-#define CLK_IFR_CCIF3_MD		63
-#define CLK_IFR_NR_CLK			64
+#define CLK_IFR_PMIC_AP			0
+#define CLK_IFR_ICUSB			1
+#define CLK_IFR_GCE			2
+#define CLK_IFR_THERM			3
+#define CLK_IFR_I2C_AP			4
+#define CLK_IFR_I2C_CCU			5
+#define CLK_IFR_I2C_SSPM		6
+#define CLK_IFR_I2C_RSV			7
+#define CLK_IFR_PWM_HCLK		8
+#define CLK_IFR_PWM1			9
+#define CLK_IFR_PWM2			10
+#define CLK_IFR_PWM3			11
+#define CLK_IFR_PWM4			12
+#define CLK_IFR_PWM5			13
+#define CLK_IFR_PWM			14
+#define CLK_IFR_UART0			15
+#define CLK_IFR_UART1			16
+#define CLK_IFR_GCE_26M			17
+#define CLK_IFR_CQ_DMA_FPC		18
+#define CLK_IFR_BTIF			19
+#define CLK_IFR_SPI0			20
+#define CLK_IFR_MSDC0			21
+#define CLK_IFR_MSDC1			22
+#define CLK_IFR_TRNG			23
+#define CLK_IFR_AUXADC			24
+#define CLK_IFR_CCIF1_AP		25
+#define CLK_IFR_CCIF1_MD		26
+#define CLK_IFR_AUXADC_MD		27
+#define CLK_IFR_AP_DMA			28
+#define CLK_IFR_DEVICE_APC		29
+#define CLK_IFR_CCIF_AP			30
+#define CLK_IFR_AUDIO			31
+#define CLK_IFR_CCIF_MD			32
+#define CLK_IFR_RG_PWM_FBCLK6		33
+#define CLK_IFR_DISP_PWM		34
+#define CLK_IFR_CLDMA_BCLK		35
+#define CLK_IFR_AUDIO_26M_BCLK		36
+#define CLK_IFR_SPI1			37
+#define CLK_IFR_I2C4			38
+#define CLK_IFR_SPI2			39
+#define CLK_IFR_SPI3			40
+#define CLK_IFR_I2C5			41
+#define CLK_IFR_I2C5_ARBITER		42
+#define CLK_IFR_I2C5_IMM		43
+#define CLK_IFR_I2C1_ARBITER		44
+#define CLK_IFR_I2C1_IMM		45
+#define CLK_IFR_I2C2_ARBITER		46
+#define CLK_IFR_I2C2_IMM		47
+#define CLK_IFR_SPI4			48
+#define CLK_IFR_SPI5			49
+#define CLK_IFR_CQ_DMA			50
+#define CLK_IFR_FAES_FDE		51
+#define CLK_IFR_MSDC0_SELF		52
+#define CLK_IFR_MSDC1_SELF		53
+#define CLK_IFR_I2C6			54
+#define CLK_IFR_AP_MSDC0		55
+#define CLK_IFR_MD_MSDC0		56
+#define CLK_IFR_MSDC0_SRC		57
+#define CLK_IFR_MSDC1_SRC		58
+#define CLK_IFR_AES_TOP0_BCLK		59
+#define CLK_IFR_MCU_PM_BCLK		60
+#define CLK_IFR_CCIF2_AP		61
+#define CLK_IFR_CCIF2_MD		62
+#define CLK_IFR_CCIF3_AP		63
+#define CLK_IFR_CCIF3_MD		64
+#define CLK_IFR_NR_CLK			65
 
 /* AUDIO */
 #define CLK_AUDIO_AFE			0
-- 
2.45.2


