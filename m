Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1445103A9A9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zfcnsGdirM=; b=4FX7L515fHK3sFWkCyIkiw6rsY
	smxHcreA86BmC/H223F5SJ/vTOEt59+wsFxK0KR0LcSYQiUGB1+sGjZ5a//1cO3SiH0gmP4RRGG5f
	cWwW18Si3RgirIvqpedGlzhCM7IPUdkRtypnXwt2TWtBekxvZYEDbazA5VxDc8rxOdpaU3HX0KAkX
	wSDX/FFqyMHSCaY5B2OKq4fDE40YE/U6HiYG5twC0bAUh7PYfqiGd1VDlgF8elcK9ThDc8xIPeGNy
	VFkHmiR6wUrSTSiU/5oSydH2fLw0cRG+uJCBUxvqN0E3fCEQttRJqHg2uwehqpHlqV1gCfUZziZ/U
	SverZrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M6j-00000003Dgq-3QSo;
	Wed, 25 Mar 2026 11:09:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M6f-00000003Deb-2cDi
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 11:09:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5Hsnf2075441
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zf
	cnsGdirM=; b=YmR/Y8TkiZcYaOPvcfbsHe4ewF0w/giKKRCjNBozfZK1eGnRYFQ
	02Ir3VGKl6MFQoQeSZ3A+1b/FaX+4ZVm0qcE9NE1orOCf3D1towXGHKaB0Wa4VcO
	2ssT9yggzVzO1BeIVEN5ENzkgkHb0b0KfxQ9H2Q+3rFEVNJUZgPOfZ5bcavpyDkr
	60mHM5xsZGCiKxC9LZfOE5ErnB6vVDntcFFe1XtBM3bbvwgt8DQTvdePcMpGcbxD
	cIm7EoRlkXPdDRn5fszmiObct55eYv/4qU4paRTkdbcsLkNP0KnDG4fuFo7q4e9A
	Dbz2Lvl/sscZexf9y73AKcWOygzWxUiTcBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412ud2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 11:09:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b878a8c07so13715901cf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 04:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436939; x=1775041739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zfcnsGdirM=;
        b=MLE30UVWpXIE+6Nt0jbj0WXxmOMYXPmHchEp/uuBBZ7z20fN+V4jeq9hQp0s1ygXzh
         E27dzpWX4KzX2d0krYXKqCFMug3/GCIyB/aCvqbI/56MIv/GthtCIWtVinOpb7fp1CiS
         gdUGgiOY5Fi/RY3f6o7HAVrvRghixH2TyXdOxYb/Mgvo93MS50cHiJJYOSUKDk9tJz5m
         wdA1yZGgTmDhnVq+5RRdeObv34vuBRbDHALChN5jzFMTRScRUrPBHkJWbZODTo0epNZx
         ZEh1hrnU7W/SKF2pkDHcyfDm/aAhc7ZpQfda9OEyqle/Jk4Ody3pJ8GGFpzEyZWHSx/Q
         WJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436939; x=1775041739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zfcnsGdirM=;
        b=Z2nAzjRLjZXYLDX+hpxuSM/nhaHppQ9gxSkqLTg+k8m4qc8h/PKgiHPGgUStkR9vLn
         ENLaUm2H4hB+NmTPN1c6a5ZCRaCSUbb9TMa3exKeaCMLLsAHkij5lqP7x9tpNsZnUgTH
         WWmIDRG4Sc1eRF1OEi5ySjoSygNnUfqxK9XJiuO9ykkBLO7Ms/WGaPD8Kji4LHLBoZoQ
         MVDreUb8wnaCMaoykNm4KpDlBk6Yr3zwTm6G8tzZqBU/6x+EgIiFE83lTFlmqlqypFib
         B3Jwt0TsyzU70Qavx0z7P0SK6+ceQqr4Etn8WOXnHaPmfuBkZpxjrDUFYwyhkgweM3t8
         GM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmM3xFG1pucKlfaxfB/uaFNWjgcHgT3C2LkY3A/am+84ZXpcp1+l2g9duGwhGyO7jS4edPcpWy/+Y73tmGYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQfuUpg0h/y+nzvVWhgvPrsjxcIHbyNWgqjvEiw2wcitXOiQGC
	ry4t4U27Kgj5Pay9K2IZlOK5XqLaE4pDqujsN8XOM64m2ahgu0daHboEmzUEOm+vvOKZxh5a0Fc
	HxOWV4kJEKmrzZ0J3mo8WU8+/bgmRVpL1C1ayzJE29o/f24pESxnUiYVGrFDOf6EyWKPS8awSjT
	c=
X-Gm-Gg: ATEYQzxBtuk1nvyF2Vtag5MPsMq3a5cITzodFPPEOsy0pUCX2s1dB6LjCcOV8cedxL7
	5iGYPvLhPIEkkG0PWC69BR7IyDx+dWJbqeX1rnKGz5k6Q1jguKNRp6UulDRsqLfsW7ia0qfDAUM
	pZD91UQhc05vvghENbXvDYpUHSbnm1bnBLb5pOOE+z75xglTDcfOLacev93PMOZEeLWtwloHYJe
	g9iUCBMuw9N/grxZ5VZRnTbVH2fn7hpwDnX1Dg+7YJ7HApDXa2oRcCKYk5zO/H0eQG86nlu+xhT
	BURET9G0wRQEj/OpneodbkPFKqqqW+95dPOMgO106NpOvS6LsKhfTpdjjyVc1UoSVUGCB/otmcC
	vOcwg0XzylPSAXhQr5LhpXyie+Bu08b1j7kf+
