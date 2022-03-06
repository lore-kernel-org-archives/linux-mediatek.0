Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B43C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPGxgeoubySAGRP3ASV+Z8sY02yrYPu3DN7l1hzphAQ=; b=1PFMOAU6NRj/Dh
	imoGEVhbugFNo6CIFtptTT7ptijqYMrcyOq+r8TitMbt5PZqnk0eWK/pS7tilsrTHZMjvm9ja//pS
	d8ScX2d7ssifhzFrSh0URlRn1oEgzGnp+g/XNuOB2B567Nmg8ikShusHhfOooFLnBth/Da+1ePiVc
	NnRXuRO+4L53WSAinTfEo1okXctRHdBjwwSLKgP/ra2WyAx4d38i6RApnOFUF7Cp8wE52Xp+rSyAz
	xdEe++yqHsV7+VtY2PXRPrWIj4Pwbi36+OZQbUFyE9kSaJ36UobKoEjfWVxuMwAa76/6SzbVyBMfK
	MPnuvMV6Slf07sj05ubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQopk-00EWFd-Gw; Sun, 06 Mar 2022 11:13:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQons-00EUxv-Af
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:58 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B29443F62A
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565111;
 bh=fptfaOUAaErRHK6yyvwk8Ba2q3vPhWe6MKEfwn6hivY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=kIEBkS4geO/1XXSDtxFXclTdE4OB6IWHj1bYyfy5BrVkAkJxAdvGint+r24MqMEpq
 bw+6S1dZ118MfAZqKPCOgEgHhglW4+0jScD3gOMmUgn+YiJrAzWRI2hUTKaMXQ253g
 Wt9ipRVKGhj2taUyerrFjvYzDi/oCsoffsscPC1Q0N6iveNoi9iGoi5GgZV9Vce4ae
 Nt+NtAT72KQnK3F/Y0uUZz2QnYBZp48g/OZL6Tq7yoN43ONnolIiQ2XC3uC4tfwr25
 MxIdaa7IsLbx4UePFnlUxp/Ozi9D72yjT/sXeDdcQ0MafaTxe0WSKAeW7Xz1A9LMrY
 b+6atqfZ85/ZA==
Received: by mail-ed1-f69.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so377216edq.8
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fptfaOUAaErRHK6yyvwk8Ba2q3vPhWe6MKEfwn6hivY=;
 b=TPomfLZ0c2VGbCqzBiYRPDnaP3+YU29WqvPdmAvVHfXPm9GjgG1Jm9k243l8SrjZAG
 EZaRgpb3y7Zv6IW0woqq4qw8pesXY8QonsmIFFZG/VGdBMydQj3rOtk44j+BxjYZUmek
 nuHD688G5lcraiCO/+Bx5xSx1glLbeaOf6JEhSmWLHY8iwqhwzlEMCeZajAzowKwmHSi
 zPouiuduy5i3BOUeKZi50hwl5u7//zDC0Qd3Ex0mCnjrcICVYjAyjcoAaGgICojw4jSn
 mGgtJWqnjGDdFFt6JKK1VmrTqoJLFweY27YeQOkCbaA/2wwDz6/Uq6tuMHtx1TuyPm6H
 pyCQ==
X-Gm-Message-State: AOAM531jI9+vnd0xWQRBatCfg45Qm/arsIoRC8BR3ePll4cVcNGR2Fjf
 L48JvQOtr2Dy078Ld4ayf2ZCyk3UvOzOfaGwBwsO4NnY9tPHWwJ70r9/tgSz6kKKFPH6O9B13Oh
 CQqCMwjaYTF/okxxUXifsWmHTqnGjL+1Mx1/rTlPSKjrkXEJ6VQ==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr5333900ejw.184.1646565109088; 
 Sun, 06 Mar 2022 03:11:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya7NhXOCbqGIagE53ZCTSIPIL5hGs6/ccWmxHFezSS2trgYWXGqqPKbwVvYlPcyFRrUXKq6w==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr5333879ejw.184.1646565108853; 
 Sun, 06 Mar 2022 03:11:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 12/12] arm64: dts: qcom: sm8350: drop duplicated ref_clk in
 UFS
Date: Sun,  6 Mar 2022 12:11:25 +0100
Message-Id: <20220306111125.116455-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031156_538570_025790B5 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ref_clk clock in UFS node is already there with a <0 0> frequency, which
matches other DTSI files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d242bab69c2e..02589b3beb7c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1916,7 +1916,6 @@ ufs_mem_hc: ufshc@1d84000 {
 			iommus = <&apps_smmu 0xe0 0x0>;
 
 			clock-names =
-				"ref_clk",
 				"core_clk",
 				"bus_aggr_clk",
 				"iface_clk",
@@ -1926,7 +1925,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				"rx_lane0_sync_clk",
 				"rx_lane1_sync_clk";
 			clocks =
-				<&rpmhcc RPMH_CXO_CLK>,
 				<&gcc GCC_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -1936,7 +1934,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
 			freq-table-hz =
-				<75000000 300000000>,
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
