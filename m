Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C767C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syVHoALUfUkqUscJuFXyphMFaI9ixOLy3rhqDhRRxXs=; b=vrB51VIi23XkdC
	mtDo50VpYZjrTfn/QmaSuegc0jGAta9vWFBhsNOxJZ8lReVCfuST7DgRfg8LNZ+dR+FzRDJuKLA0o
	IhPteLlRLFG6Mlw6ownb6RUD1zDETxhXpWRpkz68b+xnNQkcy2Qr+G25Gyj/uaEFR6OIe77Vxvsf1
	OxRFf5Yzfd4tufh+deNaf1YAWRrxox5p+NzjaKCdUDgU7VxbQvHVLJUESMUH2Hc0QSDqJv/8b15J2
	sJsJa3VXBsKxVGr51Gw81BNEeVUyXYy2BsOs3Ky1xRz0TuxW2RmQkoCobeUGfgW46hDHuwMKnBI5a
	f3MfRkQuQfU7vtCfjwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt53Y-0038co-Nx; Mon, 23 May 2022 10:12:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oZ-002A7b-SD; Mon, 23 May 2022 07:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=obZD6xRj3qIZ0z9xpubb7cPA39qMN4qHPTs9AllbWjk=; b=ICGkqh1dL/2B+b3NdOZ33Vgzey
 M39Jgn2YFQ+bcekH73emhqMaW6IUfDZXq7XQ+86AUL4tW2cLLaKCUd3o/s7INCaZAbnCfymevZcsD
 LjoBkdHl/8bDqcBGi9DQL3aY5g8cewQq05xBoYUUhQjQUcUacWd/t6CX6EMo92aSMaHqbeJON5Ns+
 RXlvDGffQnF62VIYVg/bM4kFQSevu5JvIR2KjKCDrpMmwtnmpschSTq8S+HSIdmHr1FpMAyJhapcH
 6yu0nWAeFxf46ALGaT3IKVJWitB4XmCAif2TUUDrD7IpoFU9A9YNVUwlgLjae8vwba0McWBEG75BR
 KnHiLYzA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hj-000syW-Vr; Mon, 23 May 2022 06:11:24 +0000
X-UUID: 2eb8f96632dc4e4a8de9698b5f90ded5-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:d90b2080-702f-47ce-a39b-ce2234f64fd8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:d0f93e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 2eb8f96632dc4e4a8de9698b5f90ded5-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1087045562; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 14:00:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:59 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v8 14/19] clk: mediatek: reset: Add infra_ao reset support for
 MT8192/MT8195
Date: Mon, 23 May 2022 14:00:51 +0800
Message-ID: <20220523060056.24396-15-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071120_858266_FF698059 
X-CRM114-Status: GOOD (  14.81  )
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

