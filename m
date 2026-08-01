Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D1AC55172
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=; b=YuVEjSTPvpdEH0wdhusqrLJxl/
	4i5/R4tJ9GlZOcwo1BMomxhB+bCgWWaTjD5+b5MxEUbfcXREmAFcyhBpW4PoiUUukwm3YkDxRWuwJ
	cA7/5HmP8tNjKSMTgZsHrERRMz8/Mg2sIlF386zTENjj92pSZhifmELJzmolA5UQ5xljR4O7+uY9X
	Yox6B3Q71KR+EuMKA7T466qi3vjvBnasL6IbGqQkEqOWesN2hz9cigRycSbh3vVGs5ficSru8u5cR
	LOstqSIT5CRX31/k0ceLmj5KlZ3CZ0U1ZlDBeslLv3bl1Qp0Xf7+tGTdmDxX1ZjSAoU3rkwsSkByM
	P8Z4iS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqx-0000000F44w-0dm6;
	Sat, 01 Aug 2026 21:02:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqu-0000000F43e-1Tpu
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Ixbn23525405
	for <linux-mediatek@lists.infradead.org>; Sat, 1 Aug 2026 21:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6
	swns0hMo=; b=XcOnXD0aWE+U2m8h96uJdzQgZsoQ34jeelAsgamdHqjo5HXNWyI
	We3O81eZilEYJRq4tcDTqzUCeEBsfVaUEoCosoIqekJc8dBMMHNYytQddYhnSGq7
	Ighg6aGwACCd1owRBXdKmQ/Z6Q4ejAFQkMaq7MJBUts5yz0bhzLHEd3nHut5gvZP
	xC1IgVOIOP4V4ZCABoAyfCyeDL6t9Z/SZDC+4HDWJnXydXZWLPCmVZ+8rbg6dBop
	Ce4eCBNR8PxSdN5UuYbhUpsx8zqMhZ4mf8ECqzTkPaLjrsKQkvT4dENAnIrtdNZE
	5BSlrE7XWNhLcq7XrtlX1hy9ScHeFpe6JsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa381h37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 21:02:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso23049021cf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618159; x=1786222959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=;
        b=Bk1zvnw9bBULR005Wn5x5TzhK7euQoXBl/LYnsSmTQhMTbObbRfKvqnV2CKOW+hetL
         38J19TaCG7E39RAmkRLCiiuFjM/2PrwZtFN9O+NTm5Gfar5ejP8frc63tf28yslKlHru
         MHHc0xmwq9MqPWIyxz2stT9MtGwekLLF1mM4qmeWZGwg1UoADtDg/7CJZvPa8ldp3+NH
         VRPTR/4hXQmiLoNPqtAM3DZoqXYUS00MEzGS+u062aBWyZXrHe4G+ENvxcNr7BbKlyUw
         KNEDSi+q+bCl2vZDcMxlFUl8tWL62kdcRNJhBpCGCMuzOPG8k1fnTrjs4PivKh5P07hh
         DpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618159; x=1786222959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=;
        b=Ik5XdVJSdQStaeC+Y7lyJFdTK56v1pNOpDnWbA+me68ETfWJXM/XEN52ldS4vA8atM
         RlcEkDM2ZO49J4GX0ZcJ4DphjDDMqC2LyGSaSbPoWXbH26kmKv6k21cYHljRWDMCBC1L
         Jx9VE17R4QCTy1etEQVxXp1eSImFfebNLqBsabSAtPbZzNKdHUWLAlbkLYkn6bsa32+Y
         /mKUzCPI0hDccNl8BmtWC02t4wX2YHr5fkUjv6mOGOX8uiuw+ITCHhSimFSURRD8ciMN
         obmyyACT5Rolktc6VyWxlkVmh+NQsiIrH6qIecUQRJszLRYhaA8oPnRuwW7y4LziV2PF
         kGMA==
X-Forwarded-Encrypted: i=1; AHgh+Rp74CZvMb5KzPc2AlVQVyjG+3psRWCdRQIkQ9odbY6aEnu0rjt8N8JIckZ652DceBU8S1pXhpWPlQwD1HKZHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwouE8CHyQIUkS/ab5eQLSX4I6EWmOGVP79sJ4IQ95ow2r1FTeJ
	MuiRsIwtwDts8sBb7O7mjPDNYmPVkdqv7ABx51V5VK2vSeXpmc9EDPddDYArJGWX+sOCZtixdar
	p8GW2ukwHaKarTwYL8lv+LZzXbtXrm1O0eUSteeow5kjBi96FN77TPWuvkT1G0GzxlEDfSInYz8
	FRRY+HLzA=
X-Gm-Gg: AR+sD10JIS+t0eVDoLja/2/RGghI2XwIV5LwOq8CEL2v2CQkD43PWTjN58ug+Ei9Nyz
	HiEHTGMT6U2b/qQ7KFBlTzF7ZoYSiisPlwz0Ri4G7t4kU2RpWybiZeOUvEg494OBFTAVKjy8wVE
	y2ed7d+vMoqnhxvRs+BwHqqiF03hMJMuSeYEUF8YLFoqXRmkfzK4NxbIVVMSLVgMKtcZM4k0VQu
	ruoQ81FXKzhHjTJT8hETwk4mAYfIyLHWDHazDx05mc8bl3mRu5XfxjkHUoem0k+kKnfcWT7XV83
	vDw+ClLnDfEqF4eCRmcSwsKLquKj9RcKyLgx8/Nl/mGuyuo8zFPclZ3YcRq/l0W9kkjfOtdZwQX
	0BitXv/E5bKAdy/Px
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr99692431cf.24.1785618158790;
        Sat, 01 Aug 2026 14:02:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr99692161cf.24.1785618158390;
        Sat, 01 Aug 2026 14:02:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b84fb2sm49521155e9.1.2026.08.01.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: mediatek: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:31 +0200
