Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2902BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFRtpwdOea4jyDOUCqcWy06IPJoMV+s2xdS5iGBUhgI=; b=hgE5Z3EGHlkTNu
	PIC1UBKyoJC6Ydx0bzkaCoDas7793j+EKOgRD3VoxG23lpnCKCKm5p4eC8ZSj4YkiRikMm61A5b0R
	dzVib4MfL6rCdRerIp44PvS/aT/R0GDT518cm8u6/0GnYXEvQG3G3XVrNoQ4tbqRO0sKQlIFNyoDj
	W13+6fTqPN3qH64Rxa3uLlNtIKpGl544ToXWJfI7ePc1gD9POw9wwdgn0NLWNygkEXZXPq7SBENBm
	9KKigUSleyU6d/uDZURK1hFNvOAgF+HSk/NBod9KY9nzIG0TdGFD2u38/AYqnjwIguFn7RYdS65Xe
	heMvg9BQhOG6BRbVd9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaL4-006vbo-4j; Fri, 10 Jun 2022 08:49:54 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaL1-006vZP-72; Fri, 10 Jun 2022 08:49:53 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A8fboE010559;
	Fri, 10 Jun 2022 04:49:25 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh299-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:49:25 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8nOwt023362
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:49:24 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:23 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:23 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:49:23 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imiu014275;
	Fri, 10 Jun 2022 04:49:12 -0400
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
Subject: [PATCH 34/34] iio: inkern: fix coding style warnings
Date: Fri, 10 Jun 2022 10:45:45 +0200
Message-ID: <20220610084545.547700-35-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: z0tgKmiEePpg_dowAY_aI8d3iIGfILTP
X-Proofpoint-GUID: z0tgKmiEePpg_dowAY_aI8d3iIGfILTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=768 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014951_296057_4ABC1479 
X-CRM114-Status: GOOD (  18.84  )
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

