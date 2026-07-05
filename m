Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB48C44500
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=OEAPOdZk44Wm/HY+HhFdcDYefV
	Py6TPO7Jd0bUIQTNSqpg0Jv6MvrwoNJo+m3DnlWVgZj4mOwE+sGO6JbUWbWork5o4fxIBfupL4z4S
	yoRZPKnT3JRzg9QJt8H5m2BFDEKSCFlcJSPDLLvVLLThApo6LQ2g4CzlLfh1DpvvzI7ovgbYRi9gw
	K9E+cEf/jZYs9Eo8ITWluCkEe244L8p3OMeWUy1LY5HQ7QZIq30ls4HQQrr10KlIcLQxwwTTYUpam
	FZE/cqKMreIs8s8nNkn8RZYUmJngMYKkkGj8yrtmfkBTEtYkdvFQPOpYio7hSf8BWkT2f5ccKGYPN
	BZRS35qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSho-00000009dVu-0gAx;
	Sun, 05 Jul 2026 19:40:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShl-00000009dUg-31Aj
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IeDQ12386252
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so3305758a91.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=O/ldWzOMRC66c/0+OX538drFQswmPZpHVlQ8HEb81RHsXfyBulMgz2j6G4oyIIoeO9
         AYEnp/t5AG8NlD5MCnKrTY1xWTNo2lQrIeMbNs9kZzfGIoMLn69f9D/MEEhsyknmZklh
         0mgtfiwUcxwK9nbrPIMHxb/m0o9U3TANw5EeP0UwmfrzICN3RT90TCxqvWRYYs/tSIo5
         GOoLuoX+sNdlW5knBfQCqRgloT1yRH/N6b3UCaUzpfFAHpyzzrjtJ8bzDVOV+DMS1PTU
         bDmNxgxIiJj+hHDMNgjSI/k4MJINU+IQgERDb/obn09L/A3Na+iwXwDFrIktz7RdsEML
         UGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=Qug9EATtMpBjqrMobkSqjQbKVW+dvLx46toxtS5iSB7zhX1dkm65h8wzd1ftPQOubL
         CwpDkgtkVLohefiwBcdn3N0xTPTrMQZ33hCfTiijuZuRQR2yuvnolf+TUWH7oBUO7hXm
         717egGvp/WMu4L2Dy/mCo/zwumFVXf4Q5F/0XGFCYz0kvg/NjgpaNhreqaAWl1KmpOJM
         DV0mgRzkqWYMji3WbJ3gAnUNf53q5zUiDNG/9MJw9xOxBSzkV3I9bROtkxVbcVyUnGeo
         a8JkoebGVJbDEE3eA6mDZiOvamA82y4a1Pp6Leryy4s/28pyGcIl0Dm6U8J21GXlXX4o
         VdaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpx6thsCw8mAUbF0RxhqvqPEh6t61QRVxlbhZHqTFpQRRuuUqkUEIbRwZJPCwjjj5RFk/nb6GzKg//dCwvqdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDPzhMNoDBHY0fVfP1ne+xU8xn3xJAXoPxW7Ie7DLLNfMMaI1F
	Y8T7Qcu6lycze02B3vGPuHfXyUfToOMrV8TsBrSmK6gBJL4qPcQciGLbBdpovekwVKiAT+/eM2A
	sUM4h/S9t1FRd0XOZn0CBKzv4MrWBD5hH1w3CEkxibLRj/DRDgcvPy1kWUlxN12LRHpiIU5H6c6
	4=
X-Gm-Gg: AfdE7cl6gb6XwQJ6FyeSIRu36dg/JBx9GKSGJIUJs55BExJjrscZb5hRTqfshclX+O/
	+Umed0EMUu4rkcmoo8DcP8aRDHNkf36RHR61/VnD+AkQlMiezi/iMFb2qTUxtyzn7nERP0oARpX
	H4EGikKdCL2ThJ5pq62PaSsaOI7EoLDWn5Vu+LCT0AZy0Gf2PXbYxiU+q3atp5x6lgQua7cl1h7
	guIAi805IvRNIOldhDZ6mQSCRrIeHx23i82DmMQovYyDBa7Pz+ZMc9tICPLtWoYGeb2ygXvmW28
	ISq59Wrprivw9hGc6mypLACVlx7h56NXTHc94fso6b72CMu6EkCtDoicqEGNFLVnOtX2e4EZ2cq
	2g6hLFw6ruDAAJCi1iQei/CnDpbBTrQfD+NjI9w==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872225ad.17.1783280439588;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
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
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8+eXshp5pSLm
 IReWwblE+VhKu/9Uj5q+Vr9zHV+b1OFr2pqsrfLg8wPMHcjurjFp49CP53i8Sq2A0OqBOH0hHC7
 ImpmGQqvYZwPGRAbgV/4wSPkxZK0eVI=
X-Proofpoint-ORIG-GUID: dYo06dnxDz5Brh6rIrD4poCC_Lcc4mgR
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX0NuewE1k/OkC
 HzuWMj3yTW7T5iAbLDJXzVrIjEWqFz1DX8LPj4rUz0j7p52WyCzxUK6tVF3hPaQdMfQ0BERuTjR
 WL3Wp//aCUox20kU1YO/rXrUJYivy4Sv0lPU0rR5RNdKsaQRrcINQDNoQBg55uHG4HZP59lMiY6
 7K80nv+F3J7mdF13K9Z1gdJX+KFVmgMsQLlsmVonE9YZyLjIKj9JeRZ2rUJpvboPs31NcBIMKMo
 4HhagU398YeGvh8KlipW+XHSAyOZ7a37ZenoRZxUctZFitYrPjEV0e6kR1pSeoYG2LjdzUkA/F5
 wZUNh4BN96U8tzg4w+2zDtqW2OXuPS93IjHHAp77cAH41HvqvMpqfTT7p2FlisAbpG7aw71VLIS
 WjfsVqENyxvIPtFj+gkv25Amk0gn8aD34G8uBQ1gFLaSS0Cmdewnnx448OlBh2B/IlLP2iMYtKT
 vwCYUkyTVdyvgHCFhPw==
X-Proofpoint-GUID: dYo06dnxDz5Brh6rIrD4poCC_Lcc4mgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124041_877696_9533492B 
X-CRM114-Status: GOOD (  14.08  )
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
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


