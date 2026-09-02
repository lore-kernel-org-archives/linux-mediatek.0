Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B265BC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=; b=pmXE5lBWBvktQn5yWnxuKJ7Ek2
	OPKBtb60r2Jn355F9lGjlxg16ErS0Zf6wNzhf+GwKRMP567TTmgaiizTtO3MaPgF7duuohD1rqtko
	n3gBOdFEJiTE22tAC3mcN3AaFJC6GFNhgiXAnPL+Thqwn01krR8RVmt977FyEbUceup/FispSVXFg
	TOX/JSSfeF54YE4XKfyzwBmTI0r1vsmwHGieRoyz0VpYMpg5cBFTTw6bBwtZ+2DmJNoBfqdSsu6bX
	46jtXFJ/gPqHYOKhdB1vvH9vEtGkMO9ifYc79X+AT2+WSACHtnxidhSioFW9mUvqMR29Jy44LiRcX
	lookDUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwJ-0000000Fm7y-3f7S;
	Wed, 02 Sep 2026 19:48:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwH-0000000Fm57-2fF6
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtuB1650594
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=32EdoVp2rW7
	rCpiVn+zEPU508NjDuMsP8in1gDPigAw=; b=JtsacYbKfJVs3Ni2QzCap4OTDNG
	/yHIFyKNw9eD8ooS9U6Byunnukn9ZAOAhbm4lVLXMNYCVWrxAAg6S72RE/LfntRI
	L1SJ+w6RfPMXInR9O5xSJOnxT0JzR6K6/QA/rEEyEYKnL43Bi6aEKrmik0Gxd5ak
	7eM4lhgrX/uufETpJNAMsedDd5V4j/dhF4/Cfd1RA978Hos6JzueVdJsdhZ+Tb5x
	+PGSrN/QBLOJOQIY3GJp0cAR+6qZvnTzf/MBhQJYkLA5S05owph0qHYfhi50VnBD
	BhhD3UleXckCepqAoLX5CtdpJka23y+XozayC28DcCW0pLU92wacZcAaKdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4snha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so29459335ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378483; x=1788983283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=;
        b=alCK+x81qiM5R8Zuaxope68F6BMDk+zXYf+z38dEUDffho48QA+KknUbbwX/5yCthR
         KG2ZlxlDUSDs6RH3lbrLzjDWLeq+41UxYGaCQHlD8p83o166rQ8o9tX1uhCrFGKyXWe3
         d7SlpQOAhffqiql74FKUjUX6/NolbjZYtHjUuPwCclDzU26rAyZnrJgQZNCjVQ88Wpsf
         /P0ndtExfMw4mdYAt2dBN8Vqz0XrjmYpOwwdBCzJYzZLuyURkJOT9G0XGFmae4FL9s/c
         ieKCisD5zLjXvRCgIDdNe6Kki7vW3oM5SHHKLp6/3VwDgupv0wEiFlfIEfvAAxMrYhgj
         bVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378483; x=1788983283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=;
        b=DL+U7v+O+We44ykAHppIIg8irxPKSjM0TuJblR1TlsYaagcx3uIO9mGX/HawlU+jNf
         y7+BJZcjcW43KywROZjaQByrCZrtUaEhEcS1D/t8CauagURjqZPa9C+AqRmKZJQ1sEbD
         mrvrkF2GoEUlGwTGhpefSV2b5Faw98Bvz1ITXMmlUm7kVAKYAlNe8ugLPvKQrzdI4rji
         IIkp252DsVO0SlySI6tuKytFuPu21IC/2ssVwmHCPzfGjwyniI4rHNTv1lB/e53p8f4n
         My4zpxmUaBaoK0jaIcVTgB8bSnEWM5mat7rkY4kwQAkUakxvyM23QyYx192ApZjur0bh
         YvIw==
