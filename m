Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665ACCD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=; b=29xrxOijSL0HS2/pJ9BOTUoohG
	U4RNKzc6cPIxC3vTLbKnOhnoOimyOxshWI97QhVir0PocgtIL+n31+hvX2wjZO6cmmnnAStGANPbo
	AKQW98sf9s/8kG4RLAcYHphQUyI0ePX7lqZxK2rAn65mSKNsrGVgYBBg3t2yxQNPFROtKLkBW3WMr
	z2w2AbOpiUySuH5h4iAUQCqr3dPonnq/CmWWJXJ4Xfq4NUK3x+5GHhmQp2WkhyK1x4AKdMW6TFpWh
	ujjoQ1d4o5MgCyNyzJM+tGS/E9US/O3HI0zSOmZmt8p7nWWjceq3olTFq0MUMc6Pn3cIgajfbMCSa
	CEyL4bmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzn-00000004gBE-12IT;
	Wed, 20 May 2026 13:29:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgza-00000004g2y-1Dun
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 13:29:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lk9S267089
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y1KKsus/zgk
	orq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=; b=UasdD9jsC5hDSsDAaPUSWISsp3m
	XcW/HwEvrYyVnOqyuYY/aUoOuMOlHs3BIqVEleyu01HAE35RHapZREAhR6vsKxkT
	uzATjOJl6gXQ9/xDJE6Hz7aLhtTruTd3Jf4bJ5NbzPk44GqplCQhfrziwM9Y+JGS
	pftAyqzBe4g7sWURCXQmlS90N2TtDiUJJ9mT3MPqJ5HjUSA6TLRlhM5YU4Yy1W9f
	u/7mHRWXGEcU2/2nMt4rPwMcbzh5Iwkg6PPaRNTCtY484E4xM4XJydIZn9C5ZLW2
	f89it/eQI0+G40CLKwVIEB68G5z66zvHNIXJV3lB2eiVTeioGhW0/dd0jaw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxrs9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 13:29:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so2884127137.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283785; x=1779888585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=;
        b=JdXi9vP1enmYEd/K4BQARGHvTzWmvySVBvV0oa+29i+feVkodMOc0rWfmo2dwL2Eq1
         MpUS0x/plSdbXg6NiSsoHDwRMWTyq7/iZnkJngBHowbQ1AN3mqJoJhROF6zVQlXTJ638
         k/F1McSZMYccY0TAQ8cVQc+v5oazvuFldXPEnetvoZfFrlwOXaUWtp887vKZPR0HLurw
         8XB3Se+mkli4bOfEIOjalfwU+bn6fNFDMpV8EMsg73S2xyWFsNGHU3aQcPRP1us80fKO
         J3OGqSpZW7ueFjHYe8UObHFBIbRC1tmtsq+eJ8XSAMTCA4Bwv9yWnKmwzgcHEfwVrT45
         zhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283785; x=1779888585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=;
        b=jSGGe31/7X5EOFtd11TUBj6m0ij8RtRijXWB+nwvD4r1u68eixBA31r7X6j+oazaXK
         7jaPKqAfAbcUkFII0FIvNpWF9IyF/JI2bz70/A6sqgqaPFhJ+snuXBs/DGC4EZhHhAnW
         Qj0nyY0GHGJWfeGtdeUdFzRFZpISlH3IrSWCWIG2x1CFWkj4TPpv6r6QFWS706VFqOcM
         CCH/3LozbUuGfagwswxWCPVVrHnsNdmbcR6HW3o87Ce7ScgGlJJ0HV38S5QjZNzWM203
         U7Tp6J7QP1rjxyReGwgJbIPnLHSNWiN/wGAMh+kVMIHSidABKSO6ZKf2CNgB5W4RqpTX
         AFQw==
