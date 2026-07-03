Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEBDC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=; b=OJT9PWRNb0RJfj/rRIApwUay6o
	F54PPpClrwrrq86XgfOg3KX/R9J4JkHaQMblN9KtCQOZakg3hiF9KIL8osj3uUOKP4wti7I0b2m+a
	V5Y3EYqsRLIk+WeDSxxC7B8vI5OTiXX+ef+7FPyBwOwPk88oOiJEjh67xbcn46jKTQjCMwxFNF9RG
	K234NlUKElqGGN5hXlHj2LzJ4AVaifhiJX3GJN6aAtu55fhuSYM+lCszs1rxuTTyDM55kqHv+cMep
	xsvIi+dcbelgQZoZofXAmdonLP0tmQKOPTluouu3bc+iooxy8VWyYyUE3MGhrwsTjLaWq38QjeE/g
	Yxuldg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjmd-00000007nPE-1KIn;
	Fri, 03 Jul 2026 19:42:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjma-00000007nOa-2iHi
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:42:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiavD675622
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BM7jtgPz5pu
	XtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=; b=jKWf2GSYBWt0WCeSTarF/ZyxiwK
	ySviO6bqYuR7hXocJXWdOzctBTkhr9x7EBJtne4ZOFmY2TQnOa/Gh839O06jG1Z7
	dooiFHxttTiabG9BCsQjg42O4/YG3Njl/KqjnIDTpKtWlrEa7Oz6uExs+CjZECUi
	xjJD6IMEajr2OkDLA3WKBxxOfzl0dQqBxjqVSPjOoU9RaH/p2EFT7u56Y4OH0mzN
	ZRdyYM3r4dJMbR3VmiLwRyPjjK7ZwaTZ5+BWp14AX1vqD6b0N/1+keNALbhSW6GJ
	73bXzhYTiDhE7iSf9SrCIj4lzRwnt5YUmTfWTl/y5PQ/BXjK1zfMPAEFh9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1grt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:42:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso1428844a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107758; x=1783712558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=;
        b=M5RHhpEa9lZkqz0i1KQX1t0kDtXkMKV8MOlAYVuKfXXnp9Rxkgy+bzZHJRy3WUxzty
         zizlwI6ZLmXk4SE2A3gY27UsMjgWreRYe5goOtDiZBMlAk/E3BbS6H4OyqV0ruWJiaUo
         x4hQK0fX7PJwmaJg/RymNAH+p2HldGxQDUQOcjrRAPQNHWaE8TlL8FEf03OdTv92vtPF
         kOzEzLSwYsfz+6M6PZQQIOql24eDUxSTchk2hAikEiacpTgyo6YHEv6nmwYZ7H7H2N1W
         Tw9B0p0m1rWV+esrfmEjglXGKYsycM/NBZ5cxVnnPpPQ4XEl9kCNnJKPkRnOSAiauLBn
         BeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107758; x=1783712558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=;
        b=BYC28hVB7sLSE4ZU9Ur/GbNI+WODjXDb2tK+X+nBPvqmvFbnfLP4RUHcREl/qEtUo9
         4Rl8/TRdAEs2RvNs0Xpr1axz3o7Og5OjB3IRpzaUCOfu/fUZB+81uya0wJZbxc0jPq7z
         NyukohQrlwU1ECNHc6pK+frW0Z8p//XT4TQVIZ3I6GYVnq6g7p617cXAYHK0hE3VG2h+
         bz72fXtK+sqiDbT9YiH+frbiP/I2ZlW27ydCVRAlj225J5zc6WinAG0ebIYdMnMdWvDi
         CMpqO0rxiy9w7glTmrDBGEGyjaS+EIZ9NZUPkWG2z5BqqBDpBMxxfwL81eP0krUr0Bk3
         AYWA==
X-Forwarded-Encrypted: i=1; AHgh+RqmVM31I/qa8eotNUyqK8hKRT/VqEY0/Q5grGmeNXsyStaE/dNmDna19CrTcAmkKnonTg909BxCOVH7IA/PSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjNmn+VzaFgXeTstsxDM4427ISTZtOaRKP53UdQHLa7FGyAt/j
	0voPo7HGetxE1MRHP2HNqQoFcRIlAJp8fYIVaUQLj2FZWtRaG+drE4n2rDjrtV3kMk3/3f/8Ca+
	XHKz+fGAAirKf20TJiIVbvIsWCy6S/+Z5kDHBKp4+lCzIb2dZbfRKjGVLK2VMdK9v26DRDBFvqg
	Y=
