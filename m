Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2384C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=; b=3P3szOc9QWKxab3nEbCT/0UvKU
	y2NfzxzKf+vfMXFXldVoAxBi5uPyCoo2tQET5ENGzk5f0Q7Oss/a+wD5hPDb9d9NDF8qn5cC2l3R/
	MTIEelEuvrSLK8dVKpihbqk5Neq4tCJjI00gIdKR+y4h4niz3c68P+qlmuEEWvvy7PXKx9Oll36ZW
	ouaRTAhF5/GQuRAhH0um37uAj/JybEOe4ihliEAi3ose5/1jJTinDc2FCD/2/89AglKGzu0danh9T
	WxFyuxeMco3RS8ueZoaS/VOb8KSaep4VqU4v+RVXv48GD1mX1X1xGKNMuTn6sqcW8a8Q1C1QhY7Re
	6o5rAmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjkI-00000007n5r-0Ztj;
	Fri, 03 Jul 2026 19:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjkF-00000007n5A-2g6j
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 19:40:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiPV8545518
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 19:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGH0Mfb9t3d
	kT8UvMf5f1wosC3eQeF337EZxodGa2xo=; b=HipLHZTmLwrBQObeVsOGWExITfp
	t7/tVWx4vzKDtDPxgNwrOMMLEYbY4ozBpTauLC1kSTV/W7k1Qm0e12vRO+ogANBW
	NW0APmhU3sAdU2NrCqlWIoHmD0kU4SQGq4ljc6YwuMSM7GFhHObmCpJ+/+rhnKsQ
	INKlcMzloIbYPjrnEN/lLIpHGyWDH5yPXXSi8+KcBgoraO6K/MnRfB3UUkLILky6
	qTPqH4OVJXMwBZsrvWtdNjSsexZaz22Q5jADDCPONMxS+LjIGY3qz0KpGGSr3YaR
	wcrE60nfHX13IMBNYdT4V8pqcZ2+pD+AyngKR10muMKnOdEdCQYuLKpAovQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btqp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 19:40:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so1379506a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107614; x=1783712414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
        b=OFVFGgzK190ktkVhrx93HeeJTu4f20irZMwkefZKVE0A65dEnBYzQ8EAL8hVpFJ40e
         QC/5UzwqH/vf0/s/yKWuxk7WW0GXLijdzGSCmD6q4J+i33O+Y61GGo+ZMIc5pqOrjF+C
         jZtsQcz50+gWzihfQR6lCb5S9AYA5yIGLi7yp5qIH1qLDlxgMpcDBoQVaGxirpUXkj0H
         BWFa6NJY1eRzgJ74ol6ev3rFMCy02fQCcAwTrqijFSnkIXLM/Zyhj+pe50X3cB5GV3Vb
         seXFxNQkVUcXJNoBMZrNIZcLCIAKusMQOpkjqZ2Q1+SlJ6hxvOG3jLeExDx6Xc8DGvGH
         tuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107614; x=1783712414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
        b=tA11/x3Djd8xREYqL9sZxqNZezYOSLushkSo83RWvIRa4owan0qlzIfSIpScUCFV0F
         iVAlEzWj3YNR/NiK2Fju1+y1X00JYczkph5qLZMrwKw/6OzGnlJ3gdiZn+wQ/Db5mAWC
         bcrLZV6PwrdI5w+LTZGAAkCTk0Ezb3lFRFjsbgEEaeYvFKjKraGPFFP+UJgVm/BgqPH0
         EU44paYNX7Zu52/lrZGUr2zlzfQqJMND0syt8ksfcFX4wX+a6CtMSPfDDIZgUaFNriEs
         npVIA7fVXuqafJUozzjUpmQk4m01uzU3WWcdXBbNU2EJpgXmtoyNQOm21Is0LZGYrqos
         9QYg==
X-Forwarded-Encrypted: i=1; AHgh+RqIaBz0aGsI5jhjAiKZ5OABpTuzrmNf8DrVDoO7ALkl8P+I0beJhTgOmLPlngm2ocfDSZGlW8gXlMYIPjbJfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDRmFQqsG7E9pwJN3v9t+vj75bab05kyUaw+dykhzWSO16bbXb
	HbtN4rI62RMnpcARzg3Qx/kkDAnpd2fyLdrufnZ2beQDPwuhjCPQRjKVfwMU6JpR/iLMiP05mXA
	AjA9p4auUa7Lebcbte5Jh6h962r9ZFO95ohUXdw8api8Iijd5bLTocxmKiUSDd5oKoXCCSaUj7M
	8=
