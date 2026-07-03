Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCAC43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=; b=C0JOgw6e8JYMx5gSLPhzCz7AJx
	ScuedGit+VQJQPLVHUfjKWW7iqWgRCdzqZY7Avj1cu0Jlr+UbDf4ERnsh6NY0Bz/49h1yxr5KsyY7
	55iiJaC+TAEO476pszmCpeAczFOYh025MixHAnok88vDPsSnxnx7mFPPXOTglX8GT731kZu5BrFtA
	8jZYo+lXguVXTaec7vPaKpPqmhubmQ+0S390u5ixi+mSggU8HfvVyD46sIFlqEEvYbMusNrspIziu
	YRJTyoq5SE/v1nB58Fb1GWvcu9W4c57Y2PR6RuOzyXfX3hzZbs7JNfGNB1l6aXv1W1ed7N4Aqd/+Q
	MASuVZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjtH-00000007oZS-3SFi;
	Fri, 03 Jul 2026 19:49:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjtE-00000007oYm-37X7
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:49:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiULF545604
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bLJLzW0Ww/O
	JpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=; b=VajOTEl2TqBXAzf2tW1fvyDEAof
	9pqqcBlSU62EYwWLpDFmE6KAFEoz5uiKJuh+GfK7Z/gEmbv6rL7owtce51KVrHWS
	JDymszVAl+JjH8r7PIxzJLHMEkSnc7yjmsPmk7pAahjhtd2M4qefochsF+rT/gVG
	ymuReay3qNZujq/djOXQyHwF++lReEZxvq9V8nIMVjysMUzobb2Tl/pAeuyAvNHP
	OVlKy+p/dk8e+WhhAZf3UxXXfkFHQmzYjl8bGzPEXc6vmdf9bd8GGxa8EwgR3/Sa
	Uj0HGeKXNOzg2T4bRw+GMMXPNRHWYI07wNNJ5EUOGHg+gXB1H0cEWmzY9rQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btrqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:49:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f544944so749055b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108171; x=1783712971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=bEZEvM1VsoZiHMYWLP+cMr8yv0KbAfctGk2y7OaKbIzJxHotFV0CznH+Io1/zFi1G4
         lQlE8ZmfRBwWt0I6phe9kbO8RyD87nPXzfwdQ/VWkSW167KEMDBzRol4yL7yAcdvFM33
         RoIsk4dsQXNhPph70anY978pIiMzE3U00WONdHXDizichp5ICvZpbwPX6wmxspBQ2g8u
         k3KZZX1+tOME6iNcALQU9cD4Ji57SkEXt+6xJr7KWd6Jxl8DgwxYnOIQLKbJjxIeIyxL
         Ar4rJQOMe882BkoN3SU+IroQW2GOAxiaI6sVKU6HqiL+gUflYtTVFZjxBivrPWDr7Du+
         DFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108171; x=1783712971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=TV4S+hTUSXWkenMNaAS2r2XMeviY6fOZete1T16GbtNDO6cocb1JGKUFm0VID3RmK6
         7tCVKERD3Qe/UffV/0fU5o8kMm8pZfqwXcWalT9RmYwZHr46mwr70/a9bhG9GlZQKT5t
         LnCM9OpnJGatUPUiI25ysVDxIBIG11SyRnoocn5l6yCZqT4XBF5eN98SbdMunPeBphry
         mAehUoWxWYny6vJRTd2YhA5YdYDfkfYWgdzlvmbfbk6inywfQKasEqbpxbrJ3w03YYOY
         QLpiuEgCoCga92LhYDTmWPDNGgp8HvtKUJqKSHQf3F3SNR1EZFkZjvotscdGgdXknWll
         lU4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+0kw02UsKx/u7erAkaaS9TSlRn8Mk5Na5tZgDGDHGRMiGmeQKLOS0nwdVLiig5garRadOvyJnEHTKyPiiFkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbyXmiSOMqkOT0pvEPN2cPsNZGtUqLCnvdGEBY+KV5CEGAk7Nu
	jBuxoPDtTbULg9oV3QvYiCEiXNw/Z/FfOU65VipEbZp/p9LGuIynpZ3YRFlKyRy2Wzaye7Ti9KG
	m3jl3GiamRQ51IHhBmL87wdBju63JhUBSms8pjzKdKczofND6lOjLTVAAnjGZsXkqbrC5Ktjr5y
	E=
X-Gm-Gg: AfdE7clBECrU5z3UCAXHDagS4hAmSIEHXatdojdlDI+SJ+IxkjYIEyJTVpIqJpUL4rq
	9K4Mtkbs83M80rpNSi8T44jodCvROMykO3xt67Cn2wToG/aBH1BzmHCvMyYqHU5AcCT10TrqsAq
	xNICRou5bzU83WlLwiTwBJRfehWz1TpK3/ReMf8/s9gvLPmBtto4MUOFsASBnnhbMdNDEEvNoYb
	t0tWRwKd+jjqY0/MQHftPUfcIfWPHj+ZoBhcngpkKOB+s68rcAuXz7fvpNpzMhA2b7jiH1Lxwt8
	rFxPNbGTKY+wA0+dml/kqZLOUkjCsfva1HRRl19jM1o75WWvbEEO1uxTE2B1+7b6d4OCJC6mQVx
	m2qbq40fMQw3hCc839qNU1Ym2P9upikmwg7VmKQ==
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761436637.12.1783108171091;
        Fri, 03 Jul 2026 12:49:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761349637.12.1783108170517;
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
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
Subject: [PATCH 25/42] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:38 +0530
Message-ID: <20260703193855.110619-26-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX/EyhkBxRqGsO
 UpqsrbXpcPwXDGMTO18CQOKlN4jSXAzx4zmIoCNiH5LCWli52AUoQ2me3BxD4Q7N2zsW3EYJ888
 trmFYdcQ0Dig86YxA7rRCF8dZAkaWaB3JlVBR+dmDDgTefmG33mC267XrTKpk3BJrH9oTuX1LBD
 n/8j8OwP074eh1mV7M0p4fW5i31TWOjNJs6e/0fenS2wqR8Ex04imUExnhvCKQL3f2JtZCgp54C
 RIOQBPhu4LApI0fEpLw1EO2crJ+WDUsid/0lA/R+OVhp7NhedN9cEjhRsOQI3pCHQrXVZw2HJGg
 CJOjVoR834fjSVTDPeki/sNHeyzt082yOZ207LlaqJApLd+qB6ZSx8RbQuBfd70zoW5EUPZlEa1
 owLcKJAItJDIL8mk7Ia/eSHHcdihxU/E0TJdC8Q4MymQLbHrKOK/41rKCD+cqXbzmWzJvgEx8V3
 C6jlZYCtxitYjafnyTw==
X-Proofpoint-ORIG-GUID: ZkP6bZsEg8eUlzDP-gkigdaur_uGZjJq
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a48124c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cg4emjn-6EWHYnEhqz4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXwppSCB4aPy0E
 mjKsRHUCOIryuVnjJRUlCtQXRfgRSFW1dMG9c4iJ8J3rtrHHFTssoSQExcTBcQ7wB3WctO3Dm2S
 072k9CvjlnhnILnPOg4jrk5mQOkgT8M=
X-Proofpoint-GUID: ZkP6bZsEg8eUlzDP-gkigdaur_uGZjJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124932_789320_E7AA84DE 
X-CRM114-Status: GOOD (  16.08  )
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

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.53.0


