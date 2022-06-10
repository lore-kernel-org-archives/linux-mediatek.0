Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC9C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiKvj5yugIUx1sj1jAVMxrszTCB8xthAhWf9aOHNUzM=; b=eU8FS6ACCEENjb
	uVQTbnABRVkDE+sTvxRlzF+eONasCHl0yUeT88vBMBoJWrwEIWqBI9g3k8NMjxWdsJ1CQnD1kO/oV
	zyIAukDfUbj4SSZOQvwkPZ/Jo8o8imQ7FP4vAhliNh4qL0MalKcYL9ObiLJaPkf0Q0mwKDg+8wSJ6
	uuNWjHfUstUOztE9M3dbgMpNonxvjFteK85LW5UU/co0G35IBUDsrZrAt/shlUCBqt+jXgoCuOIS7
	Idt7MeJ2JQODnktcbscHMmQMwCNaXBTIhJXp/4d7yAsE/SNoqzjUjm9QY49iUn0AaRjgZYSWODWzH
	spl1qbagq/uhsk5q/x5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaJX-006uVL-Hc; Fri, 10 Jun 2022 08:48:19 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaJU-006uSp-O9; Fri, 10 Jun 2022 08:48:18 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7h8EN005272;
	Fri, 10 Jun 2022 04:47:57 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kq8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:47:57 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8lt7F027541
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:47:55 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:47:54 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:47:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:47:54 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imih014275;
	Fri, 10 Jun 2022 04:47:42 -0400
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
        "Linus
 Walleij" <linus.walleij@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amit Kucheria
	<amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>, Benson Leung
	<bleung@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>,
        Christophe Branchereau
	<cbranchereau@gmail.com>,
        Patrick Venture <venture@google.com>, Arnd Bergmann
	<arnd@arndb.de>,
        Nancy Yuen <yuenn@google.com>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Gwendal Grignou" <gwendal@chromium.org>,
        Saravanan Sekar
	<sravanhome@gmail.com>,
        "Tali Perry" <tali.perry1@gmail.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thara
 Gopinath <thara.gopinath@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        "Lorenzo Bianconi" <lorenzo@kernel.org>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        "Nicolas Ferre" <nicolas.ferre@microchip.com>,
        Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Shawn
 Guo <shawnguo@kernel.org>,
        "Guenter Roeck" <groeck@chromium.org>,
        Fabio
 Estevam <festevam@gmail.com>,
        "Olivier Moysan" <olivier.moysan@foss.st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>
Subject: [PATCH 21/34] iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
Date: Fri, 10 Jun 2022 10:45:32 +0200
Message-ID: <20220610084545.547700-22-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: zGySTyLHzuN506SK7GBBWcpQPn_ZINfL
X-Proofpoint-GUID: zGySTyLHzuN506SK7GBBWcpQPn_ZINfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014816_852325_46F41AC1 
X-CRM114-Status: GOOD (  13.56  )
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

b2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSBjYW4gZWl0aGVyIHJldHVybiBOVUxMIG9yIGFu
IGVycm9yIHBvaW50ZXIKc28gdGhhdCBvbmx5IGRvaW5nIElTX0VSUigpIGlzIG5vdCBlbm91Z2gu
IEZpeCBpdCBieSBjaGVja2luZyB0aGUgTlVMTApwb2ludGVyIGNhc2UgYW5kIHJldHVybiAtRU5P
REVWIGluIHRoYXQgY2FzZS4gTm90ZSB0aGlzIGlzIGRvbmUgbGlrZSB0aGlzCnNvIHRoYXQgdXNl
cnMgb2YgdGhlIGZ1bmN0aW9uICh3aGljaCBvbmx5IGNoZWNrIGZvciBlcnJvciBwb2ludGVycykg
ZG8Kbm90IG5lZWQgdG8gYmUgY2hhbmdlZC4gVGhpcyBpcyBub3QgaWRlYWwgc2luY2Ugd2UgYXJl
IGxvc2luZyBlcnJvciBjb2RlcwphbmQgYXMgc3VjaCwgaW4gYSBmb2xsb3cgdXAgY2hhbmdlLCB0
aGluZ3Mgd2lsbCBiZSB1bmlmaWVkIHNvIHRoYXQKb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUo
KSBvbmx5IHJldHVybnMgZXJyb3IgY29kZXMuCgpGaXhlczogNmUzOWIxNDVjZWY3ICgiaWlvOiBw
cm92aWRlIG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkgYW5kIGRldm1fIHZlcnNpb24gaXQi
KQpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZl
cnMvaWlvL2lua2Vybi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9paW8vaW5rZXJuLmMK
aW5kZXggOWQ4NzA1Nzc5NGZjLi44N2ZkMmEwZDQ0ZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlv
L2lua2Vybi5jCisrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCkBAIC00MTIsNiArNDEyLDggQEAg
c3RydWN0IGlpb19jaGFubmVsICpkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVj
dCBkZXZpY2UgKmRldiwKIAljaGFubmVsID0gb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUobnAs
IGNoYW5uZWxfbmFtZSk7CiAJaWYgKElTX0VSUihjaGFubmVsKSkKIAkJcmV0dXJuIGNoYW5uZWw7
CisJaWYgKCFjaGFubmVsKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIAogCXJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1faWlvX2NoYW5uZWxfZnJlZSwgY2hhbm5l
bCk7CiAJaWYgKHJldCkKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
