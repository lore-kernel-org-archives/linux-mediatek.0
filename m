Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1C3C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=; b=ulLrdBaFy990q/Ix3NFVHoIWPp
	+u0HDaJEPUWP22QPFsoC0a6tjAKFr/VO8bYAYoXOScYustdNHr/z0HoOPc+1SRH28Xi8l/5SC3OiG
	g1eyz2RNqYMXYNDWVbmiK2PzZtaum5M/le2VC6g6SR+xEPC3/WzUE801gLjbrRgQb8f8Hw3ltIRGG
	U1Z1zaU/D4ck5t1WjBSvOu9bOgNbLFx/5YjX1LMaZZAs4qk7d9JQLattzQhwOXgRVQRUoMTbbXPmT
	qJXKk3JsZgbm+Biak5jpNu1JIblog6W//8Ufsb5rZdSBGhqWj3uFxhrW8hBG7zLyZF1Tvixt1fXey
	x0csrSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjnl-00000007nYq-3TPv;
	Fri, 03 Jul 2026 19:43:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjnj-00000007nXy-43SG
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:43:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiW5U684726
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qmmZAG95RTp
	/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=; b=g0ZwbQ4Fxp8RSCKppF0JkCpG46m
	IZL9lgpKtB2MG98fMp2Eetk6x/jUKWM9B4iLr2cyr0TggLUR42uycgR+HH6LVl1q
	qYaTOQFAA2HFvhnn09kA6DLClNJHb0JXw09KSUoMXJMm+0bW1nLBMzPxA86Vo40d
	IgZgqc0zloikkecM4YZLO9hc/3NBCSgblYtyVpg9UiwAyDqhm5Ayk0BIEVQXJ7vL
	wiXAZLl3svEFwMdtZXugflcoEO4rEJtFXd8dSRtQXTMK6SSN8GIzUnCNLmi4KNg2
	1PW6qN7usOBiMmNv3KbgswGU0zdTnq7gADJCvnJBxW710nhoN1OmKi1P0Ew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bs4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:43:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fec599568so1497045a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107831; x=1783712631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=;
        b=UyOPMS4lgLTCmlTdGew7VR8LhrbCPQ4M9L0ujcdmZghFf/EscinDriYjzZekH5pWxr
         rN9yCrCMBY+VT1laybEZMcoo/iojQ5KRMBwFho8nKRQW1B917UuLV2uMdln0wWJ73SQP
         F8fV7J9/BJawD3Fl/25SBHND2a3NeHUTCQdGhd/a59zPz7LHJ3HmIHmnGhHrDf8h+Vpi
         Ta8Mm3kmiCpW9XXvCwV624+taoE/S6FuCK0lZL0w/8iqzBaTu7xwx3dFb8+0L9S6uZ6C
         x3hYin8l8M7KYMBSpOwpCtMjTA7mzhHAsyLp2qVO7BQqjYw5E94nBH0ha+L0rRFLU/yI
         Al9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107831; x=1783712631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=;
        b=UXkzcevtFds4AoOLKNIlAcfaEPLPwPBWmf5eM4gPHHCv4hqgJe2BW3Z+IqwAnF9xxG
         c/RkBkrirIpIwqCId9IjGY6tk+LWKs21X3FcdPAQDw+9KFhfVhpu3CGF10o6zA+g9N+e
         3VEYUUtkAtBi+6ep2ceGfawjS3E/Xnb4PTC+4ubBT6qfR5UoIoFyakiTLsjg7GJJ4m+7
         PPX2+ZOqX9RhW45CgaKecSsSq6m0K6dza2OHr4ZbF6gmb5wYuOUfiANNdK1/Rfemd53K
         tS5T67EsM00MLSoISrUoA52ZkLmA6yoOr8P8dV8jxm7SLodeK1BKB9O8Al+Ae2JrHidH
         B88A==
