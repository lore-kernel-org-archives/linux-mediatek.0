Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BEACA601E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 19:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=; b=1x6rQz+LEcTnIrvjXjfTSK3x2E
	CDPdDNUs3soPjc7rWKXHHtX2Ayv0jkF63Qt5bVcY8D6jvvs4tSr0M8Mxl4/FGgE+dRBQFVqjKKdJQ
	sL5pnxaOqrSvkIu1XIILi+30hC8x0Gp98fdwVAEr5UGtE7KN/93kqNc5ctLxpzuSdIEUZgLPvg7jV
	kUhX4qQoS6KBoXd3Fr+HPCEI0AHZWrjArXQiIC+Q/fpyvpKvQ0R/0FBHERR1vAf1vKy48R2//kzEj
	KYikDZirTCNCJe7mpL3GCJkDEoje8YAASZh/7v/YUMUIYgcvmDCuAthKmmsZHoIrAkusQe39Gf9Aq
	v7qIJjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWX-000000077pw-07mq;
	Fri, 09 Oct 2026 19:44:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWV-000000077ni-27fB
	for linux-mediatek@bombadil.infradead.org;
	Fri, 09 Oct 2026 19:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=; b=YD3maYFQ/b15byewyklXUnZyYh
	1TsVumeFEjeLnbgAqHWUQwXeKYsm+Ficiqo5VlK6gxDb+fyQUOQvuS+njJGV8n+dgOJu8EnSxFkCG
	HvydDd+vvJKNt81DSKyBx8rZnvILof+jsZalqzu+RGSjVP+AUILCcelF2L6o9ayjsXyyNI9/kDm5o
	gqyghFjpHAT0LrX2sb6LZ3T+4aoUDg6hIi3xOu6ErjUSMuvLx3YrMNk0cB3JrROIvLPcrnFD/HqWY
	CfRJzGg/Apfob/6QAo+M/8MRTD8FDP9j6BBzrN9dxqbCqPFfCkTwYXyE4vDbCGTlxypNPCjtjcmZO
	LIGIpnzQ==;
Received: from mail-qk2-x06.google.com ([2607:f8b0:4864:34::6])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFGWS-0000000BbPb-30Ni
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 19:44:54 +0000
Received: by mail-qk2-x06.google.com with SMTP id d75a77b69052e-52e3a588bbcso114461cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575090; x=1792179890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=;
        b=B9f5/vldpuqxsCsRfaKbDgTZILToD5gCPbkfnZsVVh9Fw5Eaifm6Za4oyxFUgyOoj+
         cB1/QFnlkvG+KYQHF+Mmofoug3CW4yZrHh5yRgh0N8G4xMyMJRwT7PIM9Rj7vSqVsN9+
         5tok0ftBSYYqfooGHFlP8Xv2XjQh7vXNcMNY94rny9o+96ulOn36IWhjpocQDFxJpNTZ
         PeXhuYfjPJiKzDTaabakra3e+fpUkaR774obzh0XnPlcTLJezcPhFdFNRwhh6YzG7hky
         TEWvSb9ln7oWeK5W6v/iZTwSCIksxo48xhrQii+MTte2qF47tYdIUhn7J+opfhgmFlvT
         cybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575090; x=1792179890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=;
        b=ltYkw0RYm4RmVMFOkeX02wd/xvxcOWCVvnbofH+XlmMZaG+30SSywwSXtiwaEmrbsg
         ss+XUr/JTnJLhWmWEnz+7pjwJ1Tr09i67j8AKT3bgx7hXUidJ0tGkHqCsLai0wfRe1aj
         IbtAIplgxNXuzNYtLo1VEwqN4AIc+zvUlioR04G5d8r//kAme7IUj91dy5cdb05dcTmP
         bL0k2ZIRxpFoPHPdOjkBLpNMeCvbnFoQM41CpFi9aSSaa4FD9+IuyO14t4hfwkHD5awx
         OVM8HdUB8TdCP8aKD8FZKZctNAYHILT3EB5iMcofcttVK/u98quHxtfqcjvAC8xePftH
         nrYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZjfGuqFOH1b4jp8zPHolCyg5izLi79JZHmykL3+LAT25EM0XI2Kg6kaONFhuyU5JfGy60HM9styT0CGkgYA==@lists.infradead.org
X-Gm-Message-State: AFuF++lhavttEHfcfeKcw0Jl5WuNJ9zsx6XswsRSzevrenV8UmGDxofJ
	THtoaI8DYeJES3f40NjlMKrLpL63HDlnzWNCoBewK0vbulTqW/xM2pAx
X-Gm-Gg: AYBFou1iwYOU9zLXLTvBUMK5r/8tegl7K2Jha/mYub4XFXyzwmYTlCec+/eadfhg2uq
	1BN308vTUwm4m+WQmD4bvh1EqKuLPCVytjrGIg8dv3MyH9mhf1EqG5J/iTTXP/MzoRHFvb8FgOF
	yQf6fdjWFf7SnS647cKSO84crX8e5wcv1vFZFJ5O0r1ZyVekCn5pYieXIsDwczV1NnqeKV3YU5k
	6dt8YyFyWl/RsZuR8xSzNJpmf5EfFJcfHYnZzZCPYsMl7eQ/VG4HAx3ENFI58YqE5W5Q78XaywB
	wg0Am1yoztS5l6BKoKLkkUF07Mx7Jlu2LnNCVoVdseenTVYMsBZQN0cHLzDtR7H3NAaiklh7R+A
	9dc7ic7r+zaJhFaWoiABBOEXexPVF+l5Sme1D+uVT1FSl6krf4vjQU+72/GaVt6AfOBkQi/teZy
	fvmHaDPNdU/W+FFTslf5jNtl+db0RM82O+slKuY2fcUXQ4pAux9DXjpQk8Xpyw3q6KZawC6Zr8v
	J24t96ogEuJpyVqZqe8gTusqPs09irlK6fpXmEKuXVL+3mIMK7KJ+I27/YRygPswtRatvTQ8to=
X-Received: by 2002:a05:620a:4114:b0:93e:c173:f692 with SMTP id af79cd13be357-93ec1740673mr344729485a.38.1791575090195;
        Fri, 09 Oct 2026 12:44:50 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:49 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 14:44:44 -0500
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8173: Mark the lowest CPU
 OPPs for suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-2-ba13f826eae1@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=1277;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6mQzJb6HQwk/MiupaE++x+vH8v5ByWD2TN9pKFcfIxw=;
 b=gj/o9tBfq/u6ETFIfGltk7J8BWOdbJWMwl2Y6rCdaGMSFsSW0ix2W8xJy55yWtCQ3zXD6INIY
 13nPrTKxq5nAiEXuBKEl34WBlW0aJ9qkX1kzvEvLJvSkxByDdA/pOB5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_204452_881163_F5FC0C3E 
X-CRM114-Status: GOOD (  10.79  )
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

Both clusters otherwise enter system sleep at whatever OPP the governor
last chose. On the Amazon Fire HD 10 (2017), entering suspend-to-RAM with
both clusters at their highest OPP measured 63.5 mA, against 52.0 mA
when they suspend at 507 MHz. Mark the 507 MHz OPP of each cluster, the
lowest in both tables, as the one to suspend at. mediatek-cpufreq uses
it for system sleep, and a kernel without that support ignores it.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..7f1af15cb934 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -56,6 +56,7 @@ cluster0_opp: opp-table-0 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <859000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;
@@ -93,6 +94,7 @@ cluster1_opp: opp-table-1 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <828000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;

-- 
2.55.0


