Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB5C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRi/WTO9ulMC6lVt6c63wlpnlLgzkshb40+LVJZvO7Y=; b=ubiEVjzho933TD2/Q67TBKMirG
	lsheellqwS1b16uj0Wa4ERyqWZBQfeF4hzQW9iXnN9G9U6XHuiNRzujH9M43ZOfvGdjPF0xWCtgf2
	HCWXXwwH/gl8mLm7jZuBVRtdEDiWNOJ4kfbWJUpY34DqqLs4n1UDtZWvK4Q9r0x+mO1+W3dOXvHNX
	fCgYWPxU87yY4+R2yk/ruP9zC95BJFNCqqnsduSIhqB9z1HauWK3JAjB5QEmUwcnpxKVNWnghaddL
	jmSni/bYMxxAOPqjzho6+2NrobZVhwO5oXeAE6R0wN0HOA45Mm0lm1EjlSguyL3AQ+/JeoHUa2/HV
	M2leDWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfju6-00000007ogp-1Z1q;
	Fri, 03 Jul 2026 19:50:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfju1-00000007ofC-08Wb
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:50:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiULO545604
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yRi/WTO9ulM
	C6lVt6c63wlpnlLgzkshb40+LVJZvO7Y=; b=G9SC3rEj2kHAWnYiSRqHCTjG60U
	GTp1/0e6hpptCvjyg0JEHGriBBim0bhbPooY0oATfxtcRJooXMhaIcLDCcBqjgxk
	jYlGgrqHqhqtatabxhhxjtMkbHboHxz/yXfKfl759vZd1PEzqNEIW0l0ix6uYNAI
	Z3aEDzbTEup8FZLMCo/qecqk1uNB3pqgFiIPsHh56TqHtkt+ROAaE4LsRtNvey0t
	g+6LF+M75t44gZnCpER4kEMf1DlU9CKiCvGgikFnVCvCdxrVPZwvpgNo09p87uYJ
	HY116V/TYlyPgw62giiMSUYvclGNTfzHx3Sk7c46X48NmxcNE5oOV8dAUYg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btrtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:50:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9aa197d5easo2391847a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108220; x=1783713020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRi/WTO9ulMC6lVt6c63wlpnlLgzkshb40+LVJZvO7Y=;
        b=izv39LuBBqBbYm5/pxoYguRBxeIoaVvh8KgHwdnaVblnTv+L/FTNJ89hyZ5P5sEVD5
         O1hhTby0okl7FGag2twzNTPVumr2NZrDntou2dM7W3MeHiXYeFgDvLeT5weYiPhPSVGP
         yzqBlmlinRO2EIcj261cXUUX0nMF8tUo0S6+SYxRtGJYMMdP/mYVv5aoSt/YW7bKS82Y
         cXbyRqL9OaCy+VdHf9UiUnedffCDTYUDFREXMFHtDWtAjXSILJfRRuIHP+Pmb0zW5py6
         fY/4SazeKLfxf95I5ugRhimzHHxYxpXamONZbqvL/bVaZW2Z1oGQ+J7T3ziPGyM6Opo2
         dpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108220; x=1783713020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRi/WTO9ulMC6lVt6c63wlpnlLgzkshb40+LVJZvO7Y=;
        b=RziNRMb7StQgOQNx4Pg0IXcj06ZUQHVEOcVye3mJ/NUZarW3DyvM2iA1jGce+jkvQl
         MungJVUFnWarbW2q4xeEQ9jH9lWYWTmEiq8lff+VN49skNToiYacdEuTuI+oamaZMmGo
         +M3t+WlfS7asFm5D7nke83zOR8NJj0rgR2hGkInH15TRKCMwLhBPhM0OgsftnEBP0mlb
         ZsdqXmOoGqoXMyg+Rsw4GIfDZole9YqRaeDph43XO3DvenWkcPwsCH3TkOow3QoMOmzW
         nuu6Pz8HKqT96ZLSR7qICdEq9yPejMLjEgymcndgHZfnWgSQiw/ztE74crPxZSrPyt7K
         dzVA==