VGhlIGluZnJhX2FvIHJlc2V0IGlzIG5lZWRlZCBmb3IgTVQ4MTkyIGFuZCBNVDgxOTUuCi0gQWRk
IG10a19jbGtfcnN0X2Rlc2MgZm9yIE1UODE5MiBhbmQgTVQ4MTk1Ci0gQWRkIHJlZ2lzdGVyIHJl
c2V0IGNvbnRyb2xsZXIgZnVuY3Rpb24gZm9yIE1UODE5MiBpbmZyYV9hby4KLSBNb3ZlIGRlZmlu
aXRpb24gb2YgaW5mcmEgcmVzZXQgZnJvbSBjbC1tdDgxODMuYyB0byByZXNldC5oCiAgYmVjYXVz
ZSBpdCdzIHRoZSBzYW1lIGRlZmluaXRpb24gd2l0aCBNVDgxOTIgYW5kIE1UODE5NS4KLSBBZGQg
bmV3IGRlZmluaXRpb24gb2YgaW5mcmEgcmVzZXRfNCBmb3IgTVQ4MTkyIGFuZCBNVDgxOTUuCi0g
QWRkIGluZnJhX2FvX2lkeF9tYXAgZm9yIE1UODE5MiBhbmQgTVQ4MTk1LgoKU2lnbmVkLW9mZi1i
eTogUmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODMu
YyAgICAgICAgICB8ICA2IC0tLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLmMg
ICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2Nsay9tZWRpYXRl
ay9jbGstbXQ4MTk1LWluZnJhX2FvLmMgfCAyNCArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL3Jlc2V0LmggICAgICAgICAgICAgICB8ICA3ICsrKysrKwogNCBmaWxlcyBj
aGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODMuYyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Ns
ay1tdDgxODMuYwppbmRleCBiMWQ4MTBmODViNzEuLjg1MTIxMDFlMTE4OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4My5jCisrKyBiL2RyaXZlcnMvY2xrL21lZGlh
dGVrL2Nsay1tdDgxODMuYwpAQCAtMTgsMTIgKzE4LDYgQEAKIAogI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2Nsb2NrL210ODE4My1jbGsuaD4KIAotLyogSW5mcmEgZ2xvYmFsIGNvbnRyb2xsZXIgcmVz
ZXQgc2V0IHJlZ2lzdGVyICovCi0jZGVmaW5lIElORlJBX1JTVDBfU0VUX09GRlNFVAkJMHgxMjAK
LSNkZWZpbmUgSU5GUkFfUlNUMV9TRVRfT0ZGU0VUCQkweDEzMAotI2RlZmluZSBJTkZSQV9SU1Qy
X1NFVF9PRkZTRVQJCTB4MTQwCi0jZGVmaW5lIElORlJBX1JTVDNfU0VUX09GRlNFVAkJMHgxNTAK
LQogc3RhdGljIERFRklORV9TUElOTE9DSyhtdDgxODNfY2xrX2xvY2spOwogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19maXhlZF9jbGsgdG9wX2ZpeGVkX2Nsa3NbXSA9IHsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTIuYyBiL2RyaXZlcnMvY2xrL21lZGlhdGVr
L2Nsay1tdDgxOTIuYwppbmRleCBkZGEyMTFiN2E3NDUuLmViYmQyNzk4ZDlhMyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jCisrKyBiL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDgxOTIuYwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUgImNsay1wbGwu
aCIKIAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5Mi1jbGsuaD4KKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRzLmg+CiAKIHN0YXRpYyBERUZJTkVfU1BJ
TkxPQ0sobXQ4MTkyX2Nsa19sb2NrKTsKIApAQCAtMTExNCw2ICsxMTE1LDMwIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2dhdGUgdG9wX2Nsa3NbXSA9IHsKIAlHQVRFX1RPUChDTEtfVE9QX1NT
VVNCX1BIWV9SRUYsICJzc3VzYl9waHlfcmVmIiwgImNsazI2bSIsIDI1KSwKIH07CiAKK3N0YXRp
YyB1MTYgaW5mcmFfYW9fcnN0X29mc1tdID0geworCUlORlJBX1JTVDBfU0VUX09GRlNFVCwKKwlJ
TkZSQV9SU1QxX1NFVF9PRkZTRVQsCisJSU5GUkFfUlNUMl9TRVRfT0ZGU0VULAorCUlORlJBX1JT
VDNfU0VUX09GRlNFVCwKKwlJTkZSQV9SU1Q0X1NFVF9PRkZTRVQsCit9OworCitzdGF0aWMgdTE2
IGluZnJhX2FvX2lkeF9tYXBbXSA9IHsKKwlbTVQ4MTkyX0lORlJBX1JTVDBfVEhFUk1fQ1RSTF9T
V1JTVF0gPSAwICogUlNUX05SX1BFUl9CQU5LICsgMCwKKwlbTVQ4MTkyX0lORlJBX1JTVDJfUEVY
VFBfUEhZX1NXUlNUXSA9IDIgKiBSU1RfTlJfUEVSX0JBTksgKyAxNSwKKwlbTVQ4MTkyX0lORlJB
X1JTVDNfVEhFUk1fQ1RSTF9QVFBfU1dSU1RdID0gMyAqIFJTVF9OUl9QRVJfQkFOSyArIDUsCisJ
W01UODE5Ml9JTkZSQV9SU1Q0X1BDSUVfVE9QX1NXUlNUXSA9IDQgKiBSU1RfTlJfUEVSX0JBTksg
KyAxLAorCVtNVDgxOTJfSU5GUkFfUlNUNF9USEVSTV9DVFJMX01DVV9TV1JTVF0gPSA0ICogUlNU
X05SX1BFUl9CQU5LICsgMTIsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19jbGtfcnN0
X2Rlc2MgY2xrX3JzdF9kZXNjID0geworCS52ZXJzaW9uID0gTVRLX1JTVF9TRVRfQ0xSLAorCS5y
c3RfYmFua19vZnMgPSBpbmZyYV9hb19yc3Rfb2ZzLAorCS5yc3RfYmFua19uciA9IEFSUkFZX1NJ
WkUoaW5mcmFfYW9fcnN0X29mcyksCisJLnJzdF9pZHhfbWFwID0gaW5mcmFfYW9faWR4X21hcCwK
KwkucnN0X2lkeF9tYXBfbnIgPSBBUlJBWV9TSVpFKGluZnJhX2FvX2lkeF9tYXApLAorfTsKKwog
I2RlZmluZSBNVDgxOTJfUExMX0ZNQVgJCSgzODAwVUwgKiBNSFopCiAjZGVmaW5lIE1UODE5Ml9Q
TExfRk1JTgkJKDE1MDBVTCAqIE1IWikKICNkZWZpbmUgTVQ4MTkyX0lOVEVHRVJfQklUUwk4CkBA
IC0xMjQwLDYgKzEyNjUsMTAgQEAgc3RhdGljIGludCBjbGtfbXQ4MTkyX2luZnJhX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHIpCiAJCWdvdG8gZnJlZV9jbGtfZGF0
YTsKIAorCXIgPSBtdGtfcmVnaXN0ZXJfcmVzZXRfY29udHJvbGxlcl93aXRoX2RldigmcGRldi0+
ZGV2LCAmY2xrX3JzdF9kZXNjKTsKKwlpZiAocikKKwkJZ290byBmcmVlX2Nsa19kYXRhOworCiAJ
ciA9IG9mX2Nsa19hZGRfaHdfcHJvdmlkZXIobm9kZSwgb2ZfY2xrX2h3X29uZWNlbGxfZ2V0LCBj
bGtfZGF0YSk7CiAJaWYgKHIpCiAJCWdvdG8gZnJlZV9jbGtfZGF0YTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTUtaW5mcmFfYW8uYyBiL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDgxOTUtaW5mcmFfYW8uYwppbmRleCA4ZWJlM2I5NDE1YzQuLjk3NjU3ZjI1
NTYxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5NS1pbmZyYV9h
by5jCisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTUtaW5mcmFfYW8uYwpAQCAt
Nyw2ICs3LDcgQEAKICNpbmNsdWRlICJjbGstbXRrLmgiCiAKICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9jbG9jay9tdDgxOTUtY2xrLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1
LXJlc2V0cy5oPgogI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgogI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgogCkBAIC0xODIsOSArMTgzLDMyIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbXRrX2dhdGUgaW5mcmFfYW9fY2xrc1tdID0gewogCUdBVEVfSU5GUkFfQU80KENM
S19JTkZSQV9BT19QRVJJX1VGU19NRU1fU1VCLCAiaW5mcmFfYW9fcGVyaV91ZnNfbWVtX3N1YiIs
ICJtZW1fNDY2bSIsIDMxKSwKIH07CiAKK3N0YXRpYyB1MTYgaW5mcmFfYW9fcnN0X29mc1tdID0g
eworCUlORlJBX1JTVDBfU0VUX09GRlNFVCwKKwlJTkZSQV9SU1QxX1NFVF9PRkZTRVQsCisJSU5G
UkFfUlNUMl9TRVRfT0ZGU0VULAorCUlORlJBX1JTVDNfU0VUX09GRlNFVCwKKwlJTkZSQV9SU1Q0
X1NFVF9PRkZTRVQsCit9OworCitzdGF0aWMgdTE2IGluZnJhX2FvX2lkeF9tYXBbXSA9IHsKKwlb
TVQ4MTk1X0lORlJBX1JTVDBfVEhFUk1fQ1RSTF9TV1JTVF0gPSAwICogUlNUX05SX1BFUl9CQU5L
ICsgMCwKKwlbTVQ4MTk1X0lORlJBX1JTVDNfVEhFUk1fQ1RSTF9QVFBfU1dSU1RdID0gMyAqIFJT
VF9OUl9QRVJfQkFOSyArIDUsCisJW01UODE5NV9JTkZSQV9SU1Q0X1RIRVJNX0NUUkxfTUNVX1NX
UlNUXSA9IDQgKiBSU1RfTlJfUEVSX0JBTksgKyAxMCwKK307CisKK3N0YXRpYyBzdHJ1Y3QgbXRr
X2Nsa19yc3RfZGVzYyBpbmZyYV9hb19yc3RfZGVzYyA9IHsKKwkudmVyc2lvbiA9IE1US19SU1Rf
U0VUX0NMUiwKKwkucnN0X2Jhbmtfb2ZzID0gaW5mcmFfYW9fcnN0X29mcywKKwkucnN0X2Jhbmtf
bnIgPSBBUlJBWV9TSVpFKGluZnJhX2FvX3JzdF9vZnMpLAorCS5yc3RfaWR4X21hcCA9IGluZnJh
X2FvX2lkeF9tYXAsCisJLnJzdF9pZHhfbWFwX25yID0gQVJSQVlfU0laRShpbmZyYV9hb19pZHhf
bWFwKSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Nsa19kZXNjIGluZnJhX2FvX2Rl
c2MgPSB7CiAJLmNsa3MgPSBpbmZyYV9hb19jbGtzLAogCS5udW1fY2xrcyA9IEFSUkFZX1NJWkUo
aW5mcmFfYW9fY2xrcyksCisJLnJzdF9kZXNjID0gJmluZnJhX2FvX3JzdF9kZXNjLAogfTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0Y2hfY2xrX210ODE5NV9pbmZy
YV9hb1tdID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuaCBiL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmgKaW5kZXggZjdlMWYzMWUzOTQ2Li42YTU4YTNkNTkx
NjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmgKKysrIGIvZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvcmVzZXQuaApAQCAtMTEsNiArMTEsMTMgQEAKIAogI2RlZmluZSBSU1Rf
TlJfUEVSX0JBTksgMzIKIAorLyogSW5mcmEgZ2xvYmFsIGNvbnRyb2xsZXIgcmVzZXQgc2V0IHJl
Z2lzdGVyICovCisjZGVmaW5lIElORlJBX1JTVDBfU0VUX09GRlNFVCAweDEyMAorI2RlZmluZSBJ
TkZSQV9SU1QxX1NFVF9PRkZTRVQgMHgxMzAKKyNkZWZpbmUgSU5GUkFfUlNUMl9TRVRfT0ZGU0VU
IDB4MTQwCisjZGVmaW5lIElORlJBX1JTVDNfU0VUX09GRlNFVCAweDE1MAorI2RlZmluZSBJTkZS
QV9SU1Q0X1NFVF9PRkZTRVQgMHg3MzAKKwogLyoqCiAgKiBlbnVtIG10a19yZXNldF92ZXJzaW9u
IC0gVmVyc2lvbiBvZiBNZWRpYVRlayBjbG9jayByZXNldCBjb250cm9sbGVyLgogICogQE1US19S
U1RfU0lNUExFOiBVc2UgdGhlIHNhbWUgcmVnaXN0ZXJzIGZvciBiaXQgc2V0IGFuZCBjbGVhci4K
LS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
