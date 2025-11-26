Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBF2D1118B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=; b=WM20Z+5qrbNyCh
	7a+T2u53a8XlKA4kJWKsmmTH3cSo5K2kJfSVQ1l2rIE3j3mEjOkpP8sCRH7ONXR2vlRIeXkRiziME
	Jiu4U3LqBNxRCrS9SdMpm+F25xR64dVKcWZhnkga8Odktvj0KHMd2k+K9MhpMx4Vnzb6g5vIybVP1
	chPBzhK2q+KacO1i8NcVCAfczvk0WDEOlsOgYxjqvumQNQ9u2Cl6J5NgzJqYri3t8rtq1guG9ZFam
	IiHwpJlHqZanZ5tajTSsH/8W5Y6dkUyfOtKXU5wCH1bNc6slhusThRnVBiHwgMAhV1vsYgpgeunYp
	/4NL6mfUtLCnsrD0uiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVm-0000000FRBx-0e30;
	Wed, 26 Nov 2025 17:41:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJV6-0000000FQo8-3yFc
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9F81P4049007
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JHqleQhItLHM4lrJ5sAFUn
	HOBmEniAGn/X/VpuywkDs=; b=R8SSXyZ2jt/e3jtjAV6E34xmlZUdhW48MkbRDR
	5z91lTXDoK5+JdOp5homLut9sjo+OL3vJHlDV1OPKAY4IRfEmfDdfV/9miY7SmvF
	jxzr+uMbWrG73B2+qC9Q4jbIE1XH+WbWAyFpmt3ePlJeCaGYDM7u5wObT47CjE4M
	1B7ANVCRzGxjiwudiN7tm8B0aG+07Dh3NZDMKGJoSjxGSQgXiEaLAFqURw/cubkl
	RlZ+AiK1AIiAf98g2xMb/9o2L5LqLet2RvyT6lycpACTiCnftg6rNC+SKxGA5TIq
	Xplk4z/PXZN5JoKHuua4d5tHtUXrbmma70H+bF9YL+3Ndyxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njudt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b244ef3ed4so430885a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178819; x=1764783619; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=;
        b=EI/E2ePdnBOpyC2q873xNAQdVH+ixVJb29v+Nj43tEfySkQ2h0rpQFNvd7P0CKWt/N
         oXTOqEpPoTD+CtF5CSgBjm5HIWRsTV+IAD3fZtQA8/U5PLUPPZGCO7K4CSwFs2+1DAOq
         x0uzXLKZpI5HNrOJmtcCXXM/qHIP7y2nbUakCBF2fu2xgCHEcV7eti1rTz5jFYLfdfht
         77zvuUOKSc+nRwC2o/4Iu0yyxm3LOD2/NL8nOZJgqSGdG5ZYyYUPIYdHNBiQ5+Yj4qfg
         E9bFGKJp+8kR713SkSJDeoOGGFA10JUgN0Q+jmJFs8ClyYTrJI0rM34/eRN4i7eWG3Nz
         AOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178819; x=1764783619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=;
        b=DLTaL0aFu6K9N/KHQYsYyObZmmW2eRmK0tA7a+NVcdIVBc7V2Vh325baYyWcN7lzj2
         nOOzU7ThG/Iji+uSpaq2inaE4tqSyGRiSKjXW4JkMxwUhwByfMBY14t+Ms6ObQRSTO2x
         rkb7zZx29KZXm7i4/AZdRGq9vCF3+Q/skIFFJBubk3m9PfE7wnbpNE406p2UEFu4k3kz
         qspobkMMT6UllypzGF24SOjuYAy5h7opKGBxDFDSpehH35xSuNlj5bWEHee5OTaNgvzf
         vG8FudBjJkt5c2R3mKYnb46Sg5vUOHKHlBGoQkMW3ERu52GYOaMYW3tdZAztsHOg/QKV
         /kTg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3k6tRBPAbknUM9dfHBPybST1FsM8jYq2ZTWqSPVFYkcco5iEHewhGhntHD3HvsCbwZEwZvmoycTEMWcotQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZZdu2mOoizCF6MTZ3/h/CwP8NLVZMxeA/fZKjPDNxw4tTD2CF
	VX99Ttbo0LZapk8k+EyQTaXWz5+K/1wFsX48HnMcQfs2+yeo48D5fV5zAisaw8WcrId6C2DrsUV
	qq16Y84EMjUubD3BzX2tODGYNzzHDzomwqd81tVz61AuZiQSIhQKjWj6UHkwESGsNIpH1Dcscia
	Q=
X-Gm-Gg: ASbGncvzeS4C8GUbrxEOkuvxMo1n7A3WnEcW7NWUq/k/T1nj0sG5VnRPMlIjQgCmGVt
	8EXqAeO4/6odJHzxJmVUIRIPG2qkp6p0oz4ttX61N759SIU4BOwaYpMp+sLTTS21qzryTgrlEzT
	M3XE5/prpTTTKKX3U8AunCGWGEkA/EMpQfi4FR70HwCvX/vLzGRwK3dh9W8MsJ2ksc/HnMLAqwF
	wimjNf4UR+xt4I8GWypkqAK7remYh04pzyub1WamaifSZzogLAKIxxGmpbstv5a3DVMGNytp9Dz
	cNXPteoOnHcbi9nfO4YW6B+MUUyFhCOpXVJnbFqXcUbDTeIkJrXpBvqVHjgax+ANcghytXb31/b
	p8Qg+k6TYyoHNx9fhx4sWkueu1t/k0QpGNQ==
X-Received: by 2002:a05:620a:444b:b0:893:b99:711a with SMTP id af79cd13be357-8b33d1ee4ffmr2610289685a.19.1764178819451;
        Wed, 26 Nov 2025 09:40:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdUlT1+ot87WedYm/WP1Oj+nm2wC2UhUR9096vkFJB9K/7pV51iXl7gTIFt6VQQYJU9OozA==
