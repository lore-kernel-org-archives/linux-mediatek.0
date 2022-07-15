Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0481C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh2ZV0Mgf8PqSKksmFEY76tNyWSqmokAWVCKmkGB11A=; b=t/gQkS6Mkl5QFMWSkUo1p/J2K0
	g+ENo7AbVbzuoRc7AeQPe+y7Kfay1lUf1vhxKV5fmSEYUrWsEV++hE8dVq4JuFSPRYf8b8tjsbHox
	ClLz8X3hXlzKBTZx1mtzPwmaU1qH7oMF39Wt2Ei/E1AhQ8+teVGR1oqyE7Xv97Y1Cbk/9J6bq0zeS
	wGtYnjpc7vZssQInJo5IS2QqRsWtwbjQruQ9S+HGCEfgZNK5DA+rnsQURs4Rc/nHKpA1Uu4QlS53I
	z+IZeiVeDlbfZo7uRxhXqhifRuw6CtqugZimiF1mJQHm3i/OrDmb8ZJIu3l8eQfFk67mZqbs8F1zV
	gXPZP43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKS7-006vJX-JE; Fri, 15 Jul 2022 12:29:51 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKS0-006vDu-He; Fri, 15 Jul 2022 12:29:48 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FA9g5F026919;
	Fri, 15 Jul 2022 08:29:25 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 08:29:25 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26FCTNsR062169
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Jul 2022 08:29:23 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 15 Jul
 2022 08:29:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:29:22 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxO2001007;
	Fri, 15 Jul 2022 08:29:10 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-arm-msm@vger.kernel.org>
CC: Gwendal Grignou <gwendal@chromium.org>,
        Jonathan Cameron
	<jic23@kernel.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Tomer Maimon
	<tmaimon77@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Olivier
 Moysan <olivier.moysan@foss.st.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Fair
	<benjaminfair@google.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Patrick Venture
	<venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Benson Leung <bleung@chromium.org>, Nancy Yuen
	<yuenn@google.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe Branchereau
	<cbranchereau@gmail.com>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Avi Fishman
	<avifishman70@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy
 Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        Andy Gross <agross@kernel.org>, Amit Kucheria
	<amitk@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Haibo
 Chen <haibo.chen@nxp.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: [PATCH v3 06/15] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO fwnode API
Date: Fri, 15 Jul 2022 14:28:54 +0200
Message-ID: <20220715122903.332535-7-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: dQxR8sUr2agqR-ghpUJhUgkK3drXsN-_
X-Proofpoint-ORIG-GUID: dQxR8sUr2agqR-ghpUJhUgkK3drXsN-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_052944_622597_5DD6194C 
X-CRM114-Status: GOOD (  13.21  )
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

Make usage of the new firmware agnostic API
'devm_of_iio_channel_get_by_name()' to get the IIO channel.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index d9c9c975f931..0b8543c627f0 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -825,7 +825,8 @@ static int adc_tm5_get_dt_channel_data(struct adc_tm5_chip *adc_tm,
 	}
 	channel->adc_channel = args.args[0];
 
-	channel->iio = devm_of_iio_channel_get_by_name(adc_tm->dev, node, NULL);
+	channel->iio = devm_fwnode_iio_channel_get_by_name(adc_tm->dev,
+							   of_fwnode_handle(node), NULL);
 	if (IS_ERR(channel->iio)) {
 		ret = PTR_ERR(channel->iio);
 		if (ret != -EPROBE_DEFER)
-- 
2.37.1


