Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544BCD8CA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=; b=c0NrPRQBbF77NwNqdRgQT0TqDw
	8wjSZRlzEcuiKXN++LnwKZyYbRxZsHSZ8dvCwHqRZtAfJY0qID2nc518/WL1WBiRCPbCjZj91Dzc+
	RvAZUSI6C7svfZ2I3ldZCJrZHopx57nfjc8E+z4ONnsZF/lOqyTjYkkwbpHK/bvzqLH8U1zOb8+tS
	DbDaGOAbQrw0UIln+AgYrVkpor8JfzSZhzHws3PSrIp4tw1NzaiVy+n8k8VeHQ2Akw+x53Jsp7rqk
	00oD+WNh0E4ZEgrC3klBN9ZXSVivAFAnVtWW3pvFXAPNf3g0dYy/PPT+ZvDtTrSduazIRiMGskfb1
	wwSerdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpw-00000004NJO-0OCR;
	Mon, 08 Jun 2026 20:44:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgps-00000004NFz-47pQ
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 20:44:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwhZV276188
	for <linux-mediatek@lists.infradead.org>; Mon, 8 Jun 2026 20:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=; b=UxqmRTY9puFB7LWL
	ZMu0Qiib4RidpT67QVHaJx2XWnplGgMlJDqfKD+FGvqkOGj77M2IhfxwqatB3Bh6
	MeAf4wYyOGmzSi0oSa3FK7lEHss0rngDg95X8K1nywjpEmgKCuAiqFQ+ONKNH1Ud
	ScjuO2ZDFawf0CTjKgY2LE8K6QdrArARPhp0oQZj6oDAFZ1EwOylfi+IfUKOBtoy
	3onE4g7R4BmbKCdZurEZArH9podQMV73f6cSVxds3g7DT2AIhIJ0jmZ/EQmQwwxq
	+FkX9f+XnfAEPJJQcwup7UXe9Yl/DaaPNiCll092tEMxTZCmQIrpIf8XB9SHUcSe
	v31jAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptjv61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 20:44:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so94534191cf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780951479; x=1781556279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=;
        b=HYqL/Jop9Llpu3W1aV19NnbGiFjqvPIHOOIXURUlCPBlnwYylN34JX9VVGDqCwyROK
         c5sMwyjUXO2g7g/2VxWREaemY8eEM8AuW+ioJClRzdd5dOfDAnjBHcYs6EaiQ2rm49cz
         z8HnXfJ7g+aHbYPzV/EMqVD4tNpaq9CA/QWYnvu8aySUr5haStBqYYwb2vZHzSJE42of
         UZhWiiKQSPS4kjkyDjUCbfyFK9RRyzZLNHCfsuA0RW7P1kpPvceeSrZHATn7ALkXb5cq
         6PcjUQIXFvz1cpD95NToMN/oxw2hNdDERqJsT9y+Wz4yFoY4Ls1grrLltQ6qEhUH2RHL
         89Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951479; x=1781556279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=;
        b=j2Y/m0TLYWXKYhs14Mo9QPuubwHZHE968uxLhyv1wmj6oiPDJCi4Vi3L9j6h0AdPFZ
         i/Sye2SB0nlTc/XIuAMRbh7pCc2i2Ji99lBwZ3gZquljDqZe+ZNlpEEcHOTlYkRiP9wo
         WKqkJQ4NXQdtiHaxNwqnUcdozGzn26mmRX+VCW1zxklDByN8TjMtoxdegcRcxEW9N5Wa
         SiHrMREdvodpbKcV2/dAixvnx+cPYNsREArCb7yqFIHIfwEokZxrdAtuXNkO6Uu4lNBd
         DWzZeCzGyj4D7T2gjhIeNS9SURcNByxDLA6hd95R1VHd4/gw+wumLm+tIzV7pKNjTni/
         2ZVQ==