X-Received: by 2002:a05:620a:444b:b0:893:b99:711a with SMTP id af79cd13be357-8b33d1ee4ffmr2610284885a.19.1764178818974;
        Wed, 26 Nov 2025 09:40:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] regulator: Use container_of_const() when all types
 are const
Date: Wed, 26 Nov 2025 18:40:04 +0100
Message-Id: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ7J2kC/42NQQqDMBBFryKz7kiSxipd9R7FRRpHHdDEJiot4
 t0bPUE3H97n8/4GkQJThHu2QaCVI3uXQF0ysL1xHSE3iUEJVUipbmi9mw07CujbA+KMgbplMLM
 PqAQpLawuXmUFSTEFavlz6p914p5jmn3Pt1Ue7Z/iVaJAIrLXspJaN/rhY8zfixmsH8c8BdT7v
 v8AIRuGjM8AAAA=
X-Change-ID: 20251126-container-of-const-regulator-20e240c45b78
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6DKEtQtDLJJQwsMG0FyYufP9LkF0morViykioS/EE5Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt5v1j1dKWdNgdHT55iyox07jOOS68HcIRhW
 7B/0lBsblKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7eQAKCRDBN2bmhouD
 1403EACKq2Mwl6E/+tWaSR1Waj9G0BRQNG4tZPiXH/xW6V37CI1hItFhBPgS7JOLlfQmKvNDSUn
 x0VFPLuxHCOXT6zsXy1yWd90EJLYT3GfxImE6mZaGyA7xMffKOTKZbTC/iuTKi08K3ztT35DNhv
 yTFhTjIcH6AWic/wIdtRog1On9Qd4Ln6yfX3oihlfAWnGEC3ouPzRpvislZcOdYjhSGoUq741P1
 DiBKFy6YUnMOygJMNwap2+HmmruhVcG2ynjEDZWmD2Wpe8K/Agnlg43CoODuNOGHWvPnjGqc/eo
 upZ0zyNJNMsqm8hZOxILpixlyobCv8Khnr1iAkhrKYDb8u/TITwziN6xXyjBPrl0J+BaP95A0+K
 2yILPHP9kpTtWfCBtMzdTfBl+KaEry7J4qpSjcSgNv5aIdMLIysmaW9K2MuAuORO9GiJ+bNFevB
 6uwLDk5r+UCjO3b3PrOI4oGRO2a+X8Qxh1uWpo+wLGb7F2cAOLbYR12ehVxU6n9Ioc+mKhs3Zl6
 hrw7fg0MrZCK/ZcONldLLZ6gHY89IDvX73l6eDE0ewVF2c9vrh4SLO0x5L527g495hJA2/xHjx5
 1oWAVRQ+p3nUk1+K95Xw/roitwp+3lXc4cGNxsvbctMotMw+aS19zk6tgP9ylMpuJL0q4beABGI
 DRgd8q7pP2VLBVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69273b84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=_fikr7E7o0wGUBXK8CcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: lPvmc2Vz9xjBso47HYPCk3QDhcdEnh26
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX8zPJBSdXdokd
 m1I9mnw2UvXwj0zL7POoLrSHaDL4LqtwcismYe0UOerre/bbO8e0OgrjMFAclYSRD1/D8X+8xi5
 Dgwo4U1NNbhxUApZZCuS9c3aTz8IGINHsZfztitq9PAleGyymGtKTXUheB4S4s0kvqOBgpbK9Xy
 lROIY0iRVtz00mUjFAD3vQEZVESBBe+jk4UWZ7N472aevaAd+clDmMRkeFVzT+ItRKoS0B+SueW
 3QdCUDv20qz8+6gG09iVhcXHiwecuCqiyo4/fQDaBl4FBiwzvGd2AVN2iHrHk58T8JXGhlUS0f6
 YpDbRt0Me7ZfBzuEnkY6y72EgsMEHJScQ1qtAjm5pG6aKbAUIewKq+eSW/y7GjCFereSXW/msMA
 xphe0UURz7y6Lu0pgCzLXH+xjWFYBw==
X-Proofpoint-ORIG-GUID: lPvmc2Vz9xjBso47HYPCk3QDhcdEnh26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094020_998062_008588A3 
X-CRM114-Status: GOOD (  12.66  )
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

Changes in v2:
- Rebase on regulator/for-next, which does not have pf1550-regulator.c
  so drop this part.
- Link to v1: https://patch.msgid.link/20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Some drivers already have const everywhere, so container_of_const can be
directly used. In few other drivers, the final pointer can be constified
that way.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      regulator: Use container_of_const() when all types are const
      regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct
      regulator: mt6358: Constify pointers to 'regulator_desc' wrap struct
      regulator: pca9450: Constify pointers to 'regulator_desc' wrap struct
      regulator: pf9453: Constify pointers to 'regulator_desc' wrap struct

 drivers/regulator/bd71815-regulator.c    |  8 ++++----
 drivers/regulator/bd71828-regulator.c    |  4 ++--
 drivers/regulator/bd718x7-regulator.c    |  4 ++--
 drivers/regulator/bd96801-regulator.c    | 10 +++++-----
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 drivers/regulator/mt6358-regulator.c     |  2 +-
 drivers/regulator/pca9450-regulator.c    |  8 ++++----
 drivers/regulator/pf9453-regulator.c     |  4 +++-
 12 files changed, 37 insertions(+), 35 deletions(-)
---
base-commit: 35ed371beec9dbd889bf2ff2afd6cb549aa32805
change-id: 20251126-container-of-const-regulator-20e240c45b78

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