Message-ID: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=o1wXDvo30FMDIMPKFAH3bsRXsfW4L+mbYBBq4b+PK1Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7mYZf6UZdVCaz/eSojXugBcHrSXjG3JTpHk
 exuNJGcn/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e5gAKCRDBN2bmhouD
 1/o6EACJ+qN/cwYVo9+E0SjCZfzo5XaJLke9pVQV204hf2VmfGNPeJz1dzkFBE+QJ6GvLZtAF+l
 pHDyNX2QzpDjgr7yUj+x2cFpGuarWwyM3ljcRpA2gvJ8owPxAQfEGJI97TiDoK+2yYfNxwNkqEE
 EciQnaW6yFeQs5FP8qVMO4kWQyQe2uFYL0buF+96Gbf1xE1eAZEC3DZXMOOzHnN8nFFHH1tIL2b
 j+AB5IoKy8dcrrzQAEvtpl6niljpg0/iGu1HfAM2ayuOur2gUgGyip3reyUAw30Zx1WEOtBsJef
 l5iBwFshLGv8ji9lzJ2fCVJNza9uBK30tpxZX2enL27ZssJH9k8v7mEhnfzZvl+/5vk7uiS+vPj
 tde7cj7kgY+ezYs2WTQwVI6pgXCUbq0MHrKTsPfHt2m2GRYVlU2xJ9roB7UA3uzLcVre73hUqXD
 /urJ2lsIycgTE7ZR8zXKjzs7weDXpOi91UK4cosYA2M+0Z+B4WP/UznfP+j3hZKdIAW3z7m84Kb
 PNV2RW8Db1pWtUGtSSzPz4O99Kl3YYKQnjAFjlDp5d05idlYK0czjWUvy6fY14tUTrgR02r40ib
 XXkjidRrLzjdcQycfcphIkOdPdm1/4GNTVkiZEc7441Yek8WZOVeJpxbBtz4tzXPSTO+fA/iToq Lh4O+0cPxavM1oA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e5eef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wb8IN-ZjwPUj9z7I0xAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX3ZPOOdeiWcfA
 dC2OzNFCpLeZhWm9zDoxkIgNkAl3X+/RPJsi0U31rlagOkMNuaaq2Qg7QMLTIjbK6X+Djl99t9e
 W0zIG03ixeCh5GHXMbQdGKR99QqC80w=
X-Proofpoint-ORIG-GUID: K_oLqjNeuUlyhVnj6CvIfLcv3RePEX0T
X-Proofpoint-GUID: K_oLqjNeuUlyhVnj6CvIfLcv3RePEX0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX2bsDBnTDBrwU
 4bj9HtilAT/Je5ubP11CusSUB5oOr3nDWt6WSpSeQ0xJ3hVZ/GhlS4vXQ7zj+Hf19ZSEUTI13XJ
 LIABrzpAT5NFF/38aK2TqAIlHtF98oz9+/oWQY5cUudgkkML8ESDFLJYebybXjIei61J/Adz+nr
 4nZV8aeNlWu5SL7s2J/tw20Cp5f1wYwFzgApksDtHhoQ1v6beU/2cNvSuBCUm78xetBhCQ8n8j6
 DtrABucG6zJGKDUmK0GtmM9Ml8xQ09iR+aO9a0NdXI/r3unRgDDOCFbkIGdmsXcw4GJLzL6Rzb6
 v9mGATVzjfd1dC9x0kN0XOHhieEo9+44tQgKkEkMZgy8BJ04ETjEJzYzttnjrSpb3Riv0gcQt8m
 wC2FMj8y7/JFnL4bO5XpXFXTHZAWuFpoh9AWzJXsX9LmzCk7C58z2QHD6aWYDh21orkF8BWjVei
 +6dOL+Rf51ajev0b7Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140240_402611_0F0E3A2E 
X-CRM114-Status: GOOD (  13.24  )
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

Correct a few white-space issues, like redundant space before final ';',
which will be flagged by dt-check-style ("redundant-whitespace"
warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi    | 2 +-
 arch/arm/boot/dts/mediatek/mt7629-rfb.dts | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index aa42377b47da..6e9ff0add169 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -1091,7 +1091,7 @@ pins-i2s1 {
 	key_pins_a: keys-alt-pins {
 		pins-keys {
 			pinmux = <MT7623_PIN_256_GPIO256_FUNC_GPIO256>,
-				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257> ;
+				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257>;
 			input-enable;
 		};
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
index f24ebc20732a..71a8e8fe28c0 100644
--- a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
@@ -220,21 +220,21 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_txd_rxd" ;
+			groups = "uart0_txd_rxd";
 		};
 	};
 
 	uart1_pins: uart1-pins {
 		mux {
 			function = "uart";
-			groups = "uart1_0_tx_rx" ;
+			groups = "uart1_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_0_txd_rxd" ;
+			groups = "uart2_0_txd_rxd";
 		};
 	};
 
-- 
2.53.0


