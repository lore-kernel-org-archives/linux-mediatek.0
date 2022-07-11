Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D9AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U5zvrEdMuZH3z7+C8oNPUZzfcH7yQnssZ95KBMdorA=; b=DHa3qxDsCvD2bTd+gb+I5vAC1D
	10BaGkCoqRRLCJx3QuXi1Y/8gsv9NQgPp2rBe91phUjDz3LGTn6OLfzFqdXD0nobSitT6AsG1KkrZ
	N61NT1L3n3LQQkhXOF62PVE8IPLq4VrcB9ZwneDD4KsMWrHAmhoxjgSQijzGepMz4twgjZVbLAv7D
	t3KKW2iE4eY2p3gklYr1Q5haHIave/Vn9SBMSfHFim9a/XL3+lcj6m/3sT7F5fdx33yCO0Q+EyusV
	G5HjyoEtvFwezkrkzX/3ckj9CrmzuxH2w9NDdj8UoOOtNUjBiKI6AD50YHGZ9GabKSfAoRPnur0aU
	L+zFmlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAstX-001cQo-BM; Mon, 11 Jul 2022 12:52:11 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsgk-001Vk7-GR; Mon, 11 Jul 2022 12:39:00 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BAvb78026643;
	Mon, 11 Jul 2022 08:38:29 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bhvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 08:38:29 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26BCcSmK045671
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Jul 2022 08:38:28 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 11 Jul
 2022 08:38:27 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:38:27 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVE7011687;
	Mon, 11 Jul 2022 08:38:17 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
        <linux-mips@vger.kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC: Andy Gross <agross@kernel.org>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Benson Leung <bleung@chromium.org>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Zhang
 Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Eugen
 Hristev <eugen.hristev@microchip.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benjamin Fair
	<benjaminfair@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Avi Fishman
	<avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Thara Gopinath
	<thara.gopinath@linaro.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Fabio
 Estevam <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>,
        Arnd
 Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Patrick
 Venture <venture@google.com>,
        Amit Kucheria <amitk@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Guenter
 Roeck <groeck@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 02/15] iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
Date: Mon, 11 Jul 2022 14:38:22 +0200
Message-ID: <20220711123835.811358-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: qaJDU5Vqcjzj3zGc9hDASQNFfFavcTPg
X-Proofpoint-GUID: qaJDU5Vqcjzj3zGc9hDASQNFfFavcTPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_053858_606265_E861AF98 
X-CRM114-Status: GOOD (  14.18  )
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

of_iio_channel_get_by_name() can either return NULL or an error pointer
so that only doing IS_ERR() is not enough. Fix it by checking the NULL
pointer case and return -ENODEV in that case. Note this is done like this
so that users of the function (which only check for error pointers) do
not need to be changed. This is not ideal since we are losing error codes
and as such, in a follow up change, things will be unified so that
of_iio_channel_get_by_name() only returns error codes.

Fixes: 6e39b145cef7 ("iio: provide of_iio_channel_get_by_name() and devm_ version it")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/inkern.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 9d87057794fc..87fd2a0d44f2 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -412,6 +412,8 @@ struct iio_channel *devm_of_iio_channel_get_by_name(struct device *dev,
 	channel = of_iio_channel_get_by_name(np, channel_name);
 	if (IS_ERR(channel))
 		return channel;
+	if (!channel)
+		return ERR_PTR(-ENODEV);
 
 	ret = devm_add_action_or_reset(dev, devm_iio_channel_free, channel);
 	if (ret)
-- 
2.37.0


