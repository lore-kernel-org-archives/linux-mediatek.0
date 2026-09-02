Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94E5C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=; b=C2X9INw4e9G1cbKDg3/x27qI/K
	yTUeTWYoRrK6szA2EyeeXFfPTmkOCQINCa7nfOt7otPrsp0VqJ/evNlrEIRgwrro3shWxEykw2kkr
	BHppb+M174I+QHlusMO5NkyVO059acCyBVHazFymTRdmerP+Rtl0AOFlDqUD3PtLJbluhioYulHdb
	x3DURoWIX0vwNktiDTGPh6clGwSHak/UsKGp874dv4ZfqVBYaxQxlKtrcRRjb/DeNbEv+CK3caYLg
	It8PrbuEAGRulZ3HbLlM3/+mOZEL3uN3ireVq0IBSRaXSep6+fhl/aJ1CKSMXhuhgYRoo2uISMmQ8
	Soid5BiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwt-0000000Fmi5-3ar0;
	Wed, 02 Sep 2026 19:48:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwr-0000000FmfG-1zoy
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr2EG2270814
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvdccM5K3gM
	HO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=; b=d1rc4QZfbIpAUfa1/Cg076ioPXC
	9otIlrXV74HApsxHAcBY65egjvSUZJ/XP+wbHGPZwLWMXrC5yaKXnKjN2cFyoqav
	Sf4AXwMLW0O6E5sQw6/08LRTjVKzxOYQTqvoMfaZq64gpoXjwd34laxqaHWWOgAM
	LJ8h+PpWbylqr4FFwwAqXHdLtnkSGgXILjy3MW0mS4xSlwDjptnTky0IN6jPrhX0
	rQ4F+mI/oOFtQ0pid7mvmomP7JlWgZTvJlMdfqg0LOgUYZNRi6wG53KthQobriFg
	SVSMsN0azSxNW540JH546nB3BLb6X1E3zj26zSlu2ho81OngCUkVlvQ9mYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cae0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so392649a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378520; x=1788983320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=OL8/sf147x9QCVDPeang1nBy8Vna2fYmseBRgs0FCTKZ0/qQAG6AdatM4o1gBnXpIs
         3U6+U1YFsYrvAGlo0qfIVkocj+fFlOKRdEQeaQiJ20pGSmojYXKgZBoZ9SRACP5kUko7
         JAeQX44CREKkGUyUvRFBwAO/H96LQKhnfLiwA0MkIURlahPzjbzBioFExqA1kHLTkFmt
         o9UXThH7LHIIh5W7PNHOMbuwLsO8ArcVbcSv4X2biEg1ZDT49FAmejBZQaTMOgYVE1ew
         S+hBooG1T5OV1wqSVDNABysEefNgl6LN4atly9KBgVjewt2hVkmIp2eDBqux3M1lMNxh
         ctkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378520; x=1788983320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=rbdGJtoPKqsaiGIK/qzdk2LU1nWapVJq2Z/Yhjht6sGd79QpfmGOfgeLw5Ch4kmWkv
         tyiwhKNAOiwZ4hj6KI7+XwI9mvqHZRHFRDBOlpb8Q6vFwK2tQr4yuifpahqryTCj0K8x
         LtELGkAWUQ6Xm23SyDGRzGFVZrZvng+1QlicLCU+OgbyZiUbp620YkGUx3MpXIWiKPPm
         CRHD919l3By/UnwU//DoIQ2U8ozF8kCjDuSkDuwrlB7sy70iRCgRhq4IDfEhboP2ulWK
         cfYPgeqdPz6yU5jGGxbGqF7HyTJLNZhVkwRZUl2iagsr4A/3xXEVPe4+knHkV+yPpuOf
         T++w==
X-Forwarded-Encrypted: i=1; AKwUvByMBvI83TXVak8SqviXCFufrN4fquajhKfRi2ENEwmuP8ASarwv6uIRtSskvr3DfhZmOyTDf82Lu988zj2XSg==@lists.infradead.org
X-Gm-Message-State: AFuF++k8LmPumnFvLtSRgVPxg1FvnEDw3qcgcpgQj8MlSmyj28Cpzxu4
	6PVIwlR2fqByjj2JDzjYTHkq2BuBr/gsUZ0r2xpXYZ3++t3cgJS6NmUsAW37YVGI8Km5jiM6Bsb
	oknIR7z5+llrUAbioQYHFGh+Wbi8+9ZSF0+02h79ZrSY2AQqo27IurV4S6jHlpK6PZvx5Kq6Ftz
	XsV39vuMg=
X-Gm-Gg: AYBFou0Uk60x81+BW4SYZ0OsxEa5z4cyB+bJYkLU9dsAedVslRNDu+NArH6irpgUrA3
	o+LNJvvTKnDDkIvvPDvJXFZNOel7oUcFaIyAKArplFQwhilgnM9NHPQjLMcuEQHO9yzxukk6nau
	OednybwdC9iwGYN44ik80R8rs44lWdD0VVjy6yA2fBLxnlgUFi31+K/mXwwsdqjWgta7f/JBRBI
	89gb+DjB7qmEDjzXmSnBVTiZoCIP8Ej4rZxD89IWQZBFCzYACqUSfM854/laMpf9P6s27efU/Wp
	68GI4hcYcM2IN4+pGrqRhnFT4UCBIBfXdMk3H9OAd0jE8EK6x0ro7s5w0qGMDa2/0D+Ja+2XH/I
	F07knvI9f9kpA7mCDiK04bRpc/Co=
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560744a91.4.1788378520408;
        Wed, 02 Sep 2026 12:48:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560695a91.4.1788378519784;
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
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
Subject: [PATCH v2 10/12] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:10 +0530
Message-ID: <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXx7wSyxzG5qPi
 TxbJZEVIRAGd3qzvIRm73fT0qEPwDM3U3PEDgngbOeLf0zflPcOAHthTi5Aysg7Y0iB9sj6nyIg
 wa8gl2tF2dKEd7dwKydW9Rr2BOSiPtI=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987d99 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YACaR29NCCzKgaWCTnCioZHtMgCeh_4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXwLIKYrWobGiI
 nLJZgcI/9Ff7Rf0rzxU83L6Q0vP//9FCKPYRSA55YvmOG+Jqo5NOiCtpdaR4TPGoGJr9J1QLRXH
 QP/XMeTFexbr9Vb2fSv3iMn9YTpODbVH9RHhF2eUaEd+xROrtuBRr865bMfR/4MD8ScnqZxtO2Z
 hzZ0pFGTU93RJVzMPgMHkdkZXiEu+sI+1gymkkDrVsrfEZlMcnhhLAeupCwQtDA2RkGQOrnS6EG
 5LrJY3GCaG9auBd3rX80Yqeht3D/+MeBB3HP6xi1CgmfZsBcAI3ejWzzuhgzGGGnH9MmURkBy7q
 bllzajL5HXC1nrh7jYCxTMi5H3ilWWnZIqpxeXcbzDikLde1twXyNE2YdfGKxGLReNu8QjkfVI/
 aXcgXIZJlNEe1D5StXoAS8Z8CzPz6vaW8gfudKIed++UiREBGtd8JRMktVesLHax+eJcsl6Z810
 m3uKmScCvxFN2XewMbg==
X-Proofpoint-ORIG-GUID: YACaR29NCCzKgaWCTnCioZHtMgCeh_4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124841_518804_F2D383AA 
X-CRM114-Status: GOOD (  16.27  )
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
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0


