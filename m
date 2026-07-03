Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259CC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=; b=KNZ6Aij5wi6SjyMrqz46+ESWm6
	DFk9jsFVyWBensOyMroxVZOfTwEMFDhewqzn9ZyhrATYaez8j7PLwH0vdgnJbk72rOCYCcWcoJHkD
	wQBR6zs291asFltPowyLJd4D4S3SiYQRLBGOEvkf91tHs+9YEEnaZ0P9tlDHb9TklDQf3/TRYsgYK
	LjJW/cGCDtSX+qepjHKbQG6Z23myZDjX0afDIv0xT89A88sih1UW/FMnUM80S688EjhEfcoV0vd5Q
	95OEYvpgPJ7TOmgx4SXJI8K4Fayok7XVgkRAXcW1n+RrwP5EK5VAHgDKw3UuKCZprVTaL9l26oLle
	Q+3mxA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjqW-00000007o1Z-0HfV;
	Fri, 03 Jul 2026 19:46:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjqU-00000007o0s-1SdK
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:46:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOXL684032
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZtPwgb9C92
	gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=; b=Bgizp88k+UDI1BLUoJla4GGkC7G
	QalzzIQo5HOKqdySyqouNh7+fTnqdoAZPLfvNE6WIQ8ehkVEc4JeRhDZ+Orcj9oI
	vlzg1Soy0q7BSmJNaInnjhEUveTV3Q088y76VQo+l5xDTYTd6AcH4BPQvyk0utHM
	1H9aAIqqRIpKRozXZfR1zAhCOSkc0A004ZMHBVJFw9l8zneQ1vJ98wBZEjm1ggA/
	YmlraZaHuss0dzpOBmhubqznt2yTpsoXkoiutm98MxUWy7jHGcVmDDxzlbDuEDFo
	bW/eC7Y1DIr5p3vbbK2AU9uyIuV78xIPfCmI/lsyvnaAL5Ox+jf8uWb4tPw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bsga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:46:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso1433786a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108001; x=1783712801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=;
        b=RJIJb4EmfM4D0MxN6dVjsJwYUQQPmr8Uk5RqaxdHvlgaSyhVo/gWliJCarZsbQxbOW
         GwzKA8wDYkcaF+11Mj1zvzP4PQFTHxxiIBCobXUqjEbfmiAZ/quW3DEo4aocwK1DoVKv
         KzDZ82Q3XDvXntllh1iBTSkNR1Z8coFrW9y1TpFPfdxVamhFRKZ1TwSlei2UFShNlXdR
         bHqkvSBEuo1mAjXy7iCDqwUuQVtbr7le91eSMVWylIP7U43W+kwZkcDmGIKDHFw5AFoU
         00Y1nkxpgpiQwBpyi4yir+YnIMm4sj96e8KM2rzjjWMRlqBTqk5kXIjEKD8wio9kgKBh
         m8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108001; x=1783712801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=;
        b=KfgPdh2NzlnEKD6BNZhcYPAJ6dwSegFNUIPy98bnoOpNYBQafTjON910R7DwPF62qK
         thsV0fXlaEZyB/Pol68FR3PuvG7sHmvUiRik/B1ZMITaxm6YGYBj/nDA5FWcMk9QjwiK
         5vrgmKGC5evFXigmSXd8IK30Ytu8x7wMWESJzR3t6InNAvW5mKf3EjzmkCsZhWUKLc3h
         0kg6iR5YPPpRfTLkWxjGgTg7SHgBmUY/+Te6yhL6ZcVck29ipWEXqKhl23lGaUYPIgp+
         MFBGNJ3jqdCmOwynG08cCjq04mNCZP8Ug0n7KTSp698XcfqX5AxU2TBjhF8GQTVZc/RW
         BU6A==
X-Forwarded-Encrypted: i=1; AHgh+RrrHJY4W95o7WGJsCOE9Oz210unMFEWUQx7SjeimXhnoQLyVdP2jlaNqS6t404YX+hyzFhsd7bg+2XQOPOt7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb32yxv74u1Rmv0IfH6aKX8p8pvL/+ZRuG2rlW5734UsF26KwI
	oOkUUegrWzzL96Ir72XzavU6k1wPhxH08S7FFpjGeP/1Uf7PpC1qzivMkcvyVgaYQIS83uG5ky7
	eH3ITF/+Y9ErImUGoWYo3uLTStPQ9I38A65cA0fRBJm6xyZb/UEk3MpzJoOhj1CnrzupwDW358B
	c=