X-Forwarded-Encrypted: i=1; AFNElJ9ViXSFhZVYvwrp0ja48fx1gA+iX0ppuxGl+r9Slocs5QJQgJ+zf3bVBszrkzMVjrbPmZg6sJnU2a5KK0ZT+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxmRtY2sLzQbBAbAQMFf26V+6BjjhDFdN2bC7E8RdVZXyWdkRH
	1JjZcw37mwmVcSUSRR/syIRK+/swKIszpJTe3DQvZ66AlNtGbpH+ij7McAaH4qQX4gu5eoq4krR
	l2vVyHFk98kGrh4Zfy90EbKcmJLsKYP7VnosGByIk9YIV0kcw5vBAcnfHTe5xT+MAIbSqBTI8wN
	I=
X-Gm-Gg: Acq92OF7G6U5zpkEC+W5LhhxGpTU9U/cgN9muhxHJxpmcCmbJfQvk26akpCxzUTnjSL
	c3ADaGIe6Dd4H3PEL2Wbxdvn55wjpaMfvvbFt30Pr0zTCX3v6y54kYikpifks9ddWXYRqRmXyO/
	QMZ5aEjBIamtsPYRphu4JHk9y4nhdb10kwVSI/geBXUZAoP0085TJR6s5BUhAdYcl1Y8Qe59SWX
	QdnpRaWPrKDkvG9483DC8gGgEVIwgtUXxEDEUJ1V2+W8ayDeAyYVZfwhguzo2ilARwSWYi/DcyA
	aTesrBi6E5U9ZE1McBHYHeQA32Q10Z0s3YnZPqtX0kxaPldMltzP1VWdmltb/sOAlCNNYRAY63J
	8ziq5ZDeD/kp6A1NVLlOLH80I2rs6dylg+yKW1H6olokMxCnN9BhEjKYslOsYG64/Bw==
X-Received: by 2002:a05:6102:568d:b0:631:26f6:701a with SMTP id ada2fe7eead31-63a4019bf69mr12684007137.29.1779283784737;
        Wed, 20 May 2026 06:29:44 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:631:26f6:701a with SMTP id ada2fe7eead31-63a4019bf69mr12683970137.29.1779283784356;
        Wed, 20 May 2026 06:29:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set jack
Date: Wed, 20 May 2026 13:29:30 +0000
Message-ID: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v9O-AEpYTbAjvTUhU5sDcDSelaPsKIET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX80ZNVEuqB24m
 JmNHUj2xbxHROTydDNsQRGPgyAPvBQh1LoU9/00k2Nq7oWSFinYGYG/BYXK8KodgDeTk+pzFRVR
 xmZ00tGGKo+7cqwkNClLQpO0XEi3adMPrFXSAjU5HOI1Kt8euZ1aKL6L9waLuEGiDv8BaWaFtfN
 VcWODbQ0xRJQeJ8AS3KxV1I2+uuNnbIt2dwHqxqzp/TTDwLpSNH3pIV3LMFK5WGi++hp3xo5UWq
 7eq5CeNXDRkAWQdP9jkI/IG6twl40I7Mli+JVwxf8sf8sm00ECHNqPYv1rMLNelIIFevB9nlR1K
 OrGvX5XgiMgVxGG1yXWOaIv40G62dvnOWt52PArH87/tYrc1ys72AnM6TaoUpUxJd0qLAzgw4eB
 iYcaolagvljF3ZqthbA1dKTmsd7E4TedhEFfwxN9h6kGleHh4ZYn6aO/6MgcHq1x6PSmkgzA1Xf
 yvvVVmx8B0dR5iiE7Hg==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0db749 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xW-QnMYR1X0ORSU9WD8A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: v9O-AEpYTbAjvTUhU5sDcDSelaPsKIET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062946_439967_F73CBDB4 
X-CRM114-Status: GOOD (  14.45  )
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
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 49ebb67c818a..236e1f8df45a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;
 
@@ -78,7 +77,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return max98090_mic_detect(component, &mt8173_max98090_jack);
+	return snd_soc_component_set_jack(component, &mt8173_max98090_jack);
 }
 
 SND_SOC_DAILINK_DEFS(playback,
-- 
2.47.3


