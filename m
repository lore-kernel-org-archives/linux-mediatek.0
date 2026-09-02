Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9A8C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=; b=PMRV03VQOeTKY7ZSl6yqYsV05P
	hesx6cyl2bixpf+Uykxsh61QrTU8mjIThLvLZ5ex/31KGIGTyNfdEEQqPnIaLTLEEbeLQEYKyLX3J
	OesRHNbHFNsk/FqM9P6+3ykTodc6QqxmBe6hHEbsBavysgVtg0yw0a30uMYcgenlsVqtcitFMoCj1
	EyLpBxyuA9Me3Jg9/eMVjm1DlgHO68nH9SD9pfMrSs5PclLs6KiGeHb0+9YQEPSRhf+VxM8JBJ7Cz
	n/Rch3klFXSxFOXLWtXj5sIHGMu3IrR8bNAAUVnndH8d36RxCGdFBojzcXHbt9C2Mf3cXTfXkPtOm
	ppq+MQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvp-0000000Fljv-08Zs;
	Wed, 02 Sep 2026 19:47:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvm-0000000FliP-3RVP
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtRs2975241
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dJIDfPMkkp3
	4lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=; b=ZZiYhzPEh3cueO11Uk9yw3pog8z
	H93TvnrCSczc7ynU37V2tLuSwqtKdv60v7y+jdNrsmgPdVltqepXeXEzYjW26oqF
	ZeVDYRxDYszcG/nx1LOJyK5HM19DmBXiOPbx1soFK+9fgqoogiuUru9KTOZ5ySCX
	wHWg5Yj0kSk6Litwz5TnQ3bdApO4XGcPoi9Isj0fAD1RmFZkoTG9yiw+ykAkWOd2
	uhcgX2sBMoQvq6RcbS7LZrCnVgiROKQegrdZnIKQMKWRm5lYFX05raMQhhDh6mUn
	9pslF5pM65s4mqzd3u6M2dR3wI6q+r9VlWPo06XJwQaRPGVa8bQv/rp20xA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8mx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:47:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2976393a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378454; x=1788983254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=hUyXX+u6h5DpFkUUfXhSQSmLyuoXbtJGlJgs2H/mZijQw+WsjbNQvTVrQdVIEUgXZB
         IqycGG7dvgfxAOS4KeEfwgnxehMptDjKYeKOyibG+CGPjv4fXnk49wf/la73ihwa8ItM
         JIOxCCg9oVGpGRVDFt+iUk+cuUIXCrswr8aYZUhXI7u/g5PWxanu23uDTR897b1MgRj8
         FjKYsYH+WX8MznyxXofv2Z6LUwjQuFOpZ6N12d+hkuBrlfyggRAN2xWWd1zj6NO2xgIw
         4zrckGGzlHRKUaKnfu/sIl8g/n4Muy63XAeoKNPTDJGKI3NbgP/nTNHz4bq55neS08rh
         NptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378454; x=1788983254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=ZKMtKnqYxO4KxE6vIQYl32VnriI2VH373ixzZtTPwTWsmlz5fv7KMOKBsmauEDWifI
         ZVTZFLZeyWxIOwVXB8HY5lFz1GgnedsGF2RDhS7DMRZLLGriW7hNPs3QlDJAejLA2ndJ
         t6XIFAUuQczDiCx1KnALlzVUb4vk/5CYmxAm1ipt8XigIuhEmRy5IGSRk0Dz5ifs8dUo
         NN04dDq4vDwx6lIbsln+t7DuUHvsAK20/ZMb9kVM9u4VK63QPvPn39hWTEBWlppeElYU
         YV/TmOGtrTnmQC6l3psnFeCkLFn2MdmW2KBsYwr2PsXY5lWcJMyPjWcHT/CPC4je90gE
         LSVA==
