Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C54C44500
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=; b=tzBaOB5MtBhe9qKLEnDn1L2uzv
	kgLtLWaNYQA8AjjY5fN4RhGj0cpb4z8CzGazHEoutCgCvGQNnJyafUBymvDzDY7APzfEW5fPQSYnh
	kr8tLhywCZMRu1pi7dzcip+qFm1pvze6eb4+ZtqW5PWA8TXdN1qQihemD140OdwK/96ANtE31vaKf
	MPhbVt5KLwvolSRgXz5lm38mds4Xtz48SUcOm0oQqMbhbCrkpssSaYuhHWX/O9Vs4bmEAYRQCas2o
	yQAdvhEsUHk1N8+U1askzp97UXfwprDBbspdINHYK1aLHilulAdqrMOh+ncdFgAJ7F6XBQE6+1cua
	vODvBgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjlq-00000007nIb-3R1u;
	Fri, 03 Jul 2026 19:41:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjln-00000007nHx-3w8k
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:41:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiF2i683655
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgBn60HnIhK
	vMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=; b=RBbUqtax0OnhW8ww+r+abiXC7bl
	aoj2BEWb6XNcMTtnbQ/eZQQJxadf53YUYpMb9HDQFPKsAxYE+WHfUJzjV5P7b4sn
	+Z3ANHcjpYktEAFM1C4CV1k8NP88eUtR7krkUEhWjX0o5ZqGk+Yvz3NJ/D7Kg5gZ
	iLxwHLhK6rE6HW9etExXvSejbzzbzhvlqP05WbAXXc3gJ7C0dwK72SOv94lYCmOv
	5FQ0R2Vsu2aQgsQFeztF5gpUm7zEWsntIJWZB6Bx1yTiQ1unY38c+NcNI6Nd5Sl0
	RQ7JIvskzNJuclWDN805IAwFDfDq911B4kqC6csAGjbvgwL75Gns/PO/jfQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5brwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:41:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1024000a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107711; x=1783712511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=hivempcTm8HVdi3vsGycyMBf2P/+ywgSMpWItOmEYPh/J0K8rqCijTLNfa4LHUXS+S
         DiAZOf9YkG45H5QMaQdoJTjD4hcz2ErCJMETnEFENGI+NwAN4Hqp1cBwAN35AGT+2nxU
         8QelfWzervhf73QxefUbleYEJUOfiVp5nS0Ai7eXt+h2TNo+nuMiCkUKQKiYiNBV4yO3
         yySUrB9j7awyw0jQldlqz4zn43SHvgY5VcGPB6ZeYB7ZBY4NpFkmP1N1zVv7XakbTTPj
         8XnKdFpyA/p3omW/2dZIx+vIKDJ0q0nBHzajMJ3a/80RqfQn4ZmQhDUFaDdm9Ztx6t22
         O/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107711; x=1783712511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=pJ6CCnPrMNHMFC2ohPR9rPMfgVyZ/Fe1/9PC+9/sc/JRpsU5JSZQ3OBoHf89TPFEIN
         IrzObM9SuXoHuqAjUDoeUI2UgQOb7GfJcyxnlJk5lymMgvqRzTXN9oqrKHjI5mdOc/rB
         jX5Ry6Oy80CLBqIqilLCtrcUYptS0//hppLV/3+OQNxQHkOokhqS0yPVN9urVZU7yPAD
         JS4C22hE0efpAw5a9Js5zm5wA11+g+ZIAwazTgHFdAro37BOVAesM9snvu8RXiiaHykY
         szim55Pxpjmi4lDB2KNt8QJeXPSQj+kMPXGC3AwkeCZJXb+Tkxgy0L1v/loh8TKRM4XR
         TmRA==
