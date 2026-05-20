Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD9CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=M5uHkek0papE2UqrMUvMsBIdQI
	Qc16qSoSsV7hhe/k/JvtYSm4E3NaN2eAM3qgUY7EBkGrICxlx6FpbVnmHyPGc2Ev6nmplMU1ZXUXL
	RgB3tzAqtKBzIAtZ3JIXp1kfWLfNhMkDCsjpZspw9w8NFkn39di81bTgl1w5nVzhYbqMnZ+E50Mzt
	sI5FIpjdiraQcCvZddj85o7pwFRNNnglM0TEefhFULpiSiAGD/+p9YrLrcbwriEiR+lMqx3GUHMAV
	tZG/Nsrw7hnMCFVodkNLMBuCHGcp30N/92E7OwigLChYLJoXewqBBRH1S+BexBU8Eb+dZa+H30XdY
	S9polXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzd-00000004g65-1UUa;
	Wed, 20 May 2026 13:29:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzY-00000004g2M-3ez3
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 13:29:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7DJAu1953936
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7pajX5xu6Zp
	Ncsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=MrXHlECFBLjHTZEMNa5iWPodvxL
	24qm6jMwUgBqFdPEmvoDtG4vHPTw42MJty06cVCt7eCTOKSSkpZLhswFgoFJi5ea
	R4zLrvZiVIZ/uodjqvaGle60DBYV1vrky6AfdVQkrOqWjw/AooGZAaKsfAriUeAR
	fRoZkeIZyG+ntgvNURJNRwi/cezmh7HZtY1k0EjTIKcMyOJpN9hoMZW9NRZk1jQg
	fVig27MrI3e86i71oNVJHluQ3qeGLgTROzqx7S7GAh6HUQq20ttmDI3/6/VP1x8G
	tLwXmDXpZ/atclALbTNZz0oVg6j4ZNsF/ZkKKWxTt6GTHgy1L0YnJOgRZyQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xvxk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 13:29:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-956804755faso5440369241.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283783; x=1779888583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=Nyv8WXVrjUUa+Ad7A4ToU7hXhbqfwU01xKMniHEDAjuVSVwagaCBkwPeILG+V9+Vfh
         4Y2tMoxQlRKMPvNKADO1vi07HzFsg1crz+C+jpHgDnxt02IU4oY75hTyvnxH0y24mWFS
         i+9BpLjG+i+aR8pmPJDOj8rSaDWQmooVUaT96s3UE6penetRcHPyP9h8HGxyA73dvtHZ
         udtVNNIBjGakowpV2fF5IX7f3jL25npAKNLyObh5b/zP7VwbqQg+nGwtmf5ImeAckLey
         8VHy9qkj4Uq0F2WHQeXVtY16F5V39sku58iU7S2lzz8SuizmFz3RZmEE4o4Qser1gdKF
         yp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283783; x=1779888583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=DFBB2pNcPDcLbgeUVklzgUfPaaj/qZpEEe8YmhnNSZV6//Pfl2XBco1qsjGP0yYGJF
         kZB8AvG7H99lykR3yp+YdCi/HnPR341NbGz5ps+wsixXpT5np7OJ30FbdY8xKCKENcXY
         MAClIGFH2tWQFeO8BuoxTWQzQiEf4TbOhn3MHjKpFZAEcSxvkSvXDsELJrQem1slSvDK
         bSQOdG/wi0YePRJDI72qpcpR2Ti5GN5VhDrlYtQp2zd9Ap6JLOSjpfcFrt6skmdMQZDm
         Vk5srV7kGHgXHoH6XM4qBsyC/VUR6xDjUW6JXfGBD4Q7gebdF6d5mxKkVEevAgxhW2Y8
         +YoA==
X-Forwarded-Encrypted: i=1; AFNElJ9tw5akRLVPmYiZa+hA1NrDkSp03y4SNbsOlGCLMzor7EwOx5MWafM7A5pmaVFQnDivUHnS8gl7D8fxEeeAgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya9MHirJrVXK0u2lfQT/gbin+XGqpnr3iSIdCO4PcYP8eL8FnF
	91p2MgYySPjQH5KgPtoqHCJQHDCC7ru7GgTCKpZSPEFLPWBKKn59hf8bJlZm407fuiJFmPyjbcJ
	5ujDbZv277K2bGNSJwFZKo5Jxyi+atZITy7h0FMHuhv1KjE7sui3ofvCQKd1NlQG4ECx9PsvW4x
	Q=
