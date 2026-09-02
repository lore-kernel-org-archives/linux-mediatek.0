Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30077C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=; b=cRa+wgjTE6CNs6DohXMVneXw7b
	umNiNIsYitPMJXNmtmJT4LXzQAlx9CFN0sozG9JdFPB2qmZpIy+7uz4wlAk9oXjfTCESLlVtAeck8
	fE86iZAp3/1JcxzhLFQJDJC4RF3rA6FKCEi7g0liwbqCkaeFv3xtJSXMv80JSgfCrnp6216b0KsNR
	kZyyCOTDFGBPmHCXjhJQKzCMl6vUdu2KguyU3P9mqS16jhKyz1IekfdUm4xi+0M3iR5Cp2taIGENn
	Mdk6XErxdgR3JYqjTvbOF85MyRJXCm1oeLzy+hdNjA2faFv1DHK63pUDQ72FfTpk9mJ40yBHqKSxO
	sQh1OjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwh-0000000FmV5-1Bax;
	Wed, 02 Sep 2026 19:48:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwd-0000000FmQB-1Ux8
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqq5i2209132
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0wX0NGvpX+
	d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=; b=ex/mGCBuQfGUfQ+I3WEvpht4tCf
	6cIPSR21rccSUNeLu9q5onnBeFdg8CG584sGjhoGdssDNxKtLgGQsO3zH3x/hH+U
	6nlBflB1cSTk+1qOicUF3KKKy7voDaY9jgycGYoEYImIn991GMZDHTpQg8761iuV
	GsqR54r9J87D4CivoNelQPGhJmbk/FsWODF4fWn88Jibbpqt0Hj9TBQaGYdQ9a/7
	yMFEBEkTSP4hN6bsQeQS3MQ/enzes0QL0yD+cjarQuSpus+loQpD724LqefxuzhJ
	Ih+0a3dCckghwKcSveSRhAA6+u8Pmszj44iQtybr+grBgcJ4t8cFP1JtWFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s1pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacd6d37edso19341205ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378505; x=1788983305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=XoTA23+8B97qQTbbXFoOA0vI8R/nwq8gsg0G107nFjyODrRtNA/0kO6Sv8xfA5mKf+
         6DftMmIte9orXdtIOqDx6ARX2V5RDJXaW/qyOwmDQA0t+FI6JeJZ/Vwon2jTWQ+pJVGA
         p9bS9RuzEa+mww/AQqhSskAeaBCVnHFVHooZTDlOjIBrcIFEx2Mn4RKqokEh6wvetw6V
         PUeVDQCB+AUMPnUs6ffaGQ4Jsq5OkdJN04CdjornWXqTMbQBFbX+rqJjKLg8ZeKu4Zf2
         ED95bmTTrHUc8iZ98CSZBj/+uINuW9/7kWTIoPY/PqrJp1fYW7kpzD+IW3PlGZPNe2j7
         EqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378505; x=1788983305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=a+Ghr5/R8pSVSMyEiRBABGX3JQ0e2tsr/OxCLYuIPT4gF3m1FyqYIpjhEXqZ+82nXZ
         s2SQ1OKuzukMzoFjvPruu4vK+D5Gskq3lGZJKv2Hh0zKdqQ3qcldZK9M/qXevxRs/Jjk
         LJjQrsbb/G9X7UyAffle26/Z1yFyqIHhCECN7j0ODg4363ctkJpLcymLDdHuGlKfYH0V
         xq9meSOlVspBuEVorJYQI++OSgCyN1FZqDGySrNnHQdWQK5bVySxw6VuMJhS4EU3zdNN
         DH7Qyt1CF0oeZX0+uvQIXeTQP+gqLkolrzTNmOmv59G4tzTC5EVLU5v1Qq4wDbV4srrW
         l4zA==
X-Forwarded-Encrypted: i=1; AKwUvBzFnQe5n13qpXzlYlk7se0TjQFD7lZqqw4LK6gBA4MoZySRY7IVyRakg+aNjMn59gImoDm47TK3CoXmdBc+XQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kcz+zpUJ6aa4XrL06B5C58+LmxKc+xNROstsT5SdwY3cNgHhsu
	ESvvdisRN6u8vzzEOiCII0Ed4F6xTUVDUlcm4efboezCAqiNJB5Arh/OXszlWBDnY5aKQgqrdvq
	gIGwELSqjl/YdXSKtX9xGCltsoebEzX9dsraSAfoGt6EHqfLJTGw7FfcDmQWoN5GBao7OEejZaJ
	8=
X-Gm-Gg: AYBFou2CX3Kd60dTi2I/hFmqo0CvII1n9py2UdaeStLHSxODX6PBluq+xHLgBWs/i2K
	CzGuqd6oBOUx3/pw2NkhV23ep5LXYWwIX01RdmIcglQ5yH4nN8VcFgivyq93rLWfh0A3OcNzXW+
	rgJe2oK5IU6HbKpnd2OaTOfPTj/Q5JtZSan94I+++uc1JWqWMU+htUIYavTlbuO+vdVX8VWlwyi
	40jr7aeDvrxIFU8aEq6Bes/8XivBCfrZvwuucgD08gFoIhuzVvbX5qgHX2HPXAxh3TgWY811NJ2
	UWDXvilJlvb838apzvBFgos5WfksChwl+hK5eS8Z658bJcwJpvNVZv3YJjHTV3dE/yfg+r49IBz
	KgIMec0wSPi4auMIIMWLUpO6sFgg=
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103553335ad.20.1788378505331;
        Wed, 02 Sep 2026 12:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103552775ad.20.1788378504916;
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
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
Subject: [PATCH v2 8/12] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:08 +0530
Message-ID: <20260902194712.2003414-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987d8a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=n3t7IOQx-iCxt-lDHrwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 1yT8toUmDWklTmtjEqiuTeQMpAX8v8Tn
X-Proofpoint-ORIG-GUID: 1yT8toUmDWklTmtjEqiuTeQMpAX8v8Tn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0Vaz+WHRrHHg
 v0T4tPCwkA87hwrUPxanfkBQyP9pBVi8jSwUw1y5TovTTa/K60DiPrjWk85Z1I9Sq7B6+falC3f
 Y362GTTpoUJnnxUq5VkNm8XEyn2nru0iS+CuwLoD4YzqCIytOmqRmMdHfl+u6pvKMITv6H1k5fT
 kj6qrM4zHAhCC83ByVrrCk3GOlc+go7wye79T6Zws1Nq/J5Lg6iu4nKUnFGihc19WwyiFDimS47
 6LzruiNSIdPPX5ACseoH/TD1q+nZuLPdf6LOZ8neaA/rmqndMnUJLsIzgc85uQCQwfJt4unfOQS
 PVcH/8Syge3TowtT4gPITd6ABJhdhS4p207zryTUjHz8SiDMKisRSoZsT/RkaSR99ahZrNfTiTE
 XmHB9l7q0aRozzsEh0fsQOEuM2EuZQqz4u4wO8OZs4xvw/Ao/jOK2GT2vpcZARbkRTSGxjCFdOM
 tjM751Ur5ySL8eQhatQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX8ZQPfV1RpDgO
 WJL9rcOM8y8NqtnCtNWX5d4JTudufbapq+pHSV/YD18Foq0FmOpLmQC+LBfqWAKbJ1pfGMxF4WB
 LxyfPkRKV6jToxktp8WkJAQYNevmbiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124827_513472_65DB2F87 
X-CRM114-Status: GOOD (  16.12  )
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
2.55.0