X-Forwarded-Encrypted: i=1; AFNElJ8pcTB+boskAEUbdxrttjkEdFIcQMj15pwVtdUYN1UUvt6OaDEmhsuQYF9b7Q3CIzOEsu9MEwgIMLtR4n8JRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBJcNKuyi75U4Atn11G7lLpP5KijfOTQDb3Ly4SCgT1LpOxXqb
	/MSWcLCIIQgUU0vk7ZEVvjvdfg4ZGTE/zwbmVwwQ1jF//uZNr5tjoSYz0mF3o402ydaqJ+tQ7Mt
	Jlw5/QJgSVW2S2A4Myv/hTuYB8bGPwpKP/K+vvD9tPkB4ENUcvvp6myRebR1WMWoSOyNWToWWKt
	4=
X-Gm-Gg: AfdE7cnowezGOIBIuOrS06RqYBfsU5E8Z724aVKaLG+f+QEDl2bODwtTo7EK1tW0ygE
	JMTNqfX4RcJRBA6Q9qD+ER5iAakNzBnA9Na3vAQFRqNrY3cKvkLjPRSzZUEY3bl0c8XFQD+d0L5
	8zNINDt/+KxpiK/OdkTZ2NFFBBKJvAqWP89JLkGx7xXFnPDGegkA2vMYCm4tZHulH26PsAJBGGy
	6bCnIggGiz5HYaH+2U9IEsIwI0SQJ4iqcV6myXEYs3g4jhvkjGc34IDV7+AONlDjWDDOV3bNokH
	Fkr1fhCmvPavqqDC3g42HfEaASF6UA/coxb18pyRkHIfFj2XyU6Weo5roUmn5BMMRvnpuh7UuLK
	euVJJR2Y26lg/TQhOq6tbWV+Igqw6ciQlLVDSFg==
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809417637.30.1783107710447;
        Fri, 03 Jul 2026 12:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809352637.30.1783107709738;
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
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
Subject: [PATCH 06/42] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:19 +0530
Message-ID: <20260703193855.110619-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX+K8rIa+xU1rV
 P2Pqn+qbjDcQImVXhVSkyUHqHY0poR3QMsafwIwNzrWd2e+vd4/Rqcnlvrx1j1ODMiajIF1gErG
 85eZDcx/xV9/kseFEic6CHxV4g23csw=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a48107f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wxxTr_YEz1i4iFEBgi8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: jhD2VYVQ4hZEW54qpJTyfkMb12EWP8sz
X-Proofpoint-GUID: jhD2VYVQ4hZEW54qpJTyfkMb12EWP8sz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX96rvi88NzAnP
 FkgWMLm+DlxymCO7tkwVNP1CQPjaKVVta2bb0JvCFL8pief3wS2/wNWC3GqB0ivsbaZVlbsrpZB
 fTLhwhbgrKT4PgqL10gmnk4HY5VG0vQvbZ89y0aUj2j9X4zDr7nU8ke0fPsYKqk+WimKGn3CFZ/
 ZWOmwE7koJs1gX/u4mZtaqfmgUD3EmGneqsESOcx/CFaLb2M8ZOP++VO1wvxV3I8Rz/6tpEVoZe
 cpaU/7ksmRiTN4l47/1LDZGPS5iw7ZnAoyzHC+7oLb/uzRGtNZPa3BiMmHIsoxBKOybIrhtz6Ro
 uf1KfwzVUxD+ILhwW79SGrN/vBUNl8/b8pTh9cZtaBoebC6cw+JgYY3ZgwSzqAl+g60VsDY6XXH
 4CtML6YJGpydV/qPtb5R7ltqKF+4oqAambqTnvjZ21rSVsZodH/XWB26/4BB1rlYPuQKRUZvTlw
 X5BNeLilWf2NbAdY9hw==
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
X-CRM114-CacheID: sfid-20260703_124151_990986_4F640126 
X-CRM114-Status: GOOD (  16.89  )
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

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..7c6acc6d7e88 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.read = hdmirx_readl,
 };
 
-static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
-{
-	of_reserved_mem_device_release(dev);
-}
-
 static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct device *dev = hdmirx_dev->dev;
@@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (!device_property_read_bool(dev, "hpd-is-active-low"))
 		hdmirx_dev->hpd_trigger_level_high = true;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       devm_hdmirx_of_reserved_mem_device_release,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
-- 
2.53.0