X-Forwarded-Encrypted: i=1; AFNElJ+kxaxD7L028Eiizasnb4CWPBGiPS83cXZSeMgqeJN4B8vi5GQsY4Gy/xNcxCcNUS2Gz/AFjRXhz6842kmqSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywil2N14b31T8v14HFx81dvoo95WgvyT3HPm+YF/yIcjUA+ycS0
	8Cc8BdsMVmllkvg5E7wxgjfG/iPudfaKvfaW2rVCK+Av6WXNQWV6iEDGoE5a5/h1PwxSwjab4rP
	vrvp46u4QEUQFGt++4MU6c3L3Rzl07+hd0Jz+BLNRbGWOIW/3meLkDdZk2tZjTjxKf3hI8SAuBg
	Q=
X-Gm-Gg: AfdE7cltmFLrTdDxST42+AJXyO7Bhxi/GkzZyG8d8PQ8TuSrWP+PLvgwrhIZylRegYL
	O9gJ9MN913j7tBCRagYQcUFCWyrt/mC2ERjfe5GI1O8YMyNwU4ni5pcYKRyecKZ/1NQtxk54NpP
	pCBoQGqmCmnYGFLF1VD1DWnY5D4aoG6Cb6n7tQwGVMLAXNsKULBzUXXncCqUJJRxCc8+l2pKGdV
	aQfDc9lrxml1mbgKdgxjDKZfg82plYjsaDDmu9H1YJw+KvdmUul7X2rNnuemXSbcNJxXjBDVkNi
	85t6QOqHfkiMDg31xJTqICUq2dAYthPInxV1Q5iNJDOsiLpKuqi+FZSGXiXTHAGd7oLZsm99IFH
	osqkhXI/W/H4NlbCWEAv5heDs00oktH1kv1mOhA==
X-Received: by 2002:a05:6a20:938e:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c01cbe495dmr6288477637.37.1783108219282;
        Fri, 03 Jul 2026 12:50:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:938e:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c01cbe495dmr6288369637.37.1783108218631;
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
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
Subject: [PATCH 27/42] ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:40 +0530
Message-ID: <20260703193855.110619-28-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1zM7N4IDKWec
 LcVAghMIPRkFmsFf149OHVo4vPuIwVgXJ0Zhj1w41RaFriKfSYqoluOybF5iCMjvqImtYEuoldz
 A4ZsNcXDMBAExtlwGZgPAPTBaVtFmLrgZosB3Xh9FbQmPjFSsmN7JecLwsSgv2LMLap6VEGCNAg
 YwW4xKF6fEtvq8Nh8nLwYTjv8GTdtVYOw/wSOiaW30cvS03PaqweWX1R4UVdMLkzjVWDRQW2UY/
 QFTXGfEOQNR+zaZcvbR15rTNccIf6OYLmiZ2D86C+2n8iB9wSv4i4ZLifndBau5hVporLpCBOQl
 6h+Lw5FAZAGej3Lsaj/n5+MPWHwSQGT+1X/pfRwXbQZ7+CS8gV42HGcKLiGGOFS35ZzMx/LIPyR
 IaqndGbDbejs8OyD6ZLpHKGtfNfSefvlledN2Sr7nfdn9HTgMQx9BPNDPjOE+VZps4cBZ0rCSst
 rHxnM5eYS9SVkKy+nnw==
X-Proofpoint-ORIG-GUID: jwXDSVBYz7_WphDL2NYphqGga-sWuu3W
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a48127c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5_2tDv0Uws32Dsz64S0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX4aIej2drQeYI
 HUfKai+vY1OkiFgXxQF6pn2HY2rcW4JcYOTgquj5XNkD4Fsca3XOwEOpr0ITp+VJ5xA+IEThs33
 mR17xwKQj0NREJ2RokunSuHKkFJ/wpI=
X-Proofpoint-GUID: jwXDSVBYz7_WphDL2NYphqGga-sWuu3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_125021_077295_E0206011 
X-CRM114-Status: GOOD (  16.56  )
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

Replace the hand-rolled devm wrapper (mt8183_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..6ad396e3b10d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -766,11 +766,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8183_dai_memif_register,
 };
 
-static void mt8183_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -795,16 +790,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8183_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
 	}
 
 	/* initial audio related clock */
-- 
2.53.0


