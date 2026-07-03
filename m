Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39225C43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=; b=xxS/46+9uNpfInypA5821lVXWr
	825GqBN93eij7h3WrYE/uR0bgOh/8o3n2Zp40nJzARrybTMjjv1HUCQeZsa9LwOZ+gB9hgJLCBheA
	SDysrbIFAAxpiJbHzSzEj7sd64ix+MVmALM0l4rRcGCdh+NMDhJ2ATDSO0qX3Q/CkmkgUZSIdgKnE
	beCNX8aXX13b0gRY6ZB2jmD2Gew5eADujie0WrxunlxcvNa9EfhVQZPHiUPnY5mPnTcRC9dFLUyKw
	FO6U8HLXwksfZ73kQ6aAmW1CjnjdpLW4/rFd70CqC5Re/drvdqbFAJfENTuyC/ZySU8dqooz6Q0qm
	jKiwt+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjuS-00000007omV-0fvM;
	Fri, 03 Jul 2026 19:50:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjuP-00000007olQ-3Dzn
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:50:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiNpx631320
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=71ffIbujQRJ
	pACfwswiC++PljuSs1fWY5AHxmQ6jcq4=; b=TvyBZCsmUFb6XP0nyeMDmZUr0d6
	QfdM5q7XKtRLmhSCsR87R7n24zAgPbqwXHbQbpbBrAfJN/3BoE2r95vk71p3+CBB
	ObOCk69OylcINhIYVL4FrfDARu/c4LAUFcKEv/9v6uWS8ukaPAWQuL8QDl4PNDO6
	WjFZPBHuitcjlSddKO9eskwZfTMHVM8nPVQ4qxvV0m/4929WyXvRmCnqcdLKEtVF
	BRpK7IT2oKjC1GZwOGyeLt9zFZnQ6XcJ6WQmmdDcXj7k39CKJTR5ZgMjHxxCKGYB
	3+KiUYnJ/K88oHwqwdihUAZhPh+yEQ4A7N5sgC8Y0wHfiGLi9JI0wWQhoHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b039yuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:50:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso771373a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108244; x=1783713044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=;
        b=NZfiLVWwTHnhvDWZx0DjLLYi63i0bLrtCJalSMKPIr3EQ8OXNfMR6bPEnQ/BzLKRzR
         Oj2aal/e+Q0FWTQLsNJjRqUUqXrLSUbJhdjN1J0++lTtmXssIUh44RPEGS9LdCfvefNv
         Ue4aeYmEQ8KlEaivNtOW2uIcvXnSEaNE8gsT0iICIKy4z3YFWUlugZt77vRGXWoKeSbL
         RquqSZMSm35BnMLel5sS+x7gK0GQS3+s5dBktO+0e5NNi2Q5Qe9541UbYWYHZiMens0z
         lF5KJHbNkUkfuUvCk9K9NU2Td/1g+hd+gW3npSn/gxTvT7OOqgHP8rpWrwyirApCP3QJ
         1tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108244; x=1783713044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=;
        b=LtNm6VuxAIv7no4f/G+la4h3WsovyRz1ZbwGGEBuCCnkvFvBpXWFBVHcA0p2a+8Nic
         QD7zz3UVuwdiqE8OLgU1LeszMkuP+MnK/tnwQWZ4/jXiXgJ63iKgmr6vIEXg0I5fu4U8
         fCPlpcbLjHASKgdJUJFNlb5PMqCl5rd7kROeWfrN1wOtSyY+CJP79DZJgd6Ame8a1YQ4
         rWL6dop6VzpHL1MDFRll5bpIEU7j5Eu2rP9BozroUMhnaBeTc4A68LmgBy9RN83Ofjks
         C3dBuMpZluC5S2vb7QkxFdRk5iuQ4nBAokS4dMTDuDOGZyep6hDwU5kzQhmtg7n06RwI
         qUlQ==
