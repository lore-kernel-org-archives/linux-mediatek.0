Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55301C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=; b=cyWlDf9LA9l/Gn08T/m/FQhkMC
	C6KkStspMT1Ptsd08bm+xr4ocD+xEoiTrZV9pHDyDZPYj/+biaiVFhAymm/OwduDW/fXQfK0xcbsv
	pAC3OQwZ4x1VpT5rmUP+sCYOkzRwPQp/3XSyFFuiHf8uH8IcpZ0LD56f1UGlsKby5KA6XzkaVC+Bt
	LIuRQe6Cqcz31+5MWFXMheqHyaYl1pTUFUPjjU+dsLCfAB3d+psELT1gdblokdfHw5PugcKloHvD4
	/OQIJj4mCBUbcoE7wa78gACHr3aXBAEnax+kFUshZlclvzHF3e5dIXWBJM+nQetY5njSAJVQhwVHb
	wDS6bmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx9-0000000FmxH-1c6D;
	Wed, 02 Sep 2026 19:48:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx6-0000000FmuG-219L
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrFuT2976078
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=; b=iibPWs1oYO8ySV2H
	BvqcsytuLzFuPGHZrCg7Lng8YPrn/x2N89uT5G62qWM7kDo/zwgOFA4nHwbZnxLU
	v+PKwZLJFyV1KFt2eqYlSe187NXUulXrvC3okDckIc1BLyojN1eebK8oltyBWmR+
	Pw6VP9xmDjAMcp4yKnwXNvScT/ZOUHbAhnKzFFbJ74ebZ0+LO0bYgP284LA4VEGn
	Wr7962Scslr+O5Xe4X06r2jVjqJ+k/VzakffHMehG54l3VOLHTe+TIskcyXkeoXz
	YAFzGVOx0+6Rd/oPJRfT1iajV69lqNM9x6qTvGyf0ISlaqmaz83QIB5tvjkerm8x
	dZpwaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8n3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so14861255ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378535; x=1788983335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=DS+J4ZfHLjJ59WeEJHjhv2ybJ5AIXM5oVqNQD8NkUl06L2rWRxXI23lRDtn4v5u+Mx
         zw5cybIdetBvzvOnbUZ7f5Z/KG55D+iUTQ345akJ+LEkCL2CdEAPquMcaEs/THIXmoYz
         MlQ2g3WDpqTDMN11MOOUGrpDFyNswn4Q8qZiicGjYqzx6mvg0CfR2OkTxgMAohClhfKn
         VtdE2mJ6VlSiAjk3FnHPM+s1nOD6URyEm+6nvE84GFLjrJlX0+R2q5LZ7FzumYbHB4Mk
         wnZfJnM+BbV81GYBmp1nIO3jBitHv57h7KJ4zlujPbp+9hCpSp8PfURVLyI7Kgr++0y5
         WPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378535; x=1788983335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=F6zK9ffv7vaYN++YcX29SKk5RHi1sKMJsXaJz4JvSFUqykMcMx1No4WvuXnKv0RzWf
         EOC62bq+BNYDpOhVWlJOTb29sJCN72mYmfQTeABs/AlsNlm84R3tD2fr9ufAwEmZ0ugf
         p+sTrBef6Ov4yNsoXPgCmgNH+O7RUexQAKY1nZpH3E7sB3d04VHe4Lce3quLm1i8zqWw
         QmYlMFv2ssIept/pfF4bewUo8ta9PlTFqdZhGcnsUfov8zXPQscQOJXzd8Wj2/i5cO2r
         wg+KLdgyHwWUrwzhvM9Ba/ON3V91AKE1Kzb8dBot69d0Z9/q0q7cm1hbiVEZv2O1xZKU
         JgIg==
X-Forwarded-Encrypted: i=1; AKwUvBzDWEjsdkItfbbD5EVyatM19fcL64EqoC4cIZsJM25lXWYCCBtGIHoUZEFFrG+QIN7GrCeSSZhqB2Bic9tQGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nrXVml/UM9w9gSxw3W001oDo1c2Bjf8EYLC5NlmG8/vLg136TV
	f99Wr99gicEXhnBS/5K6KYxjUGKcP6tmnac91ft31M1VQDC/KoD0Dni99edlJuZe24ho8uFDaIS
	7yqOpP3iYeBBSaKbkxo7oz+tOAdWyXW6rL1gfP6e8nq35tC4dMQIfs/iqwxLjxwaVN9/Kq7XVqC
	0=
X-Gm-Gg: AYBFou08u20DZ80zJx0/za8KdmDg83I3BRa96ZbANwkiquRfa8jOs57gqBJqnl+qzx1
	ySJjylflQcfkgjBSt5s5onxJm7ntqiyspRguPovUDFaOJtzIZddX3EiIQ4mVcQ/AMwuDOErJ7Xr
	uCxIcTtB7c+aLWiDrNkwBWsLB9JKQg55iDEx2m3k2dxXxWlTB3sdYAddmP5ZzX2cdjlvOQJ3YSr
	BFDhVTOPJ0oeTUUyRWevyY5c+wjajVG8SUGc8nnNKtBo8fq73i6dB5trCYYnJzQZPndVL4ndeRv
	91H80a70/jp6tcGnbS4+tzvz1lyAWM9/4L6Ee4Qp+VRzG/970O9caYslTtNSR2bLubUsh6o7Sw7
	xxDEHF+zx9jIg+hE1WwZkfNoTHJA=
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040865ad.13.1788378535168;
        Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040185ad.13.1788378534670;
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 12/12] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:12 +0530
Message-ID: <20260902194712.2003414-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a987da8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2wPiPEbwE3xo
 SYHhHJwubv+qAD9zhFcn/PX3VjGwq1QERNkRug9F8dk1Y9VK2RytHLyKzrN4eBRjVtZGJxyUKvZ
 FmQitKeDhlgbY7HDr+xZf0JREZs67pc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX8pQOTKySNFXC
 vXgAC8n/35k1EGh52/o65RCsj/QljPevYVyV1pRIvtCNWWp8DYFbmc+fPMocwO5SE4qKTdKHxSU
 EkkQKz0lBvBGiqhyTRY1/rYo5SthfO6BmSWNOu2qT1Hcjw3gHZM98yWOTbYvbO8dn1zpKxsupsj
 OWYwPJXHqEGakHbywEgAGNBULRG1ZHk3jaQscqJylcWPcoFSNP5K8SWyuuXuEuVAo5WMMUkSeuc
 wNmKs9TUXfqkPaQvEXWqFUG9aMs/v4Kfpbu4wyHNL55nwMFqfvfkEthdHDpB57RAE32q8D8ptyl
 YT6MTfP5Qut8jSlRQ5gFTExlKjAlotVkP+UX2CMjLAFunQNw9uHqdc87bf9P7Eu2cnq7elETMYH
 xJ4/3O5y+dwG6j0u3siSqC+Il4zuI81lJeuEWURlq3BuzQEiVIAmI2h/51wYjYz84jDNnKw+zgM
 323wrkfa4Fi5XKSXm7w==
X-Proofpoint-GUID: R_fTV0hvsZywFl4yKMlAHvp9i6SFPxvv
X-Proofpoint-ORIG-GUID: R_fTV0hvsZywFl4yKMlAHvp9i6SFPxvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124856_522191_E1DE5BFF 
X-CRM114-Status: GOOD (  16.75  )
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
index f509a4601de2..2d5ffbe17e81 100644
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
2.55.0