SnVzdCBjb3NtZXRpY3MuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLi4uCgpTaWduZWQt
b2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvaWlvL2lu
a2Vybi5jIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCmluZGV4
IDdlYjUzNjU2MGRlZC4uNTI2NTE5Y2VmY2I5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9pbmtl
cm4uYworKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwpAQCAtNDUsMTMgKzQ1LDEzIEBAIGludCBp
aW9fbWFwX2FycmF5X3JlZ2lzdGVyKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsIHN0cnVjdCBp
aW9fbWFwICptYXBzKQogCWludCBpID0gMCwgcmV0ID0gMDsKIAlzdHJ1Y3QgaWlvX21hcF9pbnRl
cm5hbCAqbWFwaTsKIAotCWlmIChtYXBzID09IE5VTEwpCisJaWYgKCFtYXBzKQogCQlyZXR1cm4g
MDsKIAogCW11dGV4X2xvY2soJmlpb19tYXBfbGlzdF9sb2NrKTsKLQl3aGlsZSAobWFwc1tpXS5j
b25zdW1lcl9kZXZfbmFtZSAhPSBOVUxMKSB7CisJd2hpbGUgKCFtYXBzW2ldLmNvbnN1bWVyX2Rl
dl9uYW1lKSB7CiAJCW1hcGkgPSBremFsbG9jKHNpemVvZigqbWFwaSksIEdGUF9LRVJORUwpOwot
CQlpZiAobWFwaSA9PSBOVUxMKSB7CisJCWlmICghbWFwaSkgewogCQkJcmV0ID0gLUVOT01FTTsK
IAkJCWdvdG8gZXJyb3JfcmV0OwogCQl9CkBAIC02OSw3ICs2OSw2IEBAIGludCBpaW9fbWFwX2Fy
cmF5X3JlZ2lzdGVyKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsIHN0cnVjdCBpaW9fbWFwICpt
YXBzKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoaWlvX21hcF9hcnJheV9yZWdpc3Rlcik7CiAKLQog
LyoKICAqIFJlbW92ZSBhbGwgbWFwIGVudHJpZXMgYXNzb2NpYXRlZCB3aXRoIHRoZSBnaXZlbiBp
aW8gZGV2aWNlCiAgKi8KQEAgLTE2Myw3ICsxNjIsNyBAQCBzdGF0aWMgaW50IF9fZndub2RlX2lp
b19jaGFubmVsX2dldChzdHJ1Y3QgaWlvX2NoYW5uZWwgKmNoYW5uZWwsCiAKIAlpZGV2ID0gYnVz
X2ZpbmRfZGV2aWNlKCZpaW9fYnVzX3R5cGUsIE5VTEwsIGlpb3NwZWMuZndub2RlLAogCQkJICAg
ICAgIGlpb19kZXZfbm9kZV9tYXRjaCk7Ci0JaWYgKGlkZXYgPT0gTlVMTCkgeworCWlmICghaWRl
dikgewogCQlmd25vZGVfaGFuZGxlX3B1dChpaW9zcGVjLmZ3bm9kZSk7CiAJCXJldHVybiAtRVBS
T0JFX0RFRkVSOwogCX0KQEAgLTE5Niw3ICsxOTUsNyBAQCBzdGF0aWMgc3RydWN0IGlpb19jaGFu
bmVsICpmd25vZGVfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUs
CiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCiAJY2hhbm5lbCA9IGt6YWxsb2Moc2l6ZW9m
KCpjaGFubmVsKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKGNoYW5uZWwgPT0gTlVMTCkKKwlpZiAoIWNo
YW5uZWwpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCiAJZXJyID0gX19md25vZGVfaWlv
X2NoYW5uZWxfZ2V0KGNoYW5uZWwsIGZ3bm9kZSwgaW5kZXgpOwpAQCAtMjkzLDcgKzI5Miw3IEBA
IHN0YXRpYyBzdHJ1Y3QgaWlvX2NoYW5uZWwgKmZ3bm9kZV9paW9fY2hhbm5lbF9nZXRfYWxsKHN0
cnVjdCBkZXZpY2UgKmRldikKIAogCS8qIE5VTEwgdGVybWluYXRlZCBhcnJheSB0byBzYXZlIHBh
c3Npbmcgc2l6ZSAqLwogCWNoYW5zID0ga2NhbGxvYyhudW1tYXBzICsgMSwgc2l6ZW9mKCpjaGFu
cyksIEdGUF9LRVJORUwpOwotCWlmIChjaGFucyA9PSBOVUxMKQorCWlmICghY2hhbnMpCiAJCXJl
dHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCiAJLyogU2VhcmNoIGZvciBGVyBtYXRjaGVzICovCkBA
IC0zMTgsNyArMzE3LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqaWlvX2NoYW5uZWxf
Z2V0X3N5cyhjb25zdCBjaGFyICpuYW1lLAogCXN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbm5lbDsK
IAlpbnQgZXJyOwogCi0JaWYgKG5hbWUgPT0gTlVMTCAmJiBjaGFubmVsX25hbWUgPT0gTlVMTCkK
KwlpZiAoIW5hbWUgJiYgIWNoYW5uZWxfbmFtZSkKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7
CiAKIAkvKiBmaXJzdCBmaW5kIG1hdGNoaW5nIGVudHJ5IHRoZSBjaGFubmVsIG1hcCAqLwpAQCAt
MzMzLDExICszMzIsMTEgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqaWlvX2NoYW5uZWxf
Z2V0X3N5cyhjb25zdCBjaGFyICpuYW1lLAogCQlicmVhazsKIAl9CiAJbXV0ZXhfdW5sb2NrKCZp
aW9fbWFwX2xpc3RfbG9jayk7Ci0JaWYgKGMgPT0gTlVMTCkKKwlpZiAoIWMpCiAJCXJldHVybiBF
UlJfUFRSKC1FTk9ERVYpOwogCiAJY2hhbm5lbCA9IGt6YWxsb2Moc2l6ZW9mKCpjaGFubmVsKSwg
R0ZQX0tFUk5FTCk7Ci0JaWYgKGNoYW5uZWwgPT0gTlVMTCkgeworCWlmICghY2hhbm5lbCkgewog
CQllcnIgPSAtRU5PTUVNOwogCQlnb3RvIGVycm9yX25vX21lbTsKIAl9CkBAIC0zNDksNyArMzQ4
LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqaWlvX2NoYW5uZWxfZ2V0X3N5cyhjb25z
dCBjaGFyICpuYW1lLAogCQkJaWlvX2NoYW5fc3BlY19mcm9tX25hbWUoY2hhbm5lbC0+aW5kaW9f
ZGV2LAogCQkJCQkJYy0+bWFwLT5hZGNfY2hhbm5lbF9sYWJlbCk7CiAKLQkJaWYgKGNoYW5uZWwt
PmNoYW5uZWwgPT0gTlVMTCkgeworCQlpZiAoIWNoYW5uZWwtPmNoYW5uZWwpIHsKIAkJCWVyciA9
IC1FSU5WQUw7CiAJCQlnb3RvIGVycm9yX25vX2NoYW47CiAJCX0KQEAgLTQ0MSw3ICs0NDAsNyBA
QCBzdHJ1Y3QgaWlvX2NoYW5uZWwgKmlpb19jaGFubmVsX2dldF9hbGwoc3RydWN0IGRldmljZSAq
ZGV2KQogCWludCBtYXBpbmQgPSAwOwogCWludCBpLCByZXQ7CiAKLQlpZiAoZGV2ID09IE5VTEwp
CisJaWYgKCFkZXYpCiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCiAJY2hhbnMgPSBmd25v
ZGVfaWlvX2NoYW5uZWxfZ2V0X2FsbChkZXYpOwpAQCAtNDY1LDcgKzQ2NCw3IEBAIHN0cnVjdCBp
aW9fY2hhbm5lbCAqaWlvX2NoYW5uZWxfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAkv
KiBOVUxMIHRlcm1pbmF0ZWQgYXJyYXkgdG8gc2F2ZSBwYXNzaW5nIHNpemUgKi8KIAljaGFucyA9
IGtjYWxsb2MobnVtbWFwcyArIDEsIHNpemVvZigqY2hhbnMpLCBHRlBfS0VSTkVMKTsKLQlpZiAo
Y2hhbnMgPT0gTlVMTCkgeworCWlmICghY2hhbnMpIHsKIAkJcmV0ID0gLUVOT01FTTsKIAkJZ290
byBlcnJvcl9yZXQ7CiAJfQpAQCAtNDc5LDcgKzQ3OCw3IEBAIHN0cnVjdCBpaW9fY2hhbm5lbCAq
aWlvX2NoYW5uZWxfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCWNoYW5zW21hcGluZF0u
Y2hhbm5lbCA9CiAJCQlpaW9fY2hhbl9zcGVjX2Zyb21fbmFtZShjaGFuc1ttYXBpbmRdLmluZGlv
X2RldiwKIAkJCQkJCWMtPm1hcC0+YWRjX2NoYW5uZWxfbGFiZWwpOwotCQlpZiAoY2hhbnNbbWFw
aW5kXS5jaGFubmVsID09IE5VTEwpIHsKKwkJaWYgKCFjaGFuc1ttYXBpbmRdLmNoYW5uZWwpIHsK
IAkJCXJldCA9IC1FSU5WQUw7CiAJCQlnb3RvIGVycm9yX2ZyZWVfY2hhbnM7CiAJCX0KQEAgLTU0
MSwxNCArNTQwLDE0IEBAIHN0cnVjdCBpaW9fY2hhbm5lbCAqZGV2bV9paW9fY2hhbm5lbF9nZXRf
YWxsKHN0cnVjdCBkZXZpY2UgKmRldikKIEVYUE9SVF9TWU1CT0xfR1BMKGRldm1faWlvX2NoYW5u
ZWxfZ2V0X2FsbCk7CiAKIHN0YXRpYyBpbnQgaWlvX2NoYW5uZWxfcmVhZChzdHJ1Y3QgaWlvX2No
YW5uZWwgKmNoYW4sIGludCAqdmFsLCBpbnQgKnZhbDIsCi0JZW51bSBpaW9fY2hhbl9pbmZvX2Vu
dW0gaW5mbykKKwkJCSAgICBlbnVtIGlpb19jaGFuX2luZm9fZW51bSBpbmZvKQogewogCWludCB1
bnVzZWQ7CiAJaW50IHZhbHNbSU5ESU9fTUFYX1JBV19FTEVNRU5UU107CiAJaW50IHJldDsKIAlp
bnQgdmFsX2xlbiA9IDI7CiAKLQlpZiAodmFsMiA9PSBOVUxMKQorCWlmICghdmFsMikKIAkJdmFs
MiA9ICZ1bnVzZWQ7CiAKIAlpZiAoIWlpb19jaGFubmVsX2hhc19pbmZvKGNoYW4tPmNoYW5uZWws
IGluZm8pKQpAQCAtNTYwLDkgKzU1OSwxMCBAQCBzdGF0aWMgaW50IGlpb19jaGFubmVsX3JlYWQo
c3RydWN0IGlpb19jaGFubmVsICpjaGFuLCBpbnQgKnZhbCwgaW50ICp2YWwyLAogCQkJCQl2YWxz
LCAmdmFsX2xlbiwgaW5mbyk7CiAJCSp2YWwgPSB2YWxzWzBdOwogCQkqdmFsMiA9IHZhbHNbMV07
Ci0JfSBlbHNlCisJfSBlbHNlIHsKIAkJcmV0ID0gY2hhbi0+aW5kaW9fZGV2LT5pbmZvLT5yZWFk
X3JhdyhjaGFuLT5pbmRpb19kZXYsCiAJCQkJCWNoYW4tPmNoYW5uZWwsIHZhbCwgdmFsMiwgaW5m
byk7CisJfQogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTU3Myw3ICs1NzMsNyBAQCBpbnQgaWlvX3Jl
YWRfY2hhbm5lbF9yYXcoc3RydWN0IGlpb19jaGFubmVsICpjaGFuLCBpbnQgKnZhbCkKIAlpbnQg
cmV0OwogCiAJbXV0ZXhfbG9jaygmaWlvX2Rldl9vcGFxdWUtPmluZm9fZXhpc3RfbG9jayk7Ci0J
aWYgKGNoYW4tPmluZGlvX2Rldi0+aW5mbyA9PSBOVUxMKSB7CisJaWYgKCFjaGFuLT5pbmRpb19k
ZXYtPmluZm8pIHsKIAkJcmV0ID0gLUVOT0RFVjsKIAkJZ290byBlcnJfdW5sb2NrOwogCX0KQEAg
LTU5Miw3ICs1OTIsNyBAQCBpbnQgaWlvX3JlYWRfY2hhbm5lbF9hdmVyYWdlX3JhdyhzdHJ1Y3Qg
aWlvX2NoYW5uZWwgKmNoYW4sIGludCAqdmFsKQogCWludCByZXQ7CiAKIAltdXRleF9sb2NrKCZp
aW9fZGV2X29wYXF1ZS0+aW5mb19leGlzdF9sb2NrKTsKLQlpZiAoY2hhbi0+aW5kaW9fZGV2LT5p
bmZvID09IE5VTEwpIHsKKwlpZiAoIWNoYW4tPmluZGlvX2Rldi0+aW5mbykgewogCQlyZXQgPSAt
RU5PREVWOwogCQlnb3RvIGVycl91bmxvY2s7CiAJfQpAQCAtNjA2LDcgKzYwNiw4IEBAIGludCBp
aW9fcmVhZF9jaGFubmVsX2F2ZXJhZ2VfcmF3KHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbiwgaW50
ICp2YWwpCiBFWFBPUlRfU1lNQk9MX0dQTChpaW9fcmVhZF9jaGFubmVsX2F2ZXJhZ2VfcmF3KTsK
IAogc3RhdGljIGludCBpaW9fY29udmVydF9yYXdfdG9fcHJvY2Vzc2VkX3VubG9ja2VkKHN0cnVj
dCBpaW9fY2hhbm5lbCAqY2hhbiwKLQlpbnQgcmF3LCBpbnQgKnByb2Nlc3NlZCwgdW5zaWduZWQg
aW50IHNjYWxlKQorCQkJCQkJIGludCByYXcsIGludCAqcHJvY2Vzc2VkLAorCQkJCQkJIHVuc2ln
bmVkIGludCBzY2FsZSkKIHsKIAlpbnQgc2NhbGVfdHlwZSwgc2NhbGVfdmFsLCBzY2FsZV92YWwy
OwogCWludCBvZmZzZXRfdHlwZSwgb2Zmc2V0X3ZhbCwgb2Zmc2V0X3ZhbDI7CkBAIC02MzksNyAr
NjQwLDcgQEAgc3RhdGljIGludCBpaW9fY29udmVydF9yYXdfdG9fcHJvY2Vzc2VkX3VubG9ja2Vk
KHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbiwKIAl9CiAKIAlzY2FsZV90eXBlID0gaWlvX2NoYW5u
ZWxfcmVhZChjaGFuLCAmc2NhbGVfdmFsLCAmc2NhbGVfdmFsMiwKLQkJCQkJSUlPX0NIQU5fSU5G
T19TQ0FMRSk7CisJCQkJICAgICAgSUlPX0NIQU5fSU5GT19TQ0FMRSk7CiAJaWYgKHNjYWxlX3R5
cGUgPCAwKSB7CiAJCS8qCiAJCSAqIElmIG5vIGNoYW5uZWwgc2NhbGluZyBpcyBhdmFpbGFibGUg
YXBwbHkgY29uc3VtZXIgc2NhbGUgdG8KQEAgLTY4NCwxOSArNjg1LDE5IEBAIHN0YXRpYyBpbnQg
aWlvX2NvbnZlcnRfcmF3X3RvX3Byb2Nlc3NlZF91bmxvY2tlZChzdHJ1Y3QgaWlvX2NoYW5uZWwg
KmNoYW4sCiB9CiAKIGludCBpaW9fY29udmVydF9yYXdfdG9fcHJvY2Vzc2VkKHN0cnVjdCBpaW9f
Y2hhbm5lbCAqY2hhbiwgaW50IHJhdywKLQlpbnQgKnByb2Nlc3NlZCwgdW5zaWduZWQgaW50IHNj
YWxlKQorCQkJCSBpbnQgKnByb2Nlc3NlZCwgdW5zaWduZWQgaW50IHNjYWxlKQogewogCXN0cnVj
dCBpaW9fZGV2X29wYXF1ZSAqaWlvX2Rldl9vcGFxdWUgPSB0b19paW9fZGV2X29wYXF1ZShjaGFu
LT5pbmRpb19kZXYpOwogCWludCByZXQ7CiAKIAltdXRleF9sb2NrKCZpaW9fZGV2X29wYXF1ZS0+
aW5mb19leGlzdF9sb2NrKTsKLQlpZiAoY2hhbi0+aW5kaW9fZGV2LT5pbmZvID09IE5VTEwpIHsK
KwlpZiAoIWNoYW4tPmluZGlvX2Rldi0+aW5mbykgewogCQlyZXQgPSAtRU5PREVWOwogCQlnb3Rv
IGVycl91bmxvY2s7CiAJfQogCiAJcmV0ID0gaWlvX2NvbnZlcnRfcmF3X3RvX3Byb2Nlc3NlZF91
bmxvY2tlZChjaGFuLCByYXcsIHByb2Nlc3NlZCwKLQkJCQkJCQlzY2FsZSk7CisJCQkJCQkgICAg
c2NhbGUpOwogZXJyX3VubG9jazoKIAltdXRleF91bmxvY2soJmlpb19kZXZfb3BhcXVlLT5pbmZv
X2V4aXN0X2xvY2spOwogCkBAIC03MTEsNyArNzEyLDcgQEAgaW50IGlpb19yZWFkX2NoYW5uZWxf
YXR0cmlidXRlKHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbiwgaW50ICp2YWwsIGludCAqdmFsMiwK
IAlpbnQgcmV0OwogCiAJbXV0ZXhfbG9jaygmaWlvX2Rldl9vcGFxdWUtPmluZm9fZXhpc3RfbG9j
ayk7Ci0JaWYgKGNoYW4tPmluZGlvX2Rldi0+aW5mbyA9PSBOVUxMKSB7CisJaWYgKCFjaGFuLT5p
bmRpb19kZXYtPmluZm8pIHsKIAkJcmV0ID0gLUVOT0RFVjsKIAkJZ290byBlcnJfdW5sb2NrOwog
CX0KQEAgLTczNyw3ICs3MzgsNyBAQCBpbnQgaWlvX3JlYWRfY2hhbm5lbF9wcm9jZXNzZWRfc2Nh
bGUoc3RydWN0IGlpb19jaGFubmVsICpjaGFuLCBpbnQgKnZhbCwKIAlpbnQgcmV0OwogCiAJbXV0
ZXhfbG9jaygmaWlvX2Rldl9vcGFxdWUtPmluZm9fZXhpc3RfbG9jayk7Ci0JaWYgKGNoYW4tPmlu
ZGlvX2Rldi0+aW5mbyA9PSBOVUxMKSB7CisJaWYgKCFjaGFuLT5pbmRpb19kZXYtPmluZm8pIHsK
IAkJcmV0ID0gLUVOT0RFVjsKIAkJZ290byBlcnJfdW5sb2NrOwogCX0KQEAgLTgxNSw3ICs4MTYs
NyBAQCBpbnQgaWlvX3JlYWRfYXZhaWxfY2hhbm5lbF9yYXcoc3RydWN0IGlpb19jaGFubmVsICpj
aGFuLAogCWludCB0eXBlOwogCiAJcmV0ID0gaWlvX3JlYWRfYXZhaWxfY2hhbm5lbF9hdHRyaWJ1
dGUoY2hhbiwgdmFscywgJnR5cGUsIGxlbmd0aCwKLQkJCQkJIElJT19DSEFOX0lORk9fUkFXKTsK
KwkJCQkJICAgICAgIElJT19DSEFOX0lORk9fUkFXKTsKIAogCWlmIChyZXQgPj0gMCAmJiB0eXBl
ICE9IElJT19WQUxfSU5UKQogCQkvKiByYXcgdmFsdWVzIGFyZSBhc3N1bWVkIHRvIGJlIElJT19W
QUxfSU5UICovCkBAIC04OTksNyArOTAwLDcgQEAgaW50IGlpb19nZXRfY2hhbm5lbF90eXBlKHN0
cnVjdCBpaW9fY2hhbm5lbCAqY2hhbiwgZW51bSBpaW9fY2hhbl90eXBlICp0eXBlKQogCS8qIE5l
ZWQgdG8gdmVyaWZ5IHVuZGVybHlpbmcgZHJpdmVyIGhhcyBub3QgZ29uZSBhd2F5ICovCiAKIAlt
dXRleF9sb2NrKCZpaW9fZGV2X29wYXF1ZS0+aW5mb19leGlzdF9sb2NrKTsKLQlpZiAoY2hhbi0+
aW5kaW9fZGV2LT5pbmZvID09IE5VTEwpIHsKKwlpZiAoIWNoYW4tPmluZGlvX2Rldi0+aW5mbykg
ewogCQlyZXQgPSAtRU5PREVWOwogCQlnb3RvIGVycl91bmxvY2s7CiAJfQpAQCAtOTI2LDcgKzky
Nyw3IEBAIGludCBpaW9fd3JpdGVfY2hhbm5lbF9hdHRyaWJ1dGUoc3RydWN0IGlpb19jaGFubmVs
ICpjaGFuLCBpbnQgdmFsLCBpbnQgdmFsMiwKIAlpbnQgcmV0OwogCiAJbXV0ZXhfbG9jaygmaWlv
X2Rldl9vcGFxdWUtPmluZm9fZXhpc3RfbG9jayk7Ci0JaWYgKGNoYW4tPmluZGlvX2Rldi0+aW5m
byA9PSBOVUxMKSB7CisJaWYgKCFjaGFuLT5pbmRpb19kZXYtPmluZm8pIHsKIAkJcmV0ID0gLUVO
T0RFVjsKIAkJZ290byBlcnJfdW5sb2NrOwogCX0KQEAgLTk2MCw5ICs5NjEsOCBAQCB1bnNpZ25l
ZCBpbnQgaWlvX2dldF9jaGFubmVsX2V4dF9pbmZvX2NvdW50KHN0cnVjdCBpaW9fY2hhbm5lbCAq
Y2hhbikKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGlpb19nZXRfY2hhbm5lbF9leHRfaW5mb19jb3Vu
dCk7CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaWlvX2NoYW5fc3BlY19leHRfaW5mbyAqaWlvX2xv
b2t1cF9leHRfaW5mbygKLQkJCQkJCWNvbnN0IHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbiwKLQkJ
CQkJCWNvbnN0IGNoYXIgKmF0dHIpCitzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19jaGFuX3NwZWNf
ZXh0X2luZm8gKgoraWlvX2xvb2t1cF9leHRfaW5mbyhjb25zdCBzdHJ1Y3QgaWlvX2NoYW5uZWwg
KmNoYW4sIGNvbnN0IGNoYXIgKmF0dHIpCiB7CiAJY29uc3Qgc3RydWN0IGlpb19jaGFuX3NwZWNf
ZXh0X2luZm8gKmV4dF9pbmZvOwogCi0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
