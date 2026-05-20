Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF0CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=; b=rXO4t5c1kuwSV76m3kgWUJ9dVd
	cgXe0AjhY83MO/wHVDCWtoq25cSZ4Pg3U3EQSyAS4v9FJUf9PDrEXVtGksURuikirag46uiRw33dA
	WONZQQ361xAaunA8DyB7N2P/XnlpLKON9hxr9jxe/T/XbNjfynFHMdcH4b62AdMRmq4l0ZQk2ylDe
	9AIvYT5XrxR2QDd4vb2fGvLf232BDc95JUqKJFZ/jJbyFOIqaR+2Fvh5kaMNX3dW4r+nAx/+UUIKA
	+HXnNKt83V0FUpRggM+8Jr09cufZ3czwUorhhIH9+VuesIyc2MmtNZ4U2gnLb194wj142YmXu8x7/
	pnQndoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBZ-0000000542o-00Bp;
	Wed, 20 May 2026 15:50:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBQ-000000053wX-2OjE
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 15:50:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe3Oo316534
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GBFFGkFdfck
	ErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=; b=IQ+bcpSSVcDoooGZBqHLlt7+nag
	jP49nyhb2InE2RI0qGdIAYPM70jBlKJwgGwlKBkKDpWUH4iwfiXxGpO2QEphGgD2
	3qPQcnEONPha/gcfJdn8/W5Tn9tK9p8frttVV8xNGLMgwDEqoXGGAziAlsC2jhyn
	vQcKp9qYnNXnti4FBsAqhm19YElYvcCvaF7RW+SUGNV7732n7QOZh9NEWvWuCK8U
	iHmAh5+j9Bp9PwqEfElBu29TcVipQ630zEEz+h1Oqpd6boYaERJo2fNUVvOf2VGM
	S9X/Nn50t0OBk02lz0l6wzCwSinROsMWVtkcqvxGKH/KG+L75Kn/xt1MNwA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrs0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 15:50:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9614c6ac238so347862241.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292207; x=1779897007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=;
        b=BPdsr1ubDZPbiOfYO57BC7CqaPi/5TiSKp1HjjwtvK3la590k8L2MDjVUU5NlZSP9N
         XjI4QnSwd1cVxLUUgeMGVb5SYIDGdyv8QrbIbi4oPO5DFJUPk0Vk7ATvp+uhAWM1R++G
         mlMOJaWafal+VlAPjl37upn+KCkiWLXfr/jhhoEYUTW/ymkR+BguTAZrA/8ab51G0r9d
         53LCHyhMz+Y3JHLT4JSH/AMt7JZKwWeq2Qhhk6/HcVgUD7H33S5XkVUHRP4KGXrexZFd
         0ApJmDW63oZrgUcTyCEIqFpztWhgbvYkdZDSFYK15pZ60MKdV2qzjcOW0vX3k7Hyerqj
         M/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292207; x=1779897007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=;
        b=iIHlkU4y9Hln7IrpetDF3lHiWLiK12E+2480C3dk4ioJu6mYzK34Zq5gqsGcGc5rZV
         8zZotgtonIQ4QeFOKamNQd615rGklTozFQddEFe3GC6hN171kHQqv+ireqPR0dLiwGLp
         hoo1vleZSkzg3CT9GmG+09DAzW3AP8FsSjBUjf6UKPIKGWTP2pyhu1C0UlzQT371gzmR
         9W1GLl3Ql+4eG9nAIQf28yPKlt0HeliDjC//2LDvHnLqXghHX9SM/UM3CQtkZc+iNvw9
         aaDR6mGd2iGkLgKvD/5Y6v9OeHPhXr4ejWzxL0IZALSCrOtzZ15QKKlgv8gf5+tzr+my
         hzyw==
X-Forwarded-Encrypted: i=1; AFNElJ9i04FjXOa4ADvYGmAP3zL25T3oelJrOsRlHarJQHUvryOIkOi/LLgDj8hlvh49J16idZyyif34AUWcOR75nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUL9Z2trleTMHpXs9DBImBhuAcbi0sK36egZlJiVlbdqq+GEj4
	uXkX2lmVHY+cwC8WormVblzLbxViOcHM+sXW30M98y1knSU5RYtM8gcmgTnxlkRsBHp1TAOaJnP
	WdY/3QOcYTLsLkd+66SlxpfOucT0KyPmh2A5DgpmqNHyexQSK9bZntDYqlEbGbLtkmSXhtI5d8P
	4=
