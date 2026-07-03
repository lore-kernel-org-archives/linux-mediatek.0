Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC00C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=; b=v/gnoLATys0l5aguzLTFKEsn81
	kTQuIpy7JI32zAzKv5wniAr2qyHGLHEC28zu6jHEiC3OfbDlbmjVlx5lO6eFSnPeaVg69IH5+9WLK
	xhXBNXtWUf8ebaqmiS4drGpS0VB2kcjco8B1XoarT4kHYhQGx57C5FKdaAhTlFXtT7yj4cUh3j3ZX
	Upkwz02BJ0lLGguMH3rlGaSiiSMKuG9VmXJaU4NsGRfD+RC9felvhSYg1w4j4qnqpMgRHaOKhNy7d
	g/9CJVSZusA7eXDikZSd14SKI98zLA2D7Uq/NJHtJe0mzkQgjo7UfUVxFsU5tEnqwG9I0ufRb5wVE
	Jr1h89Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjnO-00000007nVx-2tDp;
	Fri, 03 Jul 2026 19:43:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjnL-00000007nVF-3hAK
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:43:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj63l547537
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bn4n8Ensq4b
	2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=; b=nOeTG4ty30vKw+ttbYanSVJ6ILE
	BTAP2O4+nJPij6iXWRyXJ6gBds/5MB5tBMGqFWh+/u8gKduK/0McbMFjobNCnuzN
	1y+6/ZZnKyZ62+pPM/DEC4Iylg8Krq0wAPqD6KdtuGk+Zdk4DKUeyMhiXbzJYdVL
	bIj/QJM7hN5BtusgbHD8m9xNThogT6wHKhQIkdOp/hbQypKE27fZgHchGeO+1BTT
	VPUpeh/bBZI59ScXYRgw65wzTgoMMnoJmFsZzRgRsYFyWaGGYCwKpfq4lPUztwV7
	wVHDf06/SCOxR42J2Z9vbHr4UhAdTAjtbJeXNkQiLE7+wIkknP7olxo/NEw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02vkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:43:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b719so672978a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107807; x=1783712607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
        b=N846Cmsk2HqgAhsKK//sp6CH7PUgbYiPu3f2qVWFO5xMefhL4vdB1ey0VlW7roL5B5
         anc6YFX91n/VGakqM7J0YiRZYsvFZ4LgcA1T2j5uM+m8L7KXRhCXCk+V17HrQ1Nt5pQZ
         o4hx64gWFTHPepJzBorQvsHTfbALVDv+JeqAgAePVpOQJkU8RsIE7oewUhxPbqmG35O2
         Z+YduC+HAV1wLS6bH1Zyl5xvwg5B+w0llTjmn28AMUtZtuL71piArn7H9U5oPSe+ee6m
         A3E/5inA7BMqVPA2WRY0LnFeGjgcPwUgbEb0XImwtSxFf5REHqRJ+od93juQgiqZjYgS
         gdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107807; x=1783712607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
        b=cQMENFb3FHMHAL0RR0OZ9xP1otPlfgTaoSewYJ88/sjeHnFNYoM+hPrOS60uqhpGd9
         xXB+rIAX+ArxfYjZIgwC/4Oub1QTnSGgq6Gf2p1AyFS8cq8DteTM2grTM0RWwNahWKHX
         C97oyidF0uhyXZ8NajbZ+VfI1fbGQesA/ZwVJy6ZglpZRFeG4mVyFtizdE/lX/DLIvQk
         Ly0Aw6oJWjQsU4ms5YICc0OWCDtN8SOBKidQlHhOaLtKTJjjnNop/PfyBkbGcsERWDAM
         oBv6A//0jpu8t+g2NqECqmazbMfObRa+6N2gr/dT6PhdCtFjaIZ856rIte6tctvwUQpf
         0zWw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/stINCKLg7X9Ra/jHESfdKa6ssYyCktBN6aW7PGJSUkvrIB/FPIGumbFsNteAdWUkeYeIE1kKWLB49AfY2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ20kfDMeQe8dFVGZ5IxPES/fMhclthpaxg8qt7GmKIuVVEwVA
	gmRR6lsM0X+Nl+/0WTGmM0UQUGZY7hfMm/iGEmRGgnUM2tOY35R8FrJXgNb6tYPIoHmnz+5CA+j
	iw9OpyVMmZ7/wpgicwXKsg0aiTpKk5e5eoesP6/vvML0h8O3FUpW1N21zCdsfLfMhsoVxbof+Bj
	U=
