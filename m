Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 07:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzddfdkowkprQfbeAkCXbPU/GFNwltoNEyQbSYkWKKw=; b=qEk3NixAXBoLX2
	rzSWNZChjZkXbkdkGor+qMsTpZriZH4zOjZYeUrwf7th+XPzmHu56AQWu+p6QRp/8DvMnP7QnE5XI
	5ohk8lrhMAcbXT9j3OYt7Gri44dgiz8ze7qyu/bg9j3VtOBMgk2jjBzWOAUXmKo5In6SIKg+m6NRW
	Ot8sdup0LxFcS79XLnRvkYhguy9RMh3ywrtw1jAinN2vuDwJaL26RSQUZujmFzfHg+jebShuNREDs
	fPH8bZKMEg4Zb1Tib12B0XWe01ZaXcLzFaCuw0SE4IJ4KnUJ1866QlcuYDvoBszryQNQ9xUsZxht1
	1JA18MU2/bKhnUyesCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7u6g-004uAR-P0; Thu, 13 Jan 2022 07:01:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7u6S-004u4h-4O; Thu, 13 Jan 2022 07:00:57 +0000
X-UUID: d01244b9eb574f66892f0362d0523bd6-20220113
X-UUID: d01244b9eb574f66892f0362d0523bd6-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 122294261; Thu, 13 Jan 2022 00:00:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:58:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 14:58:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Jan 2022 14:58:25 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v4 3/5] arm64: dts: mediatek: Correct Nor Flash clock of MT8192
Date: Thu, 13 Jan 2022 14:58:20 +0800
Message-ID: <20220113065822.11809-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
References: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_230056_198273_4BD52E96 
X-CRM114-Status: GOOD (  11.92  )
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
Y29udHJvbGxlcnMiKSwgZml4IHRoZSBOb3IgRmxhc2ggY2xvY2sgcHJvcGVydHkgdG8gcG9pbnQg
dG8gdGhlIGFjdHVhbApjbG9jay4KClNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxBbGxl
bi1LSC5DaGVuZ0BtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaSB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTIuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLmR0c2kKaW5kZXggNDdkMDU2Y2M1ZGFkLi44NTg0YTIwNDQwYzUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQpAQCAtNDY0LDEwICs0NjQsMTIgQEAKIAkJCWNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLW5vciI7CiAJCQlyZWcgPSA8MCAweDExMjM0MDAw
IDAgMHhlMD47CiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDMxIElSUV9UWVBFX0xFVkVMX0hJ
R0ggMD47Ci0JCQljbG9ja3MgPSA8JmNsazI2bT4sCi0JCQkJIDwmY2xrMjZtPiwKLQkJCQkgPCZj
bGsyNm0+OworCQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1NGTEFTSF9TRUw+LAorCQkJ
CSA8JmluZnJhY2ZnIENMS19JTkZSQV9GTEFTSElGX1NGTEFTSD4sCisJCQkJIDwmaW5mcmFjZmcg
Q0xLX0lORlJBX0ZMQVNISUZfVE9QX0hfMTMzTT47CiAJCQljbG9jay1uYW1lcyA9ICJzcGkiLCAi
c2YiLCAiYXhpIjsKKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9TRkxB
U0hfU0VMPjsKKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsazI2bT47CiAJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJc3RhdHVzID0gImRp
c2FibGUiOwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