X-Forwarded-Encrypted: i=1; AFNElJ/ttPgjOkUkNDzyaR8XBBlONGgqksF6eC0uCFYca9ulFqejKvK3DZp82JItfCno/AX81Iq9yL1JeL4SMrz+UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRNn8/YzWTmWSiY1n/a6sZmXU5wwmj56gy3cM6c657zoFrva/G
	pFH7U/aP+Gw5qIUxweGflnfTKp/VfVR/ZuQ9pFhU6nW1ebF/Ezg36fYgYpGTBTcZs66N61P9P7Y
	8NhXai4qovoIPd4jxpTDqxQf8s96lC5os3chBOnjfZhOsltjsG0BryjwHSPBJeeFDkAl/SqMNRO
	U=
X-Gm-Gg: AfdE7clE38JPrlhcQXxh2d0iTKL/erhXT65jTYbUK+hhvzo0LyoSwV4okCqxdcdAU5R
	X5FrTIVQEp889IJhJ62ljzItDDkF8tFfILTQR6YzSfU9AbRucXNAoHpkYMU/ZIFsBgdsdj45xBK
	RayYWNpUsZfCHR0+qo3e4FbzdcF/MACJG5PsstqTxI0SvJVoqtCqZNmMfkJTrABcbjYy356qL/Q
	kzGCdfszl/D4FfGTbY8ZVLgMKOwqb+yghdxj5UBTYEQCIbVYrSOfZYHNhBvUV/qXOa5egI75DCi
	O3Avnbn60EtGKFjSYLv3ELetiR+QY9Dc5HMd2QkYMjEN2zYLRtgexOxxs4Nbx+TB7QiKYiXtBWA
	nkCp5f2VY+lh3MAlL4ksXXM7cIGxvxWndVvLRVQ==
X-Received: by 2002:a05:6a20:244d:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c03e4e09d3mr691151637.35.1783107830588;
        Fri, 03 Jul 2026 12:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c03e4e09d3mr691085637.35.1783107829862;
        Fri, 03 Jul 2026 12:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:49 -0700 (PDT)
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
Subject: [PATCH 11/42] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:24 +0530
Message-ID: <20260703193855.110619-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX071Lq43RYSCv
 KXP7i4vJCKspCUCaflqdE15wT3smRSa/WDNycv38XTHcLroOYVHz9YB5La1dcp/UB4YX6WXWlK2
 ybO6wTHXJB9qgWGUNGeD/01Q1YBpSW8=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4810f7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: sfafpDRUc_bny5lJHr6cgKovG4wnZNxO
X-Proofpoint-GUID: sfafpDRUc_bny5lJHr6cgKovG4wnZNxO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX0I1L/ODxXWyx
 TigxZ9Ab0RO7blmTXpbkk6xt3wpoxrOV7fyijogOZ5T3Eix1aJ8EblGzzmHSWuqsirIFO6LP2aw
 5pdKetcmC0fiL6z7I6+VeZfOredhNnOco2q8nW0QXL9/IOOIzHG97ePWNMxirWWnajEVJsxNQce
 K0upBhqIQYjT4foMNlE6MQOSJM7njiEVdTo9Pr1X60Znk1woprEd93sAv20gyPLyRuaN0PgAi46
 v9SWDvhMIDeXb9ez61m85OEB6LyUTR74aoE847M02l2XZiw3wNLIdCMSqIn/HlhEEb8A8ct1Fog
 B+exer9rSi4pYMF5hld7ivhXjYTcYY4gpy8mKCrUQujRvBGoO0U0cd3B8ONoG63NKuFtRd3+Yp/
 op58hRgO2R9xeE0QUGLDasYPzTjLd7wW1YB56Cp3BgjO0uKrH0Gyzwz1Q82M2iwdayr3okkLsuy
 Q8ip4Vimv7ucRSNczfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124352_013296_95880193 
X-CRM114-Status: GOOD (  17.33  )
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
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 85a74c9ec521..a4387649ad7f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1027,7 +1027,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1060,7 +1060,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.53.0