X-Gm-Gg: AfdE7cltxDKQ2fLtx75rYTNAE9syOt0sGDLM84xC9bdb8/5QPqxts3xsbS06u6CGPoq
	WbQijhcGBcjABBv6rdHJ4TJ/DyEoinCtiSOgaUymAerz6bEv8kpx8CO2FiPLStmxVSVtx2cx9Cl
	Z7ZprnxgQXayUQRgjDx5tCpe1daouWNpshjRQ5vINrGcyS2KituNqoH0u8nGxiPf7S1mcsukO3O
	xDzZlQ/+FKt9QDrzPfmvYqCT2/wwmJ7ACzpo6FEYn2Z4dj+4xPQ3cLcbLB7I41zBXAVMmE8CB04
	g6omCoTC3Ty+COFTlRHbplPelbeiyTHDlxkOBuvj5fAOLDK0BGBfFxD5N+JOxTzRrTzPWu10JvP
	asWdGUUmAvkatcED5iw9reMl6UiM6wuEWMCxlFg==
X-Received: by 2002:a17:90a:e708:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-382807ae330mr703123a91.7.1783107758428;
        Fri, 03 Jul 2026 12:42:38 -0700 (PDT)
X-Received: by 2002:a17:90a:e708:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-382807ae330mr703088a91.7.1783107757826;
        Fri, 03 Jul 2026 12:42:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:42:37 -0700 (PDT)
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
Subject: [PATCH 08/42] drm: logicvc: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:21 +0530
Message-ID: <20260703193855.110619-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXxxadGhEoWUOn
 J6n3AyNbCdwzd4AISLklffD0wP8Sr/W6s5/Zzp6t6mHvkKjummiMhir2rDiU+GlUOD8OEVHlfNx
 zlpSLdlV/e0Pu1IYTLDe/3qqSVHeKQA=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4810af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ReI0EElcLHst8dYcsfAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: gBbD7aGe62DFG5T29BzV-6EJaIotm442
X-Proofpoint-GUID: gBbD7aGe62DFG5T29BzV-6EJaIotm442
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/5nHsofbIxZs
 uWT7YmKE42juBhaf5rSl33pYwdYZ3xlbj1Rc5ik+0XrZNDkWquH5y1tXgwOnVFcGUBV1Yz3sOOs
 OF4U4x6f0rNtWSLOFNWEBRqE+X0OLGzdsW5YKfWHjY6gVZatzOQ0Um9d5btrC/MvIfDQVu5nrCA
 DmOa0H/rVR59ZGk5Sl8sigy8ZXav46y3Z6NWuVun7k0e1uDAIF/iwDTmtwrcpdZ9EeT07Tr9kIk
 +etoXiH4YF0yej1K468u/QD2QSYOZ04ltIiFdhZ5HkDo2vMaIFe0mWohxyljymHc/nZKRiDKbS1
 go+BjTj5m3Eszuu5yUChku9XvJv7Xi0wkH2r+gU7GO7W+VkjsukN4QAtCP472yWXLWf17rabjTQ
 5diMhksidjTQR9K6vH5e2JZkuGJkqKHgR5O3HmLGwDsfef/BmS50eThDTP51LHTRuMaqa99xV2y
 MJW8K7tW2SFgq5jmM8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124240_831168_4F647653 
X-CRM114-Status: GOOD (  17.63  )
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
region is released automatically on probe failure or device unbind.
Replace all error paths that jumped to error_reserved_mem: with
error_early: since the manual cleanup label is no longer needed, and
remove the explicit of_reserved_mem_device_release() call in the remove
function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..d6dbe52ff0a9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Failed to init memory region\n");
 		goto error_early;
@@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		ret = of_address_to_resource(of_node, 0, &res);
 		if (ret) {
 			dev_err(dev, "Failed to get resource from address\n");
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		base = devm_ioremap_resource(dev, &res);
 		if (IS_ERR(base)) {
 			dev_err(dev, "Failed to map I/O base\n");
 			ret = PTR_ERR(base);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		logicvc_drm_regmap_config.max_register = resource_size(&res) -
@@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "Failed to create regmap for I/O\n");
 			ret = PTR_ERR(regmap);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
 				     struct logicvc_drm, drm_dev);
 	if (IS_ERR(logicvc)) {
 		ret = PTR_ERR(logicvc);
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	platform_set_drvdata(pdev, logicvc);
@@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	caps = logicvc_drm_caps_match(logicvc);
 	if (!caps) {
 		ret = -EINVAL;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc->caps = caps;
@@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	ret = logicvc_clocks_prepare(logicvc);
 	if (ret) {
 		drm_err(drm_dev, "Failed to prepare clocks\n");
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
@@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 error_clocks:
 	logicvc_clocks_unprepare(logicvc);
 
-error_reserved_mem:
-	of_reserved_mem_device_release(dev);
-
 error_early:
 	return ret;
 }
@@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static void logicvc_drm_shutdown(struct platform_device *pdev)
-- 
2.53.0


