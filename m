Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A49CCA481
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QLsNrK/Isi1flRp63wRRbypnKDd/ZWvDG67ro1BoVI=; b=gSVI8XoYSg2qtF
	LD+SmNlIojsLuyrlMkKGBYK/3AO7eC5IQQp0DFqQi+YDwuFWhinVebfsi9e9QBQgbfTOIt9Lr6bMY
	cSfEtpPXNwZXJNGZU1MsEedU4NqvRwiPh2SSimeE8K8vN0zb6ZTqVA4Wf7fCDBlpTowmY7HHP6WPe
	AcVTRf1Br78ZcRFmGk5zfLvK60IlRBi3RNQuPcNNCIb4d5x1xBzcYUMtX+TdCpgNDDYC78htwnUnl
	wvUuKotmDVkXRElmziMe+T/39CUYwSN2mAcnDVNaZI35jUIrCb95aOYmBauISuDJQzfs1cuYxf4tr
	SAC5d27hYKjhAbZ8XfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaKA-006uuw-HQ; Fri, 10 Jun 2022 08:48:58 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaK7-006usY-VI; Fri, 10 Jun 2022 08:48:57 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7SjCg005350;
	Fri, 10 Jun 2022 04:48:35 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:35 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mTCk027565
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:48:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:27 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imim014275;
	Fri, 10 Jun 2022 04:48:18 -0400
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
Subject: [PATCH 26/34] iio: adc: ingenic-adc: convert to IIO fwnode interface
Date: Fri, 10 Jun 2022 10:45:37 +0200
Message-ID: <20220610084545.547700-27-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WnzJHPBqQBQi6JveWm3Q_eHoFSEHuh2-
X-Proofpoint-GUID: WnzJHPBqQBQi6JveWm3Q_eHoFSEHuh2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=848 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014856_032175_430D4BBC 
X-CRM114-Status: GOOD (  14.99  )
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

TW92ZSBmcm9tICdvZl94bGF0ZSgpJyB0byAnZndub2RlX3hsYXRlKCknLiBUaGUgZW5kIGdvYWwg
aXMgdG8gY29tcGxldGVseQpkcm9wIE9GIGZyb20gdGhlIElJTyBpbmtlcm5lbCBpbnRlcmZhY2Uu
CgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZl
cnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8v
YWRjL2luZ2VuaWMtYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvaW5nZW5pYy1hZGMuYwppbmRleCBl
NzMxYmE0N2FkZDIuLmRjYzZiYzI5ZGNhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2lu
Z2VuaWMtYWRjLmMKKysrIGIvZHJpdmVycy9paW8vYWRjL2luZ2VuaWMtYWRjLmMKQEAgLTE5LDcg
KzE5LDYgQEAKICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+Ci0jaW5jbHVkZSA8bGlu
dXgvb2YuaD4KIAogI2RlZmluZSBKWl9BRENfUkVHX0VOQUJMRQkJMHgwMAogI2RlZmluZSBKWl9B
RENfUkVHX0NGRwkJCTB4MDQKQEAgLTcxOSwxMiArNzE4LDEyIEBAIHN0YXRpYyBpbnQgaW5nZW5p
Y19hZGNfcmVhZF9yYXcoc3RydWN0IGlpb19kZXYgKmlpb19kZXYsCiAJfQogfQogCi1zdGF0aWMg
aW50IGluZ2VuaWNfYWRjX29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppaW9fZGV2LAotCQkJCWNv
bnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmlpb3NwZWMpCitzdGF0aWMgaW50IGluZ2VuaWNf
YWRjX2Z3bm9kZV94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaWlvX2RldiwKKwkJCQkgICAgY29uc3Qg
c3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAqaWlvc3BlYykKIHsKIAlpbnQgaTsKIAotCWlm
ICghaWlvc3BlYy0+YXJnc19jb3VudCkKKwlpZiAoIWlpb3NwZWMtPm5hcmdzKQogCQlyZXR1cm4g
LUVJTlZBTDsKIAogCWZvciAoaSA9IDA7IGkgPCBpaW9fZGV2LT5udW1fY2hhbm5lbHM7ICsraSkK
QEAgLTc0Myw3ICs3NDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19pbmZvIGluZ2VuaWNf
YWRjX2luZm8gPSB7CiAJLndyaXRlX3JhdyA9IGluZ2VuaWNfYWRjX3dyaXRlX3JhdywKIAkucmVh
ZF9yYXcgPSBpbmdlbmljX2FkY19yZWFkX3JhdywKIAkucmVhZF9hdmFpbCA9IGluZ2VuaWNfYWRj
X3JlYWRfYXZhaWwsCi0JLm9mX3hsYXRlID0gaW5nZW5pY19hZGNfb2ZfeGxhdGUsCisJLmZ3bm9k
ZV94bGF0ZSA9IGluZ2VuaWNfYWRjX2Z3bm9kZV94bGF0ZSwKIH07CiAKIHN0YXRpYyBpbnQgaW5n
ZW5pY19hZGNfYnVmZmVyX2VuYWJsZShzdHJ1Y3QgaWlvX2RldiAqaWlvX2RldikKLS0gCjIuMzYu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
