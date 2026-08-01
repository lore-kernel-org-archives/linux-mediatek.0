Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6566AC55172
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMqFle/J1JW00o70YDqPHIq1JsxRkdhf14y+NrflfhY=; b=qc0wn6r/APCqpiP1qnUTADl5id
	7Sa+5VRpalgnJ+Ur+HRkpTmlo4T5i830jjDMNbws//c71/KUEZIcz1lqRDoinjij4tL80KgwNY9dR
	3glIDqywXaodbrAb1EhPyBVR9bG7csFDr67lCwTGL5KYyQ/7E0sTGmUUtC1JJ20128y1yS0Yas+aW
	2N1aMOdPM2f3DtaN1sfIGtauF0zuCHAzIDuNTiw8aGM1ucEpFKZLDS8ys4ygo6N/6J8hJPYBu4+gb
	/7KlVxyS8hpNJMVETV9mnWSqCe2gN0j2cmAI28ZKgtwF4skNZtK8WyIeFoHOy6wxnqYuoE8aRj8Jb
	XvlaDXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGr1-0000000F48R-2BFW;
	Sat, 01 Aug 2026 21:02:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqy-0000000F45X-0Wu2
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxZp7713574
	for <linux-mediatek@lists.infradead.org>; Sat, 1 Aug 2026 21:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gMqFle/J1JW
	00o70YDqPHIq1JsxRkdhf14y+NrflfhY=; b=ikpN39SIcsGT/pzQEdXWUyshpmg
	fqQEtRU8iAfoAjF2l8TJ6h3Ho+fV9Tr+tv1gOxuRt6UfUkzkHNtCebSOmTWH//6X
	71xCY9FPsrrzRjKRK4RKwl8rwOSEdaxzqfE5ue2/kilwHl2V9+pEVnxf7BHDtsmL
	1RvJNuwlMDTosg+kiHMJY46O/LOn0Y5r46jrAmEdC5DsZjw5dBpzRVqSpf8ziOVS
	yP4ZzLsJHJ/Qk0lOrjmrwEZ3QWk7JY5Ok5CqPbJNA4PPLgzE/B1NAEpvoCW0cDmJ
	cT6ynnriRGdphSF19GenTHxBTbqqdC66bZVRlS72JD9OO/AKjpP8wKKWjaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg1nbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 21:02:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so39654611cf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618162; x=1786222962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMqFle/J1JW00o70YDqPHIq1JsxRkdhf14y+NrflfhY=;
        b=JqgiOroqGQGIHx1hlhAlbhElAoxxlrz76IoEDBaUwkQ6q73nvmJqYe8yNWyV8xKuoh
         RcIyTY5XOHRKSaYPsFHNftMCmVIAYr41kOYWUTKfuI3dqqMLhabzhRitOrDcaECwxp6v
         7f9gMW3wU3FweKwYIFCpY70IxyBvLNNvzkIyDz+f1PH6kaMhe8d6l2ZGIX7CTPVeG5uj
         miCA7+sz8DBfRHRBjinWawJpO00z2t0blH4LMklth5dFnPV2/VOQ2if3GlWmTciJpNCZ
         sisy8y29F2vxIjjTjUa8RJNzad8J9K6/wL6rFZUWl0wm5Z7Y3QqzWA64bL6C7wR4jpy2
         vl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618162; x=1786222962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMqFle/J1JW00o70YDqPHIq1JsxRkdhf14y+NrflfhY=;
        b=mCLdeiJleBX2Al4sPNrtuFdErGKlr6MFLTk3YwO+/Cdj/OjuQiyshr0LqUXFoqRLYc
         t0kh85aKb42nlzfEwzJn/426bXKvVPzT3bpQe+2FqBoY3cBpc8a0sGI4LpWX6zkdBRge
         iZWUR0aAkv+E2zgGalXmj/7WHdaryHVXtYAlMXFkqBcBjFFrxxoSviBNnILkWHSc/0t6
         HyVf0sUdkpWyIc33bk768Xwy7nIgYihzoub6wId8cmL+/iZOb9Ws4l7My6PqsYGnkYDi
         9YVj5DBQU5aKUm92Q4j2fi/ijLKHzRQa0nWKhaP4vVvbA04wab+OBZWCaHMVOq6I62On
         gCPw==
