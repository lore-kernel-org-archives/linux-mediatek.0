Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F9C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=; b=l6y7XfCiLDcIKFfMAoAvu4NV4K
	ZNnVt61XVPuTKQQPk83VymlK2X6hbC/ovmeYou0f+4Ruy10givqEYRomCdlS6TX3M/WuPhlyH4s3p
	N/mGv7w5rSzX+WjdHFfaKEvY5kKv1QpuhMMFrUJ+SzLAZHkfDeYpJ4A7RLei3j7KTmmSYUmpsTyx+
	ty67AV/nSW2VesFl3IaMb6L6ChI+Jzxv5ex2XU+8jlnNKj3oPGhGdsRYXxqB40cXdrU7Mcw/QEp9V
	lpKKkYG7vSi5W33T8OSyVIIFoZST1vbpqcT+heoh0jThLoVskW2JdDc/qgoTBPhTtfHjrqt+JTlDr
	ndnnn6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjmE-00000007nME-0cx6;
	Fri, 03 Jul 2026 19:42:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjmB-00000007nLd-37oM
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:42:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiLFD695171
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fk9/GLsPy9M
	HMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=; b=Ri6qsvH0IQB7xkBldT85DbEuPR+
	V38c/QBjrTx3QAafrYlhGfVLLgywea6jC0l65ZPVm+U3OmpMLlZ2VV+buorCWD04
	bPspMhxpQP3PxJgSkqo5xItrUqIdk/3FX8SpHBpXs4HooIhx3sX33Vm6KIAIvuuO
	V+zfVc1wJpwX93k13QZzhz9J8673uBXFJQFPim6Amvhm2v5TN3gUh0UgLqfi+nD3
	BBivAzeFqowQTT99u2jDYsv71gJbnTCR7VBBQLywg7pl2+GwxpAmKoOyAAxYXYRC
	H0KctSWMLFGXaAlJi6ZSIXtE97kU1lZAseBWBP7EoFJBmuUPuQyLsm2DrLw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a5bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:42:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so1459556a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107735; x=1783712535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=;
        b=i2DHsXSfI1xImhSDd/3/gyC8w/+uCTo8HLO9aboIKX499YfJGNJoXFo4Avr9uq66k8
         zjic66lMot9/7bvP2/W0kUan9/pQpZlmQhdIf++yikr5L8nQqWXbRb+snEj617TABtST
         ZUIqC8iqxlqfu7sAnZxyfNSDkbrhCcMUgW3mTdSUFecg9W3UlrY5HT01MNEuRQQWAFqU
         2ossrd3SF8FH9goWIuBMHtkcrz+qf49ulbXMkrVk4rMr92y4NqFZumrPGCVoHgJ76oAY
         v981NsfKG5B3tcHxD9TPqrvaRlJPzAg1cYlV28duXncKiybviZ2oGPAgVISnYYjOXz8k
         VfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107735; x=1783712535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=;
        b=jbx6+cyhQMm9DrvyeevYI0kfOXK7AflTwAKXGVXwwTQA137qqjDt99kdX9Y7z7Ch3f
         rz9cJs0D6CcvEpHX1b90pJVfSZvhSMIt7NzW4j7UVbkFEf0koIG/IGe/+7JgFcyx8I7+
         fOvifQ7chO9PSv/AqPXHOGX6muFd07afazPbN/S/WTL2IA0x0Az3I6IBfF1WLaRjG+j7
         jqi7UGlGBwSBoX1Z9JXMm2ltbuOXLqMlCI7vYuA97fmTZ5p1JgUdYymRtu9feb7NaSPs
         biw9qlClL3/umMhBYoYVEjPAa9UeizB9HWTWKu39Dn1/eQYVXrmdK+kUvgT1smL9XuE8
         HPGg==
