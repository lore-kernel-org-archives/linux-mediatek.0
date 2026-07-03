Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2096FC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=; b=bGZxnF3sk7v4fS/8bB/gvycYOw
	QFQOK1zULegO3IWINkTxMeaWz3o+rhS90noGN1M0R+HuLY8XFnucrlYU9c5h04fh97TQUsEvBLteC
	qFuv8O1RKWVadXKMqw8rL8IY8Yvy87g8YiQDlQZa+Io7pmiuG5SohNHy/BKY4pX/Mj/iuJOUaWllb
	yLz0ONth5quripITMQkQz7fnV+R5kjTtg+A99W9CbyPzaXdhnke6xWBAxULlr/m5P9gURop2D0RRA
	tBW8/DHX5x+/HWG/QTy9JPfFQQ4XhLO6Mxq4pGEJbHeigf7NuP3dknK61UqynByj3KvBdaLl9aw5l
	I3yaIY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjjX-00000007myd-35VG;
	Fri, 03 Jul 2026 19:39:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjjT-00000007mxx-3fRI
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:39:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HibeG545676
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yuDgKoAlw/JRHunDNfGXYB
	YzhSRLVnjx2xmNmMEK1vs=; b=YEMeysY1/myhDao0i74e7TNlV74ktXTCfMwdq9
	CR3QbS5AITeviE8hf9EJ30WAllVldtcYL4AMMm0/LzjQKzr0t0eqDF0S43incuSV
	MyApeWy7M1IbpM60LNShiFzTpmwg+/W0PKTj+Lp+cXYVgARiHsuxhXD426SvD7cT
	GGZrPR1QcL7iICOr24d23aBH8a/MPY5danZVa1/zTiMmF2fSUTDZMyH3oHPCfVAv
	4nbvlJJiytEOZCVzenusm2J4e5XUbEHMVWQY64oswPjfiGG059bwY0hXxdENEoJ/
	sJbKqjoPigEwtHk2s+fe6Ba9Tfz1f/tpFlGt1x1q0Mz2ipmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btqjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:39:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1374547a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107566; x=1783712366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=;
        b=REcCtyQ+AxjOztvs7SLBtnIfSyMKWDYAr5Ieuhhz80SpvySEtJ4knoIU2iVXhi+xUz
         ydpScEUdoBKziWdTdJQGHo+C+WfDXkI3H2f93B6pasR8pqOtytG1Y+jDAqvvd4QTxrSD
         sS3FXYHG8x6S0NpvxJOSNUijWkYOBKDCkLj56252qY5wU2iKtpj3pkY20CWmw4touqNU
         XGPd6fPa5s9a4ZEgK1d3tkuJK7nxaznt6gR5OWfIo0Hk0xNEZQBCJ+ZHZrQZUCPI4A1b
         Bdzt0KOp9SKytuKzkz9eeqYB7e4u59GEDqtlGna/xVYJFB7iIBFiAJ+jJWuQRgLjLbYu
         TA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107566; x=1783712366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=;
        b=MNC7dswSN/Cs6Ei5LDOrwhc0NljmVfAvpu1TXaLwohjgz5O/4ND2JYZyLtzEopfWGq
         yY6U7IPNdo+9t5pcLFPpbe6EIG5EOPpwPTk6TEOrr3hrWEeE+lZxImsFLDPuQmEQW+5t
         sS6Au++IQtXntpZT0q61LpdWjDIBmqcUdYijn389RGm3XPcPOKkihQ/pd0DH5IgUCqZC
         M6jqBWch/deVScWc/tgKyKZkZomZV0nX1Ev9nhwnhAfS9snCpZVmbJBdXGdMddV0hUb/
         Ew6TvybDOcIKrrIj/CwDmtgp6M8X1FowlkQPgoZryT5CXQW2p2ZEby0OZKErx/t1QCg1
         N6GA==
X-Forwarded-Encrypted: i=1; AFNElJ8K0444C3VgPkcXpB/hXpE6GiiX9zdWXDNp2wyuKblTQLnDc4inskkHDg5R3ugjro72/wyt5E8PVJbnjtgGsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPd3BkpkA+8afxCLBJIJX7j7qcOiJYWCCHFkTl8Yk0Zz+31N/X
	0Fju+UspWde3u0rzpfemjL+PlKHOWhw1NOSdafXTRRxLv9PZo3BVu8pN6useYdiaIjXkiYEkafa
	4Mn810Ao8bIByiMai86t2yjMH32foKdCUDMnvw0qPr7ocMhusssAboMaDjzEX3iCPecZcrokb3x
	w=
X-Gm-Gg: AfdE7cnDJcLHNdebXSDE7ZjsEoHgeHLonnan38vB5ot2yu3casaChtwIKcdAYfOOjr8
	s5svv2IhFttt2QFRL2GtNlWq8+s9SgZ8M8kCWJULc17vLhf0uTPRwIMaQs2LRgPjqyVcDaZoLTc
	Rd7hBz+KSALuXvJhskK4FxunijtAcZROIIBh4lxFJJQXzhPW0BiNAHtySs3YdllM2vCihD2UYRf
	RGZRFj9IGPnDECGXjiEcrz34RrzEVnlHZMVTXDZCUGmC4KGs1Nt7uh5AWq1q87GlAL6AQtnniQ+
	Sfm+J6XfSprVx40ntIbl/AABVeJUWTXdLNuIcAPRUTtuPlIMIhV65oX1WhFjixoreP1xewGqqz2
	eX6RoCh7uWD0qUv1w5bfNN2mR3l3v3S3mLm1aAg==
