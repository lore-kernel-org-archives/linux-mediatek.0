Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB0C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVazRrG0aSxY8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=; b=lM2WQ6YEB7EaZ5FzWy21S+5t9X
	1Q7pDg+RIUwEq5PHk6w88MQOY1niFFBvYrb1Lwq/KpUPwoJhwTp8nhUB59iS5kYt8RMKsAh3CsOAP
	vZqU7M5djE69hNmzHLWbQ+Crgjk6ivahcHn/42SkaNzzJCog6DPIdN58FZcKfYxJmKjgv1b7Godmy
	8VKG3DoM2AVDgG3dexrfW3s8ZK0Wvo452kEbI0ued0Yl0eQYGT+CNrG1Bm5FiGRYmvmVJXdTTo2qC
	ya2rGainUMeTdncrwnorQRSv8MABob6DcJpyDchvmtVttorPm+dvp8HA/CH7wqeTAaoND4c8Tc46H
	BjKP+6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjvz-00000007p1x-3g7U;
	Fri, 03 Jul 2026 19:52:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjvx-00000007p1C-1EOd
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:52:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiVeQ631517
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DVazRrG0aSx
	Y8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=; b=TXRWzJJ2mDiAw8ndD7aCyMTUf3i
	qUwQeZ18wqKRvWYaRG7r+U4Zxk17QhXrKV+uyNMifJqDY+dgJJQUE1PxEVafitbL
	/sq5Mw3Xx8o/4twkp24WyE+09HMdwsGNbm1kb8tfUe4hThZERMz+wvsZtyy92Lwb
	nrBIctgsjjqOJkLu+zd2LD45dyuWrZ/mPnBa/MBW3qg8dEJJgHe+i4VpsMo3vRop
	HEkWuF2pAHHoEiQK1DLWavNEjRrtWZLcXJ1zYzjPtBxzPlLbgbJNPMNInXMxnGEF
	qThiaYPMZK+b3IqAmA49y6rMxQqQcVfei0p5lzYtDgpnoThnuaLpXxDP8BQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03a00p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:52:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso1540999a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108339; x=1783713139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVazRrG0aSxY8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=;
        b=Jufj1SZo/31RUozbPOVRnx29vraTVdpefb7pBrKObsID43neXAUSAGeUwVLbvBgixe
         /VJlWHaVC1EZ+2VY4mR6yE+yjNBWz7qe920kyzn1gc5DEiXSe90NEs4NzDevWynr6bkx
         HnmkcbtLhPnqIR4y+o8ibPTzekTtNPApQfBWeleVR6Ay73otvGRpz7a4ObyeTgzAHWXr
         OA4hEY5dzw145q29hpVAfeVzi6SOCQtdsE9Wxo15vNFZihY0dPtelkgRW1r7ghHXMpvN
         nKVv/hr3U+AQGd+G7dZILdvCqz9OkV54bXnk2w8yxnkA2syH1Y0MHm7wWjR8qdnEZhRX
         IL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108339; x=1783713139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DVazRrG0aSxY8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=;
        b=GpfMnUree865/FflZ2oUYLmuiTB/+iPof0Um9aJdMwxn5X/WtWPtm0ow0vaRJyrWl3
         2jrLi8MJSSXKI0OvMl77MJvvt+VYOiQxhsJK9ydBNjrSwrbWZpmn4rEFLyqJ4uS2W1gc
         xa3WrteTd+Xga/l+nyLIa8ffZQrxJzUPAjiyjTfbYG7ovGWYZEjT8o85ABX5MMdTyiCS
         b9s4aaDLnkiDwNQIhkA/iGRoZsN2YBoudNosvvm44elV+HLESRTS6r68jvpo50oEv5OA
         l09r+gqHGw3w5sff5OpOzxP1Jo6kqEpGrVp5JKNRgQI8sFTOms4SDL17GSA3OD8myft7
         Z+jg==
