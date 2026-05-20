Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C10ACD5BAB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=E8nFPcQoIve16a4xr96GCS4WIb
	Qgp4npmuiX6jjH7hwUT6DaltWVkUergVgi8GDHCVIGDo92vBxrWLuG/AxW2JbDcNtj3HNWa/+/Vc0
	lvcNIgb4SiO2IPa3T13GOwM5aTxe4ARVVhaMVpr/ioVIwiQw5kzZDl2Jh4UzIdUT7baoVR+60HPs6
	UP/l7g7nlnUtncaCmS58YF1421GZvUryt9KNlsfMFRrcgAuollmI3ip1OvxVzLA3oBnR9izwesPyS
	aztXADT4sfHt0zsx2PsIyc+WoDU5AWd+8qW3/3vfyMBZIGDY/35A1iz4VWZk5ZhZPm9iCLIB5YU2Z
	hMc/xXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBZ-0000000542s-0EOv;
	Wed, 20 May 2026 15:50:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBT-000000053z4-2y50
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 15:50:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZR463084906
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7pajX5xu6Zp
	Ncsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=ph0F43BPpiJ3LSL7PyxFoDj884Z
	zYdQ6LHVh5DQADqWnvGTquoS5NYVMLmTSlWoOEjvqxzS7r6u9L3S77BsFL4JYdt0
	YqCCbrGLib2lrUqLMyi5rgLviAdrD4XrE4/bGbG99H1uURi7jAx2toiMGlxLkHFi
	Ens/6Sb5B4kKoVS3TGhaHGS91PnxY9OOskTWtsp9CpexXacnZjl3hKSwdwWmiuzE
	keWwzFI8xPvj0r618tNgu6hSsm1awffSgbn5izcpuDcdAcuXRcKU0tMbTRGdE1SB
	jNQ+a+jzDw5sIA5HjOGHG1KB7xSiR2n1VAhK9QEqx3oXy+XgWpfHXZDPfRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0yvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:50:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516458449d4so38094781cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292210; x=1779897010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=CQtYaQsk4cY89p/vZGleNc/OKo1NSSiLGED/yC+HZFDKNHI0ChlVmwUbJ2fqqH6rjn
         LupKQT2keFDqHBdLQb2CEAHMkXi9KBoit2BOS3IS+RndzbRjoovgQbIkHuPtNqRnKKoE
         FeMkBRzQhs+Cl4b5WHeSIaI4zHOzPBQBPmO/tqQiQqEVfROGCNnlSQjq0c9kbm1uMbUL
         nicg7psLhfC8nE4+w923M9wx7rtxNLaETqyz/ffmdlxBBcvZ4FqASjrkqjClLXA5leLY
         trQw8aPsfQye/61rwv17wdo5DNLINZE6CcbeX8a21gpFil72VNEtG8tVGe91es7/tAMZ
         ouDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292210; x=1779897010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=dghhkgdIVMRuTdxW2jY3gxrpjPknMCW3cw8hfL+JwitLQdWQSzUVGvsgFcL/3iaQKm
         F5tt3OJRZne1cOsDhoyYPTKfmIMhCXHV2gXuqOugHvgyRdNki1oaMfv4osHt1fvrc7Z3
         zyvFiKDGr5yvkgH3K3rQOqqIAlbNVBr8JRbCvua5w16jEK6dSAg0YjfBEtN0JYcrGw3a
         R4rR4L137S6eQVJoHQEljJup+u8E/9JwKMVTQQlMHEIxux6nggA+BNoucjkSDlnuVIfi
         hA1kGVmAXRQkBhpPJf071W1v/kVs/C8Azhws/7NMRUQx8JnkVZoWvrDlUhatYAQ2tLxV
         eAeA==