X-Forwarded-Encrypted: i=1; AHgh+RrMilV+l+3tA6kz1ADqFU1xEoPlvo8GIxQZ5lOMa9+S6m3z9uBwmMWxLoPMM/IPcd8C9C647RC6PYU+XBYC+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW7yzEIO1ddrRnVuBCKkaiw3mlkxwk2n8jrpfWwSjMhLrik9fe
	+0agZ8m9eZ+64CEZbMRHx8EimJZt288rj6eRXMsw2hGEbLtg+0oIYKNyk6//AdtwN0m57G8DR24
	Xt5ltdGyURVNGBodcm9/9nD7fz8Fk3D39EXqb1oNRqFsNM3kI4de4fGbED7+I1Co5HO4vTwAVnL
	U=
X-Gm-Gg: AR+sD11IllHVZ+IQWVBYziK9pUyMDMW9T0WuEdsYrK9o5LAqkBpmlodsPa2ITicQj9V
	sfQG8hq6PNiFkemJlcoAG5h8bpsZHd/1rpBTNwirLvkLv3Hab3WsBCSF/YDF+ltD4J2EWbY6wgr
	enBVNJqNQCsUfUK7CiljjDoF3K8FoxfK1WzkFyJuKb+OVtcqoyIWSvasGgquTTW1JAkzGTC/OQF
	Z1oEifjRA/iI3tbIUx+5gtgWm2maOIOUtw9MRmtPQ2W7/pxOPI3kqhOZu2QwR14mu9701Bd3YQC
	vpvJW3LJQ2pg5xa3dQTXhSS3mj8/9hX+UbQgPjgA05tr/Si0qWdOzm8iE8jNDHPKav7v/tEPDeG
	4zqALqDCZYnyiyw0x
X-Received: by 2002:a05:622a:5c1a:b0:519:b5ef:7fdd with SMTP id d75a77b69052e-52b5666c4aamr102309111cf.6.1785618162504;
        Sat, 01 Aug 2026 14:02:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5c1a:b0:519:b5ef:7fdd with SMTP id d75a77b69052e-52b5666c4aamr102308651cf.6.1785618162097;
        Sat, 01 Aug 2026 14:02:42 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b84fb2sm49521155e9.1.2026.08.01.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:32 +0200
Message-ID: <20260801210230.383532-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=F4uEcE6NbVQbSx4Zm6Iy2Wpm8CuRe1+YsrX9tjTnMU4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7nYKunQpIhbpFCrar3M/W9NPJdLYVdGhGsN
 Ycx0XDqx0aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e5wAKCRDBN2bmhouD
 1xZcD/9L6ERTjnYP1NckHjPu9nLQkIBvMz4xSd5N3pghuhDpvah9+KFa3qrJ5+9pELyYW1TeIoR
 uxYyhCYUTnCd6Y78FRuMW7voys8liKUD7fIuthSGGr4Opihfrlbx3XEI1qEsfU0gSRrWx9EHPvk
 S+0bD8SCoOXyBPTRCmHimbE+FxK9CXws73ljJfw2CalH/+x1OBTOZxog2dQk4Qcy6hdfLL7ajXy
 Y1YnEiR1sghUKC1XX/JRcCcJu6AcvPOMw6rxxpckhnRCb2moZST8P726bm/4QJy+muMvQGdkNnS
 BZtNWN60CwZ/lyPULI4vsFA1eYhfoPLLHw7j2oDU37SnAOWtVXYbyUmsnMb4GC/20n8z0zSpwsT
 o5Q3PFKRsv8v3inwmzOczTwU2OwYeDxJQwsaACAnaQ+3Xet1ipC5zaubQRvB+ISXWObMzBwxF7m
 qN5y3qalnJI04kH8rfaeOFZUlA3Vw69wOC0PXDAQDL5Di8jl3TemNodbAjd/hNrEusma9OraM8z
 8Jt3u3rAUt/PFcvOKc2NP4/QsQDkFFDiLaC/jqJo96nvDHpbs1z/RhElF8XT2cV3zG0qbmy2QNH
 a5AaIp9rGdXOJT4nR8mOOH+iYLAu1mmMTtuBdA4F0L0cDX+shFAwgLxQv4QD4rBRN1WJ3Ydq27g F+1PF29Q6dbAhjw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Di6L47vafA7ALtaLA-t2TiNqPN7aw_TN
