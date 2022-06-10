Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDBEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXRMxqyTV9wDbu2ADtCJwR8ujOIqroHXA9SzgfDWHko=; b=U64IAVTsnuQ8Wt
	/r+4J/sTESvmlese0Mc4taG6ns7d5y86b3+Kj8Qx/yMt2O9xvTj7eWWXk8YUhnwtHXuwChGldOn/K
	1aHDo0SNUjdpwROwwDCKf2cb+vtim5Ny2METXoX3/DdUd5/sLyDYMwjUMPZKtvCmvVSaguoRqnRPj
	zj8f9lIE8a8/H/TfFxeKA2PZJ0zP5FhQh26U0Av4ZeAPDWNpvFoDBkpgzEJHW82c8TSWe00yQxFgl
	qNpfkEycELN1PPQa0M5ZH2wImUP5nf2H3Jyhm3qoABhMnsHfYzcAF+uxebrjp8Es5sy1zeGh++X+A
	PGxQwDI6Si+oIXGVzZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaKL-006v3S-9p; Fri, 10 Jun 2022 08:49:09 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaKI-006v1D-IP; Fri, 10 Jun 2022 08:49:08 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7WKNi005267;
	Fri, 10 Jun 2022 04:48:43 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:43 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mgdK023311
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:42 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:41 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imio014275;
	Fri, 10 Jun 2022 04:48:31 -0400
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
Subject: [PATCH 28/34] iio: adc: at91-sama5d2_adc: convert to device properties
Date: Fri, 10 Jun 2022 10:45:39 +0200
Message-ID: <20220610084545.547700-29-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 9rClPBikqow13Q6rIolowiZYQvRQbT2V
X-Proofpoint-GUID: 9rClPBikqow13Q6rIolowiZYQvRQbT2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014906_636065_2B21D077 
X-CRM114-Status: GOOD (  16.30  )
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