X-Forwarded-Encrypted: i=1; AKwUvBwAKv41jHBZIlRgw4ML4LLZ+YfaYAGhU2KP6MJblZN48AMS/mJYjfIcstucds1yh70H4cFd5XRJ+TNqWR8Ypg==@lists.infradead.org
X-Gm-Message-State: AFuF++kRYNQbtK7q09eAypMoAgpS+K/WWBUd4VDk15TmwyCqE2eB7kCa
	4Ph+Jfc37uhyh1rFxhAfCFHfA8oWp9k4gkLXTjicZbB4e0SU7DBY25mXrCpdK9ojJzQbGBBfDPl
	DJJvrN0K08kIrrs84gpl1U5wbMiDx58Cjpt9jT4srBTPZyu8yQBv0r6rG9DGDUqbvyO9ZmpTO1s
	E=
X-Gm-Gg: AYBFou0lyzxOIi3unIX6bL6OsI6/uY3SxiZl1/iCkifgWnaksmJthK/fE+B0xKqVuGM
	Bz6N1EpLfkgTZWIJy21+Jx1f9wUCM94mxeJQu5ShmjkRvgxOdsrnVKnOh8gbChYhvZNR9RKvYbr
	XOLFri821wHVnqlFb2zUmD7IxAqNF58dE/k/NAK3GdlooCIN6iwrLdmXQzRQ4JhncNw35SdtuO8
	Cbz1o8qU8Yjy1RyNBlao2SRG29xLmK1uO/0naizb6poPsSddf9sco2RaUHxYjhMk2lfKMaF16ty
	oEZ1wsELukKByLs2D9HJukv914EJEeCyog3pqnvto1AJGl2zqbRpxXzwOcRba/x708vPyx4yhno
	8LBKryRPxt78RMAASukAi37MDR08=
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396991a91.11.1788378453516;
        Wed, 02 Sep 2026 12:47:33 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396923a91.11.1788378452969;
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
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
Subject: [PATCH v2 1/12] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:01 +0530
Message-ID: <20260902194712.2003414-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a987d56 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Cg4emjn-6EWHYnEhqz4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX8H27t5hR9uKR
 tEZkvUbwLhU3jzdw6rbWPuftOLVfbMS5gCHkk1Bfczni9lcoYLpy82LQf8voeX6t2T/COnejZil
 38LyzugzqaP6NzSNvdnc5ONTGWu/2Ds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX+ik9fr/FtRji
 hNe43as6hXF8ID/gdzGonS3nCsAj10vq6hTcHbdPQcfivfdi8IwXzUSlLikzTdaaWqOObRrdMzJ
 9L4L96ec5IA+gFhlOpgehR7tFNFGGf3QvfpjSMRRwAjfmWOFu0dPKCNDJvTcOl0Z9U7ibLfg/HL
 DbVJjhsXMy8M8UZn6jNRZTsbYYZg8ie9GCNR9UNnBxerfDPbYZH82/K3wKsU2o24QvPuKo1yYS8
 uJJ+W56V0ltr3UR2d1iiXnwCeiNrK09kCmizJjtcrnWOc++YFNeCgf6OOai8JghQtQXmsUG5OFT
 qxs+OHrpg+7zyReiRJBKDYjxliZPOy4lYHo4atsEsOjOXc32B2QXv6GWlgD4sPpOxy3BGcCiB9Q
 FBGuR+bS0htem1FSU1gt2+hdGraYrE3RIbs5xr5oIqy4mm1a156aqY+1ASbrh2ZRdBweJe/gW5u
 yFV34ZzvfHuu5NbFpYg==
X-Proofpoint-GUID: Qou4G46Qs0YM7JJr-EHGSXbKyTCpCnbd
X-Proofpoint-ORIG-GUID: Qou4G46Qs0YM7JJr-EHGSXbKyTCpCnbd
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
X-CRM114-CacheID: sfid-20260902_124734_860955_AF3A9F6A 
X-CRM114-Status: GOOD (  15.20  )
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

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.55.0