X-Received: by 2002:a05:622a:a38b:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b80ea976dmr34740971cf.64.1774436939086;
        Wed, 25 Mar 2026 04:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:a38b:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b80ea976dmr34740491cf.64.1774436938614;
        Wed, 25 Mar 2026 04:08:58 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm47619447f8f.3.2026.03.25.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kartik Agarwala <agarwala.kartik@gmail.com>,
        Maso Huang <maso.huang@mediatek.com>,
        Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: mediatek,mt2701-wm8960: Correctly use additionalProperties
Date: Wed, 25 Mar 2026 12:08:50 +0100
Message-ID: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6I738bAfoEkJyQYtNHVpNFa/JjM+KqXguKAykG4mGRw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw8JBEfYqWLxD1bkFtAZmxhdwN6qxybaM6CQPH
 lpEpMapYKOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPCQQAKCRDBN2bmhouD
 15ujD/4g4dIYQv1qyZH2s9d5Rz1mh4nLeavnR8ImqzD/n+UWBA0g/jr0P423lyGLuoiyy5427Fj
 1NP++m9jyStQ80KoFTKmOAikHTRKgxLuZgPyIJ64vDZ53NWjD3hbsMzYQi1/IpKLElwUFygaeAG
 HGnXyE9XhE2eQdndSJ+rxmXEy3H6dPVThmCz0WHY+gD5qe+NC/u+ptMxJHVMtz9RYi4AsJfM7sF
 OqOB6i6bsBHUV5rT5rXclF/M9me6z1NVYQ31/CsYJvUozAwyPdS21SAuV2k8N1tt7onpjIeHnCm
 3EwC7hg0XOSiHQFQSShz2OTrH+xaUZq0GvJrhla0EakyM490VgfV7i3DQ9xnkdUFKEciCmUQMGh
 cCasowHJv8ubQLLad9s6BIo2fkc2+BhkDO7edOraIdyTAGB8K3eMWUaOfscyRCb+YaYJ3tDTIit
 puHqH34Ix1poix4PD+Un5D8PftlWJYQSp1nKH5ZxiyTY9etbGkml7HCdTWjscwhRwWR5MRw3u74
 Zxi59ornC0yop5XsB08C70mgad0IGrS4jNmH360ZOskfpBg7rbMNF7OHoQn/GtotAQDPF7CIIaT
 onzto6/+lZYMFEaeRtSUSeTCE6Nh0tbrkJRCHYcpwfh6XbY71DOMAGPO2yxTG8jy7xMefIiEIs9 oEroLwHkTqCwwqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3c24c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LxDdgrJzr8anm5p6-lUA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mPUCfMSwJytVJ--AfD2AwJ2i7d3jSKOV
X-Proofpoint-ORIG-GUID: mPUCfMSwJytVJ--AfD2AwJ2i7d3jSKOV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX9nl6E8LV83Ff
 md3GLNiMxqGSvyI1IGtd0E/20xLB6VpqtpAgZk4CG2W6AZeUfdv3G/Q7e7Q1RqX9R0I4MhRUveb
 Jd77nedV7dwe1mhF6qgvpGVQVF5/WNFa2jqJ1PFL0CD6Tkc+8G5gyZwpGGj+yS24b0u6GSvz+MT
 DZoU5ilNd/ztJkRyGISQxOxHWAng9fTjjgzW+gOatvbLEIYttxx/Tv/v02T8eswxcDqnH1ZImnd
 1KCEntIXfTkwnzHCZXurcvj3FAvNzxlUn/BQ7jhhYaV3GBh8L4oR6ZKanwtC0sf9CSLbfv9S3U6
 nbaodOBjvkkf5yCixnFj2Aq6DWyuZnahIL8TchHLOS53anRalBHiz62HPnNrd42fGgUBfdxkAJD
 SJ8TZjc440+INTsvNZ+vKzKisoc5Xa3LSf2oijeMVgDEX6AK+M+Hk++RbGTTurJDC/vvlio7xSQ
 /hsXEW/vpoH5HotBL7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040901_667767_E26F1F67 
X-CRM114-Status: GOOD (  14.23  )
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

The binding does not reference any other schema, thus should use
"additionalProperties: false" to disallow any undocumented properties.
Correct the code and place this after "required:" block to match
convention expressed in example-schema.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
index cf985461a995..bb6a405b263e 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
@@ -28,8 +28,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the WM8960 audio codec.
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - mediatek,platform
@@ -38,6 +36,8 @@ required:
   - pinctrl-names
   - pinctrl-0
 
+additionalProperties: false
+
 examples:
   - |
     sound {
-- 
2.51.0


