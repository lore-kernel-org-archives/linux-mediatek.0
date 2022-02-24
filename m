Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYCfdHLMbfmycM8+gYnh2uQZXPq90mIgODvBK0JfTiI=; b=fRrAdsIlL7MR2R
	A7Jb9p9kmWzJ7Vc3Oi/MnOBU4mRCoMzFB8MyoZAQNIeVb3er40nSCM2x82sowIFcZ8L3aiy5gQBuA
	YaCAKAExx923McZtaneFekTua/t/iWhf4bVEoXs+uzzdUNEvcV7I944EaNLQQnjdfO+VkUbCtqHUe
	kiUH+hS4Vh1vzbYBnCjUhqbnTvCIAcnbsffBEepKSNAVHcaaVPwAz/YKBpXqUIx1lnoN5QepcxVXS
	YtqyDRhmOlDDBo7dAWOHCi3Ih5FvpmTkVV+HGLQeaFAM697Ln2yepMX+0pSAkoIpQjso4WoB8RBEZ
	hkQRRu7dn2+UBqYALFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNDuW-000rY1-PM; Thu, 24 Feb 2022 13:11:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNDuO-000rSv-EV; Thu, 24 Feb 2022 13:11:54 +0000
X-UUID: 3cc6e043433246a0a77162e927310ab9-20220224
X-UUID: 3cc6e043433246a0a77162e927310ab9-20220224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 76654361; Thu, 24 Feb 2022 06:11:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 05:06:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 21:06:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 21:06:14 +0800
Message-ID: <fa2ebb227418c47ff38fabe6099ab03eaedc6203.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8192
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Kishon Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Min Guo <Min.Guo@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 24 Feb 2022 21:06:14 +0800
In-Reply-To: <20220223173556.u3dx7ugpxpcpir2n@notapiano>
References: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
 <20220223173556.u3dx7ugpxpcpir2n@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_051148_554147_A4B52A87 
X-CRM114-Status: GOOD (  22.38  )
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

T24gV2VkLCAyMDIyLTAyLTIzIGF0IDEyOjM1IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBIaSBBbGxlbiwKPiAKPiB0aGFua3MgZm9yIHRoZSBwYXRjaC4gUGxlYXNlIHNl
ZSB0aGUgY29tbWVudCBiZWxvdy4KPiAKPiBPbiBUaHUsIEZlYiAxNywgMjAyMiBhdCAwOTo1Njoy
MFBNICswODAwLCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiA+IFRoaXMgY29tbWl0IGFkZHMgZHQt
YmluZGluZyBkb2N1bWVudGF0aW9uIG9mIFQtUGh5IGZvciBNZWRpYXRlawo+ID4gTVQ4MTkyIFNv
Qwo+ID4gUGxhdGZvcm0uCj4gCj4gQ29tbWl0IG1lc3NhZ2VzIHNob3VsZCBiZSBpbiBpbXBlcmF0
aXZlIFsxXS4gSSdkIHN1Z2dlc3QgdGhlCj4gZm9sbG93aW5nIG1lc3NhZ2U6Cj4gCj4gCUFkZCBN
VDgxOTIgY29tcGF0aWJsZSB0byB0aGUgTWVkaWF0ZWsgVC1QSFkgZHQtYmluZGluZy4KPiAKPiBb
MV0gCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwqZGVzY3JpYmUt
eW91ci1jaGFuZ2VzX187SXchIUNUUk5LQTl3TWcwQVJidyF5dHJtR3NRX0lWRl9lWmk1aFhrMXR5
bTJXbjQ1YmY2WTFjX0FvZUU4T3NNMUZHVWtlbnhDQjhVbV9vN3FoZ29NX08wMzhlWHFiMFRfcGRU
VDZZcVRFX0dnN3ckCj4gIAo+IAo+IEFsc28sIHRoZSBjb21taXQgdGl0bGUgd291bGQgYmUgYmV0
dGVyIGlmIGl0IGhhZCB0aGUgdGFnIGZvciB0aGUgdHBoeQo+IGZpbGUsIGxpa2UKPiB0aGlzOgo+
IAo+IAlkdC1iaW5kaW5nczogcGh5OiBtZWRpYXRlayx0cGh5OiBBZGQgY29tcGF0aWJsZSBmb3Ig
TVQ4MTkyCj4gCj4gT3RoZXJ3aXNlIGl0J3Mgbm90IGNsZWFyIHRoYXQgeW91J3JlIGNoYW5naW5n
IHRoZSBULVBIWSBqdXN0IGZyb20gdGhlCj4gdGl0bGUuCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4gCj4gT3Ro
ZXIgdGhhbiB0aGF0LAo+IAo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gCj4gVGhhbmtzLAo+IE7DrWNvbGFzCj4gCkhJIE7D
rWNvbGFzLAoKT2sgSSB3aWxsIHVwZGF0ZSBjb21taXQgZm9yIHRoZSBjb21tZW50LiB0aGFua3Mu
IAoKQWxsZW4KCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGh5L21lZGlhdGVrLHRwaHkueWFtbCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0Cj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sCj4gPiBpbmRleCBkMjc5YmEy
MjIzMTYuLjdiMmUxYmMxMTliZSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLHRwaHkueWFtbAo+ID4gQEAgLTgx
LDYgKzgxLDcgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3
NjI5LXRwaHkKPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLXRwaHkKPiA+ICAg
ICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg2LXRwaHkKPiA+ICsgICAgICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTkyLXRwaHkKPiA+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssZ2Vu
ZXJpYy10cGh5LXYyCj4gPiAgICAgICAgLSBpdGVtczoKPiA+ICAgICAgICAgICAgLSBlbnVtOgo+
ID4gLS0gCj4gPiAyLjE4LjAKPiA+IAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
