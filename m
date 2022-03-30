Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C260CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUwraCDvBmEFevv0X9wGgfJeP2LPpEy7Mla4oR85XQE=; b=S9mOAOwWIEbAIY
	YJJ3+Y1WnhIvywDzvd1FWtxyOJVKPwg2ciNb2KN8548TfUToxdGN3i+C48ZDskIC1hpfrKqkolM21
	Tme4EKt95H9yhhEAuqGeUeTjEHLnMI4MrekQfC40XEG/cR3W/aVQA34DF1VXQiXvgrurBFJqhfm/H
	+TkJV18Mn4uJcrXYgW538Bg4wMDMmQr/YufWrOP77e+DRy6PGOtiE3bC8eNLGdjpFjlBt534sdg7D
	dYkIyae/cKx+nYUk1ZuqDOWInI66pwvFQ7Jkcnl1a7W5WDioaAzwBxwgN5N8GZGlu17Le9qjjkVnv
	qNNxpIA88m5vSaqj/PBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZWDk-00FKad-6N; Wed, 30 Mar 2022 11:10:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWDh-00FKZt-7D; Wed, 30 Mar 2022 11:10:34 +0000
X-UUID: d3a1d9bb59014705b95cedcbf9f4843b-20220330
X-UUID: d3a1d9bb59014705b95cedcbf9f4843b-20220330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1551491397; Wed, 30 Mar 2022 04:10:27 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 04:10:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 19:10:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 19:10:24 +0800
Message-ID: <6ca66e55fea43d54be57a4255fbb114a42f9bde4.camel@mediatek.com>
Subject: Re: [PATCH v4 03/22] arm64: dts: mt8192: Add gce node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Wed, 30 Mar 2022 19:10:24 +0800
In-Reply-To: <20220329201125.7l47kl7rmf4hjyvc@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-4-allen-kh.cheng@mediatek.com>
 <a4935385-e7a5-8650-914b-73c699d2f8ca@gmail.com>
 <20220329201125.7l47kl7rmf4hjyvc@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_041033_286241_01CBE25D 
X-CRM114-Status: GOOD (  17.98  )
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

SGksCgpPbiBUdWUsIDIwMjItMDMtMjkgYXQgMTY6MTEgLTA0MDAsIE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDIzLCAyMDIyIGF0IDA2OjI0OjAzUE0gKzAxMDAs
IE1hdHRoaWFzIEJydWdnZXIgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMTgvMDMvMjAyMiAxNTo0
NSwgQWxsZW4tS0ggQ2hlbmcgd3JvdGU6Cj4gPiA+IEFkZCBnY2Ugbm9kZSBmb3IgbXQ4MTkyIFNv
Qy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5j
aGVuZ0BtZWRpYXRlay5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8Cj4gPiA+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTIuZHRzaSB8IDEwICsrKysrKysrKysKPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi5kdHNpCj4gPiA+IGluZGV4IDBmOWYyMTFjYTk4Ni4uOWUxYjU2M2JlYmFiIDEw
MDY0NAo+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNp
Cj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+
ID4gQEAgLTYsNiArNiw3IEBACj4gPiA+ICAgL2R0cy12MS87Cj4gPiA+ICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Nsb2NrL210ODE5Mi1jbGsuaD4KPiA+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9nY2UvbXQ4MTkyLWdjZS5oPgo+ID4gPiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4gPiA+ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4gPiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
aW5jdHJsL210ODE5Mi1waW5mdW5jLmg+Cj4gPiA+IEBAIC01NTIsNiArNTUzLDE1IEBACj4gPiA+
ICAgCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+ICAgCQl9Owo+ID4gPiArCQlnY2U6IG1haWxi
b3hAMTAyMjgwMDAgewo+ID4gPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZ2Nl
IjsKPiA+ID4gKwkJCXJlZyA9IDwwIDB4MTAyMjgwMDAgMCAweDQwMDA+Owo+ID4gPiArCQkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDIwMyBJUlFfVFlQRV9MRVZFTF9ISUdICj4gPiA+IDA+Owo+ID4g
PiArCQkJI21ib3gtY2VsbHMgPSA8Mz47Cj4gPiAKPiA+ICNtYm94LWNlbGxzIHNob3VsZCBiZSAy
LCByaWdodD8KPiAKPiBJdCBzaG91bGQgaW5kZWVkLiBUaGUgbWJveGVzIHByb3BlcnR5IGluIHBh
dGNoIDIxIHNob3VsZCBhbHNvIGhhdmUKPiB0aGUgdGhpcmQKPiBhcmd1bWVudCAoIjEiKSBkcm9w
cGVkLgo+IAo+IFRoYW5rcywKPiBOw61jb2xhcyAKClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLgoK
WWVzLCNtYm94LWNlbGxzIHNob3VsZCBiZSAyIGFuZCBwYXRjaCAyMSBhbHNvIG5lZWQgdG8gdXBk
YXRlIGZvcgp0aGlzLgoKQmVzdCByZWdhcmRzLApBbGxlbgoKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
