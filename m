Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE960A2601
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oZvZgr46;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdahMkH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=; b=oZvZgr464+Dpkc
	+s877RCT9cdzMNJ8fmnkuqhNoEOsa9cXo82c5Fdz7jwp/g00wYv4i5jlxAo7wESwJ3J9TuzcKQbn5
	ietY1gCRlm6dkDxoRqRnOaknAIC39x5wxML6LriuCih+n68G9M17rRsV0qRNhBKYuTE2MHY0Mvzv5
	7woPSO479w/KG6Yw1EMb63XzkZEukBcanHRK71+SK2SGBXT8EwgFQAiY4iNsm8qsFKFlFTFr57Njb
	Ta3AP5GtCXPmHak6NrxYhV+7ZTP1ivqvczuQzF7Q5KNAwLUu3m54U2u8/fH5ulZc2mUYQV8qalQmO
	yK0iwmNax8b1+0bOJruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPor-0000000FHxj-3TkC;
	Fri, 20 Nov 2026 14:42:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoo-0000000FHvj-3qn1
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso512522a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185746; x=1795790546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=jdahMkH7OnMh784rqFRXYHI2jFnJasJvd06spv+LA7P2qrzu0zIDxJhqWOIChsEJBN
         f4Woyj/lCTqN3FO+L2ZWsquvIHIYFiEEWXkEOsKRuU1ghgS+03mrGxf/LmeOhFa1rQrI
         u+W+zquvnjG8EpNYxSibMLP0l/g3SEzbqw8+w5GReXK4EQM+3orxqhrNqsHvV6ECSr5o
         dwMY7CfyQ1BaEHwb6fpgdGnKj21Cz8BTRsgtLKRgUdTLjqqdOBf76IIzoJkRu5WbXWyz
         iM6v2r2W2NxbNMzF/+NA6v4Ax82ANnIGVn1EcUaNm/4R1YcgxetJFGnT79fvP0rJAn4l
         q4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185746; x=1795790546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=G6L2IMWsLdIRQcyFYCaHxGPqn5A3/ZmEPnyFiz2UVIOJdqIqyUFvDGQ3wJeYzgaZ46
         yAd01jDfFJ1gwOPPkT/veizbZNxLN2FmojD457lhexxhiIqQBU71H7K1Smlr1d29w3qD
         qZZhqnwIeBtyRgMTV50CXKozZ41MdyYycPX8PuOwvnex2H7/LMThb7XzlYLyssIjhCH7
         SPwogDzRlrRprdoUjhr+AMWmD7PyGJs1UOCkYVr+Z6ZWF1Y5Yd/JxcEHQg1lROjDAVbf
         EnGrn38v80m3N91+iMNrH7s/Uwrr/TmGZ+diqkYy5T4nC5BkKPEnhyQl6a5Yim0GPFyX
         tNPg==
X-Forwarded-Encrypted: i=1; AL+hErGjGqQ9zelyGWrkbZC0nSybY+dHdCQGCFup1emdA1Rsc+ofI2wRizxpk8m7VrPX4OuptCmQZTTgXAGAsPn2Lg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/vi700EvTD/mDo4g84NTnSZ6RktYnrt70h6zHyXt8RxheNW2yn
	g7WqsA9EQXgFhUEuDjTfNSZ8oE2BSXJ5dqeOmiimgZ2r5mUn+9ypne7G
X-Gm-Gg: AZFdTZd69sOI26C1r2y/V4qHRKEVbrAezwr3ErQtXQFGHRjPX1Y40khXyuWfoGCk9OR
	+m+r8Oq1AEwEQheNP7RwrJpNTVckRAQaPJnzrhgJfmPA8c49CrV3GrCuWG8taNkV2REM+CVrfI6
	tg+W8wAvVS5HRjQ/fqRtw/TVpVsk+MszMuxTtPfAGHqSYUy6UowzSqA5HyvSLl8mXNSAYgm8GyH
	/UDEyXLPCvghZJSNQSMnObAwvfcWo8WAJ0mlKV6L4NtuJ8sIESV8ZrH+Rpy5bImciGYrP9dLNvC
	zxQycsR8QoJ4Y8PXTTw5Soi/OtZPM1YvV1WI+Hv+LhmSyv5u43q2g2m+4CgRZOmoiBqQ+tyTlNu
	uWJV+l8CtpJNASyNGKH0hHn08an97Eb+2LUoCVa4zKLGQJ6vXNQa+mseoGsbP7irq8qvGt7uNJN
	Pz77bDTe94d8lu6XE4PxdyhOgi4/xelXb1BiKtAKy6EhNi7BxufERdU5+6ZJeXGVdY6lCM/15GE
	ahSCYFDaFFykM6TGBy+aD9Bx9CdWJWYF7wM2mWx0mNZqo/FQDyw6I6G9qoxqaZrZwPFkUaaYlyO
	P/jSENq6xdDQ6tjP4/pIyyicBqYurdhOzd7JZw==
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr3172758a91.55.1795185745681;
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:46 +0800
Subject: [PATCH v2 3/3] clk: mediatek: mt7629: add RTC clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-3-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064226_979357_BC4D0655 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 517c43b19f18..4843bc55dc7c 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,7 +17,7 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
-#define CLK_TOP_NR_CLK		108
+#define CLK_TOP_NR_CLK		110
 #define CLK_INFRA_NR_CLK		6
 #define CLK_PERI_NR_CLK		22
 #define CLK_APMIXED_NR_CLK		7
@@ -290,6 +290,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -372,6 +376,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -463,6 +468,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.56.1


