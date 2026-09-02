Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B7AC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=; b=Q4d8k9NQHoJKA6NvGPQHLxSo0Q
	0B4AYKQ4RfD7gsekt42vleVmsSfHtZdGZ9Q7adHX67VuI3P9zW1VFLaEK8oebyDAgyfz6m1SWf9no
	tj2rDo0Dkqy00Y2srvR1UzZ9AwWjRzdSmyH3KAOUhtVqmSdNMsjdPtN+ZFDJ7cDEjtqBG4MuTZ/C6
	CRKjDGpwBeG4JyLFxko1oMd3VQHguUl9Wi1pWxILZoTEKvRJfgsOiPCVZ4UtDEw3hEHQJV4wUDelS
	Kg9ebCFhzucx/QQgTWt9TB9WbbV2WhIbq3toHsI1R++MjlkGpiWK895alFNjPHCjUqb0MHs5UIz4s
	iysUNM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvh-0000000FlfS-2GMG;
	Wed, 02 Sep 2026 19:47:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvf-0000000FleY-1gVZ
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqwRd1586170
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aE
	nLgC5tuY=; b=fYKBCmKETr7hjhhElQ5bba4aeQ4CySO3kn9whRMrLELxcvgS3wZ
	TSiAe9qgWuenbUOZkYGD77ESL8ouruX/1nHHAu5DLzTSHzQ4itIpkTs3q3U/fyr1
	h1us0XQXNXIiaGy+VGJ+Kqbx+mdqi7kMHTg961EXjuRG7IS3cAjaIUmeDKXeaDOc
	0OFEXE0RinY4vkixwT/0CaNFS1uRG9U5Fr4jD0TJ98Wd2tWlY42E3VlcvWvxOrHw
	QktAgLkFUIjSVQaTNb02/6rTGonvIIAIA6vfcV+NPGFerUAITiYGt2xCeDUS3GRX
	zFQolpjTwPXCZ4x1RdoHfi3XCDrMQMiNzVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01tdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:47:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2976170a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378446; x=1788983246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=VBYu6evuJjjK+Gnl1XEGodigKjg18MHrnHrbKmkKr7SnNHULmdGoEQfB09hZ2Wcvg6
         YVdzYKnEPi7hsUsGtoVlyYA6UiKH+uh/mA2l+etm+41tQDbHWDjwxha9a2Dbw2BvdY+h
         5XIVe5vdfjTVMGVxTiU2wzkqpiJNsM4iOoO+dxWNTU03O0auTcWMSbVgSlQETDPdjsb0
         mzLHcBaJIzvIIrsdNIctxc2J8QXjUSmT/pH6qEGdNWtd1AXwy8EZ1FiEtTmj6gc7Qu1p
         fDRdDT7ebByMfDQOfkS4jppjBVp1xZK5lT5N1s/enkcYjqH+vW9Md0tE+hFt2sfMmGdA
         SmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378446; x=1788983246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=SgzfzKy8ZwdSMmktWxqBbdpXVG3KVYn0hq00nZHTtjba14QMu/iIDBfXjVwwI3grrX
         ne8JrfmRwo8SvxVDzeVS+zvjneD5UKIzLQLk37UvZOhSBgeuAdpPLKtlc0CqPULsh+lv
         iFmlTDcpiekx/cEvnqBtxf9fXqckxlmdYpVueQb+r4w8v2aRqtANi+Ov87Ok9bt56SQ3
         /zxJLpAc4dthaxWDr6I5wLrnleCc9Rj7jEaYzssPwhrqeHcD2nIzujMDRHbqEf+jtAUu
         YMW2BfR1yhg4HoovH7vT0wq4wk5ZpQiiqidU7ZwTWB5iekvjYa8x3v/VPEPwMRzDPLdZ
         tLoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8oigZU1KwM6SpdVUXoHHWgWk7xvfxOFTXEru5bX/OphsJZ39lzM6u3qJKQ1qjTIqPGQWzJkdVkxH6f1/DMw==@lists.infradead.org