X-Gm-Gg: AfdE7cniQT24E93p3rMLHH3SkCaR4qefjGe2EAoLM5j4E3pP8qTHAEOI7Dg0ZeuGvzN
	H8pn7zJgMOlj1KZEoMfBO11QbyxGfa7/Iyp53YP4jIjZr94uifjkYRjz9D/xHbbaQn9H9ZGfnSZ
	fhrpKezQu5AyFENNM0LuK7AxRUEho+mo52UrUcO8DELBkMDTbhjTfLFBdoM8YY01gMEcfhr2qwf
	+UVBvl8TAfjiXS+6z2zU9dM7/HniPD33D1pSh4kOmcobE4ARW3jJsqLdtL0/ztP2k0S2ZHf/jes
	gxCPouQCm5+08CRMAwpwbo7eY1yn1T9dCGhWoz9gVMN8k1v8ksUO/Q6wGyX4SidWzle3x3SXiQ/
	l78IGOqVq6HwVSUCivMzlb4lb8+/6HX7h43oHfg==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr762820a91.21.1783108000994;
        Fri, 03 Jul 2026 12:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr762719a91.21.1783108000352;
        Fri, 03 Jul 2026 12:46:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:46:39 -0700 (PDT)
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
Subject: [PATCH 18/42] drm: kmb: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:31 +0530
Message-ID: <20260703193855.110619-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXxt5x9iolmHoi
 fAnP7hHDuWRBM4WRIxHqhyfchmleulfQc147qcDkZT8z9ukNDDPOu0ODKwdyRwqVLtPR6l3xbYr
 +r8vOZh3BKEdDEnRH+gLX/aRM1QMWw8=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4811a1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WgoW8aVLYYFOpEymBdMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: -aF1eDuYmCrMogijLJPQcMZ3m6w4UQ5K
X-Proofpoint-GUID: -aF1eDuYmCrMogijLJPQcMZ3m6w4UQ5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXwS9Z53wPz2BG
 vuN99sO1e7t4fAqcruXZW8UhOcNceSLRq3+dLzGN1hOvqHmmZ4CZ/Xqt2Hkg2M6mnJtTA0WDSvQ
 opxMVxhfwkr7nilRcqGhbUFQb9sAczV8OVNXGg7FHJvmiTmkEjGlbZzulpx3EyUd68xIAEnFGug
 Ozx/KMRQ3LWbtj91WIz1pmyGNx9WDn/Vb/WhYBbCtMA4RWZ9d+39tHaE6IDmaJCL4o1c6KexIkO
 fvH26Wvh5g5kbOVRdKq/w7rQ7odduUZRtLzo9CFanJMye0YFax2UtZuyRH9b1k1buMh7CsoO1Uw
 C1K0MNlMbKzx07wHTHFnLKJl+JMiZTqAcLqvq4oec4gzcZGbQRi3iDi0AfC52fJUo4oB4Jxum4V
 WdDIaLqm2j1ci6JMmwpQO6DH4I78MW3qr5i+m8vgUt17gr0mJi/xiAey+4w0HuE9kNydtgvFyuK
 k8vXIYks8r7uPDV7Rdg==
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
X-CRM114-CacheID: sfid-20260703_124642_396768_2B0B60F3 
X-CRM114-Status: GOOD (  17.78  )
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
Also simplify the IRQ error path since the release before init was a no-op.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..88fe377940f3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -140,13 +140,12 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	/* Allocate LCD interrupt resources */
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
-		ret = irq_lcd;
 		drm_err(&kmb->drm, "irq_lcd not found");
-		goto setup_fail;
+		return irq_lcd;
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -155,11 +154,6 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	kmb->irq_lcd = irq_lcd;
 
 	return 0;
-
- setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
-	return ret;
 }
 
 static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
@@ -465,8 +459,6 @@ static void kmb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
-	of_reserved_mem_device_release(drm->dev);
-
 	/* Release clks */
 	kmb_display_clk_disable(kmb);
 
-- 
2.53.0


