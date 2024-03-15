Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03660C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5JNiRjaunQauoZyRAKchrBIX3whGa58HwzCcAYhjAQ=; b=TX9nck+JcXN7CudF89UzfTxFfx
	8AQWcDErawdNq7CRHc5H9UGgMxcILLTwvRlTXLn7C7+4aBTHoGykNfYs1t+V6PM1Il3AHp5A/ll5L
	YTiaHJKW0TeeeGl+EEOEZJZYO+SoDTNdIKPBunBc23M/Gdy/NBbXCzVBfo2YdaMI58WbrTsyKMNJN
	wE0vSZolFOh5RRVOOWhx3BQ2ZEK8k6qDZfLb9LlR1NMI6i8WNNri8k7GZXBRJ0G2MPfr05kLDQaez
	r8zlHSZW5lX93dQ09xcFLVZrcfJSHDemW1LQIgQfbJwB6/9W7p9Uc3xL2VKtcaPRNRkbksp8qqfAC
	SDg1QsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5YC-0000000HaPK-2Tqk;
	Fri, 15 Mar 2024 11:16:36 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5Y7-0000000HaLS-2Q8b
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:16:32 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e6b729669bso2079623b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710501389; x=1711106189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5JNiRjaunQauoZyRAKchrBIX3whGa58HwzCcAYhjAQ=;
        b=Xj7SKLoMFd8KB71/NlZaEW32GJpWispb0lM8zFH7yf/x6gYSePccEqG1N0uUaz9eMd
         VehjIPzXxSu8SLtBkfqJEHQtOCjWnS1BJdz2NOK6qbTRDFKV5bO4F+H46G+tjN8JOZQ6
         uTGPHn7LzYrwCNty+Nu4uo9aK3sHSqrijUXAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710501389; x=1711106189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5JNiRjaunQauoZyRAKchrBIX3whGa58HwzCcAYhjAQ=;
        b=tUaQtbMut7EaCcv92e1AGgU/asKMZ6+Bkjg9HyCcKGHOWSGbzAF/u+29oD2Vcoux8K
         JBLanFQUXz2Ftf5zyhDLk6AUfiJ9RJWom6U6lwjqY/BESSwmQ80WfGbUqdggQ41ZONI7
         zfhLeAj9wgGB8zNEmkP42QV9m4G+V5BgzSDbji93UZ1LmXO0jQevPxkXDHEbd+5Ul6RY
         TXhn4oFMS73O6oXmSEA09821SEjzqJ4QV4zH63G6cqGG3TLtNE8i3qP2ja+zhFS35x6g
         ZQx2qofQNKpVB/o/iHvmP9IzClldkN348oe4SU/pulO23LsaTIe4MW8ByXm4wBFHwyHx
         Ya8A==
X-Forwarded-Encrypted: i=1; AJvYcCWJjqyzZJPipvnP0Uc1Ihz0eDg30QJTO70V3O/4jgS93Krm4Vi4/lSyxlFzkANArSghLsRw4YitNb/HPsk9Y/zJIMtpqvlH3EreUnnU1TMqly4G
X-Gm-Message-State: AOJu0Ywbp8q6upGnnFgKjKk+QERnxihcdMbRGFlxuJKE+77DuiYhQtrZ
	iRY+YBPCSKDrqZJ1ONuuK6Ku6y8CB7NEK+HtwHk9XHVG8v0TM1q2T3FpTVWuKA==
X-Google-Smtp-Source: AGHT+IFRpeh/WVEnweWX4MTzDUNDWzLUpB5GIhy5sqcAsiRnOjZL5HQfDQh6rz45tKF+tXg2LIwk0Q==
X-Received: by 2002:a05:6a20:2445:b0:1a3:5015:ec93 with SMTP id t5-20020a056a20244500b001a35015ec93mr1101499pzc.26.1710501389194;
        Fri, 15 Mar 2024 04:16:29 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:2f9c:c00a:bf1f:e53c])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b006e6aee6807dsm3122683pfi.22.2024.03.15.04.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:16:29 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 1/4] arm64: dts: mediatek: mt8192-asurada: Update min voltage constraint for MT6315
Date: Fri, 15 Mar 2024 19:16:02 +0800
Message-ID: <20240315111621.2263159-2-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315111621.2263159-1-treapking@chromium.org>
References: <20240315111621.2263159-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_041631_644129_F86BCCFF 
X-CRM114-Status: GOOD (  11.51  )
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

Update the minimum voltage from 300000 uV to 400000 uV so it matches
the MT6315 datasheet.

Also update the minimum voltage for Vgpu regulator from 606250 uV to
400000 uV because the requested voltage could be lower than the minimum
voltage on the GPU OPP table when the MTK Smart Voltage Scaling (SVS)
driver is enabled.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- Change the value to 400000 and update other mt6315 usages

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 43d80334610a..2eafe66fbb8a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1421,7 +1421,7 @@ regulators {
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
-				regulator-min-microvolt = <300000>;
+				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
@@ -1431,7 +1431,7 @@ mt6315_6_vbuck1: vbuck1 {
 			mt6315_6_vbuck3: vbuck3 {
 				regulator-compatible = "vbuck3";
 				regulator-name = "Vlcpu";
-				regulator-min-microvolt = <300000>;
+				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
@@ -1448,7 +1448,7 @@ regulators {
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
-				regulator-min-microvolt = <606250>;
+				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <800000>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
-- 
2.44.0.291.gc1ea87d7ee-goog


