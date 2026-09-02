Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621CC624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=; b=BpjYRQ5M7RcEG0X9vKKcTTP3As
	AJeRDyUk4Lg3Ni77SOmUfdsrnK8qv6uDu2i7fOivzgQ1mEReSVHQ53/pjlWMGDNJY4dYM9+bFeP+K
	DY2ZDHIXAd/Q20z6PCkv9aQAJcYDQd2+VDBqsOBSlZF7ze5d2bQZy6nBYRcJZgMfD7vuTfJIZoRAy
	+IM/8XxJddM2ym1HcEl6jAbyuYmbOvnRN9F6DF/Ovac9OpIVI/jiA17ZocrqrUxNjm3TuyiNryOzY
	5ZA7fnbLKq0h0uG2YM4eqotVW6Kk8gDxuhuhKxxxPFOgbQ+nMC3rmDPYZA/8OwIMCZfmAi/bwEbV6
	+ku134eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwn-0000000FmaM-1TnH;
	Wed, 02 Sep 2026 19:48:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwj-0000000FmXM-40V1
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrG0K2270965
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCAbiQWo2ly
	p5N5aXBBod99zFdzxpccudIxmZh2QJ6A=; b=ETKoXRVhyGlZ7FSeYvMx5cgXRNB
	WqQbi89Xz6B6oNYmiWvwW6ZuHw9tz+UGxqyAOqtC8N3NHzZ5X48vlr68HYScqyav
	XWBvmFFBIjiifDXHAfhHsKtXe0VqEYwm+cPCWjDwmsgXLIRKWPcmqs5rCrvJ7qSq
	bpnLfc+S8z+HHPQ3Tx68AidbKngkkBHbye76ETr2t9S1Qs0jsncs7rw+4GTcYUol
	phdh+AGV6ks6n/f9jo3HWZ6Q4b5wRhnSCwyt/YB7sktxxcP1rpBk7wSsg5MEJ4a/
	9DYFvXF/pz6anNSb6fLzkkYkvYBaX5zS8a+LMGsAlcawlsY8Q7EpxgI9u+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cae0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so23019185ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378513; x=1788983313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=GdGU7Zc2aEiNr6StTpfsBIUgY9S5U2eR9V763Ud8V3cOMh5njN1W2oAhMxz6EOPhih
         qZeH4gtHqjxhMpf90tfaZdevAbzXmSydpSSfp5j7bXwTRET4NpIaejEr87oD+I+gN3e4
         2BdY8PGs4IwaPX9wnPxEyVH75+3dbW7nrNkJKoq/aOEvafPBp2Mf0V4leZN9CtE39yMg
         b0NduUm1y62atglfTy3WNtwxSaBNIAkcaqiaANRXPeJZHDfGj9Fezn0xdIzijCC+Zbjv
         U1W/17lWi36A6ka4lhLQ521FE+axM2i2oh1y9wij84c7tvckJ1sHQyTbVwhrBJdKsNVF
         Slhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378513; x=1788983313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=Uk27+AVpgofAEohRhuKSITpyvQ1/N0PYC2ikI6Kbnf6I11zcUT4mbAPX7E1sydoPCk
         TanUsDvvqCR3sngE8cgyAzBoCrNZ390GqzLx2PA2K2VldS9VYEm8pByii2VY0V/5vmVR
         3Dl2kMQtBCMyYyurfaQUVQlQDzzgiy9vwEtkChbT36h3fHFPkqpAHP3GYCeAXMJwDvzI
         X419JUbLsziX4leErhcZ8jknu48BsbP2ioG4XKLi2/bu2VaPdns8Wy7L6LEggD3Inmf1
         TMov0XktdlHhpdwhaLWE6F99YtQJsxR8usjzQvafyyInRje0yvrN2g0flZTnQ47v8cSt
         Gz4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzC4g+r4dH3GcNgE22+DKvU1YYkdgOxNxFzHnqsDI5/GBO3i52s1pu1wZbvFMLIg8FKaM8A9IKduw0dDX25iA==@lists.infradead.org
X-Gm-Message-State: AFuF++lJ0LKnftDI3/7kbYpkkX1ESWMKI/RLwXRK1RDVl1e2PZtFTPcR
	OwWkrvRn0nLx3vqqQZRZE/R782nD5xEPT14tjTJzPM7Tp8JPi2sF/t7bKU9g6JiYensU5NxrSn1
	RaAG3iyVIucF7Z+9NMbE/du5Bx1FLZQ9JpvnhkpHES7jYb9qi/q60Zwn2LnDhfStMB0wz4HlcQ5
	Q=
X-Gm-Gg: AYBFou3XWgh+Z4sdmWygl0HQFFpEGoyS5Bb/mwHdldsQKUIk70gcqheK/PCb2PzYIn1
	yPxsabMx0Dl9LnN5+nRC8z9HbTau9KRieyjY7EiUnRsQ46FcJk9ovyTLSGOsYh/y+wiptJJZw3h
	K1nMvVFbBZFkQWWr2Tn0tYbcPGZ1VJqeq8MBvKEnirmuXXSbPhtvk7HIg2b6uVx//a2KDcU2xmh
	5vTypxQ2GgummedCqLFsQWk0/djb+5AGGIcGnpYM9VXjipM+zeyUkpMIfTw7J7erpe4ZQVpVsRU
	/Gx5+a+P/D0m9APUg79bSHooECgUw0mLpXRGB9Z+Er1FIkbicJLp5CsE/pA6iM4wykSQjQGQuvC
	bu5ezdkfoPuFAvYZb7GR0IEV22r8=
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84258165ad.0.1788378512834;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84257705ad.0.1788378512363;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
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
Subject: [PATCH v2 9/12] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:09 +0530
Message-ID: <20260902194712.2003414-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXxjzm0WYSEXmk
 F+Q9E4FaPG9tztIu6kfZNuNlYL/WKnc3YKxDj/Nw0ww4aU5AKK5h67kCiPefgRzK05xIUBPkBKm
 4zafKQHFKuG9MvtIif1p72wixEotl5I=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987d91 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZVOpzVCTjiiZqqzWxwdc_hECGbUsjGK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXxu/3CceJVh/n
 ghzaPnddHaTeQPq1Rz1LA/140VMST/bkdmg29WcRcF/P6Jk7Wqq1MbQRcglpfSwVq6eoLbpqGLQ
 KOBBFS0AVTC7RjMzWBu4pDtMCXIwZq/IhLhGY1p8GQhq1KQ29QH8jG6ecZQX5e0McJ3LJkR7NKQ
 /aKWFoesQi+Nx/vm5Eqnn8gp9RJy5K82ObbmhLE+MqHaid7mt3Pacsgnq6acpiCxOybvTQwtdz/
 Cz51YvStfdLqxEqKe4ejfI3nYOGqip3VEEN3UCSXNsbGO+o+9q2xi5CFqv69OUVsXItxBzABY8J
 vWEwDDbYBvvWQ5EzrikXtPGWc5X89gXLG8Z/sbdNrjkMOZMO2L40dcYiD6Qr29tuP0aMjrLdhSG
 OsH/ILQphuucsTXq4hDV/N85+Ww9VAggzGJ7xJAJdcu/bXKlaJaWvYFzErz3BlPGySDRtgTpvVx
 rUByEfjHUVzlgWgYAAg==
X-Proofpoint-ORIG-GUID: ZVOpzVCTjiiZqqzWxwdc_hECGbUsjGK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124834_001587_DC067532 
X-CRM114-Status: GOOD (  16.20  )
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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.55.0


