Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 05:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCD060EE7
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 05:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBCD060EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEynIyoGTP7iITG62yqNPEUDvph1iAYNhRr9R/sJYfA=; b=sle+AhfsNpcRy4
	pGs/OH0Dmk7pIiGFuxOIKfn87KcGCMSPx/5QshlFGKZp5NzOXQH/rgOOaQrH+HUYG9eJDozPkBAyI
	nYpooKRExTVHg4dIeBq5IYl/RTmoGJiQkCUDuJs4v1/YttFwwZGoJjVbK8kfaToBGRpIsJuoLadae
	7ZwOfnAIC72SgOqCUf+He+hO8IMDwNLKHwC7EoZpTV3MIIL4XgSKVr216H4AnFXtysJUo6EajriIF
	B9ayK4jSqsU5DsMD/KaSqfX/6zxNVH1ieGRuQXGcMLl6Owhv7rsDBU4pSeco/Kusae3ckMZaqmHoX
	bDvFgQQMIhO7ern/CgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZoEa-007qBq-2X; Mon, 11 Oct 2021 05:52:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZoEV-007q9n-T4; Mon, 11 Oct 2021 05:52:22 +0000
X-UUID: 2f434f0c470a4a22ab3c18227532eaae-20211010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k9ifZ9vuBiBf5AnO4d5XKJK0BFQtIYXAIA+5OzwhUnY=; 
 b=nJ3gX/DP7gCnvkX2P/bhep/gTweRoI/2+OQgvhmYFthlhLqhZax9Im3utWOvcBkVQOl9YNt3Ml+rlsfH8XMWCSnuivWIqCXiUCIAFkaQcdCjacSt2VR7kqYFT/I4ug7udeVud0U+pPK5ysouTsQpB13PFL2TwLqX7neSolXdTeg=;
X-UUID: 2f434f0c470a4a22ab3c18227532eaae-20211010
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1551522527; Sun, 10 Oct 2021 22:52:17 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Oct 2021 22:42:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 13:42:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 13:42:11 +0800
Message-ID: <e41bc32907c5c8abc65b66c1612cb9265d21614c.camel@mediatek.com>
Subject: Re: [PATCH v6, 12/15] media: mtk-vcodec: Support 34bits dma address
 for vdec
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Oct 2021 13:42:15 +0800
In-Reply-To: <09ce48f4-a785-97d9-2920-eacb39c59573@collabora.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-13-yunfei.dong@mediatek.com>
 <09ce48f4-a785-97d9-2920-eacb39c59573@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_225221_361746_1C508865 
X-CRM114-Status: GOOD (  21.81  )
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

SGkgQmVuamlhbWluLA0KDQoNCk9uIFRodSwgMjAyMS0xMC0wNyBhdCAxMzozNyArMDIwMCwgQmVu
amFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+IExlIDAxLzA5LzIwMjEgw6AgMTA6MzIsIFl1bmZlaSBE
b25nIGEgw6ljcml0IDoNCj4gPiBVc2UgdGhlIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQgaGVs
cGVyIHRvIHNldCB2ZGVjDQo+ID4gRE1BIGJpdCBtYXNrIHRvIHN1cHBvcnQgMzRiaXRzIGlvdmEg
c3BhY2UoMTZHQikgdGhhdA0KPiA+IHRoZSBtdDgxOTIgaW9tbXUgSFcgc3VwcG9ydC4NCj4gPiAN
Cj4gPiBXaG9sZSB0aGUgaW92YSByYW5nZSBzZXBhcmF0ZSB0byAwfjRHLzRHfjhHLzhHfjEyRy8x
Mkd+MTZHLA0KPiA+IHJlZ2FyZGluZyB3aGljaCBpb3ZhIHJhbmdlIFZERUMgYWN0dWFsbHkgbG9j
YXRlLCBpdA0KPiA+IGRlcGVuZHMgb24gdGhlIGRtYS1yYW5nZXMgcHJvcGVydHkgb2YgdmRlYyBk
dHNpIG5vZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5k
b25nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyB8IDMgKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyANCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+IGlu
ZGV4IDAwMjM1MmZjZjhkZS4uMWE4ZDkzMDgzMjdkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0K
PiA+IEBAIC00MTcsNiArNDE3LDkgQEAgc3RhdGljIGludCBtdGtfdmNvZGVjX3Byb2JlKHN0cnVj
dA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAkJfQ0KPiA+ICAgCX0NCj4gPiAg
IA0KPiA+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShwZGV2LT5kZXYub2Zfbm9kZSwgImRtYS1yYW5n
ZXMiLCBOVUxMKSkNCj4gPiArCQlkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYs
DQo+ID4gRE1BX0JJVF9NQVNLKDM0KSk7DQo+ID4gKw0KPiANCj4gSGkgWXVuZmVpLA0KPiANCj4g
RG9lcyBhbGwgU29DIHN1cHBvcnQgMzRiaXRzIGlvdmEgc3BhY2UgPw0KPiBJZiBub3QgeW91IG5l
ZWQgdG8gYWxzbyBjaGVjayBTb0MgdmVyc2lvbiBiZWZvcmUgc2V0dGluZyBkbWEgbWFzay4NCj4g
DQpOb3QgYWxsIFNvQyBzdXBwb3J0IDM0Yml0cy4gV2lsbCBhZGQgZG1hLXJhbmdlcyBwcm9wZXJ0
eSBpbiBkdHNpIGlmIHRoZQ0KU29DIHN1cHBvcnQgMzRiaXRzLg0KDQpsaWtlIHRoaXM6DQpkbWEt
cmFuZ2VzID0gPD47DQoNClRoYW5rcywNCll1bmZlaSBEb25nDQo+IFJlZ2FyZHMsDQo+IEJlbmph
bWluDQo+IA0KPiA+ICAgCWZvciAoaSA9IDA7IGkgPCBNVEtfVkRFQ19IV19NQVg7IGkrKykNCj4g
PiAgIAkJbXV0ZXhfaW5pdCgmZGV2LT5kZWNfbXV0ZXhbaV0pOw0KPiA+ICAgCXNwaW5fbG9ja19p
bml0KCZkZXYtPmlycWxvY2spOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
