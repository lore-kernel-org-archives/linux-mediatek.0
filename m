Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40CAC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=; b=JsPgx8SRZxNCiBjZlkvYweWNR2
	aTAMMVDqJ14GFId73Jpgo8uiu1oacFyTl8+jDx6+B0nblkJyf/LJNRcSZEYNrJru/Kc2z/X0DYEx3
	UiRictiCFclPFYpbseM7+zD3TXNe1vy1lCm/qjdJO8fvTROlIzKZkxk0Q21J4ReIKtjnjY/0Mo9Px
	1leq3dvj5A4ddk48ItiS81I1zy/xzujrhnDtRJQGhAm/Rrc+zibIBYjRtDtAOpQlnwHyj8XtvPoST
	DBPzhqWKbP8kfW578D+t0UVtKRVWS6B2zIYu4lAackSABkSpGzqLwye53XWEupiriDee2RUoqY3sn
	kmJ9qN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwB-0000000Fm0O-2phk;
	Wed, 02 Sep 2026 19:47:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qw9-0000000FlyA-3cOC
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrgjW2484327
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UtK0az9ffiV
	XS6BRi5p/C8bg4TVrBl5o4jttOM3T124=; b=XZfDsFMQqWKPwwNisCMcFzhWbMh
	cMMlLP2SXc6oZeqUlSphC4aNvVn5HxnDY+qnLQzj+c/ciSqd5OwsX/XbBNJy/nce
	1QW9Z8S8S3h8cm4gkfVKfSzmLDw9EyPBq8wYcqSPpTrWraB1fFvCqUzHdKFjVUtB
	6H+ZWesSh8fVV4y3PPpAgvNL1kvs4YrUJAi+oIScv1iA88zyXG2yfkXMycQwIFRt
	4jfMK/TqgzY2edkyBGmyLJddVUVpXpmEdZfmJMyIiSvjeJfSx85zFipdFybgJ7Oa
	BfiGIN5eDO3jkjU254xZSsJ8lADx3uxnlRdKhvFXM1vDZUwYLYvbIIRGblQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9m8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:47:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso220846a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378476; x=1788983276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=;
        b=ANDuB8RL5ImcxRqC4E6DvNmWOpZ7djoB4G79rsG+BvqTrFt2nlZA4zaL4i4wNsV6OV
         Ib2yPs0VkcJgjBLRJZoeu54r+QtrdxxWv6Yrgn9Uu3lgbTXs3W6PDglqSs2fNoOoD2Sq
         3nJbIUL6TxiW7UjjvTigp0vlvSo9ahegCQf52M6pOwBB9Ob7gd8vDdu/nhrYa1Z8XY9D
         QYDA8sCnVvm58OecFLg+14WD5ZNNeOMl77SxW/S9Mc83siZ5bV2tTmkrznQt0kfXUqbq
         J4AvBcB4Yq3K4IdCQJuj5p384PvLniN07y76L3fKy0zc3RSuGgCsB+nViSUGQFeOeYAa
         X9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378476; x=1788983276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=;
        b=jhAS1aLCF6NAgY65LbeAC/Jicj/b4tBG09qBNfJHQPNx87VnfpZERRRQrcqAY1g7vj
         m7p610I5IJnKYF4MknWnmRGhZm7+iT87IYCGipflQHdfqYBD8/Tu3SSHAxremiVdoeva
         NhkSXucreqClR5WkUSMokSKun3eNaoy4FBBHZbjiBWZqIgntBz4x2S76yQulKp128s0c
         QajwACYqxAUiTtTgeqRkDaaKPUAfjn+KwBoQJDyiuv4Aeo22mfNnZklqMIWxPdL1+yd9
         dY+R9QufGJ0L7UQHCbBX9SVLL55FlpwN4x9YMlYlVLsrjv9utNaVFxMLIG6fAV3MD0yq
         b9ww==
