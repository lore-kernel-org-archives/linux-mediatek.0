Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E0CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=; b=cidmYRXIjqG4s7X/E3jGE3HCTG
	JvosETqV1kXExE7oMf50yrb+ahQXmGGCNs4SzqHOk8D8dxHaRnTZ7NRhKCSdda+f5aehrw5NCTmAz
	8B3siHARZDoyftA9zchC4PJjNwxx2WnNKrek00t1pIHPnfn6KFTlxF8j5H8uoa6DoKoDwnUrBe/tL
	R0Qp5ByESAtFfXaDti9ZagV4P49lTAyBt1BvetDTweyyPAViNoSXso3FaWA6+Xli4tJopwPthNVin
	s2liMDtfMmCUGsZqt5lASUWKnkkWBrmfcsFB8fTAohbY3r3rLf+8EFTVohyloSfEZDVSJib/MBg/7
	2efhESBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBR-000000053xk-3Hov;
	Wed, 20 May 2026 15:50:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBP-000000053vp-1IYW
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 15:50:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oZMK1178265
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c
	0ys0ZYB8=; b=Ua8Izd1gpLKgn5yT3Bp1v8iYrgBNZF+Z/qME/JHhtgBVbD+a+2F
	rCwJOd0poMpHQmal8bncpFwVtH4+hDda0zZLK0maAxgUsAWHdSLeUzhk50GDnCtt
	ewSG5JopZ51NrLEsx5H9WjoWvBtAGsJQUziNXC8qqubMbrc/KRkn71w1Qqc+PdTY
	pIQ+rMHDvoNCIJz6/sps2NffdAvdLLfJ9aY6dLfj1dhklpROIRwn+RyrhI3sM96m
	bUkBbeocfBNuut/ynYWOIbMKkEHDaIHUXQRVMdVCVL5X/0JBDfyipvv7qiwivZHP
	K/cyG34mKBe9TmAddjouR4le22ueWVeDVZg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6sbwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:50:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6443138516bso8344991137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292206; x=1779897006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=;
        b=jpls7Q4GdallNtl7PY7m/aXGFiacCaxh/notQ9dNMKm4Hibk4ahSBKjZRBWf1KNDgT
         /9gojcd+FTYvXoYyQV8FgqggvlVl3N/N7MUAa2kTEH1+U0v1nvbb9FHFDDRBdaKAOL4A
         /M3ivsrUVnX3bujhMGehiPa9VMGf9JRVcfjh+4wTCJzvkAkf/2RY/vXi7PdnfR9Z7JK+
         3TH8cLfxfJdTCWiBwQPDSOriDSBzlMDCpGoP6yeEqwVPKwYwNNUeP7Rv8gy7Rj1n63RU
         yIZWBMt+JOMbSekfextB6uSX4FiOa4UC8tybPzoqlJ8d9+mmuTNNixyvXmU3JMo5SN5X
         t2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292206; x=1779897006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=;
        b=TRDm+DvAne5MICiN1n2Rd/zOQIvQUm5z4YtW8mIyDDAOxbE+mB08MPQvD7THyUljxy
         rPSsl/wzGxXd8R2r66g2PGD4JDCa2zIoBrR3uxuNEkTbSzSMxewvEmtcazwQRCSOiK/+
         33rf8SXIZCeELTzIgWQFkkaRqFQKHWMa5/S7HM1ghgSD/dkn/NukmX8odySWe7+G1pvK
         TcVsJSeXrWcA3nOCQ62Ftp0VR6ButPTFLXK4rqiALpXQe8LjRwBjdQn1A7I8b65ZYrCH
         Z2yFeC+Emfe0UY50YE1SvmZHUvZ7UYm0eMFQfjWnL+wTHi89LvOoWjtRjY+HWlLWRLvC
         yQXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CH+h2fsFKuMu/KY5/h0YolA8Zua7bfNPRSbFwB7Zy9fSHFWFX6F5wZH02nZyJyUbbeu5EGb3T5JCMYtqrBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxPx6MnrxhTT4m4T+hQN0VLuvTdhZfw2ClKYbq1cpbixWqlE4o
	8LYJDFgGC+24cP+UEX7LHgotBXppujcyY4b2okYrCSx8EmsMrkiHSrDm3nSfQ7UQAEC9GqVZH7D
	sR9/UBQu1+doVVUc07dTPRF3qdoZHrd9+9S5q8ZBzR2P8BxoUz+ANpDyzU3GzrWtAk7HocSi4Bh
	w=