X-Forwarded-Encrypted: i=1; AFNElJ/Cn6xpq27cdvPSxb0+Uk6zIHU2qMsgZ8AigERptMdhyb/5bGHctKX1Ldf4rwl9oVdXxlQT+R7TRW1pN4sUAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3NFsDbAxCQBrw7qx7miLeHjdGGnDv5d0CbnyQOX+dp3cNGBv8
	ZI87kju6mvbVXUoc3PeNbZwmmvScMjFeJMChK5+vmu2utOpM8qjCdgc0cHrBefl6gFOyKRbwOTF
	lPRGJUA2NOdEPYf+9kTODTVwpSnGARxZaBcqMKIpf1+L3loYHC2esJAULvEqnSzmkrkkQreMA3R
	c=
X-Gm-Gg: Acq92OE2dgPJBXTmHYz7sSlRgzXCTrXShoQ4L3vcktwgm+vW5nFeItgkkemMAfacIRx
	0UrHAYSKRR/JSuPq/igDcvS9jKSTq9U/zRV5gd51/Ubcuoy/6HkCOrKuNYbjVgfVTT29biBi6D9
	Xm5MYXgdG9dDUyH3jp2yBAz/yqkPvxtiFfwVVJm7jG/M764u+DgEt+8tD6C/XRe86iPl5L1nde2
	x1Z/RLAfDzfb6KakqyEtbeTp+ZDRBz82A2nQEQ4sIXJD3vBH/O3H/QAfiL88ZSgY+MgCtSlVtir
	Bn98lxvfvC5MRdZnH4RFzek1XMBFeIzM/LLiiiZa0uOsBzOjXLIZ5yvsp/hJM2eQmcGsZaKwtBl
	gm0Fzz80PmPQBs1X3Ptg0RdLXQKuuHkQjw05SkK9aK6FXgFoIhmaPY9WAJQ6+xApwpQ==
X-Received: by 2002:ac8:7f8e:0:b0:50f:b9e7:3031 with SMTP id d75a77b69052e-51659fde5fcmr353912951cf.7.1779292209957;
        Wed, 20 May 2026 08:50:09 -0700 (PDT)
X-Received: by 2002:ac8:7f8e:0:b0:50f:b9e7:3031 with SMTP id d75a77b69052e-51659fde5fcmr353910841cf.7.1779292208033;
        Wed, 20 May 2026 08:50:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] ASoC: codecs: max98090: use component set_jack callback
Date: Wed, 20 May 2026 15:50:02 +0000
Message-ID: <20260520155002.145306-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dd832 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yuX1osHPGoIBqVCarmwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: j1wwzqieoGJep4rzHyujJQW8iZD1BnCh
X-Proofpoint-ORIG-GUID: j1wwzqieoGJep4rzHyujJQW8iZD1BnCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX1g2+KknOSPHD
 vpTF3jCYLkt2LztrxDVXqweqyTGn1KE+L9AQR4iilswqaGqpTSUGX+yAU2OOEmxUGWxekEl//A2
 quAiSiC1LZ6VDlA+ifWRdr4jIQFS2+Y6XiHTkeFCxIANT3WmX6bRo4g/IOEdprXZXbaeZkCoMSg
 FwVXDP5psp0upHvBIDBaSdbCNcyVMb+B+nwmwngHvvSAB57YSrxJvsvaCqYUfR5f3BnY0UvfHDO
 L3/CZdALUJpKR5xz+hDpBLvNFv3cJ/P/COPw9xFefuSrGJFrdoSGIiwmXhMacEjuFDj46Rygkli
 nsjxTxpm3oTrRvF8SIp/VjsfHNQJ1obHTEzoZ+qjm9qfFwPvL3jDypkjrfYyCKqQ+o/4BLRv1P1
 5agX14xSOmdrGu/I2R+3Cy11Pw1/Q139XKFENE8hnsvJc0vACX0NoQRv7jZoyiBYbbWeuOozYfB
 3McOg89110SgT363OOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085011_873755_25BE17C9 
X-CRM114-Status: GOOD (  17.87  )
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