X-Gm-Gg: AfdE7ckkZw0yRo9agO/1diCtPsq+rX8A4q7Daos0pKWvjUiduVPYZaxizFskUIvnHk/
	ED8vKC0GyLY5K6dEX9dZTB+wiUSUPX5t13Iz9hquEH5dlHHR+jTGdBL1MnTVlX8Ak/TooSfE1V7
	a8GPD/+Lwmzv1QAiQ+D3bzLVQrCF28vN76F90oNvXoaYTf20LbgAwwlU6ST3nNRhWnlmloAMozY
	XVkCgbk6E/7hOPn8Y8G74w5Wz8/6V7zvsoFbGvb43nqKRBn5Vo06r/J7oM2gD4pZ7yEarY6R4q0
	OcfoUnhmqA9rrzaP4CxNBIAY9FureCxwszqUP8NtdACmd+g69VxqYlfYcd1muakS1sJyJrLHuPS
	7vxWYU+B6A3f4y8H0h2hzgPX2zCB1cBRjFnKSpw==
X-Received: by 2002:a17:90b:48c6:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38280e98cfamr773004a91.15.1783107806456;
        Fri, 03 Jul 2026 12:43:26 -0700 (PDT)
X-Received: by 2002:a17:90b:48c6:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38280e98cfamr772970a91.15.1783107805852;
        Fri, 03 Jul 2026 12:43:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:25 -0700 (PDT)
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
Subject: [PATCH 10/42] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:23 +0530
Message-ID: <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aF0WRPKkSOt_P0ZzQGtMoNBOVvfVGHTx
X-Proofpoint-ORIG-GUID: aF0WRPKkSOt_P0ZzQGtMoNBOVvfVGHTx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX2/mhW9UF82h7
 oZt7rtvTfFc4gh8SZyF8Fv6xlbaeHYYH/GrKq/iWLe8qM8PxEAXKvP1XvsLiv+VCkliMdADImqy
 /uPzO6NpnQU1dUlr01PUQIS53eTIZyg=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4810df cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ih0ztwYHz3j8HjU85xEA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX+tpyM67LWXUL
 JVQcjscTd4Kj/eJLdD49vaby5L/AMcLAq8m+IuRzv82dvTFjCdV+Vq7QreJAZ+AN2I3NPc29tkx
 aiQbN6W+gfEMhwEA2gcCSSMSUSTGyNIP0T4r3njcAwOa4jztFeyDTjJCSsv0P8EMQzr6ShZxMMw
 JWaB8646PiQoS6dOnkGqMUwPcVC48MXmt+pcIbxkl2S06NvdigRr7m/DJLoHm8y4a56lRczsXnV
 RNMGWlD/u0UT+4jaBsi6mqtlqoErAhcsww0FYIHKqpwGWkcIFQCWsvd0VTs6zv0RqBDZ1n8rprO
 PTaIux+6eZ8BNIeX21CGxMhplDhpRPCkXihfuwPEObTvR9ovfG5xwq9NcaxJpu00Fi7Oh6cznXJ
 EWNmDGXUwgZQ80OrBz0ft4R9WxpJO9dRuVhbPwmNWTps52DhYo8A4Kv6eYco7WiwDMZyqhCqix4
 irYS+iFOX7wV72e0jAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124327_928109_9EB4CA9E 
X-CRM114-Status: GOOD (  15.67  )
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

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..25ce37a4e8bf 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -254,7 +254,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -313,7 +313,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -329,7 +328,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.53.0


