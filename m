Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFD2C43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zR9XRPc5AVucodt4jcddD2QULOfOq2FWZnJr+n7Dti8=; b=ZbauzDwYcAeRdQJo6kDm0yq7Q7
	Tf71pt1xeHtWI/Bs5Y3xkNQIhgxHybUkmz7WDzzN97olqh77S5P+NqFOTib8nBWGJ8LYB3fXEqQHB
	pwSECR2/XCp7OJ5xUuIZj2GDX/u+UOGCgGfLMxB90twj2to0tgj4ceQrs9+o97RfUBbFziqHk8KN3
	XD8ucF09yIFmQMbTuvEnxdSAYKtzpS/e9giRKYK3O41AZK5VCu1+6vvWpKlxxApw1ssO9e/Q2/ovT
	iMxARvKGyQUESs386+4ttL+aYSi8Zd5WeTKmC68boEJIhWoutIzavnQdjAXhQ72YsN8vegf3W4fFi
	eFaOCULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjkg-00000007n8i-1FYg;
	Fri, 03 Jul 2026 19:40:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjke-00000007n7s-00ui
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:40:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiF2c683655
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zR9XRPc5AVu
	codt4jcddD2QULOfOq2FWZnJr+n7Dti8=; b=J8ZGLy0xXXuEjWJGW3BRjxYS6bM
	3+dbuT5zbOpIDAwUtNGrTXtoVnVWOwNUo6eIEA3DECCTEOtiBQ1DMFD0phWfoFf2
	dZFkiD8S7fenOGLkh0uuwz0ZkVjPa2JedzgOBGqFoBe+xMf5ZHKUOiSR5XFIcwzg
	mhGkObWbnIWinotY2TsclIJMO3qilpuGC9sJY+SB7NtO+LXzC21V17p4igcMbF62
	pjaIAo6TLB7y0l6+cDM1nurvPxHtA5vcKRXylW6Y4a/iQr5UqazN6A1IsYRX+Vhz
	/sKeBg0qQU3hsuEMTB5UiS1sB1Gi2oxTql7R/jI1L9tJWier4ElBv2IRhgQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5brsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:40:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so911770a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107639; x=1783712439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR9XRPc5AVucodt4jcddD2QULOfOq2FWZnJr+n7Dti8=;
        b=BWAAeDc4ua8jq9sNXG0/3scuzfjdPZPlZ4gUWh6AM8M4OH0qdSgeaHAy7jGeEPgxfk
         +u1eyZCkF850fXMKPm2zYyN5yWoZJh4vP9BrORzWc7T1o68bGpX1wDGLt4KEZp36oxHw
         kACVKpEiZvWgPHYxoaK7BYUEHWiKT+ADDygLgPgaI39OVFGj0/w0JaJhF8WIry2dZpzY
         0pm0i+MOxdMIzgfXdRlYmKeCOfYEIqLo0VVU/VnFrDd5YZi+0T9OVtbMG/EhIl57g8hY
         U1qY2Iur/43agcwzy6aR8Vx79viJYpD7DA18uMDsaQ5zEXj9y3MQ8UA9cl0axgbKTewZ
         O7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107639; x=1783712439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zR9XRPc5AVucodt4jcddD2QULOfOq2FWZnJr+n7Dti8=;
        b=E+pdH7RfA/xjp0KxKBbmBJOvIrT+3hgvRGMVFt8HKTT6iLoa5UrMzMbg5mNY7GEUTM
         bbXDIE3+3eK5TiGV0h2dlcgeMpKHH+l4ndBAvd5OeVWE8ktVQuPCE2CEqGm6CzWva9HD
         KG46DG3UmHb6cyOcgUr+Fi9CPkTL/KoTSu0My19kXfqgP20rOW8jwTmMMeFbcrLt+L8+
         gyPL6OFpgIW+DmIqHw+cJkY+jiz8KZY6//JWBRYe4QdPGNEScUV6mQfQc9H/8UL3gaPo
         eUW1obbu6LXRWI/h9wDCxVdG0mZrMDMqBWiVI6QhdjPfIItFH/C1X+S4sqeILaUoJBWf
         +pcg==
X-Forwarded-Encrypted: i=1; AHgh+RoX3LdJZ25YyE0lUkDFUuIUdX+2dJ9nVgSEJRUPIdUgZxGe6OIREQUxqN6dOtYYpBEEK0lAs1luKWOy+YglWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdg+O6s8+G9NZYZCyswvCl45RCb6jtuEbVfYdLhBib97eP1jxf
	svF5pXezeDPAmxdGwJemHvuD4h6WlMP0LEPGK3Y8xBwtmwws7UwOxiDsfNN5Bftq5VStl6q8vmL
	7vQPOlY/A9wp5WQoD9o7cb7f7jMFERjfjgPnrwP/ltKf8USRAw200Gmr6NMFQROu3FBQVd4pLXA
	4=
