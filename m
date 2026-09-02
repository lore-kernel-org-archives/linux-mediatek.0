Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B49C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=; b=c8M3+OMfEOacxWLC0yIrRYAsiG
	0AdzHQFH3nWtAEygzZUx09kpKRLtn8hDmZ+rN56skBIA43YXrsHU0hOW27Ni7zYY9vnrti1Ox0CPk
	tywUXRMkjUeu162VVp1hsGpXmZSgyYEJQaxggc6I4UwFiB2pOafj2pwv+a68iUtPOhZh49aSTZ8VN
	vze9u0yH5nhFUGf2MxtcsN4l7Daj6cB4wToOENw3DF3ygP509f4ar/9vgC/sVguIcVs2rWDQwjRy5
	v9HO5FTZEF4lxdLbqTDnUx/ag88Pf90NqtRfGPMPnU821MOzXbU2BW/kDYrS8AWVdY7iZqiIpHvG1
	E5xqYSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwR-0000000FmEl-0H7c;
	Wed, 02 Sep 2026 19:48:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwO-0000000FmBp-1kZj
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsJws2732010
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSI8nDh7SJ+
	4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=; b=f9MRTSDk3pl+Xm8LGcfZuQKkl63
	lF4WIoD4QuA5qHY2ReiJ3flaKBMFAM+uThec/wSWQz9etrgHEP6tcXEs7EIYFTBh
	dQ0XAExdAxSd0Duruih1RZkw2j8DFjKxqFwwSB/cg41jyekNlPgLBHRMSXLzVv6a
	qNB0MqF3nOAPv1KcMcAkOq6XyOs70W0/W2uWqLOA8jspbraRPopQBI0uAcsSQFNO
	DB9YR19g4ijdhghltd9v2NaGxrrP+gFRElnvS9D5ZrytBDsHs0sEYPx2B9JO8LLr
	rw936RaWCRxEbXgs9M4S+MMXlRqiYXM2BfyV/TQjHL7rBfQ0B0+MzlcUSfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2pxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2153176a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378490; x=1788983290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=WITcsbPXT0dFWx5emvs4wnUsiPZ1vOdFkMGGehyB4h8LRviWt/kMXZrHZydumHh4IA
         QG1xCl5Gxzb1s3yPjFnG3cS+qbtXYJdgqFejY2nNx/Ay/dbPn7/lVw+0SmpxDlJ/iVXM
         0aTe+dmLUfoKI6ht9fTH/Jy4jyPzlcvmdDakqy0VHEJvCc4MPfDzRmuh0tCPOV87s3Y2
         qu088DFXw9CGeRrgYg9hTXUd3NbdGZOSWpAGHRm0ihSgzDzxq/y+2JkIyoujSIR/sfi9
         Eiw98X0b1R+lBGzyccrw2MY7q4fBuDt+/E7q33AywrLiQ2rDvnPXI+DtCh6jwreCrHs5
         DPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378490; x=1788983290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=gNwrutpp97wzEnkticpCWhjPKpo1CkS4iQ0rT7ERaHpiLBDK+43FG9K7pQxQn4NcVr
         yW5GduU9mOh/S176ccxzpkLO1oPmmCitOztt8pxAdaC0A8pq8GYQRatDBlkfwLDvgiq1
         MvmxebKQyOIQUe0IKIKntmRARPtAjxjCJuAOt9+3tEu4AMS33bC5aQOcxFgeU2AJ0jl5
         VhHPdxhIiVKZFI0d7g+YZzaCWhbt3r3l5iez6FxJ3Tb6F5+ikaZAaEIObinD2LOKJsrj
         EDIr+52dfLyhK1NJ9hjJZy+NSOfwwKU9nHuQt2vQeU5tcOhOsMVVzfsUU7JiwXVStYqE
         jjXw==
X-Forwarded-Encrypted: i=1; AKwUvBx5N82KzEfrZcXHywN0+DMH+peBeOMjfvSr36Kps5tTGfI/c4nLu5rz5t76Ngr6zuOHbNGw1RmHxrZSLOtnVA==@lists.infradead.org
X-Gm-Message-State: AFuF++nlwRtHHicpOi2eq08x/Mbf52lOyeCPmVx5+0ogAv/8SujVhDWd
	1RMwmVF5yX9O5Th7dgkniIRu51jL2h9NkxwznjoR93zAGXUMY4NzFeL0jx7K/VOJZ1KBmhULFtE
	TRPeg+N9PL62LPmTciX/FxzQTRTEk8jxlclvkh6FEQL0t73+dQZ0Rf6xV8LrokGAPImkVQ19Z44
	U=
X-Gm-Gg: AYBFou0qoCMEvUDxHoGcYupA/Mx+sckKZQimpyGybzT26hNxkVOShIu//glL//2smAH
	luKaI8VNQI7oLFIqfAoD7GadzXJ30wmNTmEtmFB8o62dPGtWfM2qWuZtGTSV2JMQMiYlf3UY150
	wA65Vsc7KiOjH/VcDAfhb/O30JvrZGtFOL3nmLsu4KsAtCGdgjTfwna+4g3a0FgmqYsBiu09uh8
	CpqOUt2wFPZOfvaG4wpShph8/b9JMFdDAYGmpkPtQwzqW9fBDlig8aOP1WYouQ0szI1h5moSoJ3
	OXJbo6w4bWx9glnkjqW+g+Em5WV1jjmzQ2tG0vrve+cFNQ+OqcMdZuOYF6IRqJw041N8lAVHg3c
	iOvQ0cAESvV/wLhPZ7BgLK7yDon4=
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442675a91.25.1788378490474;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442629a91.25.1788378490006;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:09 -0700 (PDT)
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
Subject: [PATCH v2 6/12] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:06 +0530
Message-ID: <20260902194712.2003414-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987d7b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: cXSZxa3FLl0oBhw1dMEAUFx_08apT9Ow
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5mtcdiyUGWwj
 LGGe5h0QCcND6ZeeKsnz33cMaIu50gEMk51JCwa7I8MdW13947izEYyrbv/+pPaaZ67wTdaJ9Q6
 RJQAZbp+04F3TDXqXNU4oyJOU2IcfZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4vF18Y98BZkS
 MaUvtDoO54b5orKGPGd+B/mYX/9NsEjBftCeOvAmE7dvaKYcQVoDxytj6pqc6UroeprS5SWdOm8
 /dY3uezFyDf9HGge5LyncdK5+piWs590yxYBfnxnJ+IrlCHVNWeUz4pBsfc6XwdgMnh821hugl0
 CdG0qGOeT3tl/ip3GaJcLt0g1Bwvg34Fu1CEKINyg9frZsbYn0LG64BtUh2EijKfKZWoDXNieye
 NsxqbD0AQLZR/b/o/cex8fksLT1T1e0PEGqkVY9G+93m9pPh+a92jLgjbB+CUx9t6GIDTFWYMJt
 TLhqyc7rn4pkI5D5wol+uXh0fcQnz5dGp4RkSNeY6VprqfBJGXguYw4YCatRHEtUmNWJWUKB+ND
 NuprPXivxNSOaeM1I3i8IoCPOq75c9z3lbNRoRPkzymFg8EQN062PdJeOf1LJHgEakGx3n+IW5H
 HmfLweCMNUU1BGzBAUw==
X-Proofpoint-ORIG-GUID: cXSZxa3FLl0oBhw1dMEAUFx_08apT9Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124812_576490_86A0D939 
X-CRM114-Status: GOOD (  16.31  )
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
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0