X-Forwarded-Encrypted: i=1; AHgh+RpeeP5at0SfMEYR1Qz5D9tP2mvxgS0J/h4baMfnYMsig3OD7iD9J5SkQn67MVpy8nwSoHi17IfMUa0NhyotoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx19PT+sNF8CY+mr042sSwVOp/d4BuwNy04ra4klsQU4FkuB4qo
	sIHxhfodKJ+4A3QlU9p22DLVXgK1Ft9KeWQGB2+Ppr9K0DE4tR1FA7ytBUMLyD1w5R6daS1/b1p
	hT+rJ+u+chL8bkUgRNZGX++OzsZeuAF/bKo0P+KScnGYxRx6g9SRn4OmGRc47jmR79Ta8lMO76k
	E=
X-Gm-Gg: AfdE7cnA9x/lFr7nRScK6pKqsU340QwjA0zPJw5PnLIbumkhAnu66Er3F+m+Ei848X3
	GzUk1PsC8HoHY+mRhkrZAf1bXGA/GaiiePUwoEp3YIYdMGMOKw4a3cyFLN4JIfenawveCJhyhmg
	e8E5epI+fBf1aUgLDuq2LzaDu2lMAf6w2GVDuDqeI5bhSc/oPIUlILYxJ6HbPNPNzJqxCovhEm6
	0kTnGynuMjrZobZzRNv3OZflCWohdvQumuoIjb6WRZISz3R+NT2fwOSY2u021xN6wK2LWAjy1Mi
	IfaGKEthpoG1g5DeBHP2fPH4KV0HYVgU6ziKBAL8+HPbwtS8v7Nk1qrMBMX/Z86QEbMiRT+PTZB
	wEsEd4H/xAlBzuWQjg2frqLDRiDOP5uJiFpf5bw==
X-Received: by 2002:a17:90b:2d07:b0:37e:1bc4:b6ae with SMTP id 98e67ed59e1d1-382808b20c0mr790719a91.8.1783108339131;
        Fri, 03 Jul 2026 12:52:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:37e:1bc4:b6ae with SMTP id 98e67ed59e1d1-382808b20c0mr790679a91.8.1783108338648;
        Fri, 03 Jul 2026 12:52:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:52:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 32/42] drm: aspeed: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:45 +0530
Message-ID: <20260703193855.110619-33-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX5Mi1i9/xtQEA
 TL8WuPv4iRiUjLwe4akmY46Wi9rXVr1nTM+19d0ZLKT9uSgKL/d1Mcn8wrQlu52wcui2Cbo4ota
 HglBXtUdQ/qZoYbZcI7LNEDS/oVW8MA=
X-Proofpoint-GUID: VJqoRz3c5DNLa4VHoiVvyeDXAJUYvCBN
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a4812f4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX4P/F6bHHmhRK
 UC2RBKfh9XRYA/TgQEj3RVMDcEZXCwsDibp4vslWMbogj7ZCFEVc8FzsEJzyLXC72PUDWv1nsnJ
 Y3BZODz4u+1KdAmcjQ0Ng530FUESs7Uh+P9qfeEeGzRz0JcdFBZ+WgzhdP0dTMbEKCBIwU0tQUM
 KdO1lVlnzXMEqeNrt6rxprnyHBOAJOBfKttBxVuimEUDtESNkOyycNdz9r6uAtirECmSuYR2he+
 k+UcoL2u8OJubrZM4mi6YrkfQYmH6QcfSzPSqMs+V4XBIiS5qJo7Km5OR56eEQ7TE7N96JJuWWU
 U6BhZB1dqqX1gH0AaxLQEi9AzyLs2tgxt/nlz+WAvtIiGLYx9GUV2Fr0rL5qTsMX+Z6rZSoRHLX
 W6O9O7tmZ/vAqR+d/S9K7v0lOu/fkoYpic+xDaWYFsyf9euAZ4xq4RSAgbOPIwbyBKMFXnBeD66
 Mu1XLI2Ychpl2B0c3vg==
X-Proofpoint-ORIG-GUID: VJqoRz3c5DNLa4VHoiVvyeDXAJUYvCBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_125221_439900_4A51686B 
X-CRM114-Status: GOOD (  16.35  )
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
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a1f0..2c7e54fc35d9 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -168,7 +168,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 		}
 	}
 
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to initialize reserved mem: %d\n", ret);
-- 
2.53.0