X-Forwarded-Encrypted: i=1; AKwUvByZl6iBjwRZtQQdC+ZqUxE8CEyirLtPjGiKvSe2W4afQIZmC3jKxggHFBgUaSO6kQKHxJX4FmC058nQpSze/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++miFxd0zGwL4ba4SqdX/KI2v6Se9Y9gtWB0WG8ANI7pp6Y0FK1G
	ZphLvkR/GxSS6mu+yvlnC+ryLes5u0FveptVLhPTNpT9gkegQNzdUVQnpcl9YY7ppkO09RsC3+k
	HD0sw8yPCTHaEVHK6/cxGfNHgVlYdX36w12/cppthuyoIAig4HV4Cpg3fzqFqhzpJcGOWJUesUz
	0=
X-Gm-Gg: AYBFou2ATlABOpHsK63r+togt/KSKmMpO3JKGjuPB1Uhe9cnJnnvVPsAcFqEj6M+3p3
	3jV8SqiOQ0UUrXIiPvDhta24bzlH+mbvXRi6UPbS2JMxUZTvHvVaDhyXgz8sRjUhb0QBUwlTKIa
	wHjDD9ObNDW4SY1FqbgfeGPHrHtVSdkjgpp4fbcU1HOMdNlvlVa6/C4V1fmPYTC+XwxQxCxFmoH
	2pemJ7e88CNWNEonD6i4gB3/zI7uCHJS3/xcuMYDQh7uywtFruOKtQrrbqulrabYzbQ4GSuhQh/
	ojob4a0naugxw1RE93K0F+AM/4hkWKN7fV4KeTRTFZJ+7qZsjEMqxF+VZcW7qpazeUWc9IhN3H7
	x5Jw1B11bgNTriwP1054glcNrcf4=
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1517697a91.7.1788378475663;
        Wed, 02 Sep 2026 12:47:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1517655a91.7.1788378475146;
        Wed, 02 Sep 2026 12:47:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:54 -0700 (PDT)
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
Subject: [PATCH v2 4/12] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:04 +0530
Message-ID: <20260902194712.2003414-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k0mxFEyX4B5XWjNMqopk7AqVqrT6DV2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX64iQiKTO71N5
 o4IyqZQkRe3N+G8sZNRFf52F8hNG1T2hYf4E7VZw3zxig5eiS1OUpf7/Rok1mUjgq9qxuGk2LQ+
 t62TCKEN0ZB1T+7pWPeMA7EitbW+JenMMjsu5yoJj5k2fMXNx5s6sTo8V2dycwkls0quDQIEYVP
 i/FviWVn5H+t7JgdpGbyarpRsmGQ12vQNyjcpYG09HAGQIIJJspkHcPSMjJm5dNngepNnD+Laur
 HZ4RK54teinNz5YUZHeH6fcHIB3Iz52voj0A9zpiUEquW0KXf3h7ojrSrVztGekvXlQwRwqk3JN
 tA/82Xzp2bgmVd3N/FiBB6wh8botJdG0IOiySsIGOjtawFKBK5nu45td0tC9UGXP0GOQjcTmDHH
 J/Ym/UMS+vRsmTsJFNJtMGE4HyAcp9RVp8NOR3JD7gRo69aueXJaT4vpCdDJPEKCaHUlXL89zpF
 /TLrDnDuJ3L/OTOq2Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX8kGzIgEdJXRj
 mZv64vqaez76w/yzEDSTIb36RRO6jBawF0aPFrzW/CamW76BV06HIm7K3df4u1G7kW16hUE0fvk
 B/vNvCq1pigDuRHkXmhgIiNehcTpm0w=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a987d6c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vpwXisbvDR7QvT6TCt8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: k0mxFEyX4B5XWjNMqopk7AqVqrT6DV2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124758_017750_3F49229B 
X-CRM114-Status: GOOD (  15.55  )
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

Replace the hand-rolled devm wrapper (mt8189_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..04baf7d9132a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2421,11 +2421,6 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8189_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2439,16 +2434,9 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8189_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0


