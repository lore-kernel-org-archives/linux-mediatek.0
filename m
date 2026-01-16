Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ACCC982DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5ZiocRuErw=; b=ogERm7bXPLCv++aw2cnzAffU6L
	BYwv1Cc7o4X2b32IP3gVpv4+Tfsn5GH5dR0w6Lc3iiyc2U9noltH5CDlVq5SClUocYieLV9+QnZVj
	SIJ2X4hjQASFjF/YQROeYHe7I1XFmHTWN/Df0H0Fgug6airxb8OzIV/abDwY/pWQvc/xMRwdnzt88
	fDrz0+SvYl0WwBCKSrfybO5Io4QDMvWfOtA4b5wSFBbQKrarRysUMI6DukSqgZlvYT6DU9Gk9Lm6W
	Cmn/7JzLBFHPQFrrURf2ov7KFchyeC5sMhXvhplwLqE9waGPBRZsDtxFwNPgVWmVmwCjIFBLQjaTv
	z81XYvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnda-0000000Ea5z-1mXS;
	Fri, 16 Jan 2026 17:29:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgndX-0000000Ea4y-3omY
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 17:29:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GG80Jl4100940
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 17:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5Z
	iocRuErw=; b=cilUP49ixDv+tPMVcQ1cL2pJqlIuiPMvJl1GmcSUZ89HzuIBjm9
	Won7lB+tupT57JUEFkrqi+33q6tY9IxvaI7exFtJz1+62T/s1O3aQ2Zcedmy6cUx
	pri4ryWJtEJSNzdufu/ll9BGQf+61+geviftn7InS6L1URSvoRsVLlGGVHTug3O5
	w1AbXTh1Ud+NpHhHgFo4CGHTRG6wQyu+5m3siOyNgCrWLgc6aw7dGhER6hXQl8Yw
	Lmfwh+xEHOVWxXe7TfIo0U7TLapOxS4S/FGAW4X9oKUUhoY1PO+S2JTI3LSkUIZu
	tPjWurf2+R8/2IzDK8ik/J1gr9gWi5LKchQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97531hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 17:29:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd4cca2so593084685a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 09:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768584566; x=1769189366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5ZiocRuErw=;
        b=Ts2Bmy4h0LWDVa8O9B2rF/5HF1tLgjAkNV8/vOu7K2KvCsZQahifVQtFqs+dXx2NGB
         I/1abAizM7QLjWMvS96RKSrUx6YQiPaF8LxT9xvAsicy8RUpDHwy8Z9xUvEYqMfoXYfy
         /2OS9mFBbKmG4tiAxn4igMbe1dw0HC0e78cqYUngnUvl0WRvNDUO2G2m2teZ0RKo/EZe
         AVw0FjS7CgHTddy0PKiONqlDWcbCwNUz9GeOWTdbB29fGdmQbRjtMUBa/zHoloSCWtLW
         t/16a/Rcwca0cYK7W0VoSejgZH4rdh6sUXE3BfLNUdf57YhaxNcmKiQ0yDJw1B8eX3r9
         dJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584566; x=1769189366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5ZiocRuErw=;
        b=dXzWStjt5/Ot6AdHTWNcMUQu/lu0t+FL9MnugNz0UERJLPw+wTV1yTs4nXHkaqjdFH
         0AfQuXgn/X2nuSigYtVPrSPaGwVvu+GbhgkCGcfWoXwmRUhC538fyz2bOdNGm1W5uHNB
         pQwRGMnAy/YT+OO6qTR5pa9b9BlYy8mC8oU3Cg5pNDN9NdRViyjSd5rDdvwK9DTcEGtI
         tx+zptdmcrp3Jtpr/G0IJxtHIj+8gh5tVg8E3RFAZ95Q0+omF5YCUJpX9I8ax+YgDMzD
         a7mX/GDy8BecpBVgj4AYUKKR0uJDF4hVtif1v+9n/Xd0Vlihx6RrZsiXQydPuRcvGKQ0
         5DLA==
X-Forwarded-Encrypted: i=1; AJvYcCU8qJUnELKNIHAdcAvr5ofvcRh2a9OljhAOjZSfZb/1pkIH5jKxgXJpanG+fcbHxU9Rxk1QxfTGmCeoxjm1xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPO5Wy65pytBD/mkTBJ2r5NiOJIb6NrKq5ZqDN2YyBmdp6tT0d
	KvJC9tMYquLYeYwrK+ZTRcpYsyeBfUipQWgl7ZpVBVYJgUaACgNES5Q+INWh0OxusgE/FPLC2z9
	A7yOn0MLEaKIqoS8yIuYed5Rs3BUf7iEvwtg9+dFjisnlc9azCVudUcbagITmuQMkn3+QyK3PME
	0=
