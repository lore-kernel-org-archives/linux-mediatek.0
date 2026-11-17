Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63695606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JUyM7U2F;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJogxAM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBBRBnJm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=; b=JUyM7U2FhrzGpEwamCf4DSDtoB
	SQBqy67SaXJSoK14lhahk507myPxOz9SFWkulXaeHY9lAOI7qnq63Bbrc6M30Qb0YmKqk29Gn7PCX
	lz151V/1XmfVqj3eZwJheIfQZOlfmR5fuEGCVH7bTZ4HBDFK1MGPWy7aEnb4RMBWgrjMgGizD5Zo+
	ABbrFn1UQwHeZ63TLSUDy0yhJJya0xrzSdVhuTKXsVqsTrFlKqwnvOWUIyS8FU1ChcydtimviJT7X
	RhC+OgrS7qjsl+wl/xUb3McdiX8e0vCILXgsMsXwr7gv+SYstdDluSVCQq68w90cZ3EqOJ57LERHs
	YVVvPIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIt4-00000005p6Y-04Uv;
	Tue, 17 Nov 2026 13:06:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIt0-00000005p5W-1nj0
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 13:06:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0qoG1208468
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 13:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=werp+leniNoWoVq75RHzy2154GOYJfG48Jz
	VEy4bJ6A=; b=oUJogxAMZln83g9iN2+29I1+sQ7inyqOcEuTtGiTvTofZfuXzfj
	kHfQQ30DSMBwH7QfbCU3+UP43rJdjF9wPEnT6uZrwREWeJeqVvlicBEr0tXoy4zt
	MTacoo47z8b7AXPVgR5rxCO4Jorfpm6Wp0WKI0sOyvmoGIBcLDSvuMVvZeJcOs9a
	GDcUveMK+NtE2BBLr5pVRrYmzTxEFo2ZPW7PwkiuCETYex2XfyKay3fxh0faGzTD
	7Vj+e0E+jDHpFZ7BlALcw91Wbb/pg4yOTEZisaafA+bFIzbJfywvQ5PU1DIFwbBd
	oJIw7hAoZYk8+mFIfYJf4HF2tbVgxK45lvg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc9292-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 13:06:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so2803921e0c.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920768; x=1795525568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=TBBRBnJmBIb1sk+6ElZz9OtVs5Bb2Tlu9pLcnyIUZUzYmYnieZHepsVMtC42z8Atiu
         SCZpFxVmd88W60d2kwPhpG6Akiws3jvqBCgmwGUsItT5Xm6UiiIkdDTc+3D7/QCvQHX7
         nUNwUl+p4gYolGtz0zVl2pi/oyogvTJt+t8xt1daNtl4ICLgu3DqGcGf53ArPnIsJWq5
         GKBLBtEmei0dWU+M3EC5OTTAfoJw8r3jxnA3A1NkYBDC/boJiI+rogl+mcQOonjz1QW+
         VC7JLX6yvd4ieHwAXo+uMXx+MUaAEYOMsMIqMaiQ9vWHaMFB5qJtGnJsYo7D6tLaiUMh
         b9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920768; x=1795525568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=Kh5sXLXXoApf0EoI2NybOkD1gkqYjPX0RcQoZCpbu159jKdokpWK/LjbHygGPC3Ulk
         cz9HrunCcltU3Pd4FzhzLsfqJQvzCWNOZLP5AY2nIZ/PZh1es1eGOalHQtFV3OyohpBy
         zrkbHOUgOXJuFuBma1x91oIkMHk0cAS1CMhG+AJuqdRgrG0HrNDooRGX772x7LuzBk7q
         KEHcZJfDEv1S+HyQdn6bfSAaJRtKkgkl0djyh0tUGxS6rY7ix8FcdSPz9WyJaTFBEjAL
         BvF8T/crkfS72/gSl4MXTMLeaB7ey4twaE8KKKRkceXTAVjYlmYLimtUF0f/JRa7XQ9p
         hrqA==
