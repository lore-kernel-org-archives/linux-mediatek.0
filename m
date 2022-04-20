Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB703C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghctQlLGEjD+WGBsaZmNGu0ZsG8m9V+YO8MpoKqvACY=; b=hEP3GdW/DcA9l2
	Xnz/AZCbCFOSrAr+SBv2S0y4Pfm1mL74UPIzNS+vURrjrVf28tDA35MPcvvoZauFdZMsegcsFZAcz
	Ww1wHzUdFU/3cE82QQvMQebm+/JV8bOmyLXWepqJUeVcD2PbjiUhG0u7ro3S5ZiDtTJNURX2LB5oK
	IRGWREAirG00t+V/bn/fQMAqcjJyNDCn1PLi0Zhic0gAOnYmjvSa3JsPgPLagMGnnqwTBOuOsLzD5
	mYol9JM0IfAEKCe3FPKFlAfSgYFOUypLJ44ffrBX7twEXytJNveZ8g9rzZAzJhC21znqWgMe+BpMD
	lX6jz0tA9DQ/ctz+EQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9Wu-008zck-Jy; Wed, 20 Apr 2022 12:33:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9Wh-008za2-LD; Wed, 20 Apr 2022 12:33:46 +0000
X-UUID: 4f7301da48784e19a913333b21cef2db-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0b6b8eed-6705-4c5b-9eaa-0f84a05c7b46, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:4f515cf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4f7301da48784e19a913333b21cef2db-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 740264114; Wed, 20 Apr 2022 05:33:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 05:23:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 20:23:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 20:23:31 +0800
Message-ID: <91c52b76872e6339cce3bd671f4ae1143251e2c3.camel@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <kernel@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Jitao Shi <jitao.shi@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <ck.hu@mediatek.com>
Date: Wed, 20 Apr 2022 20:23:31 +0800
In-Reply-To: <20220408013950.674477-1-nfraprado@collabora.com>
References: <20220408013950.674477-1-nfraprado@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_053343_726450_27F75E6C 
X-CRM114-Status: GOOD (  20.71  )
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

T24gVGh1LCAyMDIyLTA0LTA3IGF0IDIxOjM5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBUaGUgY29uZmlndXJhdGlvbiBmb3IgbXQ4MTkyIHdhcyBpbmNvcnJlY3RseSB1
c2luZyB0aGUgb3V0cHV0IGZvcm1hdHMKPiBmcm9tIG10ODE3My4gU2luY2UgdGhlIG91dHB1dCBm
b3JtYXRzIGZvciBtdDgxOTIgYXJlIGluc3RlYWQgdGhlIHNhbWUKPiBvbmVzIGFzIGZvciBtdDgx
ODMsIHdoaWNoIHJlcXVpcmUgdHdvIGJ1cyBzYW1wbGVzIHBlciBwaXhlbCwgdGhlCj4gcGl4ZWxj
bG9jayBhbmQgRERSIGVkZ2Ugc2V0dGluZyB3ZXJlIG1pc2NvbmZpZ3VyZWQuIFRoaXMgbWFkZQo+
IGV4dGVybmFsCj4gZGlzcGxheXMgdW5hYmxlIHRvIHNob3cgdGhlIGltYWdlLgo+IAo+IEZpeCB0
aGUgaXNzdWUgYnkgY29ycmVjdGluZyB0aGUgb3V0cHV0IGZvcm1hdCBmb3IgbXQ4MTkyIHRvIGJl
IHRoZQo+IHNhbWUKPiBhcyBmb3IgbXQ4MTgzLCBmaXhpbmcgdGhlIHVzYWdlIG9mIGV4dGVybmFs
IGRpc3BsYXlzIGZvciBtdDgxOTIuCj4gCj4gRml4ZXM6IGJlNjNmNmU4NjAxZiAoImRybS9tZWRp
YXRlazogZHBpOiBBZGQgb3V0cHV0IGJ1cyBmb3JtYXRzIHRvCj4gZHJpdmVyIGRhdGEiKQo+IFNp
Z25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbT4KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+IGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gQWRkZWQgRml4ZXMgdGFnCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IDQ1
NTRlMmRlMTQzMC4uZTYxY2Q2N2I5NzhmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
aS5jCj4gQEAgLTgxOSw4ICs4MTksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29u
ZiBtdDgxOTJfY29uZiA9IHsKPiAgCS5jYWxfZmFjdG9yID0gbXQ4MTgzX2NhbGN1bGF0ZV9mYWN0
b3IsCj4gIAkucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCj4gIAkubWF4X2Nsb2NrX2toeiA9IDE1MDAw
MCwKPiAtCS5vdXRwdXRfZm10cyA9IG10ODE3M19vdXRwdXRfZm10cywKPiAtCS5udW1fb3V0cHV0
X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE3M19vdXRwdXRfZm10cyksCj4gKwkub3V0cHV0X2ZtdHMg
PSBtdDgxODNfb3V0cHV0X2ZtdHMsCj4gKwkubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRSht
dDgxODNfb3V0cHV0X2ZtdHMpLAo+ICB9Owo+ICAKPiAgc3RhdGljIGludCBtdGtfZHBpX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCgpSZXZpZXdlZC1ieTogUmV4LUJDIENoZW4g
PHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KCkhlbGxvIENLLAoKR2VudGxlIHBpbmcgZm9yIHRo
aXMgcGF0Y2guClRoaXMgcGF0Y2ggaXMgY29uZmlybWVkIGJ5IFhpbmxlaSBhbmQgSml0YW8uCgpC
UnMsClJleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
