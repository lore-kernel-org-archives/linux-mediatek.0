Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929EAC43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCVg1Q659eHnqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=; b=3uwQhMxDB6XTr8ewupkHckCd68
	mSH/KvGCOwrBO1mVSap0qqX5YUr6OxEnMfGQI5mwvjNREqbwWAsEfFjinn6Zio1nNtdU25BStgWce
	imXjMWe/FnIYtpm9UUprTucbNpFE2Kb37cFpSrHQDYyheOazl0h24dph6xFLuy80iWTIYuBS3CS7F
	c1AnY+sbx1E3rcJpxS6eyF6StfxLTGVLCY3bS4dg4uDPxkEyCk9KzQ7itjdta5hmsOnxWO9igqv38
	Z2qb3tQczpdnbgcc9R7F604fg/z9+b1LjHIqSqN/7PKJ0HicxKdVWd3t6OK6rx7zjHF7mBQusEKrB
	c80K6A7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjrK-00000007oDA-2X9S;
	Fri, 03 Jul 2026 19:47:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjrH-00000007oBs-43a6
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:47:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiX5A662857
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XCVg1Q659eH
	nqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=; b=Fscb3jbyODRMP+LYFIFJPrbKW9j
	T7wz8PRC7scdBXFhD+ON7mjQ4uJAAYX+dl+COgx1dk9PHFteC9Oom23fyWpv4Tv2
	faD22dG57wKf0XAZBp4MmlExqTGeqybkUdTWUKEmMh9sTp0lRLkkAwYSfllngB79
	Fm7q2qvKn6tFDy4yuommj035Hc23xZgjZqav+jb4ZX8a2fUwTfo/8dYjPzaXd2gq
	xGcAxz4IYt2RxUoXKTu97fNE9L/YSHwH1wX3qDLrOYLJbdKAQA37AL15B7ldtQc4
	5OwXQoxeM58coao0hEc5yVFAK+/31GfbEZmpTdRT9RqL4g4fRuIG022A0rw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycfk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:47:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381120d6d62so1547415a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108050; x=1783712850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCVg1Q659eHnqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=;
        b=VeyAJpkRFnmvPO0J4D4r/wZJsq+14F9rfUWYCqOspH8/LdbaVKiTOYLoAH2XWdUcp1
         zBsa/ehlAQgWBWYDP0bSI6AkEJ9illsBxJSkpOZaRRSZC+AFvJc3SI2HiHd/O8p0TTU0
         AJ3Q4i0agS9ibTEUCgHGK3qQYdUS0qtt9UkgUbC5rftGxm2X+FluuACFKXG0SanbDL9e
         6dcRSGZAEUTkIN0nqrCUGC8c4nyMZD+zg3oPKLkHOXeOmr6PTMTUc0AsZ3xrz2HvWcsq
         b6kz0PBmnfMRwu3RBL3I9x1cYHWQY+3fSAoNBrCpxob7jhRZSTmU72Ms50pXPbzG9ogY
         gnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108050; x=1783712850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCVg1Q659eHnqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=;
        b=gjNfsBapY/I+5XrqDQVlkylHErd24bC/XiWOSMp/PvhGyH0ytUbJZF2pDrReFPC8vt
         0IurH3hk2tOUPsve5yRT+RYoXhwTpPFpscCX7FhEUcbXbJ6yQbNU0zjbPVpo/BM+Dc0B
         MezUP7kr8po2RvqVd0R7GJ8itqH95ML7QOAhgvyJHNACDtH2/t0mQhfWaXovVLL+Ht1F
         bgRS6Q2iee0TBHVJSAMK2i5Rf9TlG7u2K2lFkjWQEPsWrXYVio/unc6SvCV+qUE/l9lh
         TOgqDF1ogJIuyLdQ3leKNmx3herA4s3lg3ole+IbYs+9L1VBHOpVZAMf0prJBLRVjTPO
         OnHg==