X-Gm-Gg: Acq92OHbRozTJafpVSARqR9jNnpoP1p7Dq10OYkyPMMsdofciQ37JBBtO4ogYBZxI7a
	KRCRke0GP4Xiz/Yke1rwUB1LQqEObmCUuOb8ZPTZ7YHv0uX9Lyr1AYBwEutBqqz1lJoy8JVoHeT
	n1llj3BdZKEirg1xpkkY8rD1aUNJFhnMRz5v76YVfRRRvy7GtWpMkbi9gNLoGyL8k8L2HV2Qg6Y
	19pzbD5+sK5153iUxVfZCW4mloV35VqeZtBQfo0l/iJri2AOXPY53cdCLPBEuNT6Jwkt8VaRgs4
	r0XOqrfmJwZsSO9scle0ZxrQwXuwOCWi6H8QZCoOnVPY+82KAt+tDvnksezzy0BDwl0MYeqhbMi
	rZ/zt+HLVoFuo9rzwpOJn9kluPLBwDz38L+WyBh6QXq8WgwhHJAhQ4M8=
X-Received: by 2002:a05:6102:6051:b0:639:6533:65a0 with SMTP id ada2fe7eead31-63a3ee7eb93mr11334745137.18.1779292206990;
        Wed, 20 May 2026 08:50:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6051:b0:639:6533:65a0 with SMTP id ada2fe7eead31-63a3ee7eb93mr11334723137.18.1779292206579;
        Wed, 20 May 2026 08:50:06 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] ASoC: mt8173-max98090: use standard callback to set jack
Date: Wed, 20 May 2026 15:50:01 +0000
Message-ID: <20260520155002.145306-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX9V56RIMqx/kq
 /AKsCbIQL8UnkyidZGWpc0wUu04ppMYDourvBU2Kv2fVHZkFhAwDgTCAjqnOAmIAiGVuzHYQWpf
 KO/MGPSVrh85hcLoGY/56cBXiMnKIV1fxLDninOFKh7Av29gIH90A4eYToXXYgXkblo62m9aAWj
 nzBRuHj8ChmndM2YzW+zxWaod0F5BK95pIiFJAJ/rvWSrCuu/SEaYnmXQf0rvSXSjvo+FKVqo1t
 OKat7/d3XUMM2NWox3hp2+mVdOkOkLNhsr3tybQ0JknHF1o9cKQXG/VTO32g8p02UGa7Fxrr1Pd
 9Q1QlsGjFEOD51G+ytiBUigKfcNWh9lPb97UaeoAqjeQxdx+U8wDKuAPCEdBuRYseGeriRp5z+I
 SZntcKfWtCZm5uDUHhGGSRi9erUY7D7wEkcXsSxkBqgYCXBUl81fP8qVzURlNPQ2duUI0yAp+6T
 ss45QrHov8hDyhA1skA==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dd82f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eZ2NLjhSbWgmPKGfaEYA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: GFXjErDaiEKtaHmUtkKMHUvtKmB8ovKZ
X-Proofpoint-ORIG-GUID: GFXjErDaiEKtaHmUtkKMHUvtKmB8ovKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085008_726253_FF2C0812 
X-CRM114-Status: GOOD (  15.89  )
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

use snd_soc_component_set_jack() instead of custom callback to
max98090 codec.

This will help other drivers using the standard callback to exercise
the standard path instead of custom callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 49ebb67c818a..7533c6e4955b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -1,3 +1,4 @@
+
 // SPDX-License-Identifier: GPL-2.0
 /*
  * mt8173-max98090.c  --  MT8173 MAX98090 ALSA SoC machine driver
@@ -9,7 +10,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;
 
@@ -78,7 +78,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return max98090_mic_detect(component, &mt8173_max98090_jack);
+	return snd_soc_component_set_jack(component, &mt8173_max98090_jack, NULL);
 }
 
 SND_SOC_DAILINK_DEFS(playback,
-- 
2.47.3


