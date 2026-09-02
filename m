Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B03EC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=; b=vHgvk6Ybci+zDT02NYxZHLLaM9
	8KtPKtoKylwSJOq/DOQhivptmuTKNW1P4mP4WRbM+qC+E1TRrMfP3ATcmAv4PlUgIDM05fCkKyULF
	ijTmzwMGVuoA+QdW+vQhwGUxWuRn6uQpFrVftS7fGq5O6aMrhAN3wubnVpyn/W204Du59JT5eNEA1
	PEW7JCywADWvpUsbFyUQw6Q7VOJv/GFqa86mRJ7Hsq3ZjiRX8jutyaYBcRtO8lvBXr4Fz5VYoRaGc
	121ygk73y4FolEefOZi8+U9kCX+H6c8FvCLbmTseybEUzAFfW2sZFGXQ/tg0WA4mEhMonyEYAHFEC
	jFs5CwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwY-0000000FmMH-0IUE;
	Wed, 02 Sep 2026 19:48:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwV-0000000FmJR-3QDm
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsPvA2485892
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kbPay+R8Ceq
	eWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=; b=B7olY2gJGSIpj2fDG7L2gIFqQ6e
	JT6tYIqewvY8P9NfqErInwKfDOxU65KUH9vNSJx5G2VaxyA9ypw3cZle1gWc6ULB
	gwBBO249bNezUJRRvS73dLg3cwzIdBznUDugkYJIFuI9xUmaMJEysCaimOoCaOek
	i0ifSlEgcSv1cZwp+veeS1PeFh1z86k+PgQArqsL5ZkhfBKZNd1cKiHW1OVacwWK
	dH8540V7hmM/Oy3PIQGTDkGKCxqZ8vjwXZDkMDzoANPs6Z4nlOmSjRO+TN1dmr99
	hdB2oGdoSz38s6Nbqu7u/0FJ9lrvOI9wXJ6XQQv1j8dh0B7Pp5mIduLIbrA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9m9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso34344645ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378498; x=1788983298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=SQc4V96RV5MzjjzxkR5OtuZ7kC9wK104VLSjs9kKPGTXz8tBuyGaRPNV4A62GRZq0R
         owSUbN6Di4NzvPJB9WuLl03R+d6j/GVYoxQVnxb/BOeH/fU2ugWzmLFm7r7nHpmhhxv7
         S/HvXcqSbwHHd8C8Go6TDByS1sbD4ZrV/bbbSSY1Kd+qwJ8pBzmOrmnnDmYQDyLFwvIf
         YaSA2fmAbyWChrj4A6QQbNqTsuAP/sgAFlR2Y6MceoSOLU1B3Q5iUFSXuZd7TB8kz43y
         nYrjMr+cbV8z0CjJDrL9n3WfoPQvqEItGLn3MQK1Gt+zWH0CU5NvW1b2nvlfd976rUih
         9ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378498; x=1788983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=fO6aKdXwf8jkcvmO2204B5g+haX7hYRlyT3se4X4Wh0fgBwJVhOrWyw3XLhrNFAqc6
         j1mIAFPtJSK6kN4sSGUnTnxX4dqdOx3urUNfn+tTX9rT/oMK066WH4sDjycYasUB4OPu
         UhmABe5+uf0dD/Vg9QmclIlNd30FFqDNAZBVIqtAayzat2P00UNNPNd8eHcoO+MIguXy
         Vc0Z+bew7NaQnGNoZzyTSp5UnqAeyDlmZ2IwFUqILOMJF45oJtJoAXHLGsvWmf9NtMUD
         meq5+nfxPGDhN1z91APs/fYMr0deqtVLO5yr0CAusk22ue8ot69NLQDWAdhuey1beN4C
         82ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBypr6Ezg4Z7FMdOZMKV9dUDBNlLUrPTfr8U+72G89uhIyX1Xlv89HTDfRHxEip0SIhotharhHTgbSgNuFfb/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mZL2PK4827hBXTlQR8DyZKImpgZ2aoPtxTlCbcCyXoFzOFrsTE
	aaD+nBE0py27U5GMjHMT0/h1Cz4slKmPJZY6D+eqxRP/eo3xo1DFjfpoX6aoeSU+AeicHElVlbV
	Slo/b8eaVKKUnN7t0+/cvze50YTgWoX9BOluHER1aZqaHtjI0Qd7voNz3gKXcdhWW94frHxOz08
	w=
X-Gm-Gg: AYBFou1+fPQU0iyWwI0+wlC7K+5McuFkIZCIQV0eNP9ywrq8iuSz7SBYCGFornx1HA+
	h8Y82bbJt8boHvkyjKu2CojKQk5vQLq1h3tpfr9Oxb5/ANPuhgaEmzXzuSblzlHf2RQTyb/29Sh
	U4vMEnFZirqPuaqhMDDBoMPr5HUSAsVEH2ccXF3SHZWSUGnX7DG+XClTP1rM+xduqVQE0clJsi2
	dVT8A+9V8h5xQHfry3hLTGAFQNaUNaUw7oi0l4bvhA7+kKok21c4SZH1HrjAO00gDJVXrwMaeTc
	39ufzROZWyxQu3om+yuoRQYMdrPCx3gua5iS3wpMfXY9GnfteGOjPyQP12hkCv9JHAKcmgFXvvN
	vu/OVbPsrQquc10y7vv1H6HMjNg8=
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108998535ad.22.1788378497917;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108997865ad.22.1788378497411;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH v2 7/12] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:07 +0530
Message-ID: <20260902194712.2003414-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u0lwwa-_KJN413bx7dut8Mu5-eDgyLvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0wPZmx3KInzn
 9Ka+Q/6SmvfaKVbjVpKgdfGFW5DNRlEGJkItw/SWa7ZHj/DDmdO1HZ8ywzG0Jk0QcaPFez7mgQq
 wxqHs11HPFhsdSIdT9WIQma0qriWrJ688WwtiQpArCb5QorSLZu/EdwzRRBpbpA0REBoATmfMMG
 +Fh+Redbt5NCghLSZobuFMs+xUx0Hx7YRnRPvutV9/bKdl++Qf9X5Jh/wYvF8tRjgKzHOqolJdR
 bELekebZ/mQQXM6XYQUAUwdPa0BhdMMwqUu2Mj0QhV713RjQQoi0wucD/H0kAUCK8JiS7PIXxkV
 my6tkMaEq1dJC138olF/7p5yrytcyNE2PMc7PYSSLo75YzHj9k8kL57grQML4hJeQcNHua8NdNn
 +Tul1GOZc9TDMaVtTKP0LgEKeTUCJuORtVrX8oT52TC0lfUPHWxSlQ/o8MvNS+elM5gcmG8No4g
 rDojSmCr+Wsott31q8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXzBaQHv3m0QKw
 8arvcK+1HB1jA6zgi1w/hcyyIiH1ws9fCB3W0Hh6DOMES2AK8PzPigt9QSEjdboZtpOWR2Gc+VB
 evXRIsifOQw9/+KeYn2Rbhehqc5dnyQ=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a987d82 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: u0lwwa-_KJN413bx7dut8Mu5-eDgyLvF
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
X-CRM114-CacheID: sfid-20260902_124819_974006_C5DDD61F 
X-CRM114-Status: GOOD (  16.05  )
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
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0