X-Gm-Gg: AY/fxX5NU267Suq0S9Sd3yGfP3DxHFZ2uCWb2FCVz0TP0mtXV1+yMLPV2/DWugnn9qO
	O4vx+Ct9LaWfT/9gpKjTYuBewqjLLrgkp5JCkzqDp/NKQiVecBhB6jd7sFIPB1sXfrz3ZYpNibM
	LGugv39A2C7uUDe205tVYkQmFRZnxfI4C6xBxRoW3qKcB9VAVoO7QV5wT2tYKDfYMLQIOJg5bkb
	UVX2teZYLVpOaCOgOA+vUCLZks8AQYWkc2gKVPAJJ8j1d/C4WDEeFeewALZiBqR0kXUR7KEUG6r
	2I+k+UICCHB1lqjX65hGH5GKQT38iBRRR+oeiwt7zag4Kn92pZjG/FOGaY1WPoKGNdeBEoxwHr+
	iI5hlsEgUAJHhxk3y6qRsx5KeUg==
X-Received: by 2002:a05:620a:461f:b0:8bb:78dd:1df with SMTP id af79cd13be357-8c6a67c30d7mr517345285a.76.1768584566234;
        Fri, 16 Jan 2026 09:29:26 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:8bb:78dd:1df with SMTP id af79cd13be357-8c6a67c30d7mr517341685a.76.1768584565814;
        Fri, 16 Jan 2026 09:29:25 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8795f1sm52916095e9.6.2026.01.16.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:29:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in maintainers
Date: Fri, 16 Jan 2026 18:29:16 +0100
Message-ID: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w5wYmYJ0Q4EcWsM7qxhCEMwCYB+GI1JfCsWL2CMYrtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpanVr7vSCa78OJVltP3F1F8lnT/0QOtvNVJH6A
 WdgmAkrbZuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWp1awAKCRDBN2bmhouD
 16EED/9Bt3RCNfZFEV/xizSMt9bKxX+UDTt78BnE/An3TSm7nTS7v35PifUWDhS/k2HgrHRGumo
 u8ECFg1GN8Z9hKsm+3v3MN4IH3jQQL9Bahtj1tOOXN4qnRVE9rGXnBCX8/HRJUxeYsLu9NmkuzX
 PjVPED2R/ZTs2CsPEiLYXGdyMneDZH5tu8KMysCxLPaSLcNFuzzbm0rpEZu5J0X6aWfpebuBhWa
 rF0CA1SbDW/jLt6X4kVfhzSdbsWKAefcrjroQ95gqYGuO/8eZNhFhSr8Xmk1OG7tQlnp/12VLdF
 PNXXbtrvlnKMdH+zAQGeatY9r4qwiMY5TpsKlvLt0XF4wue4ImVqMNFhVr0rVrBMtfiy2EKWYne
 6bd0ekQ2uIVrqKaU9VtdpSogakNxpoFgLog886FAOuUCTuw4NXtT3nkqdv3YQPhsrUckMksJtz7
 jcPvxzie+JPuOIQWKTcZZblw9ia7frXnOQ/QEHhhtGkfQCt4jRkp+QoQQIWjB9hznN5gpWEDWDO
 rJYYsObfoLOkxHEDvuZJo7krFzXSpGishb6HxU+5o1PXq604+qUTAYQcDlNKgC0707KkTUq69Mw
 pLJTLhyPFBVO1SO1WxYSDDuJ6j0P4i/5TSwiDlGBUNTCOarF9y5FiTOeWiywHFHzzgmhI/dqTtm asdA2zlU1VrINYA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyNyBTYWx0ZWRfX1/rDrQR3N3S4
 YUd1yBON7n61bUmBq2mg5+q+uzR3XH2nF9E0mGwP1185vuSyGqFt7TzKB5dLePaezBfAIlvONc/
 JqbUSJykjmc8Hn0Cvj45GmihwjdPiRY1fCRvZNSu8fMX8hW2NsbHSsoPMaHNWBg3aTrA/PVYc5X
 LRuctCfwOH2nm61t1gDSKVULcZ2nlGLywc6DmLVGrbGsmIZxn8jgnGVCxImhX1Wf5eP3BI8CjGl
 Bw8PUBrU+M1+fogig0MMhsISReYPAeAfkIQ1kkGgmXZrgrzb7vDE45Xi+drNmZZEnluUsryl7Z/
 o/zKdY3rqR62ARE95j/ked9I1NioSWjnJtHLkjz0Ajy5/ZugXPw9nXvtRN1YKNEvCl4Is+FrG8o
 AKcgK5dpjHFiZ/U9D0FjMenxgKnVR4ROGt7wy0YgAERLRvA+h8rIqhEVB0Htm721jYgl9pjhQkA
 VJ6j/oP3WUGxD6gZJ3g==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696a7577 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=lNgBRxWjdUaVFYStBmQA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: sSH6EBbSDRnL18J5CvvgInB83HMdMjnA
X-Proofpoint-ORIG-GUID: sSH6EBbSDRnL18J5CvvgInB83HMdMjnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_092927_959948_8664C600 
X-CRM114-Status: GOOD (  12.71  )
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

Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
maintainer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
index 88575da1e6d5..508b8c2f13a2 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: MediaTek mt8186 DSP core
 
 maintainers:
-  - Tinghan Shen <tinghan.shen@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 description: |
   MediaTek mt8186 SoC contains a DSP core used for
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 179c98b33b4d..bdbb12118da4 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek SCP
 
 maintainers:
-  - Tinghan Shen <tinghan.shen@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 description:
   This binding provides support for ARM Cortex M4 Co-processor found on some
-- 
2.51.0


