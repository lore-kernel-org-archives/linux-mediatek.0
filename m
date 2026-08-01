Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BD7C55172
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2026 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0ImJYSDcg=; b=N6Jr5Tef77YhfVNCZNGjv/B/Kg
	XPnUxaBSm58RFBYVYQscB/42zeR4g3sD79Kv85WrXSTgdZReUcEIWqIwSGoC1ilceesNdUj25dagi
	CkaGhMDU3oQvQWyHCAuw8EBUpMKM/CQOWQCTCk/YAol3Nbx2O8AQINakGOS6SdkjsKTnEheQdrcTw
	C46HUKQwp0Bqq8LBZysCUDB7YInAtcOJ/gqFALhD/BU8BFqRPOFMS63cdq45MZAa/Kgl9G8+ylOc1
	B8PqoAomWRJT8UczRaZXShpxP1Q4m7N/JN5JrJURTP0x+mfRvtgBnuJTIzWsDwt4+ubM1X2RZes01
	6kVaT3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFo4-0000000F0ob-1y0v;
	Sat, 01 Aug 2026 19:55:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFo0-0000000F0mT-2YWt
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Aug 2026 19:55:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxSUf040765
	for <linux-mediatek@lists.infradead.org>; Sat, 1 Aug 2026 19:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0
	ImJYSDcg=; b=oUFjra4m/6j+FmlMLlb109kEWh/+P7bND1VOrWsvpRbmInK76fP
	x30+1KZkIBFTVb0hyTxKPAX3SlCYJHXWDjfiF5g8mqmgogJRDMBq34BhDhU0WVoJ
	YTNP7lsikoDc8yCcY/J/l51EncTUKxERdQ6I1znQ0IXd1rHryrzZLQA4YV68LNHF
	fVfopdZjEglNBFJinXGuNnfZQ8KIjwNhymDLrNoZx47nzyZXHOUvU16Ck8NTv94s
	IQ5VnMIpdtJK+ij/XLrJ4iu+FeMgPKRXRL4dl/r29oDFcS0Yn5BR95uoWPdFHoPM
	cu0CHG9+kYjcPH44x0OdjfYWOELO1I4ItFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpsjhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 19:55:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso41485281cf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614135; x=1786218935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0ImJYSDcg=;
        b=RnltpuOMuJDwXIkyMfjtFfoMZlfZhXmyaz2cX1g0MEbD3726OCnP3Gprj54k2gKciV
         hB99CbHQdJX5WOnPRTgvW1A5ehRoA+oOezxCeDPEXFNR+hB+1v0O+g6GjsXsT4SeG88q
         FDYWa/q7zsyRRxEdAqkMAqZ4ePu7e64wAI2nLlSdRO1xu7T59UzI1Has3QOzute5icjJ
         TJ4RV9Nkqf6B46Ash4RJq/enApxAgmuQxgPXSaiBtqBR2rL0WrQqcOXbceXJ8mp5SYSy
         uCsezQz+veGv9QMGRJUc+4vah7EhEphN9A4q5uyeZnMPIITfpH4IwNcewYA/iyBJwozm
         jwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614135; x=1786218935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0ImJYSDcg=;
        b=H64iR5Yg7jSrVPRreeslXo6sIMrzNleQsaFpsB/F6dwlUhnlvVdg4v+w9dA5kIRbon
         nKYXF06coAM1UWb/usF7lmYqcPJhG+a+GjDo+wRIy55Tb7AQ1H0Hi8uVfUN76jHBBa9C
         NsVHhvw+pVQuWK6ebDCYqJ+3IBOx0KNktDP99nbsZD1s14uYTD/ko61nYDOQaW92e7ct
         7AchLbM6T07JWx9qQ6x9YN71Jgvpct+olvLJdd+538B5x4CSeswqIDB4yAITUxBLiFQh
         w1xMxbfFDPiHCy3tExr4gK8kal0FgmDDc1K0c2Xf6e4G37DppQmwihbjUk+IhoyFX6Vq
         3ZFA==
X-Forwarded-Encrypted: i=1; AHgh+RqmMprgsNBHK8EcB/Wg6FZYWQOGx9y7g9+KgLb6rZQ6no4iUXIfPAptIwXzkyAkOWWKOLbyxReXATQNrLJ2yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY+gQ5hpqYBfhnl8XovVzHj0u5A5mf+bcv/GIV485rA3JZjB35
	TcWMV5EG71Z4S/1BFQ1cxAd1ltbktHhnWwuyrDxQa2dFttmqAoCRhkaSfwdxGA26cUrUuM+ifKI
	pHoANcoqoDBDJg2uitqxAKv3GLJyxt8+gWKVdDQGb+B9LI1fsEfRoON/y5MTWsZ28JQZYmzzl6U
	o=