X-Gm-Gg: Acq92OGa0GX6NLee7DlPvOC3KrxuSgvC390qqa78en9Jh6PJNG5bLfNHeqQXYtc+QQ5
	EDH2FTqEqvQQVeWfgrWw8AN2R28GFCgt9W3oI60Zl4+9lS7fRyy9FeCCF9EF2F1vMA6YFL0/QI1
	GRZS48YdzdOVoGl+cqs/u4wNRZ3mNKV8FEiNbcSJ3IiBsfK8Kc0LDRT8/3Il/Tac1Fyzd1PVTOA
	9zpz0EJ3bO/+WLaNivYu3oCL/eEV6LNOBEU860Tq+Bl61FNRCAb/t/MHgmQepguFPgPuPK4do9D
	XmD9Ty/oWOTM/4muTElGC7OsBzMWDAWRINnw8t4gslWL7FC0gj2wJ2u/2HEK3pAG7KEjHFyc+py
	ZDr7lhVy6EZX+NsGq8gTJuFXs7eoq+/zQcJzJTx2ax2T5av3TOqqxg3c=
X-Received: by 2002:a05:6102:548c:b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-638b4c525bdmr11312674137.4.1779283783508;
        Wed, 20 May 2026 06:29:43 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-638b4c525bdmr11312651137.4.1779283782985;
        Wed, 20 May 2026 06:29:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] ASoC: codecs: max98090: use component set_jack callback
Date: Wed, 20 May 2026 13:29:29 +0000
Message-ID: <20260520132930.54333-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0db748 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yuX1osHPGoIBqVCarmwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: NdKCnS1p0NEs_dNgajpiteCo4h9qJpuF
X-Proofpoint-ORIG-GUID: NdKCnS1p0NEs_dNgajpiteCo4h9qJpuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX8Lv3r5p86s3A
 vNQAOJfRp2bGFWHbRdz/NAIe13NaFtpwFy65JPs22xDetvxY2BeNGlGq3xnY13OB1vs+C5cU6Fc
 qq/oSn5KMPrb5hYoLznvIcaGbkTlwATlRwamZZ/zjzZ58lib3As+CqGPqOkWuFJKGWt2/8ZOgoG
 zdOt6C14FqICOy1+FE2mHI7s/HVA5lHO+2KYQjEp2fxYL8I1enYcImaa8th2yEhrZSQjUngBXI6
 gSR2w72QC53cg2JMACHuVdx6zZ8XKfvWyL598FfKvHIjzUIpJAAPdN9vsxGbIrqlYlNc69EYrPW
 UhMWOUHN+uDP4Md47sYypntf5OGPJw9803CjHVH1lyoly/DTXp7oogFhz9KMGVaFkRG8Oc6CV2C
 IgnOSYLhXOcmhzN0NcUqRBrJokqS+yCpjXtVe/RtUruVOdk2yQTA3notW3aD8CagiY/WCMuU7Vh
 YF+RDSGcxGvX41PRkxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062945_014851_3CE7764C 
X-CRM114-Status: GOOD (  17.37  )
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

The MAX98090 driver provides a custom max98090_mic_detect() helper for
machine drivers to register a jack.

This can be implemented using the standard component set_jack callback
instead. Doing so allows machine drivers to use
snd_soc_component_set_jack(), which is also the interface used by
machine drivers including Qualcomm ones.

Convert max98090_mic_detect() to a component set_jack callback and remove
the exported helper.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/max98090.c | 10 +++++-----
 sound/soc/codecs/max98090.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 13a15459040f..bd3bfa1d3402 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2337,7 +2337,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 }
 
 /**
- * max98090_mic_detect - Enable microphone detection via the MAX98090 IRQ
+ * max98090_set_jack - Enable microphone detection via the MAX98090 IRQ
  *
  * @component:  MAX98090 component
  * @jack:   jack to report detection events on
@@ -2349,12 +2349,12 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
  *
  * If no jack is supplied detection will be disabled.
  */
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack)
+static int max98090_set_jack(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack, void *data)
 {
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 
-	dev_dbg(component->dev, "max98090_mic_detect\n");
+	dev_dbg(component->dev, "%s\n", __func__);
 
 	max98090->jack = jack;
 	if (jack) {
@@ -2377,7 +2377,6 @@ int max98090_mic_detect(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(max98090_mic_detect);
 
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
@@ -2554,6 +2553,7 @@ static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.remove			= max98090_remove,
 	.seq_notifier		= max98090_seq_notifier,
 	.set_bias_level		= max98090_set_bias_level,
+	.set_jack		= max98090_set_jack,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 6ce8dd176e48..048af4a1376f 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1543,7 +1543,4 @@ struct max98090_priv {
 	bool shdn_pending;
 };
 
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack);
-
 #endif
-- 
2.47.3


