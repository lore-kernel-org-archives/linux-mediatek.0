Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C27AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4NGWlcmbTkD7yDc4tbYbuMANPq5kX0cwxdNxwzwENY=; b=XOHph1QJDr3ufu
	bxeD8NNKCHJ92O4w/8AYqtG7UVBAMAz6N9V+Q3LhOMWPwab5wTr85kZlR8Pcts/5EjlL9Y0apeC07
	soHdRkLl2N+Do72kOvFjSC0wMBN9GuS3A9vcuCpRMHzZrqT6eagnLAvBGZev/qjYyfiYqVh8c5f22
	CDoQsLCIqvyOICi1AqFtkc7XyLnX9sKfajH6PTtAeFBivYJcnlczLuWvdvjUQddp5uJftSPsdPUh0
	49EKe1hxTtLK5imeDBit53wqdI7cd4pHs+p4fYlFB3/wc/tnHc0qUmatFvvoed1HwVLmQT2k7daoK
	7iAq4LYiwInGdG8tKgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7cEq-002OW8-54; Wed, 12 Jan 2022 11:56:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7cEO-002OKb-H6; Wed, 12 Jan 2022 11:55:58 +0000
X-UUID: 8cdfb96809cc41049ddd2280ad552ee6-20220112
X-UUID: 8cdfb96809cc41049ddd2280ad552ee6-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 859946793; Wed, 12 Jan 2022 04:55:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 03:55:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 12 Jan 2022 19:55:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 19:55:45 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v3 2/5] arm64: dts: mediatek: Correct SPI clock of MT8192
Date: Wed, 12 Jan 2022 19:55:39 +0800
Message-ID: <20220112115542.10606-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
References: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_035556_603560_7A94FBA6 
X-CRM114-Status: GOOD (  12.58  )
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