X-Gm-Gg: AR+sD12TSNfhj60Q3ddejWUfOlx31mgbvK0b3znVdPl2haxiR2LKNsbYtnpUBMUPYHb
	5J36PEhIN+0kDCPWYOPP3G1WtnOyOYJZjRxJYe6B/G5DdGKFF9nnex4hhVj+WiOs0iWIx7Rp2Cs
	NmkmS/rPzpSRg+8LkhweinO6pmF4VimDBIH9z8W5yGRWSmKgC3HzBELi7mfT/Z3sqwy8xde2qfi
	jCMSyEoUugma75cDydGtc/ISPwTpl8S6lVLRl20Hm9S9UU+0txVUKwC8wx0OTiaWWYN0hH69Sf5
	16zrYw/DUal+iilrXnV/HwmaeDuANXvEN32qw0pDGlzpyWZpCZdohjIxzAToIDjJjlXYV202FUf
	Ep/De3MxsBZejE5FJ
X-Received: by 2002:a05:622a:230a:b0:51c:8571:1ccc with SMTP id d75a77b69052e-52b567f2645mr104547581cf.41.1785614135276;
        Sat, 01 Aug 2026 12:55:35 -0700 (PDT)
X-Received: by 2002:a05:622a:230a:b0:51c:8571:1ccc with SMTP id d75a77b69052e-52b567f2645mr104547211cf.41.1785614134881;
        Sat, 01 Aug 2026 12:55:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm17496417f8f.31.2026.08.01.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: dt-bindings: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:29 +0200
Message-ID: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7312; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f1LZFXoTJBl1/AFu1OKBHhr7hP5lW3sbCItIQAZhxeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8xEuIh8uDLGNQebu/2oaczx7f6aDF7SNe4g
 QqA/xBUaUCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PMQAKCRDBN2bmhouD
 1yFyD/40PrZJY9zLs1MqCz8QDJ/+7PJXg0TChXiqgK2wUEpoTfFVwEfXa6Kh70IyVLlgfTHBqTq
 n/1lOjE3lio2qM4yk4gcjbvyFs15AS+uJoBincJZgodWYvjIKuJtujfHLAFvuylv1z6nVsfFLnr
 9drCJQldJHDmQgK2f/y7WgZMycyqujdDrLSB8GdFQEC2xdTRNZyN5X5BkJhnrLHA73leD70rInb
 1nGmNcvJ/NaZZ5eIUjPfqNEZVoOQpUoc274BawefQ2Lcl04AdJBahDTvrwNBD89Hszi1G9YzCV4
 AQpJ8r0p5oZRhUAQLKW2vpFbsnKmYmRU5hxbz9M97AHlMzp6ZtyebKhMl4f4VDR6/xN71QoY5dg
 StbaMcygfZeWdM/mE2bHea6FzS/ev22z15mnBxORJAuswxpdEnLFSwEzysSS/cgkE/26pA5pyb2
 0NkRHZnH/ZnL3y9mrhjFfHzh7v2hPkZ/5FpIJTiaeBnOUyiaFdy8U7M1JN/nfBVwxuRxYKwa/SG
 KdV4VOLykfzAJ3nC3CROtKww02ZDPZIrWfq1yjMYaOroVRq/wIUw6Jqe75vzF1fTcJTvf16AcBD
 jE3Z11La6Ch+QlD2o5IHI8wAYRbMlwDZzw07Rhjnd69kRmYfOPSckASZ/aQ478i/d2PAr5MpRri P+a2P5BeHxR0U7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfXz/hbAUWRqrlR
 wMlUZnEw1teswmpdCc8K4PryBQJwkvzpbEicYK4sLG2VWpPpqBcTBmGnkk/S7/bHumudGaVxFW+
 NIlYGckxIQRX/4ll4C0h5vlbL/RtGQzyp+Cf7tIbrdqzJzrKumlqireoCnAxkxpiltVQed11CE9
 lgc9kRxSBPWTgjuw2RcFxF33d+1y5hFZlbdnaGmCf5xAzLtUkm3gdnduwbOQzbzmLxC3bUMZ6c0
 35Gt7QCvjnIUHCn4T494l/vm+jst457uOFl9aH8CumzPvlhGjdULaTnWUBm8u7eROJ1SBVLunAe
 5DPwbcday8iw6Ds9UyKnt4uxFsR/PF1vajpMbwAdxqZkqu3MN/AlwrotkszcDRLQGlcdLB6lXeP
 o57iR42TbZRwZ2tp5dNmItFQV4SyRAL7u4fkL6Ixjzb8aaf5OAEb6bBCipLO7pm9dBG8w+EnADN
 Ra6DW88Pq9EuH0xS7TA==
X-Proofpoint-GUID: ojM-rgXGQrk8cOiIuhh-ukEHMx2qdncH
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6e4f38 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=-OYJPjWUVwCj3UUiuegA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ojM-rgXGQrk8cOiIuhh-ukEHMx2qdncH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX2Tf8Bl6kxFFo
 ERuN5qyBfNR1Aw1oo9eeupJfFm0AY54XWRRleHeiN01l9zA3R5t50TfA4tG+S69Lja/pfBUeakv
 4JYW7Yy6s/Es6me3wTZPyTu/Tz3+q5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_125536_671252_0135322B 
