Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2FFC44500
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=; b=AzFcGVNR3aIE1X3gaCbYG5R+s5
	n66tcaQXWpFhMkNKTcXXEUTNnlvIZs8P7MQgLlvc6R+H9JL2YjHr4wovR/0PPLvSgeK5z4kROsvuB
	bvUEaV30EkWHAw/AgxuXFG4dldp9zZOy9PjR6S0lOXged0GylRs9TtDdWS+N1v2fygVDSS4KehSz4
	MvcPDQRw+/TduMuD/PETO3mAOw9WlZjvWcmKw+6+antu6+74lU601VXQoVAHiSzCNln63PHQ+i4ez
	1i+EjUr6P/VcDfeYurFEpYAt1xUon15Mvg1K6OWc41Fq6U2I81KY3xEEMilxk9f5DKkNujL68VA2G
	isc2B3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjrj-00000007oIz-0ivd;
	Fri, 03 Jul 2026 19:47:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjrg-00000007oI1-1MAY
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:47:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hiavs675622
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xuYKB9E0hzF
	7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=; b=hZRbqGsBRWL/VYFCQeXeHyQYRPi
	GCEQKMaidc29Zyn17PyPi9mLE8M/gFX2q0clAuvqWEMCi5m86/yq0yfMwm66+xQg
	Yof60+ODe2We/1xeDUT/7wgvqLLDAuqKr9nVQmVGU09S2WsL2G0wpZggA032DX2b
	1cZwFSAZJtbX6Yg5dpbk4CTusF2kY8mw+okp6PnErHmqIt9fiWUIYpZW1vkWg8mz
	kdCzNTjJvN1F2Ng4/ZvC/o/W0wBPVJ1xiIAyQ87K1oHGDx6soXMwbve9EDpAugEF
	jr3ipdr+eYULxOuL+KdU7t1704r0d+uX7wy8p3c36wO+CwmF+RyFLO7Y8sg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1hex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:47:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so1388803a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108074; x=1783712874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=efKA3wE2KQ1j27k21fMo2iLB71SfXa4B6w1jV6XbI8dvJ1bdaiiTca2KCxtG7QuN4g
         EUooJytCpBhAqEhonT7L/S3JpdtTNk8IETbwbFUK8pqoL44sUQwzBTays+3KAlAa2BRT
         GrUBh/zbNEtW2DrU7yt0egsHClgIMN66xP6BLPcqJeS00ntxkmdPFRZaP0IYCfPE9V1i
         uPC5wmeepPj4iawj+0lOyWoaAj7mLesKUN9HAI3/TpBCzR0NEKkG1gEXmn7B8fAcwpUL
         BFHohunOqSzPtG2Hhbdnp3SJ3BlGz6sP00IL1U+1fQWRdP7Q/WV1x+ClkI56p4ZDkVjp
         lHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108074; x=1783712874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=SBJWHBYFtdjUdPps1Ou6xYb6EhlDmB53cmoobiqDLcj0iNGh6+azEPIpGIX60jbM6V
         N3qr3ujHZvvPQDI6CLX1tT3T3Bsqr8rjhFXQwXl13H2w1qFkbZHL1qjYWrY9uhp2zxZL
         yRIGvm7TzGdsg4h0JDat/kc3Hxnp96vaJMUS63/iKMuJPoMvxrtZiWLu+90mxO4vuB2P
         R4NPkuoEcXauQkSef/v7ahtjJx6482GvcEy4OXMEumZrKx+cR0W0zPBFCoIVQh8DEIv0
         0SS+ijn+7oruYkWBfyqwqbD3Ou9X0CoFUwJCPW9wPVmpOtruO1hhFeFm70sMq/LKdTpK
         VNTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Sm5UUMDz9gz+JlmnQvgqh3MrdOaRwBFgqIak7Zd7t8Z74VBtoxByL+pOMFVvn8OL/+9W4NHokn3ST9F+wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGycI9ZUf701BwZuV6dvYez8tr3tlPIovX/AMDmXnnBcO2mKFZ
	Lv9f+rkWN96XS8YXTNNm2P+4RswP0jaC6B4Xxwi5d3SrGrSrrtb/8LWpEpHKwEedevrxI7Ulueo
	Y+u7yKPlKNQV5skpoqAHKeZeWKiLUR/KWUVUJW428W0WsixATMB4hLakLnDhJ3UWcSYkNJHP1T6
	c=
