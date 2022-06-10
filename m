Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24309C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lN6ElQ7oqtK8WNT0mn14vFF7YA0hc/UXN6xbsfEw0sI=; b=y5d9YUr11JVL6Q
	ptS1R0rjEKrFikemhhowswcqPNNYaiE4KhGQPMNHEJ536mm5zA3cJSWFIBxyhx9skUgH9SCnctacw
	2NGdhek+cKxxmyd/WGSfnk/aJ6jtucRPizkN9fsCG6028WNp8PP0iDdNTGug/EUdY5aIB/f7wCKlB
	vn5mpnrvbaCeO60Wjstt+nMfzm+dh+Ll+nZu7Ge0XaaXHb10xIhazSNHZuIi66A69Gk33QQ6kM60V
	moWeO1B1xzZVipvsCjXoOuV1Gun0lJkkPXlYuSjdSsTnRvyWdfkIvASrtMrU9YoO456zBCaP9yfYB
	hS7MzqKFqD4p0cU5xzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaI9-006tS0-Vk; Fri, 10 Jun 2022 08:46:54 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaI6-006tPD-TT; Fri, 10 Jun 2022 08:46:52 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A8Ze3o010624;
	Fri, 10 Jun 2022 04:46:26 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh1rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:46:26 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8kOvs023128
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:46:24 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:46:23 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:46:23 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imiU014275;
	Fri, 10 Jun 2022 04:46:12 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
CC: Cai Huoqing <cai.huoqing@linux.dev>,
        Benjamin Fair
	<benjaminfair@google.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amit Kucheria
	<amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>, Benson Leung
	<bleung@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Christophe Branchereau
	<cbranchereau@gmail.com>,
        Patrick Venture <venture@google.com>, Arnd Bergmann
	<arnd@arndb.de>,
        Nancy Yuen <yuenn@google.com>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gwendal
 Grignou <gwendal@chromium.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Tali
 Perry <tali.perry1@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thara Gopinath
	<thara.gopinath@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Lorenzo
 Bianconi <lorenzo@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon
	<tmaimon77@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas
 Ferre <nicolas.ferre@microchip.com>,
        Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Guenter
 Roeck <groeck@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Olivier
 Moysan <olivier.moysan@foss.st.com>,
        Eugen Hristev
	<eugen.hristev@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 08/34] iio: adc: mt6360-adc: explicitly add proper header files
Date: Fri, 10 Jun 2022 10:45:19 +0200
Message-ID: <20220610084545.547700-9-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: yStEYeEKhZQK-Q-JhY1x7jrE3m5FRGTD
X-Proofpoint-GUID: yStEYeEKhZQK-Q-JhY1x7jrE3m5FRGTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=871 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014651_000300_8DE4958F 
X-CRM114-Status: GOOD (  11.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVkZXMgb2YuaCB3aGljaCBpbiB0
dXJuIGluY2x1ZGVzCmFsbCB0aGUgaGVhZGVycyB3ZSBhcmUgcmVseWluZyBvbi4KClRoZSB1bHRp
bWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2YuaCBmcm9tIGlpby5oLgoKU2lnbmVkLW9m
Zi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9hZGMv
bXQ2MzYwLWFkYy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2lpby9hZGMvbXQ2MzYwLWFkYy5jIGIvZHJpdmVycy9paW8vYWRjL210
NjM2MC1hZGMuYwppbmRleCAwN2MwZTY3NjgzOTEuLjM1MjYwZDllNGU0NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9paW8vYWRjL210NjM2MC1hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvbXQ2MzYw
LWFkYy5jCkBAIC01LDYgKzUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2lycS5oPgogI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2t0aW1lLmg+CisjaW5jbHVkZSA8bGlu
dXgvbW9kX2RldmljZXRhYmxlLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVk
ZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KLS0g
CjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
