Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F566C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/ZMjoVw7k2/KpOQOuzvfRyzP14j/QO4xrW4eNNkbUI=; b=sD6YMQ+vAQ87jlRWqHOfoBzRKt
	RR3327im+xt/0KQUQvb7yEE8BrYLW5YdF3wYhxMK7fIQWgI8gjV0R29uqueM4erDQqikWh0KMZHNg
	ZSx2qEGT14+BnXJpn+EVymHtUeiCpgDmjMWEV/tUVbnRCMCednJl7xjHMnjdCQUMpb/za0yYmPsJ5
	+O2gU3TYAMl/ynZJLw9lMvzADr9iLNLN9C43zWyZ/Pu/dv45rNXMwb2YckO9HaA1KeGz7oQOXCHyB
	7gidZRjd59oTp3uyHiirsrHBWdcSrglBb0iMpFGMcYssYXhTPtVA846B9PDZuvpK9ilPSJBPtLt7F
	iSBMD4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAstN-001cLe-AH; Mon, 11 Jul 2022 12:52:01 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsgk-001VjI-J9; Mon, 11 Jul 2022 12:39:00 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BCGvj9011956;
	Mon, 11 Jul 2022 08:38:22 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h73h6caet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 08:38:22 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26BCcL5M000402
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Jul 2022 08:38:21 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:38:20 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:38:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:38:20 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVE6011687;
	Mon, 11 Jul 2022 08:38:10 -0400
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
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, "Zhang
 Rui" <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Eugen
 Hristev" <eugen.hristev@microchip.com>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Jishnu Prakash
	<quic_jprakash@quicinc.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        "Michael Hennerich" <Michael.Hennerich@analog.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Thara Gopinath
	<thara.gopinath@linaro.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        "Fabio
 Estevam" <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>,
        "Arnd
 Bergmann" <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Patrick Venture" <venture@google.com>,
        Amit Kucheria <amitk@kernel.org>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        "Guenter Roeck" <groeck@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Linus Walleij
	<linus.walleij@linaro.org>
Subject: [PATCH v2 01/15] iio: inkern: only release the device node when done with it
Date: Mon, 11 Jul 2022 14:38:21 +0200
Message-ID: <20220711123835.811358-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: ci3qmm03iYTNTvcGF918_TuIr9qgcoR0
X-Proofpoint-ORIG-GUID: ci3qmm03iYTNTvcGF918_TuIr9qgcoR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=989 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_053858_723347_F03C5B7D 
X-CRM114-Status: GOOD (  14.28  )
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

'of_node_put()' can potentially release the memory pointed to by
'iiospec.np' which would leave us with an invalid pointer (and we would
still pass it in 'of_xlate()'). Note that it is not guaranteed for the
of_node lifespan to be attached to the device (to which is attached)
lifespan so that there is (even though very unlikely) the possibility
for the node to freed while the device is still around. Thus, as there
are indeed some of_xlate users which do access the node, a possible race
is indeed possible.

As such, we can only release the node after we are done with it.

Fixes: 17d82b47a215d ("iio: Add OF support")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/iio/inkern.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index df74765d33dc..9d87057794fc 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -165,9 +165,10 @@ static int __of_iio_channel_get(struct iio_channel *channel,
 
 	idev = bus_find_device(&iio_bus_type, NULL, iiospec.np,
 			       iio_dev_node_match);
-	of_node_put(iiospec.np);
-	if (idev == NULL)
+	if (idev == NULL) {
+		of_node_put(iiospec.np);
 		return -EPROBE_DEFER;
+	}
 
 	indio_dev = dev_to_iio_dev(idev);
 	channel->indio_dev = indio_dev;
@@ -175,6 +176,7 @@ static int __of_iio_channel_get(struct iio_channel *channel,
 		index = indio_dev->info->of_xlate(indio_dev, &iiospec);
 	else
 		index = __of_iio_simple_xlate(indio_dev, &iiospec);
+	of_node_put(iiospec.np);
 	if (index < 0)
 		goto err_put;
 	channel->channel = &indio_dev->channels[index];
-- 
2.37.0


