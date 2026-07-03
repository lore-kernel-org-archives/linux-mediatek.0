Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9923C44500
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=; b=cJ/AebkederqPnarixmRkKDniT
	QuwDxMwynKW0KlmqxHtKmNNt26Z/GbJVOJfA4p29JO0iclLsFkU/kNdqRmvuIjbZSd4Wfg9KpMDec
	nnfG296deEmr9D94Lqs0jWiLiD2BaxBfZzOlrByBU6HdAU8V1AlN5ZZ7xy/xwfnJBY6YcnRskLeIp
	MPE0Wt5ilWRUNWis8osj+jAPCof79Ix7/TSB3QeE54Cgj51m1thLwWctFPvqk7eKZhMvt32cTo3MN
	UZvFJDqI84A8qqv2EJYbGwKc3rNdapXCLUQb2QdJijOOO6OQYztxhqPGmc38fLP0qCwmrronu5YrS
	Xw6xr0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjl3-00000007nCn-28Xm;
	Fri, 03 Jul 2026 19:41:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjl1-00000007nCD-2cgF
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:41:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiV1f695783
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7S6HE1h6m9l
	hE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=; b=BWHUaZWv+bF9yKBF+/TmAfINoX/
	JDQrYh1NjTGMSYWenUzFcBW7g0gbb+J+tyyNa56aj4sFeHGr3rPjjEDb8QbkBV3h
	KI3Vv8WYnY+o+4H00pvmBAdFK0PUp1dOXrM7+u3zuzfdWIdWke9AUcUJH3uUSxPT
	vQqu36jx0ftIDpgqrT4zTl9ahgQOi0NiCOdoTQREaXeNRfTSMs5kjjOCwlH5Ue1k
	zLbyHuCkxdDFhfryu5s/sG/7LZMR1EHCn6DL8cTFv+HpaM0WeShlHADd+PvnW8Xv
	B2oy+EBhx3rxbvnLnT43149pGltQRY09RsmrapivIiWSZbFohMSsgSevu5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:41:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38096521198so1448708a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107662; x=1783712462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=;
        b=ZbnpTCwWBAcQeFFJQvnjsc9YysU8sGsXUHUuUQox2CXsKF3LTkvYB76qMluoiO5xz8
         VLX/5/ih7gZtVoGgEWt+mgYIxzF8xrG1UcdhQD7I8CzoJwGVu2ebMBybJK7ZRCtGxi3A
         H6xXi2RFr8IKsNP0paVES7h+42clKjd0+FkcCWS5aV8A4TSLGAoUJ6UW6zC26oWORPay
         Zw4Exzftd2c4AcxPmlEhqoNnU0XGgiiZ5JzXWxoS5ZRnnmbq2zF0apJBYKMbXWg/xLFo
         OE1YumpVPeB4K1zEgCtly67AVaJjhe5XhP/6bUEFyG1fIEVsF2hwHiNDf9QospngTV1G
         PnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107662; x=1783712462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=;
        b=eW9+AljnTgudvSMfJImBN4TstJGYU/nb4ETtvvLP5so1ilYRZ9s4a10gWm+jw1WOAQ
         C/jAXBg+7pk9z8LmJEev6hi09V+SoDlwFjAY8L4iE1+y4rC2xCOYeuSWCzulU4EaJF/V
         eYpp3+fNXU7il6sxSxAJB6B1JpR644ncIoSme7KEkack9U7Krp1L0fTYDGrXtCAqPeaK
         LnBIqCQV/wY4j1HWsxYFFFK46mP95ExDUAez/IVLT+0n3yhl4bSMooaYPzrOj0w8gKgA
         Y4STSHR2lyUMX+D7P7PNzOQddBG0zTLiMPXde2XdKop+E62q26S65lurA/rfF+k9pXlL
         C+zw==
