Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB64C44500
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=; b=QGkWQ3mSq3BsD4QhoodGLowr2T
	J4VvePBB/MEmhFxJOy91/rgGYxgjfz6krc3YTu24IOKCVVEuoRk8zzmpYa8pkucE4DEH5xQYnmNUX
	UXleWQ53pU+5i+TnKStDyZmX/xYHiPlGGYofjNEZ0Sge14GtKN0PkuZ30svviVn/91kUMngzTcBGD
	HMSQquzaKYY0zz57ptemmxt3lP06wpDGKpahWXWbrWmnsYLvs+AFCPBXh0j0GmP+t8Q/MEEnrgNHg
	GvGJa2HPpxdBn5x2uTU2A0yLRkpmDEIisBvwQfcIB1C3NfLrK/iGN1ZKdFNx7kG4ItH8fqe3iXBlr
	katO7soQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjs8-00000007oO1-1bWy;
	Fri, 03 Jul 2026 19:48:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjs4-00000007oNB-31jj
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:48:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiVe2631517
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=05KKm/2fQBz
	iycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=; b=FSL4OW4sqkH5b5j9AIsw/YhH1nf
	ibgm5Unh2DNBArFuPePTEp7ydMwknI8hVtfX3hafu/sPH/fll/+Yol1Nt4cgUW3O
	Q2oC0AjaQcNbY6bV1u3Lrt7No3E1HH/aXPsXP7AZG4RXN8ivUpyMfu2BoEamWIFl
	NW3X3tStizixNie01eHQ9xV+jNSuNRjFoUEqBSXss9qBg6i4tK2kHk4NWRI7Hght
	D9IYQ+nKevxHW9yac3lGAA5QYlnpXFWRGBioWY+Th7V0jEKaJwNAXJ3PPQeJmZTX
	xFvGCoL556Tc+tATu/JtYm9O8HvYscVvC/BQqEq/B3XicM6VWsCrI2LiN5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b039ymc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:48:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1229084a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108099; x=1783712899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=;
        b=kJStBz0YwieZg+S0w5ZybYA4jlqLjq2h77jEFiE9Eah+YxxPAZnWWmSVAAZdmPdIHP
         ekp4wigjcrcZPmywiRkJJSoE9YbNcTPyEBxHhdx4jpV4izYz4KVNBYqfXe3E0lEIVvOL
         LIU0+Q2i6ZJs29Kn9mlcNXXqPCjz+i1okLkwkjtGSdXA4xmS9ie9PSicksNyqn/b/6ru
         wXkiDfW5agzLSDo71RjY3aFxM1mAOfqUrg574uIsJ8t0zKu08NObr5YiEBuXqDm+zhPE
         nFTO/BJLjPQ5rhofw6Ulfs8jB2RZu4yXctabx4yY1qwY9cIcOfpmZUpLEguuwAb4bHPl
         KzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108099; x=1783712899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=;
        b=SYSveA1HAxJr2DVCMbqb+f1LLGbhsivGyshrQtz1EpT7eq1ozCvpS6hCQHrXwgMKTL
         OBUeZOnNiV1tbmgW6M8rLnSkJJEX+5v3g257L4eBU6gWNTDZ45O/2kuJ5fi7/XKCRbVQ
         5IY0ABoz3abAvWygan9253i+TZDYpH4BnAf9Rt2tHn/NJHtzRJJS+pZQRPNAtrnYvrP+
         HLGQSfyLVzDw4/7CyFmPDC/3JyxrXGRTX53quLt8FF00uWOpy23ROgYnjD1FcdkhFPqo
         atPsQWoDH/SMZK+Wnvw442ZtDkjFJVnvpSXDGS7DOl0Hy8im7NWvGRt683SuSX4X7FCI
         7cGA==
X-Forwarded-Encrypted: i=1; AHgh+RpDadV7SPRMsf8413ks7g7v6QWnSolvCcsT0avgn3vJoK0alf3HL1390Uy3qdF/Nbt5OQUpHUawUl99dOnjXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB4KqHLIpghFkwxOZRK6GUFMMCoErOs3n/i0Jn6X5i/iZDBaSE
	6Dg3z703dJkIWdV5rJBJjg+J1z973Kn6h9buRFcFo7I80e191JpGUyEsElB8GHqFHzKuSOcsDEk
	ZrCRIV0T9/x0TYh4U3qODtglrousRm1lIHlRgx403rloLQq5ttc4IRF6eMizAJ/9nbqiW2NCDht
	Q=
X-Gm-Gg: AfdE7clhIRlfS+YMDT2m3dYENhEDNnZDHojC6B8PbTuUfSVADXJGFT/DEWk9dI+a/Kw
	lTXbovsW0kYDj+Drmc0JcA7dMCgaxDgSZQe8yxT16Svr56WIf2T66s/5NFMT42vQNVFN8SxqiRG
	2x5hKI63AMaApYgRPx18BQGEivrefimE9+OmtDv/j+TxZ2KWtQdvS12uxq6I6WAk15l99YmrD3G
	ux40nCXEmYsKILmr85DJ1Pq+DK3QbC7wSF1n5LCYC6/fUdHKY5kWLMhxmTOwNC4UWNJX9VKTS6p
	8RnHp0volBQHad2XIYDhvmF7Fl4s5mx3IR3w2Ovj3NM1pMvfJXSKwvb12m++RZc2uLH1WKNCwVU
	0QLmuBCwtDX6XkErS4iOUPCPsNu1uYlcxza105g==
X-Received: by 2002:a17:90b:5106:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38112340885mr6289021a91.15.1783108098264;
        Fri, 03 Jul 2026 12:48:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5106:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38112340885mr6288938a91.15.1783108097697;
        Fri, 03 Jul 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH 22/42] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:35 +0530
Message-ID: <20260703193855.110619-23-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX+0aRDkQ5j5DL
 QTS6LXMC2myg5Gv8Ix0WKEtzkqsYjEqLPXdgKdQoKT5Hu5WK4ghJd8GMpN5Wu1GnydsrSDlSkTQ
 xqfcyxhmjjcFl2f96nTbnAlbnLi7Fi4=
X-Proofpoint-GUID: oHVI72huQXgQ7io_-Tm743p4sNMsd5wS
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a481203 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX7fRHx7zeU15S
 74pzJbFGF+iyrZn03fnZOjyOjGrnxP23bil3JkYP8HrjY4rJwRu5tHh0V3KjZzNZB/hWoZ2pH1K
 23v0stukNuRBwdP3+LEucJUrq8vK498kFTmQPnZn0xTBYpSvGM7hh9h1p1wubVzDfJz/1M4YBl1
 vcBYZ1zhc0NrgeXXEKXlHgzVLyumpwUkLCkewPozmg/ljhDGRz0Y/TBO9osqaoH1WS7dOAGO205
 59baWgKG6pzsqbUB+5VvxGieEs2DWez+skc8svnSj/fwpFO7JCwilPNkJV/A0tEi59i3Ooqviz2
 pbPoJZSck5s6P/HOHfeV2kf74MQ4mE+tEM1bRGDPdAEkKzLZ9Qo1yqa66ZVWw1qe+toukFmkKuU
 u28szrz3aC88BmlCW697NMfGPOwVujeedIBHImVTxa6eyeEY2nmeEMFIHbZwWasVxPzs6YmWisX
 mbyZzkWVKHamIMYSu7w==
X-Proofpoint-ORIG-GUID: oHVI72huQXgQ7io_-Tm743p4sNMsd5wS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124820_876906_C9FF8F50 
X-CRM114-Status: GOOD (  15.53  )
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
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.53.0