X-Forwarded-Encrypted: i=1; AKwUvBy3TsaYq4MiU91A9EoS4gOE1auj12tcp1XmQKTPd100CjmHN/gvGx/WGlq5sgTaTQXVDrU1t1ReVlpwdnfaTA==@lists.infradead.org
X-Gm-Message-State: AFuF++k4VEBZ+Ih7/CScLJXvfe6sZx2WWe49TDIZlGem3r7nxS6M5HoW
	IONGsqhwy1eFeBEWcApa3ugWfARkLlZeL4/8O+Na1LO0be1IrpOk6Hq8ZVEcvtMJkqeTnJKpuCC
	hCgLnhc5YiDufvv6iquJxGhSA+qnHCIQKOc9PCfvZTw78QLqPQaeu/LLj4wjCm2iPfL8UxxfBe6
	Q=
X-Gm-Gg: AYBFou3QhlUuhf6Zan1Lhd2LybRq6q/9kH0ufVrDwN1SWQOKpjutMq5dCdWJQNIcQ2k
	azqKrMQKjdaEstCgCF1o4ybIG+OYgR93oa1uZMRvO/jGqlC01dAgUKxiR+n2IdmeGptwCq33we5
	7eb2HPewiwe7opBtjxsIRfbCKVw252my0K6UYUAuSt6WMmp16NBX0gWLoA4M6rSV4UkKVdpf1fP
	/7p988m0WTab5tK1ImuZv4I5gBYmCTUztU2QwctzLbmjeO3Kqduen3jGn2EJS7fnq7P5+VZ/F77
	fGNLCaD2MRbRAWP0vrVFABdH0z/aDzu6btiM1RsnErZlt7StVjiH+smDSJAjwvY0p/iGJciHOuY
	iJ1jyMx5J4C0NLP0pUhLy0FCcdHc=
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr88328425ad.0.1788378483032;
        Wed, 02 Sep 2026 12:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr88327845ad.0.1788378482601;
        Wed, 02 Sep 2026 12:48:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:02 -0700 (PDT)
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
Subject: [PATCH v2 5/12] ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:05 +0530
Message-ID: <20260902194712.2003414-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXyVb25LgBDcq/
 yefRZS1wGM/r4wNtGrgx0B7fqJI+xWXXrH3DrBq84HdUO7tF6h73UHSLtYgSHulqFPi/6iBAtuZ
 PLgK2LeFdYeP6XW/IxdVqTO+o8luokX/5EBTyGglHXC2QJOKyRcZZwAIBIAdEcBNlLcxbw8EItI
 gxRaylR7+VdmPEWuSw+0mjLQnifjjFQmkjAyXoCwktR33gt3dy9CobyegANYhP4YkW2wjeiDTk4
 FRpLkn6NG0FywLikgiMDsJINJ8F6k8yliJEVrtJSYxzJMr9YVvva4Svt+OAUDrTABYxyzGzk83r
 twbfs2tu06Po6fBb+fwh5Gi5JhRR0/BUiOdLmgnEZYJuRAsYzaJY24wPTtxanyQARKcPbDUV2x0
 WUjZuTshTyH1SEZdOJKfSkFF2SlrM3fMSArCL0Q6DuM0f3quzP5am4hHnAo4/zLl9EaZDZBekUr
 XLv+H01NlfQ885a/7xA==
X-Proofpoint-ORIG-GUID: bHDpM2uDnKipadaGh5Gvyxs6BX2q_pww
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987d73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=iqpFDo2SwQq5gjaSpEAA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: bHDpM2uDnKipadaGh5Gvyxs6BX2q_pww
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXzyuZejqu479m
 V9sfuRxmGneZYDgnPoyf/DhMlhBcZoN3meJoulwz0i3CBTSroz2Uj1ELrvjfbE+HQk4op/iJ2ok
 dMntsd4T15WYdEXCKo0l5sV399InMfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124805_830028_160C0BE6 
X-CRM114-Status: GOOD (  17.10  )
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

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Gary Yang <gary.yang@cixtech.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/hda/controllers/cix-ipbloq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..815932e5c58b 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
 
-	err = of_reserved_mem_device_init(hda->dev);
+	err = devm_of_reserved_mem_device_init(hda->dev);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(hda->dev,
 			"failed to init reserved mem for DMA, err = %d\n", err);
-- 
2.55.0