X-Forwarded-Encrypted: i=1; AFNElJ89uNCpcLiTpLD7Uf6j+LCQi6UA9A4w/V61375jG+sQouWiat0yuHUjLkKw0gHjX+bKVA5ggn+HabJ8aGNsng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyL+9Qx3TjERzeNBLrHQK2CiWNmh+fjGvNyfFpt78Ern0X+tki
	NltC6NX3JAt5vVk5tbjgSXx71uepu39oWKwRWxKQcx57dVWqyxaomsaTTy+eKMXtwE36a7ixOAs
	DM8CTwcHfJs+7yifX6uK4jIGil09Ikcw7PtHh+5qyyG6lG29o9/O2vjkiaXrDwnOch9VmVmCbV7
	g=
X-Gm-Gg: Acq92OFVTcVN5GAVAnHFY8FclPxsbfnKz2WcoaWfkKmIp090SXz2QISoVxpEKN2NMD1
	HztRaqZjoz1WrDgoSHowUVZOSo8oGRuEnU9YExoGYlRdnMo37kks490QEF6ashJs/YXSlFZ79HP
	sodWdXlImDJQTrcoOGQO4xdEUFYGbMZrC47xlyjwS+JlPJ0ngR3lmUsPhBfUvO6xJ6LpD4Zn2ET
	7H8g4IB5Wree3Yr9pdb0BF9Aj7W0tnhQM2gyk6UTRsokyrJdyGpeRE+yjyXpuHAKopif4/o75S6
	3tywa329k+NBNssbUEL3Js+wjkma8egDr2Q0JOJimqJQRQF5p2Pb/JiztQpZgVxuhfojPPAMj7h
	kHbvSNy27v3riAUN4kiBkQZMy82Ib9f1FQKr0zt/DHQ9f/6TqF446F+s=
X-Received: by 2002:ac8:7d94:0:b0:517:884d:3801 with SMTP id d75a77b69052e-51795b510a7mr238024561cf.25.1780951479416;
        Mon, 08 Jun 2026 13:44:39 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:517:884d:3801 with SMTP id d75a77b69052e-51795b510a7mr238023911cf.25.1780951478802;
        Mon, 08 Jun 2026 13:44:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm44018439f8f.32.2026.06.08.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:44:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 22:44:24 +0200
Subject: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus with
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3471;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGm0AisNFCyHSk5n1cRU+JBiint9Mvk66lCZxnmAJS8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJymuLrRKQk+tXDx2C3XILUa/Vb/m5SqeAMHbs
 hX701Fcl6CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaicprgAKCRDBN2bmhouD
 1xNzD/4owClN9H1JCOAoIzeu7RK56xSXZgce4N5pJJTSqM+cmLpO4VODAdnX9M90nuMT2mDNxlD
 SdZfpjjNTupJPwAZX5x+aSPrqbWsyQm1nVutsjB3jp7H6S8/1OnP5Z4BhuiwQEAhch5x6k4NVvY
 qL447Hya8vixLLsgY9sANwVmoXUKUmziA/9FQDpSgQUsoZsBPSZushtTAtPvFjdglp3PTDWJrSL
 QDkuLE+q61ip5Hpuble0C5lsc2dMCKrlXW6Lez7hvabG0BOoND5THfBuKNChvxJ4qRTArQF/VLU
 AAqUynQwJTUDLRNmHYcsvOuss3E1UqUdj45pZe23Wnlx/0WyPokJRUyqWtxelGER/rgEH4lAp3q
 qItSXbI1oiHviWpwFk0wcXYCZ28ekjTgqi6y+NctPbsPQk0mtADjQiu2eoA9gP6J/gR0fpYjBrC
 Q/en3j42uVe8KxZkbNTMCXke5RNveZKSbcz5vRoSFJiMNphlzRR382sRUXdhW8VSPf5cUIVjqlb
 cm/On61l90dg5x69fhEH+rDEK1Sc8U1+vsUhiYhWoq9jtHVBFEWUxcS5GFohZLrO5VrGSfJb2xe
 WRXhX3b9AoNrhcspfMTcxEmE1w2Z+SX9qPJ50ERHH5VTjFuC2lKRS09/TExgKqaabbdOzG+bCnK
 L1BibnK0fC/izPQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JeKJj3ltIdd6LOkI5JznnmXlwiUkKTr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4OCBTYWx0ZWRfXw+xCNeG+9kAO
 vQKr4tUJWkv7bsiw5W+O8uowxIhShwahNqccGlFkeQhIMbjnOoGsSWxQsXinSfboE3yhk7BdOZ4
 gWmX3QJGDlLcVWKj6O9g76yExQIHKde3I7yDTzh524q4CJC0bwOMNP5AWcLNh22cqlSvCPCJ3NB
 Bix5SLvYN7qi5MFG25vwD/64wroBjakkv8R1mOJv51SVcfukMmfX+sWR9lKQIepFPu3yqEUrqnw
 t+lnG9fYnMXzkiOdcXReF0mW8zWkwfbHImAtdtEBHzXSOirYdelC32I3L8gp8sFbw0Lr3AA8MGW
 M3N0dY/m4VLUPVL/i6G46nTkQF7wqSyr8nDaoMae41hDjwkgRFy46MB8Dhiq4AEvOHpqeu5ZnCS
 Z2aEssQld8l6PpfFs8MTjL7b9Gxd0DzhDfYN6ARJXIZV+bf533pMHxDeiDQaC89BeNAO7RUH4Xe
 /1OfniBIsPCrHMSowyg==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a2729b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SC3sQ6iH9rxi55wiDKQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JeKJj3ltIdd6LOkI5JznnmXlwiUkKTr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_134441_174697_F17738CA 
