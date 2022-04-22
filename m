Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE500C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 01:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2esTEFRDb8d10z7Mr/8TcLeoF3AGHPqCl3/QQTGNo8=; b=sM+cJL75QOnPJP
	zfg5BOFcu4Gv/1pqt+AHQHWfHL2nTUVbYo5AAAivk90D9SMpekQRSadJPZGsAlqoMPe0CH870S84D
	kYR2TojJQnBfrfkID6N9ORLm++5661yuMMjmmQT34u/RMJ3zZpKM/Ye5zTDlXAd6Q/TrKbJVPiWzB
	OAXUxIr+93iVzr4zzO4bUJlEz/ScPAyvvDJ2Np5+PZXbThwRs/RD9kvNsOzimQNHzINgiEAhZLa5C
	pVlDd+qghRP/UZe5HUbgU9zpxls8oWo1Op395bgqFGguCqjXoqA7Gn9e/7lEvya+ycpdWmdbfNs44
	jGNs8VSCFfjOMNAEPKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhhsC-00FW46-HE; Fri, 22 Apr 2022 01:14:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhhs8-00FW39-1N; Fri, 22 Apr 2022 01:14:11 +0000
X-UUID: 6e0c65bfb1844cae99307dec85bb54bd-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d9671df5-445d-4fcd-beb5-a4911bd250b2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:36abb2ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6e0c65bfb1844cae99307dec85bb54bd-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 114744464; Thu, 21 Apr 2022 18:14:03 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 18:04:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 09:03:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 09:03:59 +0800
Message-ID: <675df530698d609c8cf6df666017f36533a9663a.camel@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, "=?ISO-8859-1?Q?N=EDcolas?= F. R.
 A. Prado" <nfraprado@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <kernel@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Jitao Shi <jitao.shi@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 22 Apr 2022 09:03:59 +0800
In-Reply-To: <91c52b76872e6339cce3bd671f4ae1143251e2c3.camel@mediatek.com>
References: <20220408013950.674477-1-nfraprado@collabora.com>
 <91c52b76872e6339cce3bd671f4ae1143251e2c3.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_181408_136904_337A478A 
X-CRM114-Status: GOOD (  23.28  )
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

SGksCgpPbiBXZWQsIDIwMjItMDQtMjAgYXQgMjA6MjMgKzA4MDAsIFJleC1CQyBDaGVuIHdyb3Rl
Ogo+IE9uIFRodSwgMjAyMi0wNC0wNyBhdCAyMTozOSAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4g
UHJhZG8gd3JvdGU6Cj4gPiBUaGUgY29uZmlndXJhdGlvbiBmb3IgbXQ4MTkyIHdhcyBpbmNvcnJl
Y3RseSB1c2luZyB0aGUgb3V0cHV0Cj4gPiBmb3JtYXRzCj4gPiBmcm9tIG10ODE3My4gU2luY2Ug
dGhlIG91dHB1dCBmb3JtYXRzIGZvciBtdDgxOTIgYXJlIGluc3RlYWQgdGhlCj4gPiBzYW1lCj4g
PiBvbmVzIGFzIGZvciBtdDgxODMsIHdoaWNoIHJlcXVpcmUgdHdvIGJ1cyBzYW1wbGVzIHBlciBw
aXhlbCwgdGhlCj4gPiBwaXhlbGNsb2NrIGFuZCBERFIgZWRnZSBzZXR0aW5nIHdlcmUgbWlzY29u
ZmlndXJlZC4gVGhpcyBtYWRlCj4gPiBleHRlcm5hbAo+ID4gZGlzcGxheXMgdW5hYmxlIHRvIHNo
b3cgdGhlIGltYWdlLgo+ID4gCj4gPiBGaXggdGhlIGlzc3VlIGJ5IGNvcnJlY3RpbmcgdGhlIG91
dHB1dCBmb3JtYXQgZm9yIG10ODE5MiB0byBiZSB0aGUKPiA+IHNhbWUKPiA+IGFzIGZvciBtdDgx
ODMsIGZpeGluZyB0aGUgdXNhZ2Ugb2YgZXh0ZXJuYWwgZGlzcGxheXMgZm9yIG10ODE5Mi4KPiA+
IAo+ID4gRml4ZXM6IGJlNjNmNmU4NjAxZiAoImRybS9tZWRpYXRlazogZHBpOiBBZGQgb3V0cHV0
IGJ1cyBmb3JtYXRzIHRvCj4gPiBkcml2ZXIgZGF0YSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gPiBSZXZpZXdl
ZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+ID4gYW5nZWxvZ2lvYWNjaGluby5k
ZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4g
PiAtIEFkZGVkIEZpeGVzIHRhZwo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+
IGluZGV4IDQ1NTRlMmRlMTQzMC4uZTYxY2Q2N2I5NzhmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYwo+ID4gQEAgLTgxOSw4ICs4MTksOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19kcGlfY29uZiBtdDgxOTJfY29uZiA9Cj4gPiB7Cj4gPiAgCS5jYWxfZmFjdG9yID0g
bXQ4MTgzX2NhbGN1bGF0ZV9mYWN0b3IsCj4gPiAgCS5yZWdfaF9mcmVfY29uID0gMHhlMCwKPiA+
ICAJLm1heF9jbG9ja19raHogPSAxNTAwMDAsCj4gPiAtCS5vdXRwdXRfZm10cyA9IG10ODE3M19v
dXRwdXRfZm10cywKPiA+IC0JLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTczX291
dHB1dF9mbXRzKSwKPiA+ICsJLm91dHB1dF9mbXRzID0gbXQ4MTgzX291dHB1dF9mbXRzLAo+ID4g
KwkubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLAo+ID4g
IH07Cj4gPiAgCj4gPiAgc3RhdGljIGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gCj4gUmV2aWV3ZWQtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBt
ZWRpYXRlay5jb20+Cj4gCj4gSGVsbG8gQ0ssCj4gCj4gR2VudGxlIHBpbmcgZm9yIHRoaXMgcGF0
Y2guCj4gVGhpcyBwYXRjaCBpcyBjb25maXJtZWQgYnkgWGlubGVpIGFuZCBKaXRhby4KCkFwcGxp
ZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLgoKWzFdIApodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1t
ZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ0sKCj4gCj4gQlJzLAo+IFJleAo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
