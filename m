Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F4BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jT0FXAA6Jz4XIk1aN1aiR2Zt/exgkZ1AAZKqVPoQMXI=; b=V60ZA4wMSoj5Nd
	hblQ3suBx+K6VHZPZCD7lceoP4bD0vAtGJVSBOY7nDu50s3ozUQPUSSjuGKat1ttUxJ1yVHhlxZ/H
	zODOcMwtDUpwni3ewtz7MRRlHbY5LJIfKgNagRU7OkRoSEKCezgxtTkXmoVGobOOXIiqmrqYRC/k6
	WyFakZ5ta6FD9SGnZh74R9KJZR26eshGPT2UefiUDVGg78EqtUuhdDEZUfwuUmSenIfS6uWY3kzHu
	yhvN0BWTcnPFFMmlztFLQeXNwbifowoYGMmZTfGJN0D8lh3p67dN2tahczPp5c3HITs9uLY387A/E
	Hd0N5CYTSLp8V4THldmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaJg-006ubi-Uu; Fri, 10 Jun 2022 08:48:28 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaJd-006uZj-Vv; Fri, 10 Jun 2022 08:48:27 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7noCd005281;
	Fri, 10 Jun 2022 04:48:05 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kq9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:05 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8m4b4027550
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:04 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:03 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:00 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imii014275;
	Fri, 10 Jun 2022 04:47:49 -0400
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
Subject: [PATCH 22/34] iio: inkern: only return error codes in iio_channel_get_*() APIs
Date: Fri, 10 Jun 2022 10:45:33 +0200
Message-ID: <20220610084545.547700-23-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Y_iBkwY0TFr0zytvI3INOXjiF43q9YVc
X-Proofpoint-GUID: Y_iBkwY0TFr0zytvI3INOXjiF43q9YVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=842 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014826_051290_B2A6F3FB 
X-CRM114-Status: GOOD (  19.29  )
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

