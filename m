Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AA9C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=; b=ReHAWEjNc5HpPvjUIMLFTgE5zf
	brVGhX7QG6s44s89zK5feyUlpXzj7os5RlMgCHTWVsQEP3gTQDVJO4qe+omH4/464y3HrJ1u1hy7I
	OCMftvZaus8h9b8KrZxpEJSSBwKvXdyZ+7EKpx/CDO3Jx2i9aaBbPfd6sBpJIkCk4DgUnh4Mm7VlF
	AoVjQYnSC4Fzl6KrMxo2rcIEUNIIuV+l/078Lv0/J2GzR/dimMpvxWf6wxMLE4FGmq4Gmda3Wu6rL
	b207uIguFS9XIdl+AjLHY9oEzSNb/NDVCb3WjdAgJbmN6LUUN4PQmSzxEcUIr9pD8TjKK+cVJKH8W
	+HRHNrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjup-00000007orL-1GAN;
	Fri, 03 Jul 2026 19:51:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjun-00000007oqJ-1aSY
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:51:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOEN676040
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pe8ST3hB3CC
	kwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=; b=p7nQ7zZXx1dyH2mXz3LmtPkSnUd
	jisvgy2NTifLo08O3O54R98wx1vDjNj0Wc6nkxAI5QmcWaDX4R1xcGtW8a7qUW11
	pP1Tmm1qXYe0QSfC3Y/udjscZR+Ph2P+KwbQihalCCu0X5gayaM/FZiuNqhKC4dC
	bI5fBbUqwcvvYugwPT3aaoSQw4Y+2vA+YENnTjr5fTDu/vYApw3jocaRRE8EBwwD
	shcNAKkygkP0VARnjPMXCY1b3eOOzmUQ/fIJHpQK5JTNcblKvr+H9jiOiBxFD/XY
	k9QsTa+kZLp8Khy1haYPvPKdydK13icOw3hF3M3xr1GuNNJUog1AC7E7Twg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:51:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38112fd8b48so983172a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108267; x=1783713067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=;
        b=ZdKiFSSTqKvb5FFxhu4pyfldRK5N9lNmd7u9f+57NSo8lm49mlH3yrdR2Cy5whr1u8
         UxBy/RG73/U/WS5vE6T6MIRmyV8S804PGV2ou+W1iIJT91LczyKE3MP9Uge9cdMVwe/J
         uSuYH4W7SCKMB+knBHvVojsySmS5lTNW9nlh7YhnNa0WTTsP6ueX9yLRArJq38rIwTo8
         thbi0Z4uuI3IqBv3OVVVNs6NejZJbdPsUXcC3H1scc1LcCB6qXQTcq9O6oBWWALAo2e2
         YDVxKSR39Tvs4rDZNF1k+Jzg8hcViiNZAL2ECYsXOmv7xQvhTb6WArI4nS+7nZ7R/5FD
         zmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108267; x=1783713067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=;
        b=jp4crKyYOUAGvmbS5gjwp681JMWmStRDwtK4gYKUQxZKDC/hy90PSOlzILR+LeFqjE
         Bxe23etijvS3n8QC6qKt/lBjQrEqxI9kQCkNL220bS2G9GkeARWlebeV4PjOQajAOvLl
         9k50J+6i30AC4JRBx8pMDp7y+1jalwKhaWXTdu7rm8D1UkILae7Ail8weiI3VkmTBmtu
         mrH67ZPQKhiendUoePuJ5vuGJuOo+8uSI8TwRvVTYcqiIZtkKl5CVQCp7JZ5xIRvzOuQ
         Pl92xJomD26j4xMrOdA0PBQd2TmY926vY2JJ1Z3NGA6Jp3Fz6rF1ALybI8uVy2yqcCp5
         ospw==
X-Forwarded-Encrypted: i=1; AHgh+RoMfgHgSBQhGSCN87xKcUQxxC/TSqx61Orml2lcphWobGcu1mdkFZYiczQDgon1xP/HXyei2v165uk4TnT11g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWTM6mM9PpTSzs6ZwTYhaoyN2ZdANPKVbrApVIuO9EIpnmfAZC
	cm23/zPV5iU2zAXuuCN5pD9jjWWeE5qcNi5D2l9KlFEx3vnIMlVQuZbhSCcgS1BL8w79SsZ+Hrl
	sOMMxdPHyng83laLs0p4TjLfe599hBddZVI5okRkRg94ZdZwLVBswjN3X3w92Pxnz/DKR3XmzsA
	E=
