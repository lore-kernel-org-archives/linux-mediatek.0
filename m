Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8841AD74961
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbiKzhp+N5A=; b=DNlQ44gVdEPXZLFX4wHAiW8kb+
	Lai145+s1lVd8tGC6c+Q7Q4LFP8dEhm3PiO9KNHuVGbSMs5uRZ78PeuSxIgTOPyde0p2lF2dW3WVl
	653BxcmSBeMptOXfZ31klDELg2B7UfSyRXpnU1pg6RS96rj4IqPq0y6//rR1BeLousOOrJ4mtL2SR
	FyXVDPLDK4ywxWIKBu5mqLCSkGkt/3To69DPF1fD8aLr2RgmwzA+lKGiuHDfhw8NWmo6SgWH8CqBE
	9ANE+b+dCVIs9jJB646cLI4C5LDHIx+8ZOplzrUxE/0mfXb9LC6y/2JyxybQXA3xmwB5zEFE84MZE
	9UdoXruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV6Z-00000009lcf-2xRt;
	Fri, 19 Dec 2025 07:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV6V-00000009lbu-0AAU
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 07:40:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cBJf091844
	for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 07:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbi
	Kzhp+N5A=; b=eceOhw7MHcNJBA4Q0lTL8Xlrni7bLyZOSqMbCPrqfaEmaBcDkOI
	fjsook5rfL4kdOyjFe5ziRLha6s6hyB2B+YQ+hh77uFIPEMz7eDivoCSsxc8HTzv
	UmuTLpw9/tsjlKWumtqh5eKAC0kqquxGOZkzkR2/LDHdk3usKh+AJLNB21YnneTT
	ILDotgp+YZfTzhpGiJpxe9JjgM6Fnv8pQlD+MuxKdmISpIH2ZewkdlSTLp2UVlmj
	1NziJmuUnl0WD7cyfYu5SaANylX+nZuErx6MqAb5EFTddA/uvUq1rpZeSKRxUvX8
	fLySNg2iYKi/610scmOt/GMWRYhsqJZVwAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2e9r6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 07:40:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso36453671cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130045; x=1766734845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbiKzhp+N5A=;
        b=LCGkO+Vlhl/QRUJSu0QbIIUA76m5BXbCoIYxI+92CvoZOf5ElpcIdn35Sr5Cgzpa+j
         iHCrpkojc3L1FJKuXm7/5Ue9LPCUTHalszojjqoa3HjXtr5F7Sdi2Xd9aNRZ/84NpXj5
         197fRV32Y3pLVzja20TkYlf84rK+Fido1Vr/pc9twhD2FjtfV3+vF+YEuY8JqgCjEF/C
         DLSWA1QYwGbT+xR2m0KF8ZhIt9vU2JdO99NYxQfSL3y+BC8iQ5lrS9ZZ9oKyAIMTdGPo
         KKUb2GII5V+2KorjvX8kO7/Ps1e3b2FkOiPzNTmbaND5A3NerEKFcBQz1Edq5q9Sw5jP
         +1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130045; x=1766734845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbiKzhp+N5A=;
        b=fhsaR2l+ICET1bZIMKqwruYHq0yr1Rjabfi7nDazz6TYgP4g22AJ5Jg2Fc4euXdFh7
         J7NUtQABerb+ZdroO1t4zb57K1I8y/3m6PhZBbPj7fJ2A8bK8DvxG86xDLaRJCHH0uFP
         EE6MaZCiiNk/KpbYD7Xdg/Gv4OWDXmJQ/WgikQ8Fz8fQjwEs9dlggAT9gzXpoyCS6+fO
         Jlzz/1JB6PiOUttWEzlYYcRqsgFYZzyz8WYH2aCHxkPVjjYosjx+Rhic73DcAJEaHCfP
         TfIps5g4vSnDvKWRtDcLWUbt1Uv0ap3jpDbSlUXthZTzwzs3BZ21Nrzj+TwZOyWllvHi
         BWHw==
X-Forwarded-Encrypted: i=1; AJvYcCXcqo0ys/LEo8FjjMIJi+uKw5J9h9Ypt9DxD/QCldxah6AQV3RQdVOSLYY1PtkgS7qsCv8tq7XTFI90rHitIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJ5IbCGKTzPsGQDqKjvv4c0JBcoZpHni6T1XkDb5GVJqtjFb7
	yb6tSOcMSfEFIG7aZKY2QOf5SuNyZ2SeddmfJpAZoyL9ik6e4hh6vjIyVQHX9bzK34UPq7IOgFB
	82cQt0Wv16GH7qt0MN4xiaShtG8ldpjE79fcfjbL7u6yiHAZVlW+Iddt7fvNtucDrPMvV/TV1UT
	k=