X-Forwarded-Encrypted: i=1; AHgh+RriVsWcabbzxm0YqB0iiF2Ivu0o3GtJE69FrV9Kua9keTNHv9N4D8AX/PPMhfH7MsyX1/4PQ31teFkU2lptmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW0Xr61IqRRjWLeqdFZE1UXfr5yNzuZNGEDz3Vptjnt/ik8mWj
	4BhMwd30Oa3WHsacEC2J7tZ8h0JPJbAIfmrbI7fNBaXiyZjKVS0fILFhwpMkOwhSDhsekgu5D4B
	U0/fE4wbkWpmd50O5JPAiftDlhVlZsiNibHq4ef1Nrx6qQwtiJituFwDvlEtJSa2MiOIJQgudx3
	g=
X-Gm-Gg: AfdE7ck5/ezbQElvTGNLPUk/2ctcEWZWro1CEEyB3xKq2UiRr5sF/KTNPKLlqNtP0tt
	ks8PXSDjknpN6GSAyxxmo9RbtI7zRfAA6bijNzLDe9LJh6K3zy6Hz3H1QgylExsr/olHcUWhGPo
	A/6Cp/vb9v6O+lWIPb4dlONdVCyJ+km++0wKioMWinNhLqvDgMXQJpEK2ZinzuBrfbyBbVohhw3
	nWsE0PqGMaEr8wvHQLqMCbtqtPnnOPiF9FFnqZyghimbbYNFf9x/tazPZTKLIKOGKsHxjTY4laM
	LtMw+01bHOWjIfkxHgt5nItuTVNdK0QHpGlbUNxIqgc3PUeEhljWXFXhjAcG0nHT2BfIP+JXA0W
	YbIEhin/MsJzsPi2AZ18UgwBgwYsozJ8N+IzBjQ==
X-Received: by 2002:a17:90b:1dd0:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38293b9946cmr729463a91.20.1783108243288;
        Fri, 03 Jul 2026 12:50:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd0:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38293b9946cmr729426a91.20.1783108242651;
        Fri, 03 Jul 2026 12:50:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:42 -0700 (PDT)
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
Subject: [PATCH 28/42] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:41 +0530
Message-ID: <20260703193855.110619-29-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX2mfOaw7EF+6v
 ckOU5W9eifbULWPKbJpgfxVlqCSxbM87qfAXaS31+kjVeyeMaCwIrEfBe9eW3BWjyZyrdl5s4mS
 Q4R3z2JqroEev6GPgTiO+Wzmm3rLSUk=
X-Proofpoint-GUID: J1DxYoR4s7UCq8Zcab_rW1vKct7hFovt
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a481294 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vpwXisbvDR7QvT6TCt8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX4fz8u+7maQpV
 DyVGQ5hL65MrzOo+ei8Knf99M7xfyUncoyfz63DKTsvgf0kgatnbNjE3EErhqbQkTBPjpAuRPxY
 Pq/NZfxWNtlnGheycP0QcVZMkJBkX8lHXal1N678aWhlBwPSNGVHZ8NtRpiG7OQoUvokzCMUU8P
 tnJeBVLIAga9QuK2VzKUDSZkmRG/FrdNPcnlr+RRFheXj1cQXvGM1jEYQdV/NUf/GdeQoiGzjmt
 eD4bnPccwC29t+w6yRrBKmvD4wT2drg0c6njQUMkr3F6p1RXZjSPu4kAQY2hBmtcsAXdNop5Kaf
 /Cw6UoDqlKdSaC+bZYFoR1/hu9NxdDf+44puinpL2CfksQ+vo+KUWKG0z5edqm439wA//MbIfM9
 XIZjND5OF8r5lNqMWcUk2zfmIMw9qh4f8MoFTkAMGpIc2EbdDXRR8PK/1rS3dJ5SLWmCrCtfq3q
 oGrH20NGE9QLTkMLe5Q==
X-Proofpoint-ORIG-GUID: J1DxYoR4s7UCq8Zcab_rW1vKct7hFovt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_125045_916545_AB5C1DBB 
X-CRM114-Status: GOOD (  16.86  )
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

Replace the hand-rolled devm wrapper (mt8189_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..04baf7d9132a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2421,11 +2421,6 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8189_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2439,16 +2434,9 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8189_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.53.0