X-Gm-Gg: AfdE7cnTpYdQHrjG36tI64rO3TkhlRFxe+NKHlAZMznxxoMjO4BHMyG6hWk9Px7O5yv
	9MOiCeaYaSaMOXV9ev3mqYWvj0zGqw/4cb9NR2DgkKf2bL3on6YRPVOKcZ51PC/0KUMFI54wXx7
	wDnZF3Mw7mzXuN2IyTye/58xkvnsTbmL+15JqN19WPlaHWPOn+JQW8iRQI47Cxy8AV1fWtUb53F
	IfeL6AXBKBY3dL7xEtw2I+/q2cSioaR3+9jSQC7RHBCdvx4irz+muMYUQ2ivpVoJt46Qqusdyen
	/QtKVJiZQXWoDgaqjldrLyDPzDn+CWyndJJzdGS/8WyYSC49xIu05r0dMHGCBI4HncSEtXeBdQ6
	qowUBqFJkGty+9xWVqoJGVeZBLzTUUWD3d9ld/A==
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr819382a91.24.1783108267270;
        Fri, 03 Jul 2026 12:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr819306a91.24.1783108266647;
        Fri, 03 Jul 2026 12:51:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:06 -0700 (PDT)
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
Subject: [PATCH 29/42] ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:42 +0530
Message-ID: <20260703193855.110619-30-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX/cm5IhBnt5RR
 HdEC2s48u8flsXRax22c6QINCtIdARd04/DDFwUQeOl8LSc3nVyTqlrIZgrHxP2EaSRhFhsq2gs
 LSmkSjp5D+aEF+LyXMydJYKHvM5g8OJTDAt3z0yHUsXXa242qbivPuyyqSndjEpcFNBJ8EfaucE
 LbIBOtNsGZ+Y3r/hZ52H6L7neaYVAOaxAYkoKThfoccrLi/UOymJI2q3wmZ7l/65ujag5Pqv4Qf
 AesuURjJfuIGEluzcf4peqddAfD9XWNn5nlm1inemn+h5xqQYXczZqbFS2sXv+YI/jRwNgKVk1O
 6Wr3djMcCqkGYIjZ+St7YgMdY/ZNTiTeKn6OwtkY1LZRe/U1XgyHsekfL0TsYoB3PL+YHsUt4Ox
 H4RHxnrrMHcpRslVsK5fjpgAQhNjNyz9eVurqdEHjpOeO4/Lk2N1bwNJKOkuQJk42xzHtH3Qc1Z
 Me1NKSNwLEh5GW/aaBA==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4812ac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3WP4xAbIaamtf5A8kHQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: c1JDhGQJto4xsG7hI4VwnlzF04AFP9hz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXzY6c2ia9ZNRv
 iofs+0erHfw9NuwWb+B1G2tYV9+GMf28yd5v+T4v44vQu2GlF6KKzhHTHPlXqH2PxoX14m3K4Na
 9kN7bVGpEx2vx9TncX1bAUVGYvJDOH4=
X-Proofpoint-GUID: c1JDhGQJto4xsG7hI4VwnlzF04AFP9hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_125109_584903_FBC3D036 
X-CRM114-Status: GOOD (  15.58  )
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

Use the devres-managed devm_of_reserved_mem_device_init_by_name()
instead of the manual of_reserved_mem_device_init_by_name()/
of_reserved_mem_device_release() pair, letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/imx/imx-common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..29314022c11f 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -330,9 +330,6 @@ static void imx_unregister_action(void *data)
 	sdev = data;
 	common = sdev->pdata->hw_pdata;
 
-	if (get_chip_info(sdev)->has_dma_reserved)
-		of_reserved_mem_device_release(sdev->dev);
-
 	platform_device_unregister(common->ipc_dev);
 }
 
@@ -362,9 +359,9 @@ static int imx_probe(struct snd_sof_dev *sdev)
 				     "failed to create IPC device\n");
 
 	if (get_chip_info(sdev)->has_dma_reserved) {
-		ret = of_reserved_mem_device_init_by_name(sdev->dev,
-							  pdev->dev.of_node,
-							  "dma");
+		ret = devm_of_reserved_mem_device_init_by_name(sdev->dev,
+							       pdev->dev.of_node,
+							       "dma");
 		if (ret) {
 			platform_device_unregister(common->ipc_dev);
 
-- 
2.53.0