X-Gm-Gg: AfdE7cn9MrJmncRVg0aOOanM13Iy98daTf8mLBexWMKKW6/BoF7GZjlf9Fqoe0q1sDI
	l31ZhO0Aae0job/kcC2dAT7jLXvRNLbN5f6vWmv1o3kL5oDm6Zt3i3ToFCewCHf5bp0sgBsvLct
	UqCtBXT43Ewq5XuRPEiVhGXFxge5Awl/z5ONLmqS93bnp9OVnxkCR19omYYuXYCxJGIs523yR0K
	BoYgnJuOoAJez9dJw5K2CFbb78AVQhDGS7EPLNP58Y67DMjGpJhBVNerd1hCvT2pHR6p0WA/FKk
	cf3MRmQMNkaFJMvgoURnPDqekZzWpEgBXK/acmvueSTcr9S8XVi3PfPlWnWqkpkAPGqGSQODnTr
	xXalQIlL58yumBni/H0Oku/InjtSjqDbZvU8zkg==
X-Received: by 2002:a17:90b:4fd1:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-3829f0054e1mr764368a91.21.1783107614340;
        Fri, 03 Jul 2026 12:40:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-3829f0054e1mr764330a91.21.1783107613641;
        Fri, 03 Jul 2026 12:40:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:40:13 -0700 (PDT)
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
Subject: [PATCH 02/42] of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:15 +0530
Message-ID: <20260703193855.110619-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX9apEskKz6/S7
 TMAcgnGuUhW84Y+h28VTkLEftPfm7gtmuIpieKSLEL6jypWFevISQvRWJTSraEF+gcO+LK9EY0M
 Uv9E7DuIvBVx/+y6ModbCsn2ozpji2Wv49zFEtPuh/6maf3Uigj5+hJtotxLoqJ2fhklx4cIegi
 /JMNRhRh8YoSv2kT3KDC0Y8nT83yF9y8WDhxuMiiB5VDNtRq6tDceKFTWbw0l05thJtm+ikzRdZ
 /X4Kg/1tM/cDJsWqFs8uWRc/iH5N1TgLPrVlvFMS4KDNy4ISL7HzchZXstosD+PEtNxuEOzv+tp
 CvwFjdDXnchyqXhdHgecAIF9TnwmQgR1pe5stypW7vSb0PrleiC8DK8kOSLyqILqV8cT7en69pe
 e8k0rUxThiuBYYP/TmHHqgoeyVgZgE7/aerXLdUBW+5tKe3Taj8lR1jWo/xNlT/bPyrj4Kxxdj/
 c1o3I3/Dl9cYbheh9Rg==
X-Proofpoint-ORIG-GUID: 55WEZ5WEdOgH46sUDsd1PW6rfLgK8GSu
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a48101f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=K3bnyJ_z4bF7bLuR74EA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/74/FvR7n8oS
 CD/zwfUvSmhaaHUM+MlLizZpLhOw1fpGRc0Vzgn2DmNhyoiX0/AH31irBN9vXOnBS+OSCwADEo4
 wxJBqGTgQecFJLsY2rcK6+Qiz2qoRFY=
X-Proofpoint-GUID: 55WEZ5WEdOgH46sUDsd1PW6rfLgK8GSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_124015_682272_6F7CB1E3 
X-CRM114-Status: GOOD (  15.92  )
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

Add a resource managed inline wrapper for
of_reserved_mem_device_init_by_name() to complement the existing
devm_of_reserved_mem_device_init_by_idx() and
devm_of_reserved_mem_device_init() helpers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/of_reserved_mem.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index b9fd78123d77..52aacdbf432c 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -133,4 +133,25 @@ static inline int devm_of_reserved_mem_device_init(struct device *dev)
 	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
 }
 
+/**
+ * devm_of_reserved_mem_device_init_by_name() - Resource managed of_reserved_mem_device_init_by_name
+ * @dev:	Pointer to the device to configure
+ * @np:		Pointer to the device node with 'memory-region' property
+ * @name:	Name of the selected memory region
+ *
+ * This is a resource managed version of of_reserved_mem_device_init_by_name().
+ * The reserved memory region will be released automatically when the device
+ * is unbound.
+ *
+ * Returns error code or zero on success.
+ */
+static inline int devm_of_reserved_mem_device_init_by_name(struct device *dev,
+							   struct device_node *np,
+							   const char *name)
+{
+	int idx = of_property_match_string(np, "memory-region-names", name);
+
+	return devm_of_reserved_mem_device_init_by_idx(dev, np, idx);
+}
+
 #endif /* __OF_RESERVED_MEM_H */
-- 
2.53.0