QVBJcyBsaWtlIG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkgYW5kIG9mX2lpb19jaGFubmVs
X2dldF9hbGwoKSB3ZXJlCnJldHVybmluZyBhIG1peCBvZiBOVUxMIGFuZCBlcnJvciBwb2ludGVy
cyBiZWluZyBOVUxMIHRoZSB3YXkgdG8KIm5vdGlmeSIgdGhhdCB3ZSBzaG91bGQgZG8gYSAic3lz
dGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBUaGlzIG1ha2UKaXQgdmVyeSBjb25mdXNpbmcgYW5k
IHByb25lIHRvIGVycm9ycyBhcyBjb21taXQgZGJiY2NmN2MyMGJmCigiaWlvOiBpbmtlcm46IGZp
eCByZXR1cm4gdmFsdWUgaW4gZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIikKcHJv
dmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMgbGlrZSAnaWYgKGNoYW5uZWwgIT0gTlVMTCkg
cmV0dXJuIGNoYW5uZWwnCndlcmUgYmVpbmcgdXNlZCB3aGVyZSBjaGFubmVsIGNvdWxkIGFjdHVh
bGx5IGJlIGFuIGVycm9yIGNvZGUgd2hpY2gKbWFrZXMgdGhlIGNvZGUgaGFyZCB0byByZWFkLgoK
U2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJz
L2lpby9pbmtlcm4uYyB8IDI0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKaW5kZXggODdmZDJhMGQ0NGYy
Li4zMWQ5YzEyMjE5OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2lua2Vybi5jCisrKyBiL2Ry
aXZlcnMvaWlvL2lua2Vybi5jCkBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9f
Y2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBp
bmRleCkKIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3Ry
dWN0IGRldmljZV9ub2RlICpucCwKIAkJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCiB7Ci0J
c3RydWN0IGlpb19jaGFubmVsICpjaGFuID0gTlVMTDsKKwlzdHJ1Y3QgaWlvX2NoYW5uZWwgKmNo
YW47CiAKIAkvKiBXYWxrIHVwIHRoZSB0cmVlIG9mIGRldmljZXMgbG9va2luZyBmb3IgYSBtYXRj
aGluZyBpaW8gY2hhbm5lbCAqLwogCXdoaWxlIChucCkgewpAQCAtMjMxLDExICsyMzEsMTEgQEAg
c3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wLAogCQkJCQkJCSBuYW1lKTsKIAkJY2hhbiA9IG9mX2lpb19jaGFubmVsX2dl
dChucCwgaW5kZXgpOwogCQlpZiAoIUlTX0VSUihjaGFuKSB8fCBQVFJfRVJSKGNoYW4pID09IC1F
UFJPQkVfREVGRVIpCi0JCQlicmVhazsKLQkJZWxzZSBpZiAobmFtZSAmJiBpbmRleCA+PSAwKSB7
CisJCQlyZXR1cm4gY2hhbjsKKwkJaWYgKG5hbWUgJiYgaW5kZXggPj0gMCkgewogCQkJcHJfZXJy
KCJFUlJPUjogY291bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKIAkJCQlu
cCwgbmFtZSA/IG5hbWUgOiAiIiwgaW5kZXgpOwotCQkJcmV0dXJuIE5VTEw7CisJCQlyZXR1cm4g
Y2hhbjsKIAkJfQogCiAJCS8qCkBAIC0yNDUsMTAgKzI0NSwxMCBAQCBzdHJ1Y3QgaWlvX2NoYW5u
ZWwgKm9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCiAJ
CSAqLwogCQlucCA9IG5wLT5wYXJlbnQ7CiAJCWlmIChucCAmJiAhb2ZfZ2V0X3Byb3BlcnR5KG5w
LCAiaW8tY2hhbm5lbC1yYW5nZXMiLCBOVUxMKSkKLQkJCXJldHVybiBOVUxMOworCQkJcmV0dXJu
IGNoYW47CiAJfQogCi0JcmV0dXJuIGNoYW47CisJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiB9
CiBFWFBPUlRfU1lNQk9MX0dQTChvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSk7CiAKQEAgLTI2
Nyw4ICsyNjcsOCBAQCBzdGF0aWMgc3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hhbm5lbF9n
ZXRfYWxsKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWJyZWFrOwogCX0gd2hpbGUgKCsrbnVtbWFw
cyk7CiAKLQlpZiAobnVtbWFwcyA9PSAwKQkvKiBubyBlcnJvciwgcmV0dXJuIE5VTEwgdG8gc2Vh
cmNoIG1hcCB0YWJsZSAqLwotCQlyZXR1cm4gTlVMTDsKKwlpZiAobnVtbWFwcyA9PSAwKQkvKiBy
ZXR1cm4gLUVOT0RFViB0byBzZWFyY2ggbWFwIHRhYmxlICovCisJCXJldHVybiBFUlJfUFRSKC1F
Tk9ERVYpOwogCiAJLyogTlVMTCB0ZXJtaW5hdGVkIGFycmF5IHRvIHNhdmUgcGFzc2luZyBzaXpl
ICovCiAJY2hhbnMgPSBrY2FsbG9jKG51bW1hcHMgKyAxLCBzaXplb2YoKmNoYW5zKSwgR0ZQX0tF
Uk5FTCk7CkBAIC0yOTUsNyArMjk1LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2Zf
aWlvX2NoYW5uZWxfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIHN0YXRpYyBpbmxpbmUg
c3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hhbm5lbF9nZXRfYWxsKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKLQlyZXR1cm4gTlVMTDsKKwlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIH0KIAog
I2VuZGlmIC8qIENPTkZJR19PRiAqLwpAQCAtMzYyLDcgKzM2Miw3IEBAIHN0cnVjdCBpaW9fY2hh
bm5lbCAqaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwKIAlpZiAoZGV2KSB7CiAJ
CWNoYW5uZWwgPSBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShkZXYtPm9mX25vZGUsCiAJCQkJ
CQkgICAgIGNoYW5uZWxfbmFtZSk7Ci0JCWlmIChjaGFubmVsICE9IE5VTEwpCisJCWlmICghSVNf
RVJSKGNoYW5uZWwpIHx8IFBUUl9FUlIoY2hhbm5lbCkgPT0gLUVQUk9CRV9ERUZFUikKIAkJCXJl
dHVybiBjaGFubmVsOwogCX0KIApAQCAtNDEyLDggKzQxMiw2IEBAIHN0cnVjdCBpaW9fY2hhbm5l
bCAqZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJ
Y2hhbm5lbCA9IG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKG5wLCBjaGFubmVsX25hbWUpOwog
CWlmIChJU19FUlIoY2hhbm5lbCkpCiAJCXJldHVybiBjaGFubmVsOwotCWlmICghY2hhbm5lbCkK
LQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiAKIAlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoZGV2LCBkZXZtX2lpb19jaGFubmVsX2ZyZWUsIGNoYW5uZWwpOwogCWlmIChyZXQpCkBA
IC00MzYsNyArNDM0LDcgQEAgc3RydWN0IGlpb19jaGFubmVsICppaW9fY2hhbm5lbF9nZXRfYWxs
KHN0cnVjdCBkZXZpY2UgKmRldikKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAKIAljaGFu
cyA9IG9mX2lpb19jaGFubmVsX2dldF9hbGwoZGV2KTsKLQlpZiAoY2hhbnMpCisJaWYgKCFJU19F
UlIoY2hhbnMpIHx8IFBUUl9FUlIoY2hhbnMpID09IC1FUFJPQkVfREVGRVIpCiAJCXJldHVybiBj
aGFuczsKIAogCW5hbWUgPSBkZXZfbmFtZShkZXYpOwotLSAKMi4zNi4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