X-Proofpoint-ORIG-GUID: Di6L47vafA7ALtaLA-t2TiNqPN7aw_TN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXynKSw59GDlQb
 OdNGVVjGrB5Z5D4CZaVv/A02lcf4FWv7WZ/zx+91kt3cRPLPvT0ZVga0XlXbOSDc/m/XYBednmT
 3Fn3DdFIuw/iX9HM8XASaGTiP4Newl0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX21qXaxgkY+MM
 9RF+hJuaclsbaSc3JQvQSosvJfWMpzG4ggdj8WierBHu9NKeIln4k9jRLxA37/I8L2gWRNf01N1
 wc/DXhZv7ROZt5a/sX6Ef77JiK0QVZwzriPOjmnJB3yhzxN5cNFR/fOFIqOFXc+eX+mtyE7T3kV
 Tukmso6on1yxd6RIEHZ6pnxH0jcNPmrtJq60WUSCl5kCbmd7WXYCgwNba8A9rafI8vHybMO+7MA
 WwbzP3BkYCW4OcrQXPeUfaf++BqTWHUqxE55ocyhOB+WrhTYblJH4meKi8pGPI9CI9RtVlpH8gC
 DVjMCNe2nXADO7QtWGjwzocmJ7v8ctIOmJulrpeYFByTMeadikmVpQxhGdWyrvxt06e0HRqHels
 JZIBGa4Pn+dCho4TL/rn0snVzyxi7S+Zh03ANAuAGHdZ+pAICdTTolIE5cLhBAXQ+wLMu0N5Vo6
 7ntrTlP9fihEwHv5GMg==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6e5ef3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jFBtGHywRsdJY6S0xpEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140244_191728_6922A5F8 
X-CRM114-Status: GOOD (  14.44  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi                 | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                 | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                 | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 8ac98a378fd6..28fbd4654a80 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -442,7 +442,7 @@ mmsys: syscon@14000000 {
 		#clock-cells = <1>;
 	};
 
-	imgsys: syscon@15000000  {
+	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt6797-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
 		#clock-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 9f100b18a676..9cf1443f58a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -564,14 +564,14 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_0_tx_rx" ;
+			groups = "uart0_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_1_tx_rx" ;
+			groups = "uart2_1_tx_rx";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..c3fc8567fc7d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -498,14 +498,14 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_0_tx_rx" ;
+			groups = "uart0_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_1_tx_rx" ;
+			groups = "uart2_1_tx_rx";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..8346f0207134 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -866,7 +866,7 @@ i2c6: i2c@11013000 {
 			status = "disabled";
 		};
 
-		afe: audio-controller@11220000  {
+		afe: audio-controller@11220000 {
 			compatible = "mediatek,mt8173-afe-pcm";
 			reg = <0 0x11220000 0 0x1000>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 8b0992548431..7414c10ee664 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -2129,7 +2129,7 @@ port@1 {
 					#size-cells = <0>;
 					reg = <1>;
 
-					dpi_out: endpoint@1  {
+					dpi_out: endpoint@1 {
 						reg = <1>;
 					};
 				};
-- 
2.53.0


