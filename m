Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD57CCA47B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c81+/L+kDQjPNS+Kiw2vrqSdhDjHXpMwCRwBqOSttdo=; b=WqDHnbmzj85SHs
	Ui7RMIUmEtLhI57ls2nGei2ej68xnOMZjfjgwkwl092rej5CQuF5grJRXcnokGqyRPVJcHnXjLIEU
	fRzZ1Bmzcq2UmNIM5rJ+d2P7fpBgWziScoh9OhoJgg+U5N7Rf7CK+BtdrrPbhrjzv3FpH1xGdCXPg
	uG1DgxB4bN25hYthuDbSTqRZ4B6V4/Dqgx52wbq0mI1OChy6kyrFtbOrvQhU/Z+YA1K31YnhhHrfH
	4qrf0FqQFK1T2vvVFm2NmPaFNZO6Ga93XSp4ry6CJd6WEPMuo4BE06xyAa1zuCu1gvI/nut2pTg6T
	Blh5tZM+YcaQ7LbKphOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaHw-006tGg-Ql; Fri, 10 Jun 2022 08:46:40 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaHo-006t98-7w; Fri, 10 Jun 2022 08:46:35 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dcRs010610;
	Fri, 10 Jun 2022 04:45:32 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh1h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:45:31 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8jTCo027432
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:45:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:45:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:45:28 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imiM014275;
	Fri, 10 Jun 2022 04:44:51 -0400
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
Subject: [PATCH 00/34] make iio inkern interface firmware agnostic
Date: Fri, 10 Jun 2022 10:45:11 +0200
Message-ID: <20220610084545.547700-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: ECPDV-TWick4LVOEVuc0kdMXUUX-GpEN
X-Proofpoint-GUID: ECPDV-TWick4LVOEVuc0kdMXUUX-GpEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014632_333589_F2C6D5C1 
X-CRM114-Status: GOOD (  13.20  )
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