X-Forwarded-Encrypted: i=1; AHgh+RqSXlt6GdTewNJr0iI4YFYbduO96JEV0NFhKFgjWdJxWkVlJrYKqyofhuCM0su83oP9ZdUKRD/h00LiBue1mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxME+8ivZsB/xpFSRIKRcvPARbgLEqQLhNuYFzMy2vq+MoDWVX
	x0ayugWSF78TEPXNzImqysRikIncY9q1gBbcOAzXqCIN+MXiKAhBAb1KScejwhYj4sfGjAp96we
	vpXY7QaPoHaE+wQP6tUQhg8VBZh5b1ukHmJIzj3D3+uNn5wTcmxBVLLOgH4Qh81LN6vSEoW6wd0
	U=
X-Gm-Gg: AfdE7ckl4I+oXZy+6cboO+/0HNexmMP6JcoFlAdB92521z5rNUjrLkDNvXIAHZcZ9Jf
	0Lo70s3CvpdG8jnXk9QOL+NTnrMFOVST6X0nApme4BClyWCuyNP4/J+NOasMWnVMYfVcDR+2HX3
	W2XnovWHD6bgSz7Njw9H5wm2vQG1ZEAmE318b9FRQ9o9EcQ2pYsU4CZ1WVWKCm+63Nrq2vRm4Bs
	3IMsTg4vF/wddgevS75oKW7zuuHkH9zt5GbiGf7zUGF283AOuuLnUZxU8GaXAbxJ0zxgJPq/1Og
	PTVS19N/XpO2XshIkuwEuTlzBSCNyk7nmgRCt+S7w3P5k7YWfi9lpPB44EstppH+pvSGDy4QiOv
	ivZYc2m1H97xk1BsYrKUogIMUDbVF4JKNajCzwA==
X-Received: by 2002:a17:90a:d408:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3829e933299mr718636a91.20.1783107734436;
        Fri, 03 Jul 2026 12:42:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3829e933299mr718564a91.20.1783107733767;
        Fri, 03 Jul 2026 12:42:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:42:13 -0700 (PDT)
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
Subject: [PATCH 07/42] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:20 +0530
Message-ID: <20260703193855.110619-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: npMDuoEQC3_-7-_V6wRFp8ni7WlaPQ8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX3SLUs/hvg3bA
 jQrDzXWz3HqMI052jgKY2rcnqvWcfTpV+CupRlItmWB3yMRffgyYuZDYhWIWcbk5jcp6Sa2mEUX
 mqfyYOUh8OC8L7uanjJyL7rZ9UgKTDE=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a481097 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX9OOd2+Thrqg9
 ervtQ00ZyEMBQKyVY+Hjd622SG0R5hj3e9oQ0swjXaBkS67wtbyAtaKPKXPGlgZN0fZ2XRRz6xc
 V7HO6czTSpAEY0P0t5l0NWQNRgHBJfpQEGH+0ZiyBUUaLAeP9tDVY2b6hZfbitl56bqz4FYuKuN
 QmfgSIMmGFaV8AIzxSg26AUJueH54bq/g6AQPzNU8f7AUBZ+6wvQGaG0pABAZMhVhclrDCficCO
 652z/QvsQlDgOJ5HSP6Dhhsx+qwOl4u3p6ng3g0Ur+yvrA+Y615BwYDRMfooQuMYDmM3qtiSYgV
 yLRcODS7ZwH2hmEZhORNRlJQJkIX4qg6hHRP4DyHMWS7UMN+zb5kH+zlOzr0ebMSg+SVhNoyuBA
 +/qkSoSfO1phxcnGVkC3gCKqEThbUKSsUomu2AZcmQ0vbdPzJgisHcJehTJxRcxm9XmvIT5tzv6
 fL/vba+rnpzaR12rNlw==
X-Proofpoint-ORIG-GUID: npMDuoEQC3_-7-_V6wRFp8ni7WlaPQ8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124215_795944_6D46CF59 
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

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.53.0


