Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE883C44501
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=wgMGtrQWjr4Fcpy8agy1IVLIaP
	7zEhAsusJXNtw2u5ObCpjGFZe5h2bZTuVvTmjBlx4D1AfZ6Cq+dBzdrL3TlnEZyi+Z7UPyTFPdMPn
	ylZ2EbioxgI2lYBz7l9nODPGUSGDmxZeRCa2XIApbvFGa1EImbLy/vVluJejbbPf275DeJPkuSomS
	EuuBx7Mo27E9gHfxcX/ktrw9fOtrLjprfpcFkdZ4FUuukkDLCpQLvauaUc5bRKBWUr2X46KNxtVjg
	zYGmIWGUBGprwSkwyWuZALi+U+SkB36Ndq41faqrUgylKdANJjzf0AOyzc75GapNvAaVQ9Ll/muX9
	JnT/lMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSi1-00000009ddt-2TI6;
	Sun, 05 Jul 2026 19:40:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShy-00000009db4-1sfh
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiKXb2315417
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489410a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=THzFIBIQBuMIft4RxveLAFycoZy5O6o1gwkHU+yKPp6CTMPB9M9rNo69vFq+F6hquY
         UJqZPGSE1lgZ9iC8AEhgTNyI/BK/pKiq+MJR5SEY/ad/97W7+1wyiihu47DG69gciOzT
         bQiG3aqPRg9vLd+SYsrlnLP6dNnB/pGBqYnygxD8mtINSHgF//owzNgchfUBOq6Abn7M
         zta3gZYsJy4D/Nu6wm9iy4euGyiHk90EHW7mPFezsZ3houRqL9w/b4jUkoTuWksdvYJx
         Sz/HGQ8zWfJMxDrSw6WE0oaS5UL1Xkls6t08nMRns+7QJtZIgz3lvVkS071IOVODZQsD
         eY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=lvMnlnv887z+81g+Aijl6Azsg1ckYHGn0HnQJqpseh7jVHEECUk4yoAbCQFZzJsz88
         6Ew4bjoziIWtd76WNsZRyejTm5jE2Fm7ZQy62s/Nv0Alm46U1CsLs92S1HYDmmUqQlbx
         dG/UVJy9EketY2OlhVHMrtK7AmML/Ro7vVrBLtNaVSsB89qR9lAL22hQsqA7Yfcwmyma
         4QJDKJd7Kda5q4dGRDFsqJpBX3Cu7PYacGKSOm5GLsMyfiM45tF8e8Z0rG4AtfKizHU0
         z0hBIVkC2cOp34Jqh1GytQgUwfrjLvT9c587Aq2iOuY4H8Gwe+/9MEiXwCLEz+XwgZIK
         VTuw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu8qO9SHsRCmR5JLXtsqTAtVCHGtsfeL0gbpRjnC1QoDPo7NculkIN6QKvU9CtiZB+RXFD3AD9vamk1E8bEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWX9UOY5afeG9NGseIl1WSm9SNePrT1Ne12m1KiA+2Ey/qQYXI
	xf08MqqviXmlB6ldQzu108JhaKscbJjWB2jTe1Rs4z0DQryGB3wWxhPwPK2vqB8CVFBxWcGplMg
	6V0k6ZLUlz84cZ84VzoGaTGCPphWJv9ud5eQb59KG45Io4nn0Y1QlbvrBC9MNg/f4YHe1IMgLiM
	Y=
X-Gm-Gg: AfdE7ck4XFJuQ4IvcyouS2+w40bi5u7gW0mJ+uR8fjPUIdEDINXEjEV1ZqrMb63YTIx
	lvrvEji9gqDf361/W/nPRf/v4ONByRDAzBUpeq0J9PdBOtsQ9XcE6wAvyEVoEcyX3m9Riv+IgKJ
	/4oTpWCJs2cs3MtSC1pWAImBfLd64GXFwQHt/GBZf6c6DEmf8Wc4xlRvTz61hrCby5tPqpl0dEg
	qIBf6LkHe1s+DIuSmjcyG0p3JLqEOOTCvtnYOsp5pSfNenicOX1zs3cjgBws+/fzuQad6cSg6J+
	35gfx3w1ioflq0hGHFTL2CZ/6YQweXTq+xM1/I24e9sWsZshWCA4+2LGePJT306Aqpvkq68Eyen
	Mf218xYuezjR8nOiSuBC9cRZ7PO3B6c5X8DiZ5g==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386821637.37.1783280452360;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
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
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xAzfV34e_6eVAK8QsmQBb4Y4LMFg8H1P
X-Proofpoint-GUID: xAzfV34e_6eVAK8QsmQBb4Y4LMFg8H1P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3UVBvXgrJkfP
 BAElREO16t0kRGD1/jjPF2rAfs0Jk8xTfND64sEmUSnpBaXfJJqwm+ZkvPCGtphwcyvH2fQY9pq
 yKWSg9y63MzRixeh2eiEMOqOllmiCgI=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX27nCEV/Eiuyd
 yWjYjOTlW6OA2Pg416qonFDENPlPr43gb9kW6axsNAcUIkXCg9UgZVu1LypUAUVBJEdk7GfLtOw
 pDdGpqOV0LAH7zQUNLlvA5Z+8nM+Z3ff0LDLijTxDtO99HPn5JmsgCjiNnQ7mUxpEDoQVkR4vXK
 KYhGEquLUGCdYeF0CWZBamPaXpnZXt4iVjONxoQpFRjrLgNACX888qitQU5vSY0NBeMAXHXCOyX
 e5ti3Qd44mzVx/b4y+b8cxucfDI1bYaEeVz/IeE9IDtj7EuC3lJEx6xFjAvjQcIvcTPJotkd/J7
 QI2rVuqd0RwNZ1nAPAwqmdx4EBAkkmk/0jubvk//ASmc0aWyEV/ceT/mVYX6rYgoJSi+JS2nMNz
 VrZ5yUUDyfcy5nrIbx9G9CNXsQz23qQV7G9imb+n17IGj2TUZAtiaaRSBtDhJkt6FbEF+NWembO
 qiZIzYv2AQSa4k4uGGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124054_610284_AF0FD16E 
X-CRM114-Status: GOOD (  13.05  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0