TWFrZSB0aGUgY29udmVyc2lvbiB0byBmaXJtd2FyZSBhZ25vc3RpYyBkZXZpY2UgcHJvcGVydGll
cy4gQXMgcGFydCBvZgp0aGUgY29udmVyc2lvbiB0aGUgSUlPIGlua2VybiBpbnRlcmZhY2UgJ29m
X3hsYXRlKCknIGlzIGFsc28gY29udmVydGVkIHRvCidmd25vZGVfeGxhdGUoKScuIFRoZSBnb2Fs
IGlzIHRvIGNvbXBsZXRlbHkgZHJvcCAnb2ZfeGxhdGUnIGFuZCBoZW5jZSBPRgpkZXBlbmRlbmNp
ZXMgZnJvbSBJSU8uCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29t
PgotLS0KIGRyaXZlcnMvaWlvL2FkYy9hdDkxLXNhbWE1ZDJfYWRjLmMgfCAzMCArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQy
X2FkYy5jIGIvZHJpdmVycy9paW8vYWRjL2F0OTEtc2FtYTVkMl9hZGMuYwppbmRleCBiNzY0ODIz
Y2U1N2UuLmY1YTFkZjE5ZTViNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2F0OTEtc2Ft
YTVkMl9hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQyX2FkYy5jCkBAIC0x
Niw4ICsxNiw5IEBACiAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvaW8uaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9k
ZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KICNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+CiAjaW5jbHVkZSA8bGludXgvd2FpdC5oPgogI2luY2x1ZGUg
PGxpbnV4L2lpby9paW8uaD4KQEAgLTY1MCw4ICs2NTEsOCBAQCBhdDkxX2FkY19jaGFuX2dldChz
dHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBpbnQgY2hhbikKIAlyZXR1cm4gaW5kaW9fZGV2LT5j
aGFubmVscyArIGluZGV4OwogfQogCi1zdGF0aWMgaW5saW5lIGludCBhdDkxX2FkY19vZl94bGF0
ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAotCQkJCSAgICBjb25zdCBzdHJ1Y3Qgb2ZfcGhh
bmRsZV9hcmdzICppaW9zcGVjKQorc3RhdGljIGlubGluZSBpbnQgYXQ5MV9hZGNfZndub2RlX3hs
YXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCisJCQkJCWNvbnN0IHN0cnVjdCBmd25vZGVf
cmVmZXJlbmNlX2FyZ3MgKmlpb3NwZWMpCiB7CiAJcmV0dXJuIGF0OTFfYWRjX2NoYW5feGxhdGUo
aW5kaW9fZGV2LCBpaW9zcGVjLT5hcmdzWzBdKTsKIH0KQEAgLTE4NzYsNyArMTg3Nyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaWlvX2luZm8gYXQ5MV9hZGNfaW5mbyA9IHsKIAkucmVhZF9yYXcg
PSAmYXQ5MV9hZGNfcmVhZF9yYXcsCiAJLndyaXRlX3JhdyA9ICZhdDkxX2FkY193cml0ZV9yYXcs
CiAJLnVwZGF0ZV9zY2FuX21vZGUgPSAmYXQ5MV9hZGNfdXBkYXRlX3NjYW5fbW9kZSwKLQkub2Zf
eGxhdGUgPSAmYXQ5MV9hZGNfb2ZfeGxhdGUsCisJLmZ3bm9kZV94bGF0ZSA9ICZhdDkxX2FkY19m
d25vZGVfeGxhdGUsCiAJLmh3Zmlmb19zZXRfd2F0ZXJtYXJrID0gJmF0OTFfYWRjX3NldF93YXRl
cm1hcmssCiB9OwogCkBAIC0xOTIwLDYgKzE5MjEsNyBAQCBzdGF0aWMgaW50IGF0OTFfYWRjX2J1
ZmZlcl9hbmRfdHJpZ2dlcl9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIGludCBh
dDkxX2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogeworCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IGlpb19kZXYgKmluZGlvX2RldjsKIAlz
dHJ1Y3QgYXQ5MV9hZGNfc3RhdGUgKnN0OwogCXN0cnVjdCByZXNvdXJjZQkqcmVzOwpAQCAtMTkz
Myw3ICsxOTM1LDcgQEAgc3RhdGljIGludCBhdDkxX2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXN0ID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKIAlzdC0+aW5kaW9fZGV2
ID0gaW5kaW9fZGV2OwogCi0Jc3QtPnNvY19pbmZvLnBsYXRmb3JtID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCZwZGV2LT5kZXYpOworCXN0LT5zb2NfaW5mby5wbGF0Zm9ybSA9IGRldmljZV9n
ZXRfbWF0Y2hfZGF0YShkZXYpOwogCiAJaW5kaW9fZGV2LT5uYW1lID0gZGV2X25hbWUoJnBkZXYt
PmRldik7CiAJaW5kaW9fZGV2LT5tb2RlcyA9IElORElPX0RJUkVDVF9NT0RFIHwgSU5ESU9fQlVG
RkVSX1NPRlRXQVJFOwpAQCAtMTk1MCwzNCArMTk1MiwzMiBAQCBzdGF0aWMgaW50IGF0OTFfYWRj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlzdC0+b3ZlcnNhbXBsaW5n
X3JhdGlvID0gQVQ5MV9PU1JfMVNBTVBMRVM7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
MihwZGV2LT5kZXYub2Zfbm9kZSwKLQkJCQkgICAiYXRtZWwsbWluLXNhbXBsZS1yYXRlLWh6IiwK
LQkJCQkgICAmc3QtPnNvY19pbmZvLm1pbl9zYW1wbGVfcmF0ZSk7CisJcmV0ID0gZGV2aWNlX3By
b3BlcnR5X3JlYWRfdTMyKGRldiwgImF0bWVsLG1pbi1zYW1wbGUtcmF0ZS1oeiIsCisJCQkJICAg
ICAgICZzdC0+c29jX2luZm8ubWluX3NhbXBsZV9yYXRlKTsKIAlpZiAocmV0KSB7CiAJCWRldl9l
cnIoJnBkZXYtPmRldiwKIAkJCSJpbnZhbGlkIG9yIG1pc3NpbmcgdmFsdWUgZm9yIGF0bWVsLG1p
bi1zYW1wbGUtcmF0ZS1oelxuIik7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsCi0JCQkJICAgImF0bWVsLG1heC1zYW1w
bGUtcmF0ZS1oeiIsCi0JCQkJICAgJnN0LT5zb2NfaW5mby5tYXhfc2FtcGxlX3JhdGUpOworCXJl
dCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJhdG1lbCxtYXgtc2FtcGxlLXJhdGUt
aHoiLAorCQkJCSAgICAgICAmc3QtPnNvY19pbmZvLm1heF9zYW1wbGVfcmF0ZSk7CiAJaWYgKHJl
dCkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsCiAJCQkiaW52YWxpZCBvciBtaXNzaW5nIHZhbHVl
IGZvciBhdG1lbCxtYXgtc2FtcGxlLXJhdGUtaHpcbiIpOwogCQlyZXR1cm4gcmV0OwogCX0KIAot
CXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiYXRtZWwsc3Rh
cnR1cC10aW1lLW1zIiwKLQkJCQkgICAmc3QtPnNvY19pbmZvLnN0YXJ0dXBfdGltZSk7CisJcmV0
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImF0bWVsLHN0YXJ0dXAtdGltZS1tcyIs
CisJCQkJICAgICAgICZzdC0+c29jX2luZm8uc3RhcnR1cF90aW1lKTsKIAlpZiAocmV0KSB7CiAJ
CWRldl9lcnIoJnBkZXYtPmRldiwKIAkJCSJpbnZhbGlkIG9yIG1pc3NpbmcgdmFsdWUgZm9yIGF0
bWVsLHN0YXJ0dXAtdGltZS1tc1xuIik7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsCi0JCQkJICAgImF0bWVsLHRyaWdn
ZXItZWRnZS10eXBlIiwgJmVkZ2VfdHlwZSk7CisJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
dTMyKGRldiwgImF0bWVsLHRyaWdnZXItZWRnZS10eXBlIiwKKwkJCQkgICAgICAgJmVkZ2VfdHlw
ZSk7CiAJaWYgKHJldCkgewogCQlkZXZfZGJnKCZwZGV2LT5kZXYsCiAJCQkiYXRtZWwsdHJpZ2dl
ci1lZGdlLXR5cGUgbm90IHNwZWNpZmllZCwgb25seSBzb2Z0d2FyZSB0cmlnZ2VyIGF2YWlsYWJs
ZVxuIik7Ci0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