X-Gm-Gg: AfdE7cn9/EUzRVicGzl2CI0GES806IFd/ZzfVaE9oAiNoAOTHSgDOwzzHnT0bJT6ULk
	Xboa58R1Wkse7AAeoPEx/+mFzRD+G9cDqiyIq+TIO1INKbiktCRbnYtRqL4YnwdyiPT3br5z6K7
	45Xn6LlcDGNa3/j7UgZ3OkqOvw4qMH8MEJciy1+QBQhnmxJ7Fo4wHnFswtCI6KBevdJ52mYBDH9
	cFmuXRoIUF5QIja9wwh/fE/r1qM2DhMwMM1bh8Vz2ez49vL/Gyx5y1FEeuoqHeydoUms2T2l5/0
	W74obZGMWooNpMlmkpZKvcfEZWN0LSbGu19VULzj2I+2BCDJXvsaq+EjbslSxR6QW3hfNtkmhNY
	WGzFl05XTyhzcrWoYbZrHLeX2WHBJDxsf8vLusQ==
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730891a91.26.1783108074072;
        Fri, 03 Jul 2026 12:47:54 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730822a91.26.1783108073506;
        Fri, 03 Jul 2026 12:47:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:52 -0700 (PDT)
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
Subject: [PATCH 21/42] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:34 +0530
Message-ID: <20260703193855.110619-22-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX73728L79od7t
 MgDFPHvgizOKsEwWj2SWzdzjPIdqOGfcTCfTghKy73NpsLi35pSrI/dBMnYR/peZIlqx0GThOFO
 NqT8JvuRH77oGJeujbJH6z0B0jxrZ/0=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4811eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=NKxwcvIfb8AsFCMGSgUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: P3bJT-UO2enlbBaBCpC_3-EW_NdvvEnw
X-Proofpoint-GUID: P3bJT-UO2enlbBaBCpC_3-EW_NdvvEnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX8lj6Z0r8Ztle
 OMTGmjs7kbKhiiLY1I9vO6CNIp8MwTS/tmWtjkZLw6OBHu0Qgb7lMBRRO/Hyk1yhA6vIKwNp9DJ
 cSG4/8aJDVsGLHbK82pNKI4FSmvqwql9rQpA0n3OrLd+RMX35wGQ3WO2JNMVegmfmFEK6psj5R7
 M88ZYXjaO3D8YocLt5EiUq44p0NVgN8MAgHUrS+xtMDUFYYhI6ADjW1lSx43eVTB2tMFzmF4qxq
 xfxzEQzPiFQLHWVpsGSsZptaaDslvaet9xtVXVa/RnZoOQGiTrLyeStLk8LIvdO3DRVpZODgZF4
 FLRQDTjjD4y3GQDrIFmQD5Ju1Ijfw07dSp89SveiIl/PwcNEfQqUq7xm1Hb1YQ9nsw7AnTZv5TN
 sCQ3sF+fD92XCbof2QQrXTwVTTDY4iBe/X5t9e9fiTd9cKu1eSJyiRUJWN16m08VmNIMLI1PMWR
 M1IkmdPOlET1wOl7wfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124756_471988_3E03EC8E 
X-CRM114-Status: GOOD (  16.42  )
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
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 94a389b3f833..afbec11f69f8 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -801,14 +801,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -847,9 +845,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -864,7 +859,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0


