Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB4C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+DsXwsUWBuH+aojhy4/J4URgft5Yvx086IeNR/2cNQ=; b=eyB/DRVGtMN/EhVERa2QA6YSNq
	M3SK4mRRJHIVodKoAkc7x4uGBfJoU8QpqICusX092VPNYHlOdWZZSNsyUqmmHk9tad6TzEK+dN8TI
	dH5HpH6BeHMZbhUzBYwvsID818iWY2s9tx/iCwuJ/Z3c/MIH/wpSIUKNOukgO2O/rm2qp60fcWh6E
	uygfA6vA7mrMlhqVdX1BkDCcppShQqYAJ4PDaQDSO2Ju7vXnNBxdgWFpOH5+8cbsNL4R0dfhflGnB
	1PwncONyfAVqmZm1A8/LKJTtxZXhDisBVBes7ys/jLVoR+K0MbY1gws0ow3sDDMk7OUVR8FmNP3bL
	4BcTdeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qw5-0000000FluE-17s9;
	Wed, 02 Sep 2026 19:47:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qw2-0000000Flrm-1fXk
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqwKe2104779
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h+DsXwsUWBu
	H+aojhy4/J4URgft5Yvx086IeNR/2cNQ=; b=IQTRtLTSYcEOn18VGO9wYHCZm4K
	ltU9fpBlsJtOTcLD7E7eB2BLQcA8mVbIQMpUqezCGdjQZVbHJPM4ZSk9462m/FNy
	5U3C1sdVh1Uj7f8YxEU9MQITdBhE+VeRNaGOoCLVquEVAa0tP/ghtDsaEIJNjtuj
	uh/Cno3i8JgYUWwRRhcJieqMH0tvbobM7AH6QubM1OwcgtaXzRXHYUYSrMErE6UU
	gHtOcSL0fE31QERVt2eoyT4UFCAdtPu7So0S01rUwc71RlyWO/7a5WR5u13yBPPQ
	HpoMvE64V5Myr3dkX794kkVZEo5XohURqsvN/6cPfkAUEd1WQFTImtDXJ1Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsbhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:47:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso34334105ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378468; x=1788983268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+DsXwsUWBuH+aojhy4/J4URgft5Yvx086IeNR/2cNQ=;
        b=KHyZJ+kTrDEeqXksiuzFEcVAr48BjAHohwnpDrj7UA8c4oKWIVcqva7hf3bkVx5mQC
         RrvWk1WNooK8cxZsjSa9dFx1UcCf6hJtCJI2iUrD06TIhIatra/Smjo1zNAKBgS4MCz/
         qy0rqKhTRHNMfUzRjb6kK3YgUZpa/0Rs9uXMvtBKVE4rCGnoE0FYIiIunxzMZxlJ75EQ
         EEZjzZfrudGICRA57kcFilgnHYBjAYOfQvVtwyv83TvIxh9om/iKQJtPOHWXDEwH34Pr
         KCNIPw+lJaD+X0XPfd0SaC7Ry8zbDfkCMNV1BSUzGW1P6NmA07XMmEKEd6XwDZkzO66V
         zHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378468; x=1788983268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+DsXwsUWBuH+aojhy4/J4URgft5Yvx086IeNR/2cNQ=;
        b=MLvlEvAaAnAKgiBq8GWQjpO2ITI2i9t0v74nKaoPferygQDM3qeZZvRH1eSleunix5
         mZtY8qhAtnsu9Fc8zw4Gcrb1TC4jzN1JxASA1PQiKqo337xGwZ7wSs4bjndK5WkPD3gp
         12Jf57N4uh4yBkbgZNixdRVXimW6Od4Kpv9m7wWN/OLBRR5m15SQ+LFrUcCPtZgvW5Ys
         Pe3kXjg1kBRInpWVHE6bU+yg7wiv14PRKtoOB88JdOqLcPm5J5ox76mC3mQZ8B/2hP0q
         xDfvyfs0IiXQZoTIVXC34mcGv3quMBOQTWaZqx/0aUQBzo3ABr/nho6boB9t0GpWWsWs
         FEng==