X-Forwarded-Encrypted: i=1; AHgh+RrRWO3trDxEu4j4hlXxqqUFTnMVhdT/P063i7tsihm8vX+eckCg9Gk4lNnxo5K/ekwJVCi2I0QT9SWofwUevg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBZM3USLcLA/QWAbJ2JZZUQmWOydtv4qVzfPk4guXB6oFD85TL
	qNEzJkuTJuvovgcq2GPOFBI24vBd2BE0RvlADQjscghp7OEJ+35UlloSYxn5+YsREq1dlIwYW9n
	NUPYerOKh2f/wMpFj9p2ri9UqTw/n2tQmPTklHoKTjl5Hb/AFzTwZo/kMXK935/j6FCHRrQBbM7
	o=
X-Gm-Gg: AfdE7clwwPWFEM13JsIcy4iygKsK/h+mU28UIDuRvtFhkFvwy8pOJQRjEHKAsH4Dsgb
	TdRHvL6k0+A1OCZmEkubBs4f4zUQmn6vqXJu8yz2DAiE0cDLLiqJUxoIqwZRf1nrKXBdCq+s7fX
	VaJPfC/RtPW59eyFaKZN19eIU+bgGKlCwUxnNJnWnQ6qZebUG4m7XyfhVCdwjr/adR1vm65jRYo
	91nrLP10dKLlpGnZycZjqKiAvv1iSDPsfrZq3SQBbQ7yOrq0FGRcVlbqhImeQ4lLLCr0oTmFMKK
	XNHQjyVDzPQBhwEIrH2ATTVDJVVH1Q8Rs67R4ZWEAMbLnJSpBlhqrH27SEnwNRzZNvlxOYRMZZV
	TrklSPTqrFcUzOutVkLQv013Cuf0V9R8GWqHqhQ==
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr770781a91.27.1783107662283;
        Fri, 03 Jul 2026 12:41:02 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr770661a91.27.1783107661655;
        Fri, 03 Jul 2026 12:41:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:01 -0700 (PDT)
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
Subject: [PATCH 04/42] remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:17 +0530
Message-ID: <20260703193855.110619-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d-v9WXKagoQx29Mh45r0W7bnNBy89LKY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX7phIkJW9eH+q
 FDq+bmiwCMGWqgDiNCV06lFfMXjm1IE1TECAi7deEiB916QvNqGFNrgU9Wr/WHdiAzeEleQrhYc
 W6grX6D7nCCQO+IrnjbxHKEUjMnd+H0=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a48104f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MiZJTWugLlTGxHTZgFEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXwVHbUsBZEeY6
 qAo++Htd0tyCmhp69qa/fnkUjtrJVH2u8dG9aPcIvXI2YjJyCJSA4pt7twqMIWZIu6ackYKfI1X
 VKtBsVKy7ALjYqPDA26HlIEKG0wvzl4ffqOwbuQBrxI+m9zRwLQHnFIUjEndINy1JOLy0CgkLoD
 cbRizgbODXG/8nd1UOM2XbbC/jxGmfPJviY86LQbS3oHZ0CjM50N3pbdpdgWAHwRrxizW55qTsN
 7tmdSaS231rfv7JAdjqWksju+hrbBwdgkEl8jnGkLzPRG+S9M7sZXRGV3h8QupCjL4dKYDuaVIo
 0ryRurN3OD2vjXmw/Da4+E5Eir4ZoVqKrKQpdcpPBzBpRUA8k8TCKDLXICB5kNhBh9XV0zA39uS
 ykY3hQp3WJB04EzPdyZELDifU8OCA6nh2YnmU1ZWHzfrrpA1ci7dU1M4d6ImUmgqmjgzSGs8Ker
 Bo4OcTOpBYSUr0dbz6g==
X-Proofpoint-ORIG-GUID: d-v9WXKagoQx29Mh45r0W7bnNBy89LKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124103_993730_639A51FC 
X-CRM114-Status: GOOD (  17.11  )
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

Replace the hand-rolled da8xx_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 23fca7176539..cd9a8f2b3163 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -230,13 +230,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void da8xx_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,10 +260,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				     "unable to get reset control\n");
 
 	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
-- 
2.53.0


