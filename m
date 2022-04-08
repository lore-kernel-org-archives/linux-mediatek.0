Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC23DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 03:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMLCMNlY36T6bEuE1bVZoEn7GD9JjDaLQuRkHesBjfk=; b=UEeY45ZBaPeKXO
	DpdHLt+aJAbGsyl5R2St3Fe+UhtkDOMWplPhSs9T1P6vOPuzBwvP8g6H3ReZhtqf0cb0Lz3/EZZ8O
	NBq6i49vUX0bXLtRA65IxlUGUv8e5wfW0binhHreieAjbUx5jP69+aS0VXJXaoMYFeUkEd06pk77z
	NLdtl1D+U9TiHKmFG5ULQQoW7rVeaYRPhUigRQt9RpPMnm045th/v9EG0O6K+WZlol5wD7UQZGyOa
	gynqQd/6syoDPvnd0lpZS0Jn6550v35V8WwXxJo1JsL0ZdQ9NsQ4lOo9PUYR6BG7qF3Ts47kSVtWr
	Tp3o/yKp5VeCu6jIJkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncfWl-00EnxZ-J1; Fri, 08 Apr 2022 03:43:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncfWi-00Enwq-CH; Fri, 08 Apr 2022 03:43:14 +0000
X-UUID: e64b9d6b794a4cafaae73a6688a2aef7-20220407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fyrgDu4KJBRYe+c7EVDwp71r+G+hMvx/GovXpom3Tr0=; 
 b=I52hXUW0VwmDQn2Fe3KeqZkGRT14GWPWo+7Obpfn2DqZulqLDxyLnWB4+xhx5wca8i+2mkyhYTuoiSNuenp0JnKraLs4WKryFeBqay8OGWGgqDwmi+oPTcjyPfMzY9mN9VjSGYwfF21z9deZP28lzW+8WIXFvoPyIR35t4YRVGY=;
X-UUID: e64b9d6b794a4cafaae73a6688a2aef7-20220407
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 810213637; Thu, 07 Apr 2022 20:43:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 20:43:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Apr 2022 11:43:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 11:43:01 +0800
Message-ID: <505ab354843d9360887e8052a3dbf6712317c6fd.camel@mediatek.com>
Subject: Re: [v9 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 8 Apr 2022 11:43:01 +0800
In-Reply-To: <20220407212420.tncc576jo5iwaqk7@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-3-jiaxin.yu@mediatek.com>
 <20220407212420.tncc576jo5iwaqk7@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_204312_463542_AF38CA63 
X-CRM114-Status: GOOD (  16.51  )
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

T24gVGh1LCAyMDIyLTA0LTA3IGF0IDE3OjI0IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gSGkgSmlheGluLA0KPiANCj4gT24gV2VkLCBBcHIgMDYsIDIwMjIgYXQgMDY6
MDU6MTJQTSArMDgwMCwgSmlheGluIFl1IHdyb3RlOg0KPiA+IE1UODE5MiBwbGF0Zm9ybSB3aWxs
IHVzZSBydDEwMTUgb3IgcnQxMDE1cCBjb2RlYywgc28gdGhyb3VnaCB0aGUNCj4gPiBzbmRfc29j
X29mX2dldF9kYWlfbGlua19jb2RlY3MoKSB0byBjb21wbGV0ZSB0aGUgY29uZmlndXJhdGlvbg0K
PiA+IG9mIGRhaV9saW5rJ3MgY29kZWNzLg0KPiANCj4gU3VnZ2VzdGlvbiBmb3IgdGhlIGNvbW1p
dCBtZXNzYWdlOg0KPiANCj4gQXMgcGFydCBvZiB0aGUgcmVmYWN0b3JpbmcgdG8gYWxsb3cgdGhl
IHNhbWUgbWFjaGluZSBkcml2ZXIgdG8gYmUNCj4gdXNlZCBmb3IgdGhlDQo+IHJ0MTAxNShwKSBh
bmQgcnQ1NjgyKHMpIGNvZGVjcyBvbiB0aGUgTVQ4MTkyIHBsYXRmb3JtLCBwYXJzZSB0aGUNCj4g
cnQxMDE1KHApDQo+IGNvZGVjcyBmcm9tIHRoZSBzcGVha2VyLWNvZGVjcyBwcm9wZXJ0eSBpbiB0
aGUgZGV2aWNldHJlZSBhbmQgd2lyZQ0KPiB0aGVtIHRvIHRoZQ0KPiBJMlMzIGJhY2tlbmQsIGlu
c3RlYWQgb2YgaGFyZGNvZGluZyB0aGUgbGlua3MgYW5kIHNlbGVjdGluZyB0aHJvdWdoDQo+IHRo
ZQ0KPiBjb21wYXRpYmxlLg0KPiANCkhpIE7DrWNvbGFzLA0KDQpJIHdpbGwgdXBkYXRlIHRoZSBj
b21taXQgbWVzc2FnZSBhY2NvcmRpbmcgdG8gdGhlIHJ1bGUgb2Ygb25lIHJvdyBwZXINCjc1IGNv
bHVtbnMuIEkgd2lsbCBhbHNvIHJlZmVyIHRvIHlvdXIgc3VnZ2VzdGlvbnMgdG8gbW9kaWZ5IHRo
ZSByZXN0IG9mDQp0aGUgc2VyaWVzLiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpKaWF4aW4u
WXUNClRoYW5rcy4NCg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGlu
Lnl1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQo+IFRlc3RlZC1ieTogTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiANCj4gLSBUZXN0ZWQgb24g
bXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24gKHJ0MTAxNXAgYW5kIHJ0NTY4MikuIEFsbCBhdWRpbw0K
PiBwYXRocyBzdGlsbA0KPiAgIHdvcmsgYXMgcHJldmlvdXMgdG8gdGhpcyByZWZhY3Rvci4gQW5k
IGl0J3Mgc3RpbGwgcG9zc2libGUgdG8gb21pdA0KPiAgIG1lZGlhdGVrLGhkbWktY29kZWMuDQo+
IA0KPiBUaGFua3MsDQo+IE7DrWNvbGFzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
