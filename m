Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5C4C44501
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=qgUGNK3tSwx38KLysH5T9wVSar
	NuRAThLHuNby31YLbnS8NoDmbUrLk0CXccmNf5443rQKbfBJtHp2vvnNRGqwYwYwvbxwK3cezuhJF
	/RDWdTNP3rVn3OoaoKZ1OBVhYxy6dTRUlGLD1fbc1pvPu5XYbUKjF09vwMxt9npGokZsb46SZ+r6h
	Kh4ykFOmJ2kKwpq7PK8VJAfSUSm4HczOHOLrUVmS+vsvTZv+ESp8+cWFF+/4l505OHTI5GYCcou7P
	aJgmV/nWcpWCAIl9yKYhnckHTl0TFte4l8Rheq9uonk1NFlIqi+v6UVw8DVXWRxvCcT+jyDGbd8tb
	PZK8vOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSid-00000009eIP-3DS3;
	Sun, 05 Jul 2026 19:41:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSia-00000009eEN-0EXC
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhbSt2324480
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=LEH8gBGqre98aZ5S
	R+gXIdM13wWVBKCaHBPzQIy3YO16XtaM2Yeu1rWWcKE8Ahh7phGi5PdgSe6faHYh
	NZ6WuJayU3dm2BjN9bw+VBE+ZM79Gb5/VMy0wrJmVG9PAL4oi/vWr8CCwZvut6LG
	bgx8kYmZdMLIw+hO7G1imKVsWOK46Uaj/pGQFCjPL0CK5llMYjmxUaWFjupRdJAp
	DojiJvRtFxtp1fbC0Y51KdHDxd4iTgLcudGv/2y9joceF7NK21EqPuFhp9vBp/DG
	Mr1h6o1uwl/xqAgXXnlbwqyx/z4fTFXUP1+eeaAFH0RCQyOQiLqKrFrdvXcDdzoo
	l70Dvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:41:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88d7a75507so3701891a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280491; x=1783885291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=kqRF9TElYXkvc/cPcAvQNe4XSBo8MalNXifwPqS9HEjFn4VMscbPeU69+uAT3PHItp
         Ny16l5Z/50r5o3w3y6vv202Vhs+6t5SfQZ/CEEweIUHU49FBvKSpyq9MHcuUE7mLQpts
         HpR5XIw64+3/hAOYskCzeQ7FnpTwbAu47zHl1fr/C968Vx1ssMBQU/K02+2zTHq2iaN7
         FFu+Q5ekKK491/hcuMTw/Tw0NT/Qz5BMg9E5kDULyrPLMzKFxTSRxRZrMNhs9NRv45B1
         o5Vyh/UUVj6CE4dgZmA8/98Kapm2yKnMaChQcDmgxe9iXfZ363FyJYyL0qF9uOwUMjbR
         sqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280491; x=1783885291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=FFv3fHi6Wlfe/As/RxwbfMudj3242b1DGGEn8VbQAr1g6oOjefzq4VNpopEGxEUKUo
         NToMjVUKccMq/xpVOJHW5ITSS3oQoGd1qcJwykxZ0kbqOF7+bwHml6ol/bHBCTxDgeeb
         kBTvzJkvxy3wrAHy6P7a8jyOmhAG3BPos3RGkxcO0oeytbSV7t9fgwBQk8KU+LMZcnSI
         yfcfq02MVP0yVuzvWhg6UhVIxZwuRbKnkGnKYi8DgFv7tVcxFd2Hi1GbrQZTxD2EG7ca
         BDm/DXTMHYFO8auA0y/eGAaqFxVPYNCVkRK4tZX3FvgVK/fYJdhRnzEcQCw935fVKLuc
         0qNg==
X-Forwarded-Encrypted: i=1; AHgh+RpUx6LcDpLbptVJQqG8ocCdXLE5XuzZnUREZpu7cPH3iFJkFSXSlKyT/GsX15oBLp32EWoIfGPpYaj3MPjBZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpp9RHpCESbN5LwZtOfKyAK7VPvVIMdc9LEM7GzSzWyEerIh6G
	kDf/WTxFLthKguOGOk5fGxAB5QP/pcQBjQQUUZS2gE8r9BpzAJ/Yu4WoNCIUSUJYxsX0MYBgMYL
	tRiO8fEvvRzaSJvZOxhiqZGOigWw4pDrLcFV6vrbtCkfdDezNSufzKk74amZIICAmFcgGUdvgEd
	s=
X-Gm-Gg: AfdE7ckcrw25JtmWxCCYKMebglSkYR5oP4Ki2Tzl0LxWT0SR3p7NDFBm3Jqflb0cbp+
	Jnpts78nCH89syRnHkJzbJ5HlIGlvhBqQBr8+gb8KypDkJF+yPBWxB92YEhZ0sOvKPg1h+jvIRq
	ObCpxqZ2F5nDCEy/9mwH9pa+DKx32XtAZ4V9K+3XZutayKeC6tbkYqis62F5VY+KnrdwxfO7IcL
	C+4B0mENWyZpE2wBtyIC52yerCoanUIF17X2t0xinw9FTK2yCjEkzdz+0ZxICkARnnwa2apUX4m
	hyV0yPSNUALj5xtfx/uBsEHWPLGPiWbzcswKfXIxzTSN3ngnhpJpJiWgs3vb+mQbfnnUDQYe1FC
	+d2H0hFJHeMv9bpPvDSAVDbZa7pGXE8SLyxBaZQ==
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554469637.47.1783280490840;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554455637.47.1783280490326;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 42/42] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:18 +0530
Message-ID: <20260705194019.2565498-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab36b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: l6QvWSiZ64aJ6jf-ywKfzqLsUa8fv4Ew
X-Proofpoint-GUID: l6QvWSiZ64aJ6jf-ywKfzqLsUa8fv4Ew
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9jfZ3hrt2Vpz
 MXJDZj3rQ060d2s8PppXg4o9TBjE7b3rQQg82kWYLFFEipbhk4V8DWJ85ARGTssesZt6FU9SwWB
 09a4JbvbY1HYbbFfIFa/aGO3Pcon4Mo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1P10WGsvkJ4Y
 62PU1vZAX/SP2chPPBRAE0EAPsnWtjcDpnb3O9kyEq9wWKZ0Cl0eIlW/8KYI0K501UCZGrhAKhC
 0UtmBU4RF3/esfe8j7KZ5t0xFJv3wz/DgiqTOJifX5s88JDXjFTbILvasrsXGjS7XONfi4ImLK5
 i249+UzRHCErvH3nk1SHN/g0n5uXOl2SCBVuqLpGn2q42RAWUemtsce4qL0CKaXzSiO/Q2sdivJ
 WWQbBaGTnuW6QZBmaELd/OCEMkaNouPWRynOXL8cEINMJW7BgIvkntfzSiiyFmznAyoM4+QN9KJ
 3l9fN40NZSkRdWwqVxlfi7V2EG95g/vu9jYu+tH7VYFg+vNfFoYWkGnrYtsQkVnqq4KAHCIxxh0
 PkKRaGFjpFkX/5Q2lst6ffVAjBEY1bzpqkqZ6F3iEEB583EgFdvWDpn22lvGPfRYSLyY4BPvFh8
 HQypgDHbT5RSkOZ/JPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124132_131337_902E3790 
X-CRM114-Status: GOOD (  14.33  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..220f55d475af 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.53.0


