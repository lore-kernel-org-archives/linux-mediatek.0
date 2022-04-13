Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BA5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+8eDntvrI6KJJ9RD9ft/Q1h0oEiP7Ua048WZvbf9o4=; b=K8w1Eyn4iYPgrc
	IYdMLIOGIalptIX1G3oLqd3RLmvRXaBs+qHwn5jL/FYsia1PUR7Oe/Y+cD0PgLXt0ehhGgd7uV2Hh
	gk0uyPhP4k9OFCxaS7WIWtIQ+OOYxQHj2D5E2RUv25lbCKoOMHhlkjgT1Oai5LbjFIVE8ESM2DIal
	yu3D5aEeYhdCZaaY6D6G2ifFWuPplgr7D2eOrQSpjSySod0XpeJA1s3iWcz2px53OMNEsJlUAg36R
	rBxDu6l9swx+TNUKySqDwm7KToYtrco5RxDqOsCzz13+/gZHs/CmF2qsYuNCQdPn669fiWVjCg/kv
	ZegOXBHfES/0I5z29NsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neX26-00HKdv-9V; Wed, 13 Apr 2022 07:03:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neX1r-00HKaD-LI; Wed, 13 Apr 2022 07:03:06 +0000
X-UUID: 8248a098cd634674935304912cce6762-20220413
X-UUID: 8248a098cd634674935304912cce6762-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <alice.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 533754210; Wed, 13 Apr 2022 00:02:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 23:53:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Apr 2022 14:53:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 14:53:23 +0800
Message-ID: <7ad2e7fc39ce0d2b145f651d530d157c67c04f29.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] scsi: Fix racing between dev init and dev reset
From: Alice Chao <alice.chao@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: CC Chou =?UTF-8?Q?=28=E5=91=A8=E5=BF=97=E6=9D=B0=29?=
 <cc.chou@mediatek.com>, Chaotian Jing
 =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?= <Chaotian.Jing@mediatek.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 Jiajie Hao =?UTF-8?Q?=28=E9=83=9D=E5=8A=A0=E8=8A=82=29?=
 <jiajie.hao@mediatek.com>, "jonathan.hsu@mediatek.com"
 <jonathan.hsu@mediatek.com>, Lin Gui =?UTF-8?Q?=28=E6=A1=82=E6=9E=97=29?=
 <Lin.Gui@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Peter Wang
 =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?= <peter.wang@mediatek.com>,
 Powen Kao =?UTF-8?Q?=28=E9=AB=98=E4=BC=AF=E6=96=87=29?=
 <Powen.Kao@mediatek.com>, Qilin Tan
 =?UTF-8?Q?=28=E8=B0=AD=E9=BA=92=E9=BA=9F=29?= <Qilin.Tan@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>, "Yanxu
 Wei =?UTF-8?Q?=28=E9=9F=A6=E6=99=8F=E6=97=AD=29?=" <Yanxu.Wei@mediatek.com>
Date: Wed, 13 Apr 2022 14:53:23 +0800
In-Reply-To: <20220308232333.28978-1-miles.chen@mediatek.com>
References: <20220308020725.16116-2-alice.chao@mediatek.com>
 <20220308232333.28978-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_000303_727435_4DF6B96E 
X-CRM114-Status: GOOD (  32.73  )
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

