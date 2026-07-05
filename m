Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF723C43602
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=2zv/d3NwZRA4RFwXvTTYrS+mTR
	Qx2g6OtPjmEFfZ9VXXTZ4h/NNoymXCc5rP5CLd/yRf0lBsqLGjAS6h+gbi8ZlYaJXtU/c8oGioRLl
	Q141tcc7Ua7IPHx1Ue6t/XCGHePpce81OtsPa3WO9fN01kiXb1N9WsY4gljZuZq+vtof3/50ApUrv
	9ISisIzDAa2Q+aCSh0dfeLgv0yWcEOJL6f1LhAvhMcq3Lwxr6eRX5l0X7nB32rQjjXW8WoI0aNGCe
	Yd/eF2w2ihzOx/YlzVK1m6zh6RIntc9nlncve28WfxrpmefH9udDfyhFKm00k1xbBUAseJa0gM6TJ
	vmEWthaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiX-00000009eAu-0Sd1;
	Sun, 05 Jul 2026 19:41:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiT-00000009e6J-3XSl
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi3bN2201000
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek774-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88da04b719so1526547a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=JFqjEmspQBSs8PHx+rNSmaRDIpZhU0Y0fKuEvExSXMbp3rcuvJX3hwvRhEW+lFCN/P
         wzhdkj1ePb77kBleduNpDN1sSg6GT4uoUJw+K93HZO7neqTM8VjXC9ccxv0aqqgT6wTd
         hWaP8Jg/DoUnKzh1VkmbTi103oV4a99kQrsefhb+OL5ALV/Lb7eBnYMU/JSQVHQ8IGjI
         f9Lc4wMen4FfZLL4kUij/nlOmKJ7pl4WKNud8PuRTHH6CUT0NZj1v44MqarZFKub1Plk
         gju8zFug/Vu51YGjiFGPai9GtVoLMpEam1J01on/WuMH2FuEcAks5/cLVyjGgJVvjGpA
         aWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=kX2rFQh768406/Pb80xsH39uz/vqy6khe+8iMz9qVB0cJQS0cTeHFiFDNXrUezM2JK
         dk8x+ABAbRzZNEFbv/J2BgLdEoARm2DCf8vDq1D+ivXhxxohzpEuL8Rpqts9Sf9jz58g
         2dIxRg2YXJ0O2nhq5sswRtltzSu97fvMhgeNacIxqvWWBcJfqtnllrMVi/GfS3p0ONBu
         mDC2sMwcsgnLSDa56tflqEI58UB2iqbE2wWbfwZCeqKyvkPnYRQ21tuD1K/Dcm4pgWg/
         Nwt75V+Rwct6AQDVrL73QfqaQzCdSQUvZ4vf3X5RwMQpJcomMNDT+7095euYc9QOSVw3
         6ntw==
X-Forwarded-Encrypted: i=1; AHgh+RqecKjj8tujrIAKk2gndYy/TQBJ/z2wd+c1VFmM9c/dJi6AcUxSG/xR9E5WIpXTArN5wiWfd7f70qg2NrCN9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAUWcRf+5iv9BNvQfrTQKnGFZn3V/X2wrm5Vstc9DCnE/EluIk
	Wk/YT9RQHwueDaX5mf+CKpKOvrXOMDTUFvVjAOdcyiwTO6vpBd7JR2o/ZgRxpookwT3i7ehOCH6
	63brSuZmRa1efypB/oYM8P4X7o0PjD4YoRAmMWQu1nv35RR51HlE5tEYU/GBx050wXqUs+0uXrl
	c=
X-Gm-Gg: AfdE7clboWg6YLT5guV7zvGK08G9Y42TtQGEfVFB1PCKPqQGqIS+umWvFSADDkUOAlA
	SBVsks5IfpKd0kGyiyQfzCewpWOIovREyIgOZvaEP9A9BUaWUxw9jKVc9JRr9kP7fN+OZ+bEu2y
	P8aokRwwXqXdgKat6/hUUzVR8mD/xIt4ShWg/Tv0rZpkqvNK87DjZhaBXn3lXaPJTaGu200pnXp
	jhUE47o7qo5VrYl8FzHfpkVnCRIHlmqQopS+tp/NZkM8Bl0J/YRmzetkwzhQqsBBWMck0zx4R4k
	rR1B265iL+d43kIJWwZlpPNrGTBUHnexkO4iTMmsNzKrYZmeZIivIXYUtwbR9bEM+lbVT1n3Zwt
	LFYC68VCR8ZpGrl2BZhtUnhLYwsAKs8kEF7vkSw==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745233637.15.1783280484467;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
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
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX2rZEIVL6z8R9
 sVtruMS3UnAMGxc94eN9itB07GQPm7P5Jw200zgerPwLsgzeUMnQ0/mrRR/436u0bhy51hfEISd
 xuRHx4Qg+HrtanW/CXi9gP2/6jyIY9E=
X-Proofpoint-GUID: vo74fpBbJrN3D7XOUvuUL4sMGDbwTBCk
X-Proofpoint-ORIG-GUID: vo74fpBbJrN3D7XOUvuUL4sMGDbwTBCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzMZB5mNlfLp8
 1J9mVQQrdP/NkLHToNHbJda/MAECdAfslCh0lhRpbfEZlVdF8kpBk9afHnRkKGCi0rQz38Gamc6
 ZAZHmQZoGSr5P3edN4+GEFEvVwiR6kB/gDIMl4tY0XzIekwfY/uMoP0rAPuEoccPFE9BzyD6tDu
 DIHJKrar5KAeDvjVSbMskIzkR4GpAnPFe/7sSCmD+tRfOJIWv1bp4nAs3YCFMbmNOqZscZRUVr2
 J4h/3pDrsH+zEQ2fOuMRfcSW2mRWIdvuwcMdrnw1c4WbQfQu7qxqc0zG+sgvUXsRbPNA4dCPezV
 W/jDooppw/lA3H48tNx0msniS+rMQS7yWlCRN23zXW6LsXKXz8wHm4kAe4C1ARK89G2jIQR051Y
 71M/dh8ioF86o3teWIHD/Pl6euJpMzb4MOZCxFs+AwL6tSQmOrro/n8NSh5xzGs8ZU0s8GL6sVY
 h7tF0+HJpF3HkF5rsLA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124125_918979_4B0C2A4A 
X-CRM114-Status: GOOD (  13.21  )
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

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0