X-Received: by 2002:a05:6a21:4c81:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c03e298475mr701946637.17.1783107565967;
        Fri, 03 Jul 2026 12:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c81:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c03e298475mr701865637.17.1783107565344;
        Fri, 03 Jul 2026 12:39:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:39:24 -0700 (PDT)
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
Subject: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and convert drivers
Date: Sat,  4 Jul 2026 01:08:13 +0530
Message-ID: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXzDJg8V9K+iTx
 AJijv4Wwf9XQ8HD1FPjWGE2Cb/7DcHePlrcJP7fBUbPE/YGF0/ARgPjU0rOkxr+92TxnLYM/dhr
 ce7bmgktSznUShbE3+a1vYLmMZYVMKf3NcfaMLVcHMuFOa+y3eFfQac8gzM0+XaMRAAVoJsE00Y
 8ti0uYXxZGrviJ+3Omy/dli6W4UQZjjIspwwFCiGbwrPtTqWwrIW1tpoewd/3AM6EaKoiZzHV4R
 h+2kYAOwNnqFtoB8RfxAMUJhb7Wz7/rYAs1VheRhSCJMIURBUIPmEYckzsSV8+DqS6wstCNgUDa
 wiuf9ndpJ7RDUtEEaM5AR4k0pk90mm9IeNEv9OZZnLJi7n7o+ELvHH1ZqZ0xtQCEPjMs0soY34W
 hBH1f+0FAHo1W7t1/63L28nczMaWmA4pid+Z1ZmgXdeiEvtwVBHImcx6RDSszmeTiyqN+LU3gWY
 mARTQ8ut87gJLDPmbsQ==
X-Proofpoint-ORIG-GUID: grcMC3ZTkm6KtyDAR2fbJCHECpTclDzQ
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a480fee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c_1ikP4J58vCyc_cPHMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX8WxpeV4rHAzq
 ul+5OvJCSaLQA8GyVLw0ehZq8+O8Dkf26E1cK933e6b2bwYzjgSkw1u5ZWcKibciPjyApzciSyN
 QS6nYjYx5o8dBExjgtBFERSIKj2XQtk=
X-Proofpoint-GUID: grcMC3ZTkm6KtyDAR2fbJCHECpTclDzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_123927_920400_759B5D95 
X-CRM114-Status: GOOD (  14.38  )
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

Drivers using of_reserved_mem_device_init() and its variants must
manually call of_reserved_mem_device_release() in their remove and
error-unwind paths. This is repetitive boilerplate that is easy to
get wrong, and several drivers have open-coded the teardown
inconsistently or skipped it entirely, leading to dangling reserved
memory references.

This series introduces devres-managed wrappers —
devm_of_reserved_mem_device_init(), devm_of_reserved_mem_device_init_by_idx(),
and devm_of_reserved_mem_device_init_by_name() — that tie the reserved
memory region lifetime to the device, releasing it automatically on
unbind. The remaining 40 patches convert drivers across the drm, media,
ASoC, remoteproc, firmware, mmc, memory and misc subsystems to use these
helpers, yielding a net reduction of ~90 lines of boilerplate.

This series depends on  https://lore.kernel.org/lkml/20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com/

Konrad Dybcio (1):
  of: reserved_mem: Introduce devres-managed initialization functions

Mukesh Ojha (41):
  of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
  firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
  remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
  remoteproc: keystone: Use devm_of_reserved_mem_device_init()
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  remoteproc: omap: Use devm_of_reserved_mem_device_init()
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  memory: tegra210-emc: Use devm_of_reserved_mem_device_init_by_name()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
  remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  misc: fastrpc: Use devm_of_reserved_mem_device_init()
  ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 drivers/firmware/qcom/qcom_scm.c              | 22 +++------
 .../gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  6 +--
 drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 13 +-----
 drivers/gpu/drm/kmb/kmb_drv.c                 | 12 +----
 drivers/gpu/drm/logicvc/logicvc_drm.c         | 21 ++++-----
 drivers/gpu/drm/pl111/pl111_drv.c             |  4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  4 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  4 +-
 .../platform/arm/mali-c55/mali-c55-core.c     | 12 ++---
 drivers/media/platform/aspeed/aspeed-video.c  | 12 ++---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c |  3 +-
 drivers/media/platform/nuvoton/npcm-video.c   |  9 +---
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 16 +------
 drivers/memory/tegra/tegra210-emc-core.c      | 21 ++++-----
 drivers/misc/fastrpc.c                        |  2 +-
 drivers/mmc/host/sdhci-of-bst.c               |  7 +--
 drivers/of/of_reserved_mem.c                  | 41 +++++++++++++++++
 drivers/remoteproc/da8xx_remoteproc.c         | 10 +---
 drivers/remoteproc/keystone_remoteproc.c      | 16 +------
 drivers/remoteproc/mtk_scp.c                  |  3 +-
 drivers/remoteproc/omap_remoteproc.c          | 13 +-----
 drivers/remoteproc/ti_k3_common.c             | 13 +-----
 drivers/remoteproc/ti_k3_common.h             |  1 -
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  6 +--
 include/linux/of_reserved_mem.h               | 46 +++++++++++++++++++
 sound/hda/controllers/cix-ipbloq.c            |  2 +-
 sound/soc/fsl/imx-rpmsg.c                     |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 13 +-----
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 +------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 11 +----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 14 +-----
 sound/soc/sof/imx/imx-common.c                |  9 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c        |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c                 |  3 +-
 43 files changed, 162 insertions(+), 249 deletions(-)

-- 
2.53.0


