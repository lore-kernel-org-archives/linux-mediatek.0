Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CF9C43458
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=f74hLMZ+uvAMIdJn8BGjx03oiX
	Myi63ubPhTiBnDdJXb6IwDJjMfhC5bINg4iSWg0b7cBpREtQ9xPNtaGYDE83SqFHOn+7So5TvXsvd
	AsGpMJVlEOwuJPn5ZmYpajnaHYLzVqU/+Mt9tU1xF84ucwFTHp9+RnfdR4IXL5mzFgeyK6yS7dFx0
	1Yf/EXwd26APc2TlQ+N9StG7LgyKKISyLvRBqF2y7QNYUdZrF5kf6RwFJtN1DpHJ2aImkdlmZo33y
	Wtl3B6/zBJu1CAXsN/ARSfXsnu/sejLUNUuDJt9TOu3LQglmsNK66eV56aXQ3zvfxR8t+MJH9vAsL
	14ueMSDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiK-00000009dv2-2Lkj;
	Sun, 05 Jul 2026 19:41:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiH-00000009dr3-01qV
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hk4l82204183
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek76g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489678a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=KCk1MwWsmTdvqnnoRdoKAuqFz8DVvkUNRJufekb0Iha4SS77yR60HM/WXHILM41jLe
         5XOQUX9fxxxiyHqEPKRUv/M7rUNRHKqKvRML2zaIq6TyfS9ag7ZJ5SCWhqW+ZwKJ2KdF
         2ldBKpO15jGhGOSWu/2CCnxyhBJx8QuCHTNtSVzHl4KCwHJjzztgq3ciIiGdDMBsML3N
         bcXAhZmpVDlf2abhF5NmAMMuoXVr5rzLN6lr44y5b14UKuKKuYYm8a+y7FGwvYO7c1ht
         9ZM/iHYDRVz4h4bNU6T13wgDHwo5JS9wKJ+SGmaE7UvPeakHQzZJRrPfNJsk9nNUiHbs
         3Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=V7bzgLFClWJWfW77HLpvcNpXbeFgsLxEgV/GdNB+TZPND+zeLZ527fYLOBHZJ6CZJ1
         wtuCMGwYa6Lxw8+pU3n0t2/Dr9ELaWD8BqGTkxnmkV5OgnkOtO605gLuhdFe0/K5kyYg
         psUM5bKzdh6hdHxKWA2fe9MkN1df6BpkuJMHHzpSQW/RCy+49e7VWKUe1GE4+bnquCyy
         rSWda4n7YQX2WlPiaEDxiQq583B6ce2oITlVRjAMxhK56/tnl4Oh1u01Am+HJcw659U5
         /u49Z2piUOVVt/SsUWtawbJypxDn8YphxqeUdwch4bJhWx8VRBpJdnMNv1hugoWcfn4J
         /Ifg==
X-Forwarded-Encrypted: i=1; AHgh+RqpyudT6caDV2BbXVB5dZvXhR9UO+u8NhmtdsYFUleYkHJTZqhwxOkIz1b0imPog6kz1PVKngceKkEKgg/WGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdGDz3IdAuG4F6KUJg3i/3e0lWWAmxOBjRZZFU5zsm9lSZmeBV
	EiJfX3zuShvoOOODFyjFXxoUYsYzjay8tdR2Q3xLIrAXj3HMRJ5U07C/JCrxnHGQv1G6cRQUv3o
	Z1H7kfFa54tclR86yavP7qr75UsQDsmPYsJ2EI20SJVHI9Nu2gWetiJTyEy5aKQ2klhs9pyTylH
	o=
X-Gm-Gg: AfdE7cncP4X8/emJyfzC/y1o0c0veHu8TNMbFDeanXfmfmbYHCCZguHsUaQLx8fZxoE
	cf7A9hqaZW0JfIwFDDNr84jFfXSql94MetCHBBDi5okQMm9U191AsV/IpKWISk94ZeTr2U0rDnM
	KN+7SD7kliu2lPQTNbCMEQhsXKEEBa5NsOUd0KeoyQ1TRaxsT2E7z8l50TZjWCPWTj5ob2IW4Pn
	vg1WigWhziOQ7hWsgU7TNYybqaR8skol/ZBsEmkTJJlUAv5F89EB+xZ9ByReEFHR+dGrt6jt+BP
	5UL/VSjwhdLfSQF6+dS0sPuKl+Afi3wXL+jEt9tO9InQYPDp2WmwlBWefIK0ljWnsgOggthzFTD
	Y5gZhBQqHkELbecPd0c7Ip0ogb7PX/VqoJ5ZSYA==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605442637.10.1783280471647;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
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
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXziynAwtu/Ol4
 +YYoxLms23LwQS5vkXhcQgXZJaHo1+8g+jAK0kD3RMO/xKJLFVNIULIR5ZxQUtLCXvJHkSmMxzB
 GqTgpr+bVW+YDL+MuP7Tkjdil4MiJns=
X-Proofpoint-GUID: WZZyDSfP8RfpUxg_0zFhAFGXp1Q6vyQI
X-Proofpoint-ORIG-GUID: WZZyDSfP8RfpUxg_0zFhAFGXp1Q6vyQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX4XypHUb4LOLA
 0S0UEnY/WScl8f76SylFDN/TZUs2GHU0HOhVwl0apBBd2DdKC2DcTVeRpEoSXAcwKZZIaglpey8
 gMyvj0hxpj8zJVY+JVtTXs9dgUlUVzntY9xGyMV4DSC23P3GDUjgx7j4rZFNKwIA103vC5oJZJs
 nI9Wa3nl51ZGOMNKOHffDxdTbll3RwNJNXaISwKl5WgGzQYPUJOuFXtV55EcMvl+LJ1C18fvBc5
 8LkD5ioPKb4Izrc18k/krxYgOvanwNB28HSQHJYfpOEZMeNbumXu6I03S/asgq4sQo4KAgoqhKP
 5CWCAKJrXoTfNRapgYjbypqVcE8pPNHYoRj6+iiQl79vg2r2kpJxvMf7Whn8oHXwR6sqaJI5BP/
 vgA8qv2y8VaWx1ObkVPWcRwz0YQrET2RYR6yyHnyC10vJ3yCauT0AuIZzVZqdWJccHNcWBF8LUI
 +QKXkJg1pjJETtXLcuA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124113_056071_EA8CC7AE 
X-CRM114-Status: GOOD (  13.39  )
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
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0