X-Forwarded-Encrypted: i=1; AHgh+RoQ77oGNvIVM3MshNqlRZNEUiZ3Iu2UVvq5o0iSegHHJan5/jDMQKksQrUg4hi/5uUD1yprRUkeWvjdZfI1Og==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4SlM/Qw1yQ4EmsI4dWhYNMmCozCnNj3Iq5hNUB6BKbEIee++a
	Qoa+Pj/o0RDd87B/127RJy/72bSj2daJV4pLnRwMJ//O1OQQDG/WU4gysPET4kXaZmMAY2/fkdn
	ZINOyLsxtFzoCC5ZO+VbU+zBI4nQmZJf4dAqd9r4tFCVFcoHPHYRgDK+vxARdjFzuo73Z/s7rHb
	c=
X-Gm-Gg: AfdE7cltbaAV9ElhbA3GZL+oj2f7SD9Dlpo626SHusRdojDH1Has2wCqrS6QWx3F01E
	iQ7iJLSxCnb10LFbphqanewiX1eTJphzwHNYpzuQTcCK1MrZp0QeARJDwz92p56pyLiHMUJjRLL
	Q/0dSXGS3+qMGc5i8NqJaxebC4wX60S6izRpi/zVqrFXYAdQYB7adVCKofvVWxPckZHYjVVWbrM
	vC7H3tyJVtKB+tVSC8kYUTvYvXV5Vyey/LaZsYLkjsJsfvuwXLwOI35vdoM17XILJAY9A6mxuSe
	VVRo0ZuSkjoRM7853qcPgpCz9xFtwhRq0o8iB57UZCHd6PKY9WUhuztEyj+GcM3a9sTH+d71GEJ
	gtnb3WwhUbzu4sj96AY9wbH31auoexGnwACg9hA==
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr810875a91.24.1783108049762;
        Fri, 03 Jul 2026 12:47:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr810815a91.24.1783108049130;
        Fri, 03 Jul 2026 12:47:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:28 -0700 (PDT)
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
Subject: [PATCH 20/42] drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:33 +0530
Message-ID: <20260703193855.110619-21-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX0+nMp6gqh8Dd
 BUTWxLcy7NST+ioRLr9X3MlcuDqju0zGSLNszT72BJxyWlXmMU8ArKjI5qsAwvD64x+pPmgUMAb
 gJWOBpC92RAg77ac60Vfz6k17c1V6XkFQ/P9DaQhfmegvCz5787c3oB5Rmu4oglPC6SFdJ/vNeG
 wHpgo7Xg2N+RoyCfBL4UGPQJBE8SWYtJNY+B5tbZVdafr6E6HFe8+cCRcBiVlrRZfvlXxxcruMM
 YJz7Qhpbp8IOlfWzxmN+M/EpmyElv8+JgX2Mg0BLi+AqIt8TGSxfCRiP1a4PxQKV5eF2OF4S+7a
 tgNpxwf58f4gBu61oxhCCdPJ0U6h2y3wq4vV3nyu4tGkXJqDRfedv3CSTGzybiYpWq7gvGL7a7u
 7FfgPs7M5+hlmqZR6mxU93FrKEts9EDEUnS24+2zcAYGOk4hanWPUCD6r3zJgIzfLu8OgSTEqnB
 zIE+MvCCDihvK/Pez7w==
X-Proofpoint-GUID: 0QjV-__FFftdg7zeNfuym4ckBOGwqvZN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX/+kcMFpbSdZQ
 xJvl5DM1slJiz9ngXJFdSAjwPa4hVgOi85JuwDpG/msI0BULGKWjo84kvrJqzWmBP3wXhJHbcXp
 M0Bf6JpJUdLSkRY+dLU2UKoRvycDneA=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4811d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QbF1duAvIEq2M5YqX_oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0QjV-__FFftdg7zeNfuym4ckBOGwqvZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124732_123113_056E70A0 
X-CRM114-Status: GOOD (  15.40  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 53ab1a2a5aaf..e93a7a299b52 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	/* Try the reserved memory. Proceed if there's none. */
-	of_reserved_mem_device_init(&pdev->dev);
+	devm_of_reserved_mem_device_init(&pdev->dev);
 
 	ret = zynqmp_dpsub_init_clocks(dpsub);
 	if (ret < 0)
@@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
 	return ret;
@@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
-	of_reserved_mem_device_release(&pdev->dev);
 
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
-- 
2.53.0