X-CRM114-Status: GOOD (  17.65  )
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

"syscon" is a system controller with registers having their own
functions, thus not really a trivial MMIO simple bus.  "simple-bus" on
the other hand is just a bus on which multiple devices sit and the
"simple" means no functions are allowed here.

Combination of both "syscon" and "simple-bus" is abuse of DT for easier
instantiating of Linux device drivers so add a schema to disallow that.

Unfortunately there are a few old cases of that patterns, so add
exceptions:

1. "cznic,turris1x-cpld" and "img,pistachio-cr-periph" are already used
   in upstream DTS.

2. TI has several DTSI with a child of SCM device (e.g. "ti,am3-scm")
   using "syscon" and "simple-bus" but without a dedicated compatible
   documented anywhere.  Add new compatibles for such cases.

Additionally, add comments around code enforcing two or three
compatibles: it is similar safeguard detecting incorrect bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. s/ti,omap5-scm-conf/ti,omap5-sysc-padconf-global/ because it is more
   appropriate (specific)
2. Add comments, why simple-mfd+syscon has dedicated if:then:

Changes in v2:
1. Complete patch. I accidentally sent only part of it, built on top of
   internal WIP which I forgot to squash.
   I received Ack from Rob, but change is significant, so please kindly
   re-review.
---
 .../devicetree/bindings/mfd/syscon-common.yaml     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 14a08e7bc8bd..2d5eef5add54 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -32,6 +32,7 @@ properties:
   compatible:
     contains:
       const: syscon
+    # Always require a specific compatible for syscon
     minItems: 2
     maxItems: 5  # Should be enough
 
@@ -52,11 +53,44 @@ allOf:
           contains:
             const: simple-mfd
     then:
+      # Always require a specific compatible for syscon with simple-mfd
       properties:
         compatible:
           minItems: 3
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: simple-bus
+    then:
+      # simple-bus conflicts with syscon - if a device is a system controller
+      # with miscellaneous registers, then it has at least one dedicated
+      # function thus it is not a simple bus. Allow existing exceptions.
+      if:
+        properties:
+          compatible:
+            not:
+              contains:
+                # This list CANNOT grow
+                enum:
+                  - cznic,turris1x-cpld
+                  - img,pistachio-cr-periph
+                  - ti,am3352-scm-conf
+                  - ti,am4372-scm-conf
+                  - ti,dm814-scm-conf
+                  - ti,dm8168-scm-conf
+                  - ti,dra7-scm-conf
+                  - ti,omap2-scm-conf
+                  - ti,omap3-scm-conf
+                  - ti,omap4-sysc-padconf-global
+                  - ti,omap5-scm-wkup-conf
+                  - ti,omap5-sysc-padconf-global
+      then:
+        required:
+          - incorrect-usage-of-simple-bus-and-syscon
+
 additionalProperties: true
 
 examples:

-- 
2.53.0


