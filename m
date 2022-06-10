Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLH2C1fFVMFcNiWBLbon7qpgsugB89rxQyq+8EpScjs=; b=mR5AK3RuwDa5MM
	4cYl6wz749HgEMkRNvCdXCVqEvN77vnD0VyLRWt++GcCCBlCQTPbEfOoEiz+nBF9G8ZuuF8n/iffF
	ktPzeaUaaRffOdgv7csMH0JqS/Pux1Pz0zQ0ymRs97rZQElUI4wQzCg1vqQivL76mt9l4pcPxeski
	qX1nMT//NjvX/eop2kMJkpguNhXqqOj299DRIK66roE94YAb9A5tcFef8Jh6VN+pagcHskMhm8yqV
	tbi/lIoqYd22HSUjdMSuWWmKrbsKC23uyvcKd79WiXkQ2FFg7NABumNWAP/Jokju+58dXIzjv4kj7
	mecaVHLM32vc/WDsF7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaKx-006vWU-7N; Fri, 10 Jun 2022 08:49:47 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaKv-006vUg-16; Fri, 10 Jun 2022 08:49:46 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dXrY010565;
	Fri, 10 Jun 2022 04:49:20 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh28t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:49:19 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8nIrB027580
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:49:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:49:17 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imit014275;
	Fri, 10 Jun 2022 04:49:03 -0400
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
Subject: [PATCH 33/34] iio: inkern: remove OF dependencies
Date: Fri, 10 Jun 2022 10:45:44 +0200
Message-ID: <20220610084545.547700-34-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: GePAQQx29L8bJJPCyooQxLNIvK2ZZ6i9
X-Proofpoint-GUID: GePAQQx29L8bJJPCyooQxLNIvK2ZZ6i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=780 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014945_127649_658FF482 
X-CRM114-Status: GOOD (  15.33  )
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