X-Forwarded-Encrypted: i=1; AKwUvByqF8egpI480YK0gpx8YUqXELlO6QcxnuWeZ7Mb2rq+SIgI1pnvqtaSc37yY44rkrZx6NskBhYzfqqDj3Fs1A==@lists.infradead.org
X-Gm-Message-State: AFuF++nq6guHWA/24tni7/VJA2nAhgFOEZo1vP4VuG3UnQe5+z9YUUpJ
	1ongk6Drw6k9Fr8q/SCoJEQbszrfsKD4YgwNdt2l/xHdklTQjUxyzG0nIS6xKDkHenHfv1E1pHc
	xhku98ug6LeW+rLMz6rChVvaMEUcG88fl5ET1hvqW8g2PM0tGA/i7oUDUONeXQ/43wKYDaPmj6d
	w=
X-Gm-Gg: AYBFou2cHYPHYnf90ERO08mcxIv2ldsE/bi/fDloGbns/Dd3WPMa/KiDXDuPO5NTKwz
	GLXakFqy/Rr0Hri/iWzSS1tTYBAK6+OoEdxO+Vrb6xRLnAD+R2mpc/U8iMoRycAa5HzLo5VUo2w
	Zv/Vwt0Ui3qax/aKuOWj9P8K+NZznp1aUFNyS/McskCc9A7MetJdusFdOoZCOVrVKYT4SXMqZIX
	aZMcXvTjdtd7BKD/tv0hxyGghdhkLItxNLp0SHMuhEo1atOCivZ25dCkE1bhyYPWHxPQkQ10Y+u
	S94gGDo/2bZlmCL/PQsWt3hpDkozFof3+7X9NSYrknVUFgP5PnP3DM+pMOEL8HMvu+tnRVnhcNI
	3/7jzPJE+dYlDA9f3ocBUqEjiL3A=
X-Received: by 2002:a17:903:1b08:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2daec75b6fcmr106240465ad.17.1788378468266;
        Wed, 02 Sep 2026 12:47:48 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2daec75b6fcmr106239845ad.17.1788378467791;
        Wed, 02 Sep 2026 12:47:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:47 -0700 (PDT)
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
Subject: [PATCH v2 3/12] ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:03 +0530
Message-ID: <20260902194712.2003414-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987d65 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5_2tDv0Uws32Dsz64S0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JLUFp_5UifA1SRn-5pt2hDFLRfBwoKOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0xC96LwOC6DR
 uIMIgaHSJ47d3sRqPxF2UgCZmWGegmqvpe4UpAMsK+ngVlKaekveJdCllfMf1GE5FLT+r++qE67
 TPdBRYZ3+sOmnwEc+c/rtUGnlrCYJZDkeMGeYES7FtOMoBLkWVz+Ivm53MCjzBTegL5dO5OwjyP
 1RejlGoenlilr46HtktrENQ9azH1lZRgKjQCV7hdBKcIyf1Ooi/90wvE6M8/mG/r3eiliITRm2o
 pWF3qHMu5KxyZOkNI/1W2/hfCRfKdCuYUH9UYvo8fqEIDxbFro9TGji36JpSR5Ui1GU9FG1cqEZ
 H14ldQXDNRGXXiVC3q0jLym78/7bYyiqeAzW1BAAidc5PU5hUklg/TWD1Et5keWetyg/YIaXbjE
 +To228uWli+ACAfbrhbdjlRGSKBCDYhlGEl6tkhwGDiNMXPIruhWKrkO/eJ0g0AKv57yYjJE3Sf
 ad6aATUb729wdsvbQog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXwj26QkGfwZQc
 9n05H30RLGy6V5x75LifnQMcu7SygURosOfgIobXtXc766L2JWR4hw5WbQ6We/NcPZaVpYns80V
 /iXuMYoFq4g5miWPk99b8Gbij62+0Jo=
X-Proofpoint-ORIG-GUID: JLUFp_5UifA1SRn-5pt2hDFLRfBwoKOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124750_838815_6A6B0C28 
X-CRM114-Status: GOOD (  15.71  )
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

Replace the hand-rolled devm wrapper (mt8183_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..6ad396e3b10d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -766,11 +766,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8183_dai_memif_register,
 };
 
-static void mt8183_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -795,16 +790,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8183_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
 	}
 
 	/* initial audio related clock */
-- 
2.55.0