SGkgTWlsZXMsCgpPbiBXZWQsIDIwMjItMDMtMDkgYXQgMDc6MjMgKzA4MDAsIE1pbGVzIENoZW4g
d3JvdGU6Cj4gSGkgQWxpY2UsCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBJIGhhdmUgc29t
ZSBxdWVzdGlvbnMuCj4gCj4gPiBEZXZpY2UgcmVzZXQgdGhyZWFkIHVzZXMga29iamVjdF91ZXZl
bnRfZW52KCkgdG8gZ2V0IGtvYmoucGFyZW50Cj4gPiBhZnRlciBzY3NpX2V2dF9lbWl0KCksIGFu
ZCBpdCByYWNlcyB3aXRoIGRldmljZSBpbml0IHRocmVhZCB3aGljaAo+ID4gY2FsbHMgZGV2aWNl
X2FkZCgpIHRvIGNyZWF0ZSBrb2JqLnBhcmVudCBiZWZvcmUKPiA+IGtvYmplY3RfdWV2ZW50X2Vu
digpLgo+ID4gCj4gPiBEZXZpY2UgcmVzZXQgY2FsbCB0cmFjZToKPiA+IGZpbGxfa29ial9wYXRo
Cj4gPiBrb2JqZWN0X2dldF9wYXRoCj4gPiBrb2JqZWN0X3VldmVudF9lbnYKPiA+IHNjc2lfZXZ0
X2VtaXQJCQk8LSBhZGQgd2FpdF9ldmVudCgpCj4gPiBzY3NpX2V2dF90aHJlYWQKPiA+IAo+ID4g
RGV2aWNlIGluaXQgY2FsbCB0cmFjZToKPiA+IGZpbGxfa29ial9wYXRoCj4gPiBrb2JqZWN0X2dl
dF9wYXRoCj4gPiBrb2JqZWN0X3VldmVudF9lbnYKPiA+IGRldmljZV9hZGQJCQkJPC0gY3JlYXRl
IGtvYmoucGFyZW50Cj4gPiBzY3NpX3RhcmdldF9hZGQKPiA+IHNjc2lfc3lzZnNfYWRkX3NkZXYK
PiA+IHNjc2lfYWRkX2x1bgo+ID4gc2NzaV9wcm9iZV9hbmRfYWRkX2x1bgo+IAo+IFRoZXNlIGFy
ZSBiYWNrdHJhY2VzLCBhbmQgdGhlIHRoaW5ncyBhYm92ZSBsb29rcyBsaWtlIHlvdXIgc29sdXRp
b24sCj4gbm90Cj4gdGhlIHByb2JsZW0uCj4gSXQncyBiZXR0ZXIgdG8gZGVzY3JpYmUgdGhlIHBy
b2JsZW0gZmlyc3QgYW5kIHNvbHV0aW9uIGxhdGVyOgo+IAo+IERldmljZSBpbml0IGNhbGw6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRGV2aWNlIHJlc2V0IGNhbGw6ICAgCj4gc2NzaV9w
cm9iZV9hbmRfYWRkX2x1bigpICAgICAgICAgICAgICAgICAgICAgICBzY3NpX2V2dF90aHJlYWQo
KQo+ICAgc2NzaV9hZGRfbHVuKCkKPiAgICAgc2NzaV9zeXNmc19hZGRfc2RldigpICAgICAgICAg
ICAgICAgICAgICAgICAgc2NzaV9ldnRfZW1pdCgpCj4gICAgICAgc2NzaV90YXJnZXRfYWRkKCkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAga29iamVjdF91ZXZlbnRfZW52Cj4gKCkgCj4gICAg
ICAgICBkZXZpY2VfYWRkKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrb2JqZWN0
X2dldF9wYXRoCj4gKCkgLy8gc29tZXRoaW5nIHdyb25nPwo+IAkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGxfa29ial9wYXRoKCkKPiAJICBnZXRfZGV2
aWNlX3BhcmVudCgpIC8vIEkgc2VlIGEgZ2V0LCBub3QgY3JlYXRlIHBhcmVudCBrb2JqLAo+IGNv
dWxkIHlvdSBzaG93IG1lIHRoYXQgcG9pbnQ/Cj4gCSAga29iamVjdF91ZXZlbnQoKQo+ICAgICAg
ICAgICAgIGtvYmplY3RfdWV2ZW50X2VudigpCj4gICAgICAgICAgICAgICBrb2JqZWN0X2dldF9w
YXRoKCkKPiAgICAgICAgICAgICAgICAgZmlsbF9rb2JqX3BhdGgoKQo+IAoKRGV2aWNlIGluaXQg
Y2FsbDoJICAgRGV2aWNlIHJlc2V0IGNhbGw6CnNjc2lfcHJvYmVfYW5kX2FkZF9sdW4oKSAgIHNj
c2lfZXZ0X3RocmVhZCgpCiAgc2NzaV9hZGRfbHVuKCkJICAgIHNjc2lfZXZ0X2VtaXQoKQogICBz
Y3NpX3N5c2ZzX2FkZF9zZGV2KCkgICAgIGtvYmplY3RfdWV2ZW50X2VudigpIC8vZ2V0IGtvYmou
cGFyZW50CiAgICBzY3NpX3RhcmdldF9hZGQoKQkgICAgICBrb2JqZWN0X2dldF9wYXRoKCkgLy9n
ZXQgd3JvbmcKa29iai5wYXJlbnQgICAgIGRldmljZV9hZGQoKSAvLyBhZGQga29iai5wYXJlbnQg
IGZpbGxfa29ial9wYXRoKCkKICAgICAga29iamVjdF91ZXZlbnRfZW52KCkKICAgICAgIGtvYmpl
Y3RfZ2V0X3BhdGgoKQogICAgICAgIGZpbGxfa29ial9wYXRoKCkKQWJvdmUgYmFja3RyYWNlIGRl
c2NyaWJlcyB0aGUgcHJvYmxlbSwgZGV2aWNlIHJlc2V0IHRocmVhZCB3aWxsIGdldAp3cm9uZyBr
b2JqLnBhcmVudCB3aGVuIGRldmljZSBpbml0IHRocmVhZCBkaWRu4oCZdCBhZGQga29iai5wYXJl
bnQgeWV0LgoKPiA+IAo+ID4gVGhlc2UgdHdvIGpvYnMgYXJlIHNjaGVkdWxlZCBhc3luY2hyb25v
dXNseSwgd2UgY2FuJ3QgZ3VhcmFudGVlZAo+ID4gdGhhdAo+ID4ga29iai5wYXJlbnQgd2lsbCBi
ZSBjcmVhdGVkIGluIGRldmljZSBpbml0IHRocmVhZCBiZWZvcmUgZGV2aWNlCj4gPiByZXNldAo+
ID4gdGhyZWFkIGNhbGxzIGtvYmpfZ2V0X3BhdGgoKS4KPiAKPiBXaGF0IGhhcHBlbnMgaWYgZGV2
aWNlIHJlc2V0IHRocmVhZCBjYWxscyBrb2JqX2dldF9wYXRoKCkgYmVmb3JlCj4ga29iai5wYXJl
bnQncwo+IGNyZWF0aW9uPyBhIGNyYXNoIG9yIHNvbWV0aGluZz8KPiAKCkl0IHdpbGwgY2F1c2Ug
c2xhYi1vdXQtb2YtYm91bmRzIGluIGtvYmplY3RfZ2V0X3BhdGggYW5kIGtlcm5lbCBwYW5pYwp0
aGFuIGNyYXNoLgoKPiA+IAo+ID4gVG8gcmVzb2x2ZSB0aGUgcmFjaW5nIGlzc3VlIGJldHdlZW4g
ZGV2aWNlIGluaXQgdGhyZWFkIGFuZCBkZXZpY2UKPiA+IHJlc2V0IHRocmVhZCwgd2UgdXNlIHdh
aXRfZXZlbnQoKSBpbiBzY3NpX2V2dF9lbWl0KCkgdG8gd2FpdCBmb3IKPiA+IGRldmljZV9hZGQo
KSB0byBjb21wbGV0ZSB0aGUgY3JlYXRpb24gb2Yga29iai5wYXJlbnQuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEFsaWNlIENoYW8gPGFsaWNlLmNoYW9AbWVkaWF0ZWsuY29tPgo+IAo+IFdoZW4g
d2Ugc2VuZCBwYXRjaCBOKzEsIHdlIGhhdmUgdG8gcHV0IHRoZSBjaGFuZ2UgbG9nIGJldHdlZW4g
cGF0Y2gKPiB2MSB0byB2Tgo+IHVuZGVyIGEgIi0tLSIsIHNvIG90aGVycyBjYW4gdW5kZXJzdGFu
ZCB0aGUgY2hhbmdlcyBiZXR3ZWVuIHBhdGNoIE4KPiBhbmQgTisxLgo+IGUuZy4sCj4gCj4gLS0t
Cj4gCj4gQ2hhbmdlIHNpbmNlIHYxCj4gLSByZW1vdmUgQ2hhbmdlLUlkCj4gCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL3Njc2kvc2NzaV9saWIuYyAgfCAxICsKPiA+ICBkcml2ZXJzL3Njc2kvc2NzaV9z
Y2FuLmMgfCAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Njc2lfbGliLmMgYi9kcml2ZXJzL3Njc2kvc2Nz
aV9saWIuYwo+ID4gaW5kZXggMGE3MGFhNzYzYTk2Li5hYmY5YTcxZWQ3N2MgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL3Njc2kvc2NzaV9saWIuYwo+ID4gKysrIGIvZHJpdmVycy9zY3NpL3Njc2lf
bGliLmMKPiA+IEBAIC0yNDYxLDYgKzI0NjEsNyBAQCBzdGF0aWMgdm9pZCBzY3NpX2V2dF9lbWl0
KHN0cnVjdCBzY3NpX2RldmljZQo+ID4gKnNkZXYsIHN0cnVjdCBzY3NpX2V2ZW50ICpldnQpCj4g
PiAgCQlicmVhazsKPiA+ICAJY2FzZSBTREVWX0VWVF9QT1dFUl9PTl9SRVNFVF9PQ0NVUlJFRDoK
PiA+ICAJCWVudnBbaWR4KytdID0gIlNERVZfVUE9UE9XRVJfT05fUkVTRVRfT0NDVVJSRUQiOwo+
ID4gKwkJd2FpdF9ldmVudChzZGV2LT5ob3N0LT5ob3N0X3dhaXQsIHNkZXYtCj4gPiA+c2Rldl9n
ZW5kZXYua29iai5wYXJlbnQgIT0gTlVMTCk7Cj4gPiAgCQlicmVhazsKPiA+ICAJZGVmYXVsdDoK
PiA+ICAJCS8qIGRvIG5vdGhpbmcgKi8KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvc2Nz
aV9zY2FuLmMgYi9kcml2ZXJzL3Njc2kvc2NzaV9zY2FuLmMKPiA+IGluZGV4IGY0ZTZjNjhhYzk5
ZS4uNDMxZjIyOWFjNDM1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zY3NpL3Njc2lfc2Nhbi5j
Cj4gPiArKysgYi9kcml2ZXJzL3Njc2kvc2NzaV9zY2FuLmMKPiA+IEBAIC0xOTA0LDYgKzE5MDQs
NyBAQCBzdGF0aWMgdm9pZCBkb19zY3NpX3NjYW5faG9zdChzdHJ1Y3QKPiA+IFNjc2lfSG9zdCAq
c2hvc3QpCj4gPiAgCX0gZWxzZSB7Cj4gPiAgCQlzY3NpX3NjYW5faG9zdF9zZWxlY3RlZChzaG9z
dCwgU0NBTl9XSUxEX0NBUkQsCj4gPiBTQ0FOX1dJTERfQ0FSRCwKPiA+ICAJCQkJU0NBTl9XSUxE
X0NBUkQsIDApOwo+ID4gKwkJd2FrZV91cCgmc2hvc3QtPmhvc3Rfd2FpdCk7Cj4gCj4gZG9fc2Nz
aV9zY2FuX2hvc3QoKSBpcyBub3QgaW4gdGhlIGNhbGwgdHJhY2UgYWJvdmUsIGNvdWxkIHlvdSBz
aG93Cj4gdGhlIHJlbGF0aW9uc2hpcAo+IG9mIGRvX3Njc2lfc2Nhbl9ob3N0IGluIHRoZSBjYWxs
IGZsb3c/Cj4gCgp1ZnNoY2RfYXN5bmNfc2NhbigpCnNjc2lfc2Nhbl9ob3N0KCkKZG9fc2NzaV9z
Y2FuX2hvc3QoKSAgPDwgaGVyZQpzY3NpX3NjYW5faG9zdF9zZWxlY3RlZCgpCiBfX3Njc2lfc2Nh
bl90YXJnZXQoKQpzY3NpX3Byb2JlX2FuZF9hZGRfbHVuKCkKc2NzaV9zeXNmc19hZGRfc2Rldigp
CmRldmljZV9hZGQoKQprb2JqZWN0X3VldmVudF9lbnYoKQprb2JqZWN0X2dldF9wYXRoKCkKZmls
bF9rb2JqX3BhdGgoKQoKQWZ0ZXIgd2UgYWRkIHdha2VfdXAgaGVyZSwgd2UgY2FuIGVuc3VyZSB0
aGF0IGRldmljZSByZXNldCB0aHJlYWQgd2lsbApnZXQga29iamVjdCBhZnRlciBkZXZpY2UgaW5p
dCB0aHJlYWQgZmluaXNoZXMgYWRkaW5nIHBhcmVudC4KCj4gdGhhbmtzLAo+IE1pbGVzCj4gCj4g
PiAgCX0KPiA+ICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