U2luY2UgYWxsIHVzZXJzIG9mIHRoZSBPRiBkZXBlbmRlbmRlbnQgQVBJIGFyZSBub3cgY29udmVy
dGVkIHRvIHVzZSB0aGUKZmlybXdhcmUgYWdub3N0aWMgYWx0ZXJuYXRpdmUsIHdlIGNhbiBkcm9w
IE9GIGRlcGVuZGVuY2llcyBmcm9tIHRoZSBJSU8KaW4ga2VybmVsIGludGVyZmFjZS4KClNpZ25l
ZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Ci0tLQogZHJpdmVycy9paW8v
aW5rZXJuLmMgICAgICAgICB8IDI1ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUv
bGludXgvaWlvL2NvbnN1bWVyLmggfCAxMCAtLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2lpby9p
aW8uaCAgICAgIHwgIDMgLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMv
aWlvL2lua2Vybi5jCmluZGV4IDFkNTE5YjBjYWNlYS4uN2ViNTM2NTYwZGVkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2lpby9pbmtlcm4uYworKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwpAQCAtOCw3
ICs4LDYgQEAKICNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgogI2luY2x1ZGUgPGxpbnV4L3Ns
YWIuaD4KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgotI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAK
ICNpbmNsdWRlIDxsaW51eC9paW8vaWlvLmg+CiAjaW5jbHVkZSA8bGludXgvaWlvL2lpby1vcGFx
dWUuaD4KQEAgLTE0OCwyNiArMTQ3LDYgQEAgc3RhdGljIGludCBfX2Z3bm9kZV9paW9fc2ltcGxl
X3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJcmV0dXJuIGlpb3NwZWMtPmFyZ3Nb
MF07CiB9CiAKLS8qCi0gKiBTaW1wbGUgaGVscGVyIHRvIGNvcHkgZndub2RlX3JlZmVyZW5jZV9h
cmdzIGludG8gb2ZfcGhhbmRsZV9hcmdzIHNvIHdlCi0gKiBjYW4gcGFzcyBpdCB0byBvZl94bGF0
ZSgpLiBVbHRpbWF0ZSBnb2FsIGlzIHRvIGRyb3AgdGhpcyB0b2dldGhlciB3aXRoCi0gKiBvZl94
bGF0ZSgpLgotICovCi1zdGF0aWMgaW50IF9fZndub2RlX3RvX29mX3hsYXRlKHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXYsCi0JCQkJY29uc3Qgc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAq
aWlvc3BlYykKLXsKLQlzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIG9mX2FyZ3M7Ci0JdW5zaWduZWQg
aW50IGk7Ci0KLQlvZl9hcmdzLmFyZ3NfY291bnQgPSBpaW9zcGVjLT5uYXJnczsKLQlvZl9hcmdz
Lm5wID0gdG9fb2Zfbm9kZShpaW9zcGVjLT5md25vZGUpOwotCi0JZm9yIChpID0gMDsgaSA8IE1B
WF9QSEFORExFX0FSR1M7IGkrKykKLQkJb2ZfYXJncy5hcmdzW2ldID0gaSA8IGlpb3NwZWMtPm5h
cmdzID8gaWlvc3BlYy0+YXJnc1tpXSA6IDA7Ci0KLQlyZXR1cm4gaW5kaW9fZGV2LT5pbmZvLT5v
Zl94bGF0ZShpbmRpb19kZXYsICZvZl9hcmdzKTsKLX0KLQogc3RhdGljIGludCBfX2Z3bm9kZV9p
aW9fY2hhbm5lbF9nZXQoc3RydWN0IGlpb19jaGFubmVsICpjaGFubmVsLAogCQkJCSAgICBzdHJ1
Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCBpbnQgaW5kZXgpCiB7CkBAIC0xOTEsOSArMTcwLDcg
QEAgc3RhdGljIGludCBfX2Z3bm9kZV9paW9fY2hhbm5lbF9nZXQoc3RydWN0IGlpb19jaGFubmVs
ICpjaGFubmVsLAogCiAJaW5kaW9fZGV2ID0gZGV2X3RvX2lpb19kZXYoaWRldik7CiAJY2hhbm5l
bC0+aW5kaW9fZGV2ID0gaW5kaW9fZGV2OwotCWlmIChpbmRpb19kZXYtPmluZm8tPm9mX3hsYXRl
KQotCQlpbmRleCA9IF9fZndub2RlX3RvX29mX3hsYXRlKGluZGlvX2RldiwgJmlpb3NwZWMpOwot
CWVsc2UgaWYgKGluZGlvX2Rldi0+aW5mby0+Zndub2RlX3hsYXRlKQorCWlmIChpbmRpb19kZXYt
PmluZm8tPmZ3bm9kZV94bGF0ZSkKIAkJaW5kZXggPSBpbmRpb19kZXYtPmluZm8tPmZ3bm9kZV94
bGF0ZShpbmRpb19kZXYsICZpaW9zcGVjKTsKIAllbHNlCiAJCWluZGV4ID0gX19md25vZGVfaWlv
X3NpbXBsZV94bGF0ZShpbmRpb19kZXYsICZpaW9zcGVjKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvaWlvL2NvbnN1bWVyLmggYi9pbmNsdWRlL2xpbnV4L2lpby9jb25zdW1lci5oCmluZGV4
IGE5NmE3MTRiNWZkYy4uNjgwMjU5NmIwMTdjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2lp
by9jb25zdW1lci5oCisrKyBiL2luY2x1ZGUvbGludXgvaWlvL2NvbnN1bWVyLmgKQEAgLTksMTIg
KzksMTAgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvaWlv
L3R5cGVzLmg+Ci0jaW5jbHVkZSA8bGludXgvb2YuaD4KIAogc3RydWN0IGlpb19kZXY7CiBzdHJ1
Y3QgaWlvX2NoYW5fc3BlYzsKIHN0cnVjdCBkZXZpY2U7Ci1zdHJ1Y3QgZGV2aWNlX25vZGU7CiBz
dHJ1Y3QgZndub2RlX2hhbmRsZTsKIAogLyoqCkBAIC0xMjksMTQgKzEyNyw2IEBAIHN0cnVjdCBp
aW9fY2hhbm5lbCAqZGV2bV9md25vZGVfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRl
dmljZSAqZGV2LAogCQkJCQkJCXN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCiAJCQkJCQkJ
Y29uc3QgY2hhciAqY29uc3VtZXJfY2hhbm5lbCk7CiAKLXN0YXRpYyBpbmxpbmUgc3RydWN0IGlp
b19jaGFubmVsCi0qZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCi0JCQkJIGNvbnN0IGNoYXIgKmNvbnN1bWVy
X2NoYW5uZWwpCi17Ci0JcmV0dXJuIGRldm1fZndub2RlX2lpb19jaGFubmVsX2dldF9ieV9uYW1l
KGRldiwgb2ZfZndub2RlX2hhbmRsZShucCksCi0JCQkJCQkgICBjb25zdW1lcl9jaGFubmVsKTsK
LX0KLQogc3RydWN0IGlpb19jYl9idWZmZXI7CiAvKioKICAqIGlpb19jaGFubmVsX2dldF9hbGxf
Y2IoKSAtIHJlZ2lzdGVyIGNhbGxiYWNrIGZvciB0cmlnZ2VyZWQgY2FwdHVyZQpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9paW8vaWlvLmggYi9pbmNsdWRlL2xpbnV4L2lpby9paW8uaAppbmRl
eCA0OTRhYmI2MzQwNmUuLjcwOTNiZTE1MzFjMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9p
aW8vaWlvLmgKKysrIGIvaW5jbHVkZS9saW51eC9paW8vaWlvLmgKQEAgLTE3LDcgKzE3LDYgQEAK
ICAqIEN1cnJlbnRseSBhc3N1bWVzIG5hbm8gc2Vjb25kcy4KICAqLwogCi1zdHJ1Y3Qgb2ZfcGhh
bmRsZV9hcmdzOwogc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJnczsKIAogZW51bSBpaW9fc2hh
cmVkX2J5IHsKQEAgLTUxMSw4ICs1MTAsNiBAQCBzdHJ1Y3QgaWlvX2luZm8gewogCWludCAoKmRl
YnVnZnNfcmVnX2FjY2Vzcykoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKIAkJCQkgIHVuc2ln
bmVkIHJlZywgdW5zaWduZWQgd3JpdGV2YWwsCiAJCQkJICB1bnNpZ25lZCAqcmVhZHZhbCk7Ci0J
aW50ICgqb2ZfeGxhdGUpKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCi0JCQljb25zdCBzdHJ1
Y3Qgb2ZfcGhhbmRsZV9hcmdzICppaW9zcGVjKTsKIAlpbnQgKCpmd25vZGVfeGxhdGUpKHN0cnVj
dCBpaW9fZGV2ICppbmRpb19kZXYsCiAJCQkgICAgY29uc3Qgc3RydWN0IGZ3bm9kZV9yZWZlcmVu
Y2VfYXJncyAqaWlvc3BlYyk7CiAJaW50ICgqaHdmaWZvX3NldF93YXRlcm1hcmspKHN0cnVjdCBp
aW9fZGV2ICppbmRpb19kZXYsIHVuc2lnbmVkIHZhbCk7Ci0tIAoyLjM2LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