X-Gm-Gg: AY/fxX66jjl5ABAsuxYfBLO5Rynq+lNz+NDMTkmwyvCFZAl2j6QlEWXZnHFkbDCwvio
	ttFvElXNjX8Kfr772bMD2neolHp6Tr4pzowazZKK5zsaehq5KhAqlOOpAb23hxvflfDj35zDeBt
	sLU0jfIsbhiiDL+Kxq3u7LGF0xmjigRuMCDiAdSVmxNY7evqDVLmK5lY6if/on7kZ3oD4itjsBP
	Mv/8JJbwt9YxEcEuHRE4eyzVCHEGPBCpH4ECKSqeb0riktGQdqk55PWYmJ1Ugh1S6TPBYy/gO9x
	M3IHUiDP3vJaYytQ2VhawjrEdcQlBxwvv0GfUQKdZhxLOQcAlpdJ2pofzj9wrVHtM0acxWwrRak
	wdYvR3n4Y+h/+olrrL8z7/Br+zmgg8ccPol3KXdJC3OLYo8+YhGNM5rgZjsMdwEKC+Fg=
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr26272791cf.51.1766130044824;
        Thu, 18 Dec 2025 23:40:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZEHmexCkpUpnJU3gD8Mpws4Lb3U3S6CxCEkKP17IE4LRT4jWtCCJFbvZtGo1Vj8vdU/D+Ww==
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr26272671cf.51.1766130044437;
        Thu, 18 Dec 2025 23:40:44 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm163174266b.1.2025.12.18.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:40:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        MandyJH Liu <mandyjh.liu@mediatek.com>
Subject: [PATCH] dt-bindings: mediatek: Drop inactive MandyJH Liu
Date: Fri, 19 Dec 2025 08:40:36 +0100
Message-ID: <20251219074035.13001-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Pj+5rF1JzrlA2iWQvzCZRORhOwCpPgy2lS1f3GmBXaQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRQFzVSyGI1P+7P7LeiMXwYB/UU4cmRnFddVZ2
 NZtxkX9aC6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUBcwAKCRDBN2bmhouD
 19JYD/9CCbYGdUgNg/6wlO7AqltOh1PNwU+mESZeL+tKQSbY6m3VjAiplRsoDiNUJMowDAcxJTK
 PqxdrWg63SHJpgaE1xS7p8x4AHVwSQhVR62MzrUwNPBtSHLBV29cJA3BJVmTWTFzovTLFjyGiOo
 90UGzia4vNxO7PVXsP//ULpayHUp7dtpDtvvlaV6F/d8788bUcGBOVzgAsP9n6HvW0kwFr9dnKb
 wVpEjEDipSGJ4LepDYYIHKMpw1g/xio3Db3fPaLGZK3w4ayniYVttpBpXHnYgek/gNEXaghXdd6
 vc+r6fJI8AFGSaVmixFdWAzmFeDphvbL/0TQOsa9NHO0b5u7UwenNGTl0mn8r2fymKSOCfNyIyC
 yYkuTf30W2plhYnuC4BrhQnSGztgyDl4NMYRyiT5S74VW6D4ZQ/q6Vk+o3KedRPX0N7z6KtQSh3
 GVosI6Ib+OAu2fjlmMV9A4AleOQntd+jXRmDNqeNWK7oFM6daOXN+SGUDqT7CVlcqe9ZX2PvL44
 X5lVWuprTJh44StcfRB0EuxSRRbsadKHZuZSsngcIgKNun43ygOJV0wlKlKCPm6YUNtoQuwTT6n
 9Kb3YrVRn7ZoNDGadO+CC6OSzzZ9TqSl41Ci6g1j6CoN0P2Q9Zs2rmuDtYSzUgH+Ks9OdMwyb3M Q7fvNxtKKfCKL+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfXwIbtJMVo55Bp
 zPMa2iXHXGsP1yAxwiHlycaAp8der4Z8d+5uBPENX3FWgftyU9ON6j3WTH/ELDBCfhlMeGRasM/
 r0508rp8K1EsDs0WJsZdx4+CNsYU+WBM9fYxvLwDa36XHQdrYf3T6/9fp5zsgVZS5r1JiUbCfHQ
 MIujw/IZ0/NM+Er0VfshIg2+FEA7Qq6rKZRfkMLfHP2MExvcZOZKsjbbyQWJMKn1szT6S42MUMS
 qPwHOEdTGztXv8XWShd9UWtlUpMj4//9n825UjQ9aHyiGLKnxthA/ZX3x6WE2MLQ5A/oAkJWjFA
 H474Gx4fOC91+RMB0J/8j0BW53BxFTusXouXq7JdcTqs9z32CJgsUO3QcfD5RCq9oiJdmhQz23C
 /qU33EryRS0zAS/dPOYP89CT3FJSZUQVx5epO84TqGvVDRB1iTnirX+DxQ/GsO6FC6ZswzpItSX
 MfjVxLjZsgkmt2u2J3Q==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6945017d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=RAb97dgWUv9LPol2dIoA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: htTnqG1OVZj5DgD4jcebVM_OHvddG3Y5
X-Proofpoint-GUID: htTnqG1OVZj5DgD4jcebVM_OHvddG3Y5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234047_223919_B6E32E8E 
X-CRM114-Status: GOOD (  12.42  )
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

There are no emails from MandyJH Liu, no reviews [1] of these bindings, so
clearly no maintenance is happening here.  Switch to Mediatek SoC
maintainers.

Cc: MandyJH Liu <mandyjh.liu@mediatek.com>
Link: https://lore.kernel.org/all/?q=f%3Amandyjh.liu%40mediatek.com [1]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml        | 3 ++-
 .../devicetree/bindings/power/mediatek,power-controller.yaml   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 0e1d43c96fb9..1cb9d6797b92 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: MediaTek System Control Processor System
 
 maintainers:
-  - MandyJH Liu <mandyjh.liu@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description:
   MediaTek System Control Processor System (SCPSYS) has several
diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index f8a13928f615..9507b342a7ee 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek Power Domains Controller
 
 maintainers:
-  - MandyJH Liu <mandyjh.liu@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Matthias Brugger <mbrugger@suse.com>
 
 description: |
-- 
2.51.0