X-CRM114-Status: GOOD (  14.18  )
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

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
 .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
 .../media/mediatek,vcodec-encoder.yaml        |  2 +-
 .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
 .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
 .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
 .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
index b0129beab0c3..2f11e5f45839 100644
--- a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
@@ -96,8 +96,8 @@ examples:
                   <0x0 0xff01a000 0x0 0x100>;
             reg-names = "aphy", "dphy", "host";
             power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
-            clocks =  <&clkc_periphs CLKID_VAPB>,
-                      <&clkc_periphs CLKID_CSI_PHY0>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_CSI_PHY0>;
             clock-names = "vapb", "phy0";
             assigned-clocks = <&clkc_periphs CLKID_VAPB>,
                               <&clkc_periphs CLKID_CSI_PHY0>;
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
index 0e7a7b5ac89f..99d728c47cfb 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
@@ -88,7 +88,7 @@ examples:
         #size-cells = <0>;
 
         sensor@37 {
-            compatible =  "galaxycore,gc05a2";
+            compatible = "galaxycore,gc05a2";
             reg = <0x37>;
 
             clocks = <&gc05a2_clk>;
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 4505e66876a2..551e483f3e51 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -160,7 +160,7 @@ examples:
 
     vcodec_enc_vp8: vcodec@19002000 {
       compatible = "mediatek,mt8173-vcodec-enc-vp8";
-      reg =  <0x19002000 0x1000>; /* VENC_LT_SYS */
+      reg = <0x19002000 0x1000>; /* VENC_LT_SYS */
       interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
       iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
              <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..76878050cfd9 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -72,8 +72,8 @@ examples:
       compatible = "mediatek,mt2701-jpgdec";
       reg = <0x15004000 0x1000>;
       interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
-                <&imgsys CLK_IMG_JPGDEC>;
+      clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
+               <&imgsys CLK_IMG_JPGDEC>;
       clock-names = "jpgdec-smi",
                     "jpgdec";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..3bc1ccb25893 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -67,7 +67,7 @@ examples:
                    "mediatek,mtk-jpgenc";
       reg = <0x1500a000 0x1000>;
       interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
-      clocks =  <&imgsys CLK_IMG_VENC>;
+      clocks = <&imgsys CLK_IMG_VENC>;
       clock-names = "jpgenc";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
       iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 56c16458e3bb..389b545c9631 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -119,26 +119,26 @@ examples:
                  <&mmcc VIDEO_MAXI_CLK>;
         clock-names = "core", "iface", "bus", "mbus";
         power-domains = <&mmcc VENUS_GDSC>;
-        iommus =  <&venus_smmu 0x00>,
-                  <&venus_smmu 0x01>,
-                  <&venus_smmu 0x0a>,
-                  <&venus_smmu 0x07>,
-                  <&venus_smmu 0x0e>,
-                  <&venus_smmu 0x0f>,
-                  <&venus_smmu 0x08>,
-                  <&venus_smmu 0x09>,
-                  <&venus_smmu 0x0b>,
-                  <&venus_smmu 0x0c>,
-                  <&venus_smmu 0x0d>,
-                  <&venus_smmu 0x10>,
-                  <&venus_smmu 0x11>,
-                  <&venus_smmu 0x21>,
-                  <&venus_smmu 0x28>,
-                  <&venus_smmu 0x29>,
-                  <&venus_smmu 0x2b>,
-                  <&venus_smmu 0x2c>,
-                  <&venus_smmu 0x2d>,
-                  <&venus_smmu 0x31>;
+        iommus = <&venus_smmu 0x00>,
+                 <&venus_smmu 0x01>,
+                 <&venus_smmu 0x0a>,
+                 <&venus_smmu 0x07>,
+                 <&venus_smmu 0x0e>,
+                 <&venus_smmu 0x0f>,
+                 <&venus_smmu 0x08>,
+                 <&venus_smmu 0x09>,
+                 <&venus_smmu 0x0b>,
+                 <&venus_smmu 0x0c>,
+                 <&venus_smmu 0x0d>,
+                 <&venus_smmu 0x10>,
+                 <&venus_smmu 0x11>,
+                 <&venus_smmu 0x21>,
+                 <&venus_smmu 0x28>,
+                 <&venus_smmu 0x29>,
+                 <&venus_smmu 0x2b>,
+                 <&venus_smmu 0x2c>,
+                 <&venus_smmu 0x2d>,
+                 <&venus_smmu 0x31>;
         memory-region = <&venus_mem>;
 
         video-decoder {
diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
index 1fc62a1d8eda..5c0f2f7b1d95 100644
--- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -53,7 +53,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        isp@880000  {
+        isp@880000 {
              compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
              reg = <0x10 0x00880000 0x0 0x4000>;
              interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.53.0


