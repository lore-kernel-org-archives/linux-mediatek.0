Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC3BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onTjSqkqPjYiiWflJvOt82rmNFExsmR4GVs75a+3gK4=; b=pdiCZ7iULIrW0A
	uhdyzgNQdpXtdv4bzcIsh54dNWIx6gN/zZvxFEjoIGQuw3i+TuCJwohClD6/rRDrXmNbmEwnhYJwt
	jW5326deRb1iGyxu2XMlIBBO0l9pUIvqkZLINH1+YtIl4iUONVH8HMTOqXyXR6A7r9VX82rz6RMja
	vWdGKksZC+fRo9AyDiXJhxKZKtByDbFXE0Xaft6sHRNDRbfrdd48mKQJBjRPV0n/R57YCgKEZ6gFZ
	Xohk/ikBwIa/Rci+pIge5/IbnJxnWZR9nAM6RvbAtqywcI40flOZXTC86u6NxrcRnk0kukeDMRxD+
	cOF0rRb4huy/oPoD9+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaKD-006ux2-9X; Fri, 10 Jun 2022 08:49:01 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaK9-006utg-EW; Fri, 10 Jun 2022 08:48:59 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A8Ze4W010624;
	Fri, 10 Jun 2022 04:48:37 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh26m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:37 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8ma7n027568
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:36 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:48:35 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:35 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imin014275;
	Fri, 10 Jun 2022 04:48:25 -0400
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
Subject: [PATCH 27/34] iio: adc: ab8500-gpadc: convert to device properties
Date: Fri, 10 Jun 2022 10:45:38 +0200
Message-ID: <20220610084545.547700-28-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: pHxz0w2nnloZydOjdMyGYt3pvgqFy8Hp
X-Proofpoint-GUID: pHxz0w2nnloZydOjdMyGYt3pvgqFy8Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014857_521037_69713271 
X-CRM114-Status: GOOD (  18.36  )
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
PgotLS0KIGRyaXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYyB8IDI3ICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYyBiL2Ry
aXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYwppbmRleCA5MzBjZTk2ZTZmZjUuLjRmYTIxMjZh
MzU0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2FiODUwMC1ncGFkYy5jCisrKyBiL2Ry
aXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYwpAQCAtOTI1LDggKzkyNSw4IEBAIHN0YXRpYyBp
bnQgYWI4NTAwX2dwYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJcmV0
dXJuIC1FSU5WQUw7CiB9CiAKLXN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX29mX3hsYXRlKHN0cnVj
dCBpaW9fZGV2ICppbmRpb19kZXYsCi0JCQkJIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mg
Kmlpb3NwZWMpCitzdGF0aWMgaW50IGFiODUwMF9ncGFkY19md25vZGVfeGxhdGUoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldiwKKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNl
X2FyZ3MgKmlpb3NwZWMpCiB7CiAJaW50IGk7CiAKQEAgLTkzOCw3ICs5MzgsNyBAQCBzdGF0aWMg
aW50IGFiODUwMF9ncGFkY19vZl94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAogfQog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19pbmZvIGFiODUwMF9ncGFkY19pbmZvID0gewotCS5v
Zl94bGF0ZSA9IGFiODUwMF9ncGFkY19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRlID0gYWI4NTAw
X2dwYWRjX2Z3bm9kZV94bGF0ZSwKIAkucmVhZF9yYXcgPSBhYjg1MDBfZ3BhZGNfcmVhZF9yYXcs
CiB9OwogCkBAIC05NjgsNyArOTY4LDcgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcnVudGlt
ZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogLyoqCiAgKiBhYjg1MDBfZ3BhZGNfcGFyc2Vf
Y2hhbm5lbCgpIC0gcHJvY2VzcyBkZXZpY2V0cmVlIGNoYW5uZWwgY29uZmlndXJhdGlvbgogICog
QGRldjogcG9pbnRlciB0byBjb250YWluaW5nIGRldmljZQotICogQG5wOiBkZXZpY2UgdHJlZSBu
b2RlIGZvciB0aGUgY2hhbm5lbCB0byBjb25maWd1cmUKKyAqIEBmd25vZGU6IGZ3IG5vZGUgZm9y
IHRoZSBjaGFubmVsIHRvIGNvbmZpZ3VyZQogICogQGNoOiBjaGFubmVsIGluZm8gdG8gZmlsbCBp
bgogICogQGlpb19jaGFuOiBJSU8gY2hhbm5lbCBzcGVjaWZpY2F0aW9uIHRvIGZpbGwgaW4KICAq
CkBAIC05NzYsMTUgKzk3NiwxNSBAQCBzdGF0aWMgaW50IGFiODUwMF9ncGFkY19ydW50aW1lX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAgKiBhbmQgZGVmaW5lIHVzYWdlIGZvciB0aGluZ3Mg
bGlrZSBBVVggR1BBREMgaW5wdXRzIG1vcmUgcHJlY2lzZWx5LgogICovCiBzdGF0aWMgaW50IGFi
ODUwMF9ncGFkY19wYXJzZV9jaGFubmVsKHN0cnVjdCBkZXZpY2UgKmRldiwKLQkJCQkgICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAorCQkJCSAgICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpm
d25vZGUsCiAJCQkJICAgICAgc3RydWN0IGFiODUwMF9ncGFkY19jaGFuX2luZm8gKmNoLAogCQkJ
CSAgICAgIHN0cnVjdCBpaW9fY2hhbl9zcGVjICppaW9fY2hhbikKIHsKLQljb25zdCBjaGFyICpu
YW1lID0gbnAtPm5hbWU7CisJY29uc3QgY2hhciAqbmFtZSA9IGZ3bm9kZV9nZXRfbmFtZShmd25v
ZGUpOwogCXUzMiBjaGFuOwogCWludCByZXQ7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
MihucCwgInJlZyIsICZjaGFuKTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91MzIoZndu
b2RlLCAicmVnIiwgJmNoYW4pOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycihkZXYsICJpbnZhbGlk
IGNoYW5uZWwgbnVtYmVyICVzXG4iLCBuYW1lKTsKIAkJcmV0dXJuIHJldDsKQEAgLTEwMjEsMjIg
KzEwMjEsMjAgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiAvKioKICAqIGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVscygpIC0gUGFy
c2UgdGhlIEdQQURDIGNoYW5uZWxzIGZyb20gRFQKICAqIEBncGFkYzogdGhlIEdQQURDIHRvIGNv
bmZpZ3VyZSB0aGUgY2hhbm5lbHMgZm9yCi0gKiBAbnA6IGRldmljZSB0cmVlIG5vZGUgY29udGFp
bmluZyB0aGUgY2hhbm5lbCBjb25maWd1cmF0aW9ucwogICogQGNoYW5zOiB0aGUgSUlPIGNoYW5u
ZWxzIHdlIHBhcnNlZAogICogQG5jaGFuczogdGhlIG51bWJlciBvZiBJSU8gY2hhbm5lbHMgd2Ug
cGFyc2VkCiAgKi8KIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWxzKHN0cnVj
dCBhYjg1MDBfZ3BhZGMgKmdwYWRjLAotCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
LAogCQkJCSAgICAgICBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqKmNoYW5zX3BhcnNlZCwKIAkJCQkg
ICAgICAgdW5zaWduZWQgaW50ICpuY2hhbnNfcGFyc2VkKQogewotCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqY2hpbGQ7CisJc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmNoaWxkOwogCXN0cnVjdCBhYjg1MDBf
Z3BhZGNfY2hhbl9pbmZvICpjaDsKIAlzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqaWlvX2NoYW5zOwog
CXVuc2lnbmVkIGludCBuY2hhbnM7CiAJaW50IGk7CiAKLQluY2hhbnMgPSBvZl9nZXRfYXZhaWxh
YmxlX2NoaWxkX2NvdW50KG5wKTsKKwluY2hhbnMgPSBkZXZpY2VfZ2V0X2NoaWxkX25vZGVfY291
bnQoZ3BhZGMtPmRldik7CiAJaWYgKCFuY2hhbnMpIHsKIAkJZGV2X2VycihncGFkYy0+ZGV2LCAi
bm8gY2hhbm5lbCBjaGlsZHJlblxuIik7CiAJCXJldHVybiAtRU5PREVWOwpAQCAtMTA1NCw3ICsx
MDUyLDcgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IGFi
ODUwMF9ncGFkYyAqZ3BhZGMsCiAJCXJldHVybiAtRU5PTUVNOwogCiAJaSA9IDA7Ci0JZm9yX2Vh
Y2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7CisJZGV2aWNlX2Zvcl9lYWNo
X2NoaWxkX25vZGUoZ3BhZGMtPmRldiwgY2hpbGQpIHsKIAkJc3RydWN0IGlpb19jaGFuX3NwZWMg
Kmlpb19jaGFuOwogCQlpbnQgcmV0OwogCkBAIC0xMDY0LDcgKzEwNjIsNyBAQCBzdGF0aWMgaW50
IGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVscyhzdHJ1Y3QgYWI4NTAwX2dwYWRjICpncGFkYywK
IAkJcmV0ID0gYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWwoZ3BhZGMtPmRldiwgY2hpbGQsIGNo
LAogCQkJCQkJIGlpb19jaGFuKTsKIAkJaWYgKHJldCkgewotCQkJb2Zfbm9kZV9wdXQoY2hpbGQp
OworCQkJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwogCQkJcmV0dXJuIHJldDsKIAkJfQogCQlp
Kys7CkBAIC0xMDgxLDcgKzEwNzksNiBAQCBzdGF0aWMgaW50IGFiODUwMF9ncGFkY19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBhYjg1MDBfZ3BhZGMgKmdwYWRj
OwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAJ
c3RydWN0IGlpb19jaGFuX3NwZWMgKmlpb19jaGFuczsKIAl1bnNpZ25lZCBpbnQgbl9paW9fY2hh
bnM7CiAJaW50IHJldDsKQEAgLTEwOTYsNyArMTA5Myw3IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dw
YWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZ3BhZGMtPmRldiA9IGRl
djsKIAlncGFkYy0+YWI4NTAwID0gZGV2X2dldF9kcnZkYXRhKGRldi0+cGFyZW50KTsKIAotCXJl
dCA9IGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVscyhncGFkYywgbnAsICZpaW9fY2hhbnMsICZu
X2lpb19jaGFucyk7CisJcmV0ID0gYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWxzKGdwYWRjLCAm
aWlvX2NoYW5zLCAmbl9paW9fY2hhbnMpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLS0g
CjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