X-Gm-Gg: AfdE7cnD8b1UwJ2vbZHgFqU2RZLC+g4V+yqj6KXomDgDMlqd9y9SbhykUe9H3QIaWfD
	pYpJvqv+Cn1GhOlWzej2Pf2DOlJe+JjgJICsSiB6Oax29zNfkPzskTe20x6kTlnWaaTfH6jzrfN
	vdWy63c3rYe3lhZC2esZPla5lNngbaMKFPBqiVIsrV2hHpUkTS7DGERHv1LfLQGoPyM2wBt3ifI
	tHqPZ4e2DE1/SDh2h1n57Kb63Zwdq6EGwhdqzL+01bB1snTYZP+AKuDtYpdez6lJ5ACVG+x9CJZ
	xjde4zmH/LrMj6yho5/+PUIbNhYjT4ME22l6sp7jHxahll78Jp2MnSF948mOfVt52Wkuq8C7d2H
	HH40pcptM39Pq/KFsKdAttqLBxzetIYPmNcMoCg==
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr834274a91.24.1783107638328;
        Fri, 03 Jul 2026 12:40:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr834169a91.24.1783107637623;
        Fri, 03 Jul 2026 12:40:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:40:37 -0700 (PDT)
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
Subject: [PATCH 03/42] firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:16 +0530
Message-ID: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX2iYQ05QFJRnm
 fqfiV6oZstFJgT5Bzkp4dCFis91pkUI1HtwB6L6UGT3ortedQGFrSWayFGvcN9vnCIjB8ZN2sd8
 H9DXAFvVFAElZyQahM87mQjQ+NZG058=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481037 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-SVse2xkFbf2KMwQCVkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OkJ-QtoFy6YwmggNIJM1PABomJx02LNI
X-Proofpoint-GUID: OkJ-QtoFy6YwmggNIJM1PABomJx02LNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX6lbMCwG4rPpB
 31R62/cfL9FUppBvt7oPSQDNO+utlAEmkVhGFsMP32x4OaS6cL6VU7Mtpza+QpW68KGZWSEz2sK
 In/n3pBMGIKjDjCSa0gvWUEHaiKDgk2i5xR85eLBKnnIBYXWA4jn/B6l9EcNXSNgwpVguD4emj4
 HFuA/e1fCFgUaCfikRSL2EXK8ZIkUg2No07FYVtiYem0Pz5eA2IYLAR75BXBsIF1bUQUlBnbxDB
 +3JwVvngoCY3s6Rs0+aiR+3Lx867xF4+QS57EUl5BMjdV0eciXQaTJBfE0OVFbwNnJIxKMUuK6w
 ATXER8XJwfClQ2gwTv68p053JcXFQtQlJyK0Faaeq147f2mAvLz08linM3xt0zfm3bBeagmZ1vI
 xkiJRcWUdqbGM7cNjNeGuPntawy3xr2FMtT1kKHw9c63hhwkCzidf0AbgjhpTlSRc9Auz9FpyTJ
 Be8jA6XxwpHmtqcuObw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124040_077379_6EED607D 
X-CRM114-Status: GOOD (  16.97  )
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

Switch from of_reserved_mem_device_init() to the new resource managed
devm_of_reserved_mem_device_init() so that the reserved memory region
is released automatically on probe failure or device unbind. This
eliminates the err_rmem cleanup label and the need to call
of_reserved_mem_device_release() explicitly on error paths.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26bf87247afa..0f9559b9cc53 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2779,17 +2779,15 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(scm->dev);
+	ret = devm_of_reserved_mem_device_init(scm->dev);
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(scm->dev, ret,
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret) {
-		ret = dev_err_probe(scm->dev, ret,
-				    "Failed to enable the TrustZone memory allocator\n");
-		goto err_rmem;
-	}
+	if (ret)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2797,11 +2795,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool)) {
-		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				    "Failed to create the SCM memory pool\n");
-		goto err_rmem;
-	}
+	if (IS_ERR(scm->mempool))
+		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				     "Failed to create the SCM memory pool\n");
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2872,10 +2868,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
-
-err_rmem:
-	of_reserved_mem_device_release(scm->dev);
-	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
-- 
2.53.0