X-Forwarded-Encrypted: i=1; AL+hErEnq4ovFPqfOaXEogGyYKDhfm2ofnATyIjbTYbUzKTZjQXW8g4GGqGGEAr2c9qyhJsoTjSfWFBC9N0+i5gH2A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9nf0UhKulvdzCd91gu7yZQ5vOp/ZAPeZJkS1QT5p0b3hXRtruR
	wC1aR5fgCO3Nr7geXVIZzNKXhl9UPy+KVQXoD6I8hC+QqM9OgHU2CMASkYBG+nJB5qZTop1S4d6
	PAA2D63c9ZFl8VbzyPuWwqVJrXhQ/CKn6lzyEhQKn16C0A3tcdD2bsFpS5acK0bXMFBeuSb1JCC
	g=
X-Gm-Gg: AZFdTZdLgZI/7ffoWgFKahlD/ydq956zCZysUCYt80y2eHcbS/x9YKfxUf2Kn/WYzqa
	Vuv8mFdxAPpLGZe1BjoiQ+MNwDFi5QDUnLYoD4IXNgRjj13+hJ2P8ZjZzQAw4XbfoaN7fhwQwC5
	zD3oQXvwJT2BG2IPpwDDdceoxg+JzO4rePAUdLXn9X07JP0gss2mOZLhiZwQwa9ddd0mwdPkmZA
	hc7NQVU9q2/AFwpVsyTatEB5GsxYO0YYrbkrXfCbM93PnVP0R0VkVNydgCFRxMyy1ouKOSY1NNK
	uTX3mPi0xlP0qbW/dSiPRd45ISwFzTFHwr0gTDrtUhpD7/agOhGai0+fNm0Kf8tLLr9kWqknywF
	EhuiJGkNXDfeuSTyPM6P5LtUZM0aQpVCbd0CDXDigHdezP0yjoKpCsvWJXyzieg==
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929150e0c.21.1794920767815;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929113e0c.21.1794920767336;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm534082166b.56.2026.11.17.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:05:57 +0100
Message-ID: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JhAQKSi0UHwGaRwXw9Ozbf6HX68wW/ZtNlGPzsJLQPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FE05ytbYP2204OYIuT2UmPNOZgaD/fErFnqn
 Yehi09tgqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRNAAKCRDBN2bmhouD
 12y+D/4/5qerQxe/BEAJkh8aESGtkmL0OcZVuM3sOQgqovDF88ovrnq67BZoRD+ZOenW68asV5t
 uLd5WnWNL/naLPXAwBgivabqWoY+CnkfnPkMbDAqhbXuvGV1xL5XNcGhMc0iElFhS94biszOgds
 NRQlYPKCYEZoEuEBbleG2vXdARzecRe4NSDQo7cjX85X0gSy5mcjqEGJuwa52CGOsflhtsFmE5Z
 vQZPFy0Ffqu0ZdjItDPr4u+b8HZfHu/u2AgxSPGw5l67u5D+Ir8MXPr42YvfpLkhSmlS30Y43RX
 PBW4cKZ8XMQfYEXVhU5PSZyEDgZF53u57IR7TO7jOXklQm2mMZu6hsM1G5J8Fv5O4bKL7QcmST3
 V3AiqRHZ9KRp8oPuPVclwIOxdK7cAA5w4xPNb6y7ZbGo0+JKsz0UeU+RopVx5UHyNusSSzY3Z82
 GIkj06gwBQPdWcOPdcpKr11R7QqrlLlXLZSuNcVZQMj6AMqfA/RBeyYz1+610GyNOQuJdgRre+a
 3VPqAJEZto9ASmnUs1Y7Q7hjiArQzim6ewz5vmb+URjaNboRswzapn37mJQLng0f0wNlhkvFYz2
 XWdDJTL343s+bS94gfF8Wi1ADmuR53MrjwysN18+Qz2y33wR2MDuYt2dpnw2reKJdmka/j5jckn sXVVx3Ey+/h4nVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX+S/xeDRmFhsC
 V4goxOg7ER2NbnbanvpK7Ozhe68csISXZgNioznEnWMkyNYKFDKWenNLKm42KbSVNYvE70S9O/C
 h6T9U3i5KK2bNMcsHUI5QbK4pOCuUOQ=
