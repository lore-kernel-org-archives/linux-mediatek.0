Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EDBCA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=; b=zpeD59BuysS8IhEhjL7szsaeZD
	RTiZfj5ArVa5g/YlD6fC39E/HcCRfnOHfD3IvN7v80xvIVFLj5wSGolZ3Ad0AKleUXAeh5r1iavvF
	Y6ZjImdWkRA0xD9T8/6BvtpRscGiney+0rqDxUcgoQ10l656x1QwhYJ1Fnk5gavYPDCRgV8if5MLw
	kkSzwQIxiEcT8PMs+4pSKLAR9pgdxmXIo4A2Wwvt52EaulgDNHkX+ECcyqKrDniDR9bF/zQp/50AN
	XhmVs8q3eqpFSUX5tWaVzbKWtCZqI82Qk+gSHnm4QsNtJlvp1Jc+M9K28hKcWehPjfWgm/YXUYfYF
	Alc6Ghpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDytL-00000000975-0vA2;
	Tue, 06 Oct 2026 06:43:11 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDytE-0000000093w-0EiH
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 06:43:10 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-33fb4680717so7201199eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268983; x=1791873783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=;
        b=LgxkDnxPzTrGbOWORemefptzpoGMzsld1FfRbjP4jSxWoE+X9ksFwm+CHdUgVXIAOr
         5muzy5dke6DZm4YypYw1qOczMmib0WXA7Z560QvxnfD09knFJ0+G2Zy1DHhggYySQm3v
         UKUh9BJ8KMqXrJdM9Scfp5Xgw+bmcezi3aRRJdM6Np2K6XWCJM605F3afcgDG3lLpdn3
         BSio31lFbXDylFPRqyh6LhS86aeES+JzkV7zih3eKlHJWC//G+Bj1UKy46w0rb4/ulgA
         cLystYAwiteryPaxbK01bpdKpjEbgdObymHfDi5YSPa+5+1kh3Q5JraNq4lALS5Gfiru
         kz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268983; x=1791873783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=;
        b=A64eygyiK5lRYAqJ2vbUpXFtahplGXcL6wVzkXIGWAnfyyQicuWONFhFr5D74+rc9Z
         /hEVktNEwX8xNSd+XK95QirrTshgaOwcsdOFJfrfyesnkBltPyCiTm9L4NT3/EIy4pjP
         o4wWMXAQi7rOP6TKO9pHRAMRWgEyrm7yXPf6brgAhG2CuCVGmBWbK/DDqyO28WO6VCe9
         G9BROcY3ownGU3sB30WMW2mmyMxV71kCgHZtAtNVpCBOOtv5ajXTMtAjJJVrAjJD+fuv
         99RXTmQmHr4MA3RZV3WpirRuqW5Z9rxHKdVKXNJc/entN1y9cV7C39hZuKth+EPgRgee
         i5yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL884WKjyXZOfaSQ/6LO9L50baRxeBlJq60q/KFgbVEW+PjUWDQbjz77D7CSC9foH/Z6NrwB4H4cppVRqH7g==@lists.infradead.org
X-Gm-Message-State: AFq9FYId0bmabvhb3KlNU0GHQyjbtRM4g2yd9vPEaTjjr9T6xWiMGTaF
	++c+zZLIErlaVgChTwZNGUUeBH9mws89+u43B2E/k/hMzgWGJ0m1g6aB
X-Gm-Gg: AYBFou37qKnPwAQ3dZZxK7XPQl+EXjN4gsq6e4snU3oncd890e2M37+zwsk1rg0N725
	8Etd3KIlFvES3kNR2Ak4M7+rgtYJ7Mz9ANUPIU8QlWT79Khx2xL+tihGVc04m4RRVse0nY20KGC
	JNj8rnilJ3DNJriWk7T+auro3CEkPFQlZYSqZnU6rfsLq/nXmav3nV2k0QJxIXM09p0cRVODaH4
	kuvD5XCO6ixlqCdzN7Orxhg6l5YcCD2MhJmoDI4SiUl7IkYPh9gqoJSVGFdmRHliAPOZ2Fm//Z5
	MB5uUmLlZvMGmJNlAB0QxlrWmzqngXHds6pcs8wRgF1eXBGrS78qHcV9S3gImSr35ijiJBmz7Ru
	NygCyiiEigF8kg/Blr87mcjYtO0TORktqlBWKlwAD6nJg5z4jp0yXNtZP/aczw3EHModwr5krLC
	ISMpFOAMVk3e4rIgduzUFRQlzlGk1ZSbhkcU9SzvcBTMnDCA/mwSwGK+uWtoTcVPIzayR/8FM5o
	qY0RGe7
X-Received: by 2002:a05:7301:18a3:b0:34e:67d0:bbb9 with SMTP id 5a478bee46e88-351116caa62mr11416936eec.29.1791268983110;
        Mon, 05 Oct 2026 23:43:03 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:43:02 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 06 Oct 2026 14:42:24 +0800
Subject: [PATCH 2/2] clk: mediatek: mt7629: add RTC clock selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mt7629-rtc-v1-2-e556386df816@gmail.com>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
In-Reply-To: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
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
X-CRM114-CacheID: sfid-20261005_234304_090327_0F1FE0EA 
X-CRM114-Status: GOOD (  10.92  )
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
 drivers/clk/mediatek/clk-mt7629.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..6336f8c4167b 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -285,6 +285,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -367,6 +371,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -458,6 +463,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.55.0


