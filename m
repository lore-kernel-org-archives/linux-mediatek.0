Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C3CD8C9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=; b=d6bwwjnqFA7cNbffEPkU0ejzK3
	azxF2ZjXdR+kIGcCKX1kAZ1gvTFBbkSRUFJ3kTjvacZhq7TFaVwHF2P7VPNK+JGAoAgo/eOsW6S4M
	g4stFBj1JXlYw1A+8Fh4rk1GoHqjEzyORb27Nkx4dTL6sPzEpMbyyt/3geV8JAuRgZeuFqIiIX2nl
	QF8Na3hjjw9n788yzNt9L49DxEf3Xn8S1gVGVlNtaETygYHfRD/EG7RjfsUjBY7Rzg3JNmJPWUg5W
	przv32Vba3IFv1FQwIeSI8w9B1HUzdw9kui2N9zEj5EUT2FNQD31fW4NDMfD3/Y4tyoXIt0OFoUFJ
	b09sDoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRW-00000003fID-20i4;
	Mon, 08 Jun 2026 13:55:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRT-00000003fDa-0dmP
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR3wE3720879
	for <linux-mediatek@lists.infradead.org>; Mon, 8 Jun 2026 13:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=; b=HE8V9I898hiEnvjd
	WXThoSGLHy1Uov/QdRACXp+qCvo/yPAfD3XNHA+UdSB+0b3D1D5J4dICKdJSxQob
	Uhe2nvdy9YzePsEHGJifH7aXA2hBFy/zAM8t+gihx81pgZVNAs76vMYnAvpg1CZ+
	vfCj9EcM5L2utHz4ohjBgDZyZNzXqSEIl8Rfj0lgc2QZ2Wn+K+rHxgGqn2/e9C0I
	gFGoMdRenILm5f7ighMjrxkkcUXMZVqeDH897zSEIrySUdEKUD8RlPIGJMBpPElI
	RCWoZh4Ev40/FIIGP9H5cOwqC58kttiPFY8o/HfoT8FeKj4uqkr1aprpX62j2Y9h
	DBi60Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enupth0rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 13:55:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517ac42d958so34972551cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926902; x=1781531702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=;
        b=aceUxrnU+ROBX2UdeIvHcrB5XoAC5Erpsr947Knjv6KiC69Lu1cE31tF+ZYeK+BzeL
         YtfcVaJp+aMWjZXi7IElsaDo/uD0ht0ASu9vKjUaa9iOE+U9FAc0+74QNUqYetDHaTVr
         G/ztJZl/drHDlJc0XP2g2ipnsz2LE3YPG8ux+3PWrs50EZbZK2SrcYKpvCeNdnRLDRJ4
         tcYVE1LcqFVdhsJhZOM0STeGe9mRUZGgWlj24JeezPFecA2Fd/wAMnjh91L6Ip/QhXgO
         D50sskF6adQYjepiYvbvf0sQU+2kjvjS+2EGSksL5NF+K5r8NdPgoUja2zMaxK3ZArY8
         pKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926902; x=1781531702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=;
        b=HEtdNa/bkGUkTyuPFZKOBUn1O8U/H2HSlAndqbleSjzILUT+Y5jrn5Ti2dAaeVTN5k
         WJDTkivWztoVPwhgA2nuOWOgE8xxqIK0FMurCCdnkPk6WiBC4rTBE1HwJADFsPMwPSlW
         +0GHKgqo/gQivB2ZG/4Qf8FZxl7cZMhonznRUhIbDnjQGzRLr/djLxNuRi6iJWIxFHAO
         EA0J9hnJI6Ar/oqQ2ghKOgtJiUkMQdsqTxq6YJJvsqxALHlGizYXxr4ap8gZ4Lpt7qK1
         UFa3MBNoeVhv+ZGYnOd+qLNJqUBQe44BwRruc3aBZXElYuyB7xS90rostRd90G/jIKs3
         As9w==
X-Forwarded-Encrypted: i=1; AFNElJ+B9K8QeZNOSERn5Acz4wmdwAA53z0FAvRAh74HyWoKY2W6KbK/b0Axiu3clofovu5Hcly0fORC8eF9nXFuhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Q2aUTTGfS+nX3REdaZwN3IHFlYbK3aLbzu0Xk5NChVL/zSB9
	qZDjZ21wp203JYYE+Vb70kMuZZNlbC1yvG9UveQxVLbxXwBH5q+B4V3Xw0WoyCYcEntc8cWcOPt
	9MnIseg4CdUo+BvkxMhl+9LorruWJSDjW9Kl7tDw+t2fPIZEx3ku68xck2rhMzfxPP/RIhjecpb
	s=
X-Gm-Gg: Acq92OHj9Sbv9I23OnST1zrdueKJ/vna3/rkBYm6Pfb7s2ygHFgFRpbfidQfAgFPSkj
	34sL4P0p2pr4xfhHQtM66fVitJUSiUGB86leVyZQ4wlk3lsWVIOCkVlBnI68Syz755L1wbvJw1i
	HAjJ4mflo+8dpZYJFbw9BBYLLCfTKyYuAWPGEhgWa47nkjmJVKuNzPf4dfeuadlqEjjEXiuMa96
	k7VMK8cmQKhXaEcNI1cz9qqbueaoZqhLVvy1b6mxr8mVLseJd1u12qmJTyAcPd8uhDSSkwbaTSe
	xBUDOsMCUX8+VvVf3SSjq+nNl5baDEVpv/VZyfFfuSPhAMvIaAUeOIrzFCpp06mPnvnQJx/KYBP
	uuyr4TDYKb2GB3TbuKQ5CBOP2lWSqgKAQ4gbhiJQxT2pWMPzfU2tLRHc=