RnJvbTogQWxsZW4tS0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KCldoZW4g
dGhlIGluaXRpYWwgZGV2aWNldHJlZSBmb3IgbXQ4MTkyIHdhcyBhZGRlZCBpbiA0ODQ4OTk4MGUy
N2UgKCJhcm02NDoKZHRzOiBBZGQgTWVkaWF0ZWsgU29DIE1UODE5MiBhbmQgZXZhbHVhdGlvbiBi
b2FyZCBkdHMgYW5kIE1ha2VmaWxlIiksIHRoZQpjbG9jayBkcml2ZXIgZm9yIG10ODE5MiB3YXMg
bm90IHlldCB1cHN0cmVhbSwgc28gdGhlIGNsb2NrIHByb3BlcnR5IG5vZGVzCndlcmUgc2V0IHRv
IHRoZSBjbGsyNm0gY2xvY2sgYXMgYSBwbGFjZWhvbGRlci4KCkdpdmVuIHRoYXQgdGhlIGNsb2Nr
IGRyaXZlciBoYXMgc2luY2UgYmVlbiBhZGRlZCB0aHJvdWdoIDcxMDU3M2RlZTMxYiAoImNsazoK
bWVkaWF0ZWs6IEFkZCBNVDgxOTIgYmFzaWMgY2xvY2tzIHN1cHBvcnQiKSwgYXMgd2VsbCBhcyBp
dHMgZHQtYmluZGluZ3MKdGhyb3VnaCBmMzVmMWEyM2UwZTEgKCJjbGs6IG1lZGlhdGVrOiBBZGQg
ZHQtYmluZGluZ3Mgb2YgTVQ4MTkyIGNsb2NrcyIpIGFuZApkZXZpY2V0cmVlIG5vZGVzIHRocm91
Z2ggNWQyYjg5N2JjNmY1ICgiYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtdDgxOTIKY2xvY2sg
Y29udHJvbGxlcnMiKSwgZml4IHRoZSBTUEkgY2xvY2sgcHJvcGVydHkgdG8gcG9pbnQgdG8gdGhl
IGFjdHVhbApjbG9jay4KClNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxBbGxlbi1LSC5D
aGVuZ0BtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTIuZHRzaSB8IDQ4ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi5kdHNpCmluZGV4IGNmYjY3Y2M0MGMyYy4uNDdkMDU2Y2M1ZGFkIDEw
MDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKQEAgLTM1NSw5ICszNTUs
OSBAQAogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQlyZWcgPSA8MCAweDExMDBhMDAwIDAgMHgx
MDAwPjsKIAkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNTkgSVJRX1RZUEVfTEVWRUxfSElHSCAw
PjsKLQkJCWNsb2NrcyA9IDwmY2xrMjZtPiwKLQkJCQkgPCZjbGsyNm0+LAotCQkJCSA8JmNsazI2
bT47CisJCQljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfTUFJTlBMTF9ENV9END4sCisJCQkJ
IDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwKKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFf
U1BJMD47CiAJCQljbG9jay1uYW1lcyA9ICJwYXJlbnQtY2xrIiwgInNlbC1jbGsiLCAic3BpLWNs
ayI7CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwpAQCAtMzY5LDkgKzM2OSw5IEBACiAJ
CQkjc2l6ZS1jZWxscyA9IDwwPjsKIAkJCXJlZyA9IDwwIDB4MTEwMTAwMDAgMCAweDEwMDA+Owog
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2MCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwotCQkJ
Y2xvY2tzID0gPCZjbGsyNm0+LAotCQkJCSA8JmNsazI2bT4sCi0JCQkJIDwmY2xrMjZtPjsKKwkJ
CWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1X0Q0PiwKKwkJCQkgPCZ0b3Bj
a2dlbiBDTEtfVE9QX1NQSV9TRUw+LAorCQkJCSA8JmluZnJhY2ZnIENMS19JTkZSQV9TUEkxPjsK
IAkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2VsLWNsayIsICJzcGktY2xrIjsKIAkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CkBAIC0zODMsOSArMzgzLDkgQEAKIAkJCSNzaXpl
LWNlbGxzID0gPDA+OwogCQkJcmVnID0gPDAgMHgxMTAxMjAwMCAwIDB4MTAwMD47CiAJCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMTYxIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Ci0JCQljbG9ja3Mg
PSA8JmNsazI2bT4sCi0JCQkJIDwmY2xrMjZtPiwKLQkJCQkgPCZjbGsyNm0+OworCQkJY2xvY2tz
ID0gPCZ0b3Bja2dlbiBDTEtfVE9QX01BSU5QTExfRDVfRDQ+LAorCQkJCSA8JnRvcGNrZ2VuIENM
S19UT1BfU1BJX1NFTD4sCisJCQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1NQSTI+OwogCQkJY2xv
Y2stbmFtZXMgPSAicGFyZW50LWNsayIsICJzZWwtY2xrIiwgInNwaS1jbGsiOwogCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKIAkJfTsKQEAgLTM5Nyw5ICszOTcsOSBAQAogCQkJI3NpemUtY2VsbHMg
PSA8MD47CiAJCQlyZWcgPSA8MCAweDExMDEzMDAwIDAgMHgxMDAwPjsKIAkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAxNjIgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKLQkJCWNsb2NrcyA9IDwmY2xr
MjZtPiwKLQkJCQkgPCZjbGsyNm0+LAotCQkJCSA8JmNsazI2bT47CisJCQljbG9ja3MgPSA8JnRv
cGNrZ2VuIENMS19UT1BfTUFJTlBMTF9ENV9END4sCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9T
UElfU0VMPiwKKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfU1BJMz47CiAJCQljbG9jay1uYW1l
cyA9ICJwYXJlbnQtY2xrIiwgInNlbC1jbGsiLCAic3BpLWNsayI7CiAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwogCQl9OwpAQCAtNDExLDkgKzQxMSw5IEBACiAJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
IAkJCXJlZyA9IDwwIDB4MTEwMTgwMDAgMCAweDEwMDA+OwogCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDE2MyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwotCQkJY2xvY2tzID0gPCZjbGsyNm0+LAot
CQkJCSA8JmNsazI2bT4sCi0JCQkJIDwmY2xrMjZtPjsKKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4g
Q0xLX1RPUF9NQUlOUExMX0Q1X0Q0PiwKKwkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX1NQSV9TRUw+
LAorCQkJCSA8JmluZnJhY2ZnIENMS19JTkZSQV9TUEk0PjsKIAkJCWNsb2NrLW5hbWVzID0gInBh
cmVudC1jbGsiLCAic2VsLWNsayIsICJzcGktY2xrIjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CiAJCX07CkBAIC00MjUsOSArNDI1LDkgQEAKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJcmVn
ID0gPDAgMHgxMTAxOTAwMCAwIDB4MTAwMD47CiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTY0
IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Ci0JCQljbG9ja3MgPSA8JmNsazI2bT4sCi0JCQkJIDwm
Y2xrMjZtPiwKLQkJCQkgPCZjbGsyNm0+OworCQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9Q
X01BSU5QTExfRDVfRDQ+LAorCQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfU1BJX1NFTD4sCisJCQkJ
IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1NQSTU+OwogCQkJY2xvY2stbmFtZXMgPSAicGFyZW50LWNs
ayIsICJzZWwtY2xrIiwgInNwaS1jbGsiOwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsK
QEAgLTQzOSw5ICs0MzksOSBAQAogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQlyZWcgPSA8MCAw
eDExMDFkMDAwIDAgMHgxMDAwPjsKIAkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNjUgSVJRX1RZ
UEVfTEVWRUxfSElHSCAwPjsKLQkJCWNsb2NrcyA9IDwmY2xrMjZtPiwKLQkJCQkgPCZjbGsyNm0+
LAotCQkJCSA8JmNsazI2bT47CisJCQljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfTUFJTlBM
TF9ENV9END4sCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwKKwkJCQkgPCZpbmZy
YWNmZyBDTEtfSU5GUkFfU1BJNj47CiAJCQljbG9jay1uYW1lcyA9ICJwYXJlbnQtY2xrIiwgInNl
bC1jbGsiLCAic3BpLWNsayI7CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwpAQCAtNDUz
LDkgKzQ1Myw5IEBACiAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKIAkJCXJlZyA9IDwwIDB4MTEwMWUw
MDAgMCAweDEwMDA+OwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2NiBJUlFfVFlQRV9MRVZF
TF9ISUdIIDA+OwotCQkJY2xvY2tzID0gPCZjbGsyNm0+LAotCQkJCSA8JmNsazI2bT4sCi0JCQkJ
IDwmY2xrMjZtPjsKKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1X0Q0
PiwKKwkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX1NQSV9TRUw+LAorCQkJCSA8JmluZnJhY2ZnIENM
S19JTkZSQV9TUEk3PjsKIAkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2VsLWNsayIs
ICJzcGktY2xrIjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07Ci0tIAoyLjE4LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