VGhlIG1haW4gZ29hbCBvZiB0aGlzIHBhdGNoc2V0IGlzIHRvIGNvbnZlcnQgdGhlIGlpbyBpbmtl
cm4gaW50ZXJmYWNlIHRvDQpiZSBmaXJtd2FyZSBhZ25vc3RpYy4gU29tZSBwcmV2aW91cyBkaXNj
dXNzaW9uIHdhcyBkb25lIGluIGhlcmUgWzFdLg0KVGhvdWdoIHNvbWV0aGluZyBvZGQgaGFwcGVu
ZWQgd2hpbGUgc2VuZGluZyB0aGUgcGF0Y2hlcyBhbmQgdGhlIFJGQw0KYWN0dWFsbHkgbmV2ZXIg
bGFuZGVkIGluIHRoZSBJSU8gbGlzdCAoaG9wZWZ1bGx5IG5vdyB3b3Jrcyk6DQoNCkFzIHN1Z2dl
c3RlZCBieSBBbmR5LCB0aGUgc2VyaWVzIGNhbiBiZSBzZWVuIGluIHRocmVlIGJsb2NrczoNCg0K
MSkgIkZpeCIgYWxsIGRyaXZlcnMgdGhhdCB3ZXJlIHJlbHlpbmcgb24gaWlvLmggZm9yIHNwZWNp
ZmljIGhlYWRlcg0KZmlsZXMgKG1haW5seSBvZi5oIGFuZCBtb2RfZGV2aWNldGFibGUuaCkuIEFm
dGVyIHRoYXQgd2UgY2FuIGRyb3ANCm9mLmggZnJvbSBpaW8uaCBhbmQganVzdCBmb3J3YXJkIGRl
Y2xhcmUgd2hhdCB3ZSBuZWVkLg0KDQoyKSBNb3ZlICJtb3N0IiBvZiB0aGUgSUlPIGluIGtlcm5l
bCBpbnRlcmZhY2UgdG8gRlcgQVBJLiBBdCB0aGlzIHBvaW50LA0KdGhlcmUncyBzdGlsbCBzb21l
IE9GIGRlcGVuZGVudCBBUEkgaW4gcGxhY2Ugc28gdGhhdCB1c2VycyBhcmUgbm90IGJyb2tlbi4N
Cg0KMykgTW92ZSBhbGwgdXNlcnMgb2YgdGhlIElJTyBpbiBrZXJuZWwgaW50ZXJmYWNlIHRvIHRo
ZSBGVyBBUEkgYW5kIHdpdGgNCnRoYXQsIG1ha2UgSUlPIGZpcm13YXJlIGFnbm9zdGljLg0KDQpP
biAzKSwgdGhlIHFjb20tc3BtaS1hZGMtdG01LmMgZHJpdmVyIHdhcyBvbmx5IGNvbnZlcnRlZCB0
byB1c2UgdGhlIElJTw0KQVBJIHdoaWxlIG9uIHRoZSBJSU8gZHJpdmVycyBhIGZ1bGwgZHJpdmVy
IGNvbnZlcnNpb24gd2FzIGRvbmUuIFRoZQ0KdGhlcm1hbCBvbmUgd291bGQgYmUgcmVhbGx5IG5v
biB0cml2aWFsIGFzIHdlIHdvdWxkIGFsc28gbmVlZCB0byB0b3VjaCB0aGUNCnN1YnN5c3RlbS4g
T24gdGhlIElJTyBkcml2ZXJzLCB0aGUgY29udmVyc2lvbnMgd2VyZSBtb3N0bHkgcGVhY2VmdWxs
DQooYXBwYXJlbnRseSkuIFNwZWNpYWwgY2FyZSBmb3IgdGhlIHN0bTMyLWFkYy5jIGRyaXZlciB0
aG91Z2ggYXMgdGhhdCBvbmUNCndhcyBmYXIgZnJvbSBiZWluZyBzdHJhaWdodCA6KS4NCg0KTGFz
dGx5LCB0aGlzIGlzIG9ubHkgY29tcGlsZSB0ZXN0ZWQgd2l0aCBhbGx5ZXNjb25maWcgZm9yIGFy
bSBhbmQgYXJtNjQuDQpXaGlsZSBJIHN1cmVseSBjYW4gY29tZSB1cCB3aXRoIHNvbWUgZHVtbXkg
ZGV2aWNlcyB0byBtYWtlIHN1cmUgSSBjYW4gc3RpbGwNCnByb3Blcmx5IGdldCBJSU8gY2hhbm5l
bHMsIGhhdmluZyBwcm9wZXIgdGVzdGVkLWJ5IHRhZ3Mgb24gcGxhdGZvcm1zDQpyZWx5aW5nIG9u
IHRoaXMgaW50ZXJmYWNlIHdvdWxkIGJlIHZlcnkgYXBwcmVjaWF0ZWQgKGFuZCBJIHN1c3BlY3Qg
Sm9uYXRoYW4NCndpbGwgcmVxdWlyZSBpdCkuDQoNClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaWlvLzIwMjIwNjA0MTQxOTI1LjEyOWYwZmZlQGppYzIzLWh1YXdlaS9ULyNtZmQ1
Y2NkNzkzODQxNTY5MTgyZTRmODMxZjJjNDYwODliNjY1YzM0Ng0KDQpOdW5vIFPDoSAoMzQpOg0K
ICBpaW86IGFkYzogYWQ3NjA2OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQog
IGlpbzogYWRjOiBhZDc2MDZfcGFyOiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVz
DQogIGlpbzogYWRjOiBiZXJsaW4yLWFkYzogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlciBm
aWxlcw0KICBpaW86IGFkYzogaW14N2RfYWRjOiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVy
IGZpbGVzDQogIGlpbzogYWRjOiBpbXg4cXhwLWFkYzogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhl
YWRlciBmaWxlcw0KICBpaW86IGFkYzogaW5nZW5pYy1hZGM6IGV4cGxpY2l0bHkgYWRkIHByb3Bl
ciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBhZGM6IG1wMjYyOV9hZGM6IGV4cGxpY2l0bHkgYWRkIHBy
b3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBhZGM6IG10NjM2MC1hZGM6IGV4cGxpY2l0bHkgYWRk
IHByb3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBhZGM6IG5wY21fYWRjOiBleHBsaWNpdGx5IGFk
ZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQogIGlpbzogYWRjOiByemcybF9hZGM6IGV4cGxpY2l0bHkg
YWRkIHByb3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBjb21tb246IGNyb3NfZWNfbGlkX2FuZ2xl
OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQogIGlpbzogY29tbW9uOiBjcm9z
X2VjX3NlbnNvcnM6IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBk
YWM6IHN0bTMyLWRhYzogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcw0KICBpaW86
IGRhYzogdmY2MTBfZGFjOiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQogIGlp
bzogaHVtaWRpdHk6IGh0czIyMV9idWZmZXI6IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIg
ZmlsZXMNCiAgaWlvOiBsaWdodDogY3Jvc19lY19saWdodF9wcm94OiBleHBsaWNpdGx5IGFkZCBw
cm9wZXIgaGVhZGVyIGZpbGVzDQogIGlpbzogcHJlc3N1cmU6IGNyb3NfZWNfYmFybzogZXhwbGlj
aXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcw0KICBpaW86IHRyaWdnZXI6IHN0bTMyLWxwdGlt
ZXItdHJpZ2dlcjogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlcg0KICAgIGZpbGVzDQogIGlp
bzogY29yZTogZHJvcCBvZi5oIGZyb20gaWlvLmgNCiAgaWlvOiBpbmtlcm46IG9ubHkgcmVsYXNl
IHRoZSBkZXZpY2Ugbm9kZSB3aGVuIGRvbmUgd2l0aCBpdA0KICBpaW86IGlua2VybjogZml4IHJl
dHVybiB2YWx1ZSBpbiBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkNCiAgaWlvOiBp
bmtlcm46IG9ubHkgcmV0dXJuIGVycm9yIGNvZGVzIGluIGlpb19jaGFubmVsX2dldF8qKCkgQVBJ
cw0KICBpaW86IGlua2Vybjogc3BsaXQgb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKQ0KICBp
aW86IGlua2VybjogbW92ZSB0byBmd25vZGUgcHJvcGVydGllcw0KICB0aGVybWFsOiBxY29tOiBx
Y29tLXNwbWktYWRjLXRtNTogY29udmVydCB0byBJSU8gZndub2RlIEFQSQ0KICBpaW86IGFkYzog
aW5nZW5pYy1hZGM6IGNvbnZlcnQgdG8gSUlPIGZ3bm9kZSBpbnRlcmZhY2UNCiAgaWlvOiBhZGM6
IGFiODUwMC1ncGFkYzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBpaW86IGFkYzog
YXQ5MS1zYW1hNWQyX2FkYzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBpaW86IGFk
YzogcWNvbS1wbTh4eHgteG9hZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMNCiAgaWlv
OiBhZGM6IHFjb20tc3BtaS12YWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzDQogIGlp
bzogYWRjOiBxY29tLXNwbWktYWRjNTogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBp
aW86IGFkYzogc3RtMzItYWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzDQogIGlpbzog
aW5rZXJuOiByZW1vdmUgT0YgZGVwZW5kZW5jaWVzDQogIGlpbzogaW5rZXJuOiBmaXggY29kaW5n
IHN0eWxlIHdhcm5pbmdzDQoNCiBkcml2ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMgICAgICAg
ICAgICAgICAgfCAgMjcgKy0NCiBkcml2ZXJzL2lpby9hZGMvYWQ3NjA2LmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL2FkYy9hZDc2MDZfcGFyLmMgICAgICAgICAg
ICAgICAgICB8ICAgMSArDQogZHJpdmVycy9paW8vYWRjL2F0OTEtc2FtYTVkMl9hZGMuYyAgICAg
ICAgICAgIHwgIDMwICstLQ0KIGRyaXZlcnMvaWlvL2FkYy9iZXJsaW4yLWFkYy5jICAgICAgICAg
ICAgICAgICB8ICAgMiArDQogZHJpdmVycy9paW8vYWRjL2lteDdkX2FkYy5jICAgICAgICAgICAg
ICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9hZGMvaW14OHF4cC1hZGMuYyAgICAgICAgICAg
ICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jICAgICAgICAgICAg
ICAgICB8ICAgOSArLQ0KIGRyaXZlcnMvaWlvL2FkYy9tcDI2MjlfYWRjLmMgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQogZHJpdmVycy9paW8vYWRjL210NjM2MC1hZGMuYyAgICAgICAgICAgICAg
ICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9hZGMvbnBjbV9hZGMuYyAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jICAgICAgICAg
ICB8ICA1OCArKy0tLQ0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jICAgICAgICAg
ICAgICB8ICA2MyArKystLQ0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jICAgICAg
ICAgICAgICB8ICA0NCArKy0tDQogZHJpdmVycy9paW8vYWRjL3J6ZzJsX2FkYy5jICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMgICAgICAgICAg
ICAgICAgICAgfCAxMjggKysrKystLS0tLQ0KIC4uLi9jcm9zX2VjX3NlbnNvcnMvY3Jvc19lY19s
aWRfYW5nbGUuYyAgICAgICB8ICAgMSArDQogLi4uL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMvY3Jv
c19lY19zZW5zb3JzLmMgIHwgICAxICsNCiBkcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLmMgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKw0KIGRyaXZlcnMvaWlvL2RhYy92ZjYxMF9kYWMuYyAgICAg
ICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9paW8vaHVtaWRpdHkvaHRzMjIxX2J1ZmZl
ci5jICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9pbmtlcm4uYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyNDEgKysrKysrKysrLS0tLS0tLS0tDQogZHJpdmVycy9paW8vbGlnaHQv
Y3Jvc19lY19saWdodF9wcm94LmMgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9wcmVzc3Vy
ZS9jcm9zX2VjX2Jhcm8uYyAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL3RyaWdnZXIv
c3RtMzItbHB0aW1lci10cmlnZ2VyLmMgICB8ICAgMSArDQogZHJpdmVycy90aGVybWFsL3Fjb20v
cWNvbS1zcG1pLWFkYy10bTUuYyAgICAgIHwgICAzICstDQogaW5jbHVkZS9saW51eC9paW8vY29u
c3VtZXIuaCAgICAgICAgICAgICAgICAgIHwgIDI4ICstDQogaW5jbHVkZS9saW51eC9paW8vaWlv
LmggICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICstDQogMjggZmlsZXMgY2hhbmdlZCwgMzQ3
IGluc2VydGlvbnMoKyksIDMxMiBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjM2LjENCg0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