X-Gm-Message-State: AFuF++mh2YZsBNk3vgfOo9xWURuXzjaEhDccMrU4Ifez2hBHMfFyOf0g
	6gwoBnOE3Cl27TTrVulkABpyzRtm2IJKkeac4WOFojb9aB1Oe7+ags3s6SpzbMslZqQ8TdiVYO2
	Od8rfsnA7uesoVR20N3RF34nluiwSlfjeR9To5SbgwNL0LLbTUNvz6KbPQ4iodgzEU2Od+Iia8Y
	U=
X-Gm-Gg: AYBFou3Vv6PPmHsdEBh6mWc6ivmjQjECA/HtrENt6deIK8aGQMcNVoe4sqsmlSfzYQK
	r9+1M+lf1rp1rRGqcOy9d1huJgRw3QsQpKIHowZq+CnCNDI1742mfNFs304xffqshDxXzspD4fp
	WI2IJ1LAtJtOvc5oQkn0foax+DpLIWXbfNYbMibtzTpvgRvkp69FYm9h0T8Llb/fRhz3xYdK3Yw
	ABGYx4Bmkz/Ewp5ySB3jJwg19BCAGzmG20BfTTqRS5Y8wpTd9rMu4hRpgWphnv9CQy8lRzPipDI
	w8B/AuxoifukXIUmLRsrrtOXcI7uB/N9CAFZV94iGpOlXtUsWcMxyS4XjuRFEgV+IMWUG/m7/KN
	9imLrleJu53rsKARmT1HpuFKdQo4=
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917513a91.10.1788378446088;
        Wed, 02 Sep 2026 12:47:26 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917460a91.10.1788378445546;
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
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
Subject: [PATCH v2 0/12] ASoC: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:00 +0530
Message-ID: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xvhd4n9ZaC8yKXfmCX3nb3F6UEfpSGcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX+jl9bSbH/AT0
 EH31I0AZbVNT68+xtxcSSBL5TqwbOrEOGkYcBF90Su3PxU8lFrZXPaxDK5Ue0UE7QDTfBYMzih6
 WjKQdcqqCGPmJVs30KYD2X9MpfuKvGSaX6PXpFsVIXdQZGKHv2mIjFbf28DXk3B/uRqhx3t8FQQ
 NXnCRsmnqNX4NjJget5KqH7XYGbKipEs1EkO8XIYOaPxTAHk+IyyqISVe39lyPrjSvvBD8NUFGx
 dIb/drkUKz8tpbcTD0MXMEkag1b2oojQ5RKfHm3pCDmd/dFousBWoZHnyXpghQH5eSeEjAyh2QG
 x4bQgVtswg+Pr0KiGsZVzOilmykhV0P9QRX3p4C2OBsbAjXH6++2xHopnYLAnMzfqH46GhMavlR
 /aalZF7XXtTzf3PEqlH8KvPFn+f5ZN2g4PyGO7+sy7MhrVaieQyWHF2C7u7tZP+MA9sNmPuC1ML
 kAcRa7BTAgqX+9pGXVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXwPLdYMJP27hv
 X7d+AfmAlJsDYurP1dQhuFrtdlJNCQUpXvCFk/tjEl6xk4iUGviJMb2/EP21lQOKrQQTuMN51aC
 zmsaYsPH48RtjOCU+qR1IBPW53j7BwU=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a987d4e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x_sJgRSeZ0M3cdfWgbwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Xvhd4n9ZaC8yKXfmCX3nb3F6UEfpSGcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124727_466107_9F3C309E 
X-CRM114-Status: GOOD (  10.85  )
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

Several ASoC drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. This pattern is fragile: any error path between the two that
skips the release leaks the reserved memory region for the lifetime of the
driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
ASoC drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried review tag.
 - Rebased it.

Mukesh Ojha (12):
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 sound/hda/controllers/cix-ipbloq.c         |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c     |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c             |  3 +--
 12 files changed, 12 insertions(+), 71 deletions(-)

--
2.34.1