X-Gm-Gg: Acq92OFx5fvyV3WB/D+PQ3WSe7pS45RF/ggvaNucCz3XNiIh4Zf1jImJDfizbVqjcyS
	vavPKBxBY5bnh87rzklFivv2+5kZT38vGhH/wGDv7E13Uz1mwndWmixRqnAWgHhxQ9MCYkkTdEH
	KRCELb9c7AF5oPqBUF7Y0sc75+xCSTH2Y04WAwlLmjHMuB8Txw12862k4n7nlzEWQ78uNdZyJsM
	WdRUgo83RFZrk0RkQ0PNALD81S5iCYmkih1sZLXGv0CQzGcwygtbf0nw6QiKgfoOKeKSid0hmjZ
	uBpa/GR8efrAdhtvOqmraqhpfjAR4sbJ4iQW78RlZbdJhpCF6R6cnRlzl5LXsqprXkyCFo/z1qB
	Bcgm14sJ7iqyP55VKdx0j6hl6fStrXPHQ1YIQwU7iL3DV33lE2v6R9bw=
X-Received: by 2002:a05:6102:41ab:b0:62f:5908:648a with SMTP id ada2fe7eead31-63a3fc9c913mr13617441137.28.1779292205741;
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:62f:5908:648a with SMTP id ada2fe7eead31-63a3fc9c913mr13617409137.28.1779292205212;
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: max98090: switch to standard set_jack callback
Date: Wed, 20 May 2026 15:50:00 +0000
Message-ID: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wB9BvDLbrXcjyOj5Xi1Q__KppOZdYIEk
X-Proofpoint-ORIG-GUID: wB9BvDLbrXcjyOj5Xi1Q__KppOZdYIEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX8qOdQ7wLLPu3
 8DpoqYukAcxDX6OIDUmBmVfWv1yXxYrEgWPqt46XD/DEY+fwTwweevFN47KdFgug8YJ3jduReAx
 XsGD8qEUcIPywl78/ItDbOcCShvhXZwtc3pgOKso7GJ1By9zzwnQXZmQt5jBo7Fly/YpPJ6eFQI
 lDE/59quoj3ygSFb3ev3AqirGBleI43kMMwV7LBqsjQUVz5eRaZB6qjikgK/2sKmo1BIm4iP+WD
 PBaLRHOC+NUERKm6+BxnRkPLKWLk0UfAhgDl5YkPNX7qJ+y6NyvOOjZwuHELEtIgYfITS+jnU/h
 eBjIeyQq9hXinBw2w9onE5NEW8tKGI9W/NS7fnf8FgUGDAtBS1nJ6ZpD1VUyrcVmZYPOO+YcE//
 b9v2ADawgV59MTF6YGUBg4HIOWaaSR1aTbJ28X+A92Bnd2FqJxZUxid4kKVMQ226XmOHeW4AiYQ
 IQaLnITby12MvbZ8gyw==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dd82e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=PN1NiZu9CLyR3tTXQRMA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085007_354000_EF5BC1A3 
X-CRM114-Status: GOOD (  13.01  )
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

The MAX98090 codec driver currently exposes a custom
max98090_mic_detect() helper for machine drivers to register a headset
jack.

This series converts the driver to use the standard component
.set_jack callback and updates the mt8173-max98090 machine driver to use
snd_soc_component_set_jack() instead of the codec-specific helper.

Using the standard callback removes the need for a custom exported
symbol and allows machine drivers to use the common ASoC jack
registration interface. This also improves compatibility with machine
drivers, such as Qualcomm platforms, that already rely on
snd_soc_component_set_jack().


Changes since v1:
	- reordered patches for build failure fixes.
	- fixed typo on mt8173 patch.

Srinivas Kandagatla (2):
  ASoC: mt8173-max98090: use standard callback to set jack
  ASoC: codecs: max98090: use component set_jack callback

 sound/soc/codecs/max98090.c                 | 10 +++++-----
 sound/soc/codecs/max98090.h                 |  3 ---
 sound/soc/mediatek/mt8173/mt8173-max98090.c |  4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.47.3


