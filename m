Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2414C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFejvoIV0hyszUPiq5ToqdExjQwfaJ+mUFt6bM4sJXA=; b=TddsidAfOxG4Tp
	+hD4gcacG4AZd/+HkmdgXO9G8CCWn9Wn/380lAl5GmuK2xEC02UtgkM36MU+fFE4zEx2A6K/MsDAd
	DzO10m7GtVFdUukGEoSi4BAgJBXrE3iXKn2vB88ekBL1orF3mLL27xdTQ0YDMhmegSrgL7PGwjZCs
	S0x/MjXv8ec/u5mCEnT/F7HUjdCzECR2dveCfMFBhlpx8PYIP+Ai3qSbJuz9MOqD2eicQwLBi2wOc
	ZVYL2NgOCsQTNA8Mvee0+k6DzwMtSaS1j1iV66Hrh/KsbDagbGZWRGRTGRRGHn6xVF0AGWcRWEZeM
	SKcHl1XlxECB7CGI9FsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrlS-00EWEH-Hi; Wed, 23 Feb 2022 13:33:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrlD-00EWBI-RN; Wed, 23 Feb 2022 13:32:54 +0000
X-UUID: fb1e7754e85140729b1d5ed2190f6025-20220223
X-UUID: fb1e7754e85140729b1d5ed2190f6025-20220223
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 561655248; Wed, 23 Feb 2022 06:32:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:32:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 21:32:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:32:41 +0800
Message-ID: <92fd81e34e5587d70e0a6aa0c2f8ccd15392c5c3.camel@mediatek.com>
Subject: Re: [PATCH v2 14/23] arm64: dts: mt8192: Add mipi_tx node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:32:42 +0800
In-Reply-To: <20220222212658.xuau6t3xcvu7m4uz@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
 <20220222212658.xuau6t3xcvu7m4uz@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_053251_915185_F5ADDB6C 
X-CRM114-Status: GOOD (  17.51  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE2OjI2IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjoyNFBNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCBtaXBpX3R4IG5vZGUgZm9yIG10ODE5MiBTb0MuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRp
YXRlay5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi5kdHNpIHwgMTAgKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5Mi5kdHNpCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kK
PiA+IGluZGV4IGNmYzJkYjUwMTEwOC4uZjVlNWFmOTQ5ZjE5IDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gQEAgLTExMTQsNiArMTExNCwxNiBA
QAo+ID4gIAkJCX07Cj4gPiAgCQl9Owo+ID4gIAo+ID4gKwkJbWlwaV90eDA6IG1pcGktZHBoeUAx
MWU1MDAwMCB7Cj4gCj4gQWNjb3JkaW5nIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvbWVkaWF0ZWssZHNpLQo+IHBoeS55YW1sLCB0aGlzCj4gbm9kZSdzIG5hbWUgc2hv
dWxkIGJlIGRzaS1waHksIG5vdCBtaXBpLWRwaHkuCj4gCkhpIE7DrWNvbGFzCgpJIHdpbGwgY2hh
bmdlIHRvIHRoZSBiZWxvdwptaXBpX3R4MDogZHNpLXBoeUAxMWU1MDAwMAoKClRoYW5rcy4KCj4g
PiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtbWlwaS10eCI7Cj4gPiArCQkJcmVn
ID0gPDAgMHgxMWU1MDAwMCAwIDB4MTAwMD47Cj4gPiArCQkJY2xvY2tzID0gPCZhcG1peGVkc3lz
IENMS19BUE1JWEVEX01JUElEMjZNPjsKPiA+ICsJCQljbG9jay1uYW1lcyA9ICJyZWZfY2xrIjsK
PiA+ICsJCQkjY2xvY2stY2VsbHMgPSA8MD47Cj4gPiArCQkJI3BoeS1jZWxscyA9IDwwPjsKPiA+
ICsJCQljbG9jay1vdXRwdXQtbmFtZXMgPSAibWlwaV90eDBfcGxsIjsKPiA+ICsJCX07Cj4gPiAr
Cj4gPiAgCQlpMmMwOiBpMmNAMTFmMDAwMDAgewo+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTkyLWkyYyI7Cj4gPiAgCQkJcmVnID0gPDAgMHgxMWYwMDAwMCAwIDB4MTAwMD4sCj4g
PiAtLSAKPiA+IDIuMTguMAo+ID4gCj4gPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