X-Proofpoint-ORIG-GUID: 3KyUNQn-lRVYVegBkkE1vQ__Oq9P-H7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX7szfwds+Lf8D
 2ln9/pp6in7qpysTMIIwLLMcTxmSgHaxYF+z3VfOuLs7NydnESktiMuo+Pt+nzFaLvRxEY19c7Z
 7DA91sj61vgyHDdTptDnQyj/3CSh3NcN6gJokSXKi3zuIQ1H2qmNARKxFMVPh1m5IjJpP+SHnrR
 UbdX5sC9njI7WMYJfK0eOulPT+Qla/2PENL3WfHq6jJKQqxAygGFUWxWI8E9WWKq8yjkjzYqDSt
 Ebo1ZnAAXAp0364PgxtmXEUfRULQI5dEiecV/RE20hPqRh3rc5whTP6iHkoHMCfi9kyvVvlLnHb
 af0IMp70OQ/BimMDvazVYP0vB8WbSzjBR30VhwKmC3zBi0M7J90z05H4SoRCYql0h7SwkVV+gxN
 6qbNscbTWvn0aVuvzfhzJI9oXwoYzK6S03wk+OEh04A8FnyeEY4BGNI5bdEyNOjvTsf3LsZcdsw
 tDkK95APpYg0WIvj8og==
X-Proofpoint-GUID: 3KyUNQn-lRVYVegBkkE1vQ__Oq9P-H7E
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc5140 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MmkPf4a8AFjUc3_LGQoA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050610_575655_4449ADDC 
X-CRM114-Status: GOOD (  14.20  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
approved by Devicetree maintainers, because they were never documented
as actual ABI.  Drop them, because no new custom aliases are allowed for
years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 17 ----------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ---------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 ---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  7 ----
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  1 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 33 -------------------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  8 -----
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 24 --------------
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 13 --------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  1 -
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  1 -
 11 files changed, 126 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 6dd706b27830..971fb19e95df 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -21,23 +21,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-	};
-
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6ec50125cea0..868b0fb84449 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -22,22 +22,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-		mdp-rdma0 = &mdp_rdma0;
-		mdp-rdma1 = &mdp_rdma1;
 		mdp-rsz0 = &mdp_rsz0;
 		mdp-rsz1 = &mdp_rsz1;
 		mdp-rsz2 = &mdp_rsz2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 7414c10ee664..2c3836555e55 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -35,11 +35,6 @@ aliases {
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l1 = &ovl_2l1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
 	};
 
 	cluster0_opp: opp-table-cluster0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 621408439ffa..2f82eb532f30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -22,13 +22,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	fhctl: fhctl@1000ce00 {
 		compatible = "mediatek,mt8186-fhctl";
 		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe..883141d8a6d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -9,7 +9,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70c..f14b23dd57aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,39 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		dsc0 = &dsc0;
-		ethdr0 = &ethdr0;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		merge0 = &merge0;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		mutex0 = &mutex0;
-		mutex1 = &mutex1;
-		padding0 = &padding0;
-		padding1 = &padding1;
-		padding2 = &padding2;
-		padding3 = &padding3;
-		padding4 = &padding4;
-		padding5 = &padding5;
-		padding6 = &padding6;
-		padding7 = &padding7;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 898953acdb61..bf5893e3002b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -23,14 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l2 = &ovl_2l2;
-		rdma0 = &rdma0;
-		rdma4 = &rdma4;
-	};
-
 	clk13m: fixed-factor-clock-13m {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..389fb9d7ea89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -23,30 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		hdmi0 = &hdmi;
-		ethdr0 = &ethdr0;
-		mutex0 = &mutex;
-		mutex1 = &mutex1;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 2e782558fb77..4b05f6a864d4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,19 +20,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		aal0 = &aal0;
-		ccorr0 = &ccorr0;
-		color0 = &color0;
-		dither0 = &dither0;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		gamma0 = &gamma0;
-		ovl0 = &ovl0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..a938539c92b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -21,7 +21,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index f2ad9265be31..d70bed80274b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -16,7 +16,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
-- 
2.53.0