X-Received: by 2002:a05:622a:2509:b0:516:daca:ea8a with SMTP id d75a77b69052e-51795a4149amr202288681cf.20.1780926901632;
        Mon, 08 Jun 2026 06:55:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:516:daca:ea8a with SMTP id d75a77b69052e-51795a4149amr202288261cf.20.1780926901148;
        Mon, 08 Jun 2026 06:55:01 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:15 +0200
Subject: [PATCH v2 2/4] dt-bindings: mfd: syscon: Drop unneeded case for
 syscon + simple-mfd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-2-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lpvEF+gT5fcjZ09COuS+KduhTUqK+dyTIeYaqErwUx8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmprD6HuAcUIRBVQOXNOcJdz8AQBm1/59E2R
 DiKe8Ecmk6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqQAKCRDBN2bmhouD
 1ybOD/9TTTiTOIm72paZbnNZ62/N87L70A5R6anWHdWGFq4pwhlun9eNRC5N+e3kQ0suiL3JbGl
 6LsQsTwGFhxDADb1KHyJb3IMOWq8anPjedxgEs/SK1W4hSSF7Gy3KRmm0enmIgK5DsvdZvzoX7/
 W0JSVyitDrsCGOQw9OaIXT57J4B9nIfXxFl0BmRBpfSRORSELC406pvTbWQLwF5M2GhYSGs2CO7
 a/zp+KDtNYT7m85FzFo/D+fHOPcLUXneuYROZPlLM64EEx0/itbHL+NwsUCamJ3l/yyT/r/T8rx
 4vpizNrNsHUesYVok8afqlxEjdefNeOKx4P9VCSbVRpkvDJJwMryWSmLPVlweEvRt2R1t/Pj11L
 Xpp2H4ncIKOoJVEG85aUPy9YVh6sonSbQylYfLb0LLlm5b+BxjemGExL7XA/qZ0yOCN5dH+lhCN
 CxpRc5u8LA4fWdrg/GO0KGMeHCTbKeQ5g813ZLYVkbpuBjkBSLAuJPsi+puemCnalsC3qTx5Mj9
 gaXEiAnHsHcbJQNprPAjpqGfTE+ZkILnU3RWvc50jxaWvkJOUWi9K9kwpXS+3/dYS5KdDrOQUte
 rPPlc8hburw82yv+bG5e4D+h+3QYOYB6sQWAHgTNHZlJtAAuqF4ig2gb4tlT2tyFdYOafeP47uJ
 oaeZTP9STt9FJ+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: uDB5Lht386I_Xb5CexDAXfD5kzVHhijf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfXwtUXx2UIuhtW
 w4vJYaj2qaimC7mV29BDmUPRa926SvDFc0CirielWElFdG+VdJvty5oPLLxUtnux+pB0U4PfsWC
 KgC+T9Fg/zr+iEB+c548lNGZzDjh2p7EFQEahj2lL+uJ6JiXC+mACqD1R11/7WE08/ytvwvejX1
 0QUWwwNrIlOqjKi0YJXarF3wUiiv14NomaMWe21s17GcLdgtMI8aTgUzO7eF5bkAPHQjIllaafi
 zbQn01talnlXIdGG0yUEQgqI8ChNNnqPCNZIwqDir/IPscVMnTRVExHv9ZwUf39o+x8SepcnmyR
 ZxITZ0YH95SphBJQWSZs+hImwcz1zPsbywL3KACZDkcZRD2eitn6jxJOqH/Bp1TxxwXFa7oPO2Q
 mxoy5PbJaZ2riGRLmZteERBDtoIZNr7r63TzMzy5pxCMY5c5M4lyELDXCp9Pv02cLc+wnpTgGoT
 k/i4clj3VkUIlzLnaLA==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26c9b6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iBsvbdzN5SDSf47EeGIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: uDB5Lht386I_Xb5CexDAXfD5kzVHhijf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065503_335765_47228369 
X-CRM114-Status: GOOD (  13.28  )
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

Commit f97b0435c857 ("dt-bindings: mfd: syscon: Split and enforce
documenting MFD children") split the syscon.yaml bindings with intention
that combinations of "syscon" and "simple-mfd" will own bindings file
referencing the common syscon-common.yaml file and define its children.
That is why it left the quite generic/wide compatible list of up to five
entries with simple-mfd.

This permissive list of up to five entries with simple-mfd can be
removed because:
1. Such case - referencing syscon-common.yaml - did not materialize.

2. All documented bindings combining "syscon" and "simple-mfd" have
   their own schemas.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/mfd/syscon-common.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 315357da146e..b3462e876622 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -46,17 +46,6 @@ required:
   - reg
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: simple-mfd
-    then:
-      properties:
-        compatible:
-          minItems: 3
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.53.0


