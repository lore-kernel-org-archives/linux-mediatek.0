Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15986C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkzPz6gqowDXqqmX3V4wgnaAntr2mXLnEvZ9bMMxYVs=; b=S7y4lIkfDOO2TC
	Q7Og+EvdtLRwbBsspFx0sYqDIXqM9JF/MDOYCefJlAKn3uhJ8kD0JURHPYXYsZL98jNXeO9R+JTt7
	MGpKfcIF8sQ8ta+Q+7ge42R3tPDskgOxmHX9Sc3mYw8HqOK026wipgnbxtu5utPvR7mNzmhB3aLRD
	cps027QrTIvvJciRy1S4hqQOBfk+rSXN911I67NhyK0ZYF9TLNQ4ptaSbORc/s8jeLaJDbnLdr0Nl
	B1jbjsMV1paII38CB8eHnl4+9i8bb1584b+jI/vhqgw+3cjFTWvzRck/Rs2rlfov8yGCj2M45vQff
	3OlIMWLCLa8PARD+wXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUnGB-00FhcP-QR; Thu, 17 Mar 2022 10:21:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUnG8-00FhbS-KX; Thu, 17 Mar 2022 10:21:34 +0000
X-UUID: 5f9631a1df2d4e0a965a0636598ee5f2-20220317
X-UUID: 5f9631a1df2d4e0a965a0636598ee5f2-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2074558749; Thu, 17 Mar 2022 03:21:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 03:11:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 18:11:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 18:11:21 +0800
Message-ID: <00715fdbc03815d683d85b5e4ef7250a07141f78.camel@mediatek.com>
Subject: Re: [PATCH v13 2/6] soc: mediatek: mutex: add 8183 MUTEX MOD
 settings for MDP
From: moudy.ho <moudy.ho@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 17 Mar 2022 18:11:21 +0800
In-Reply-To: <4958a206e1fb1d7bf729c501c8548e9d83f7cff5.camel@mediatek.com>
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-3-moudy.ho@mediatek.com>
 <4958a206e1fb1d7bf729c501c8548e9d83f7cff5.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_032132_697879_55AA403A 
X-CRM114-Status: GOOD (  21.01  )
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

T24gV2VkLCAyMDIyLTAzLTE2IGF0IDExOjMxICswODAwLCBDSyBIdSB3cm90ZToKPiBIaSwgTW91
ZHk6Cj4gCj4gT24gVHVlLCAyMDIyLTAzLTE1IGF0IDE0OjEwICswODAwLCBNb3VkeSBIbyB3cm90
ZToKPiA+IEZvciB0aGUgcHVycG9zZSBvZiBtb2R1bGUgaW5kZXBlbmRlbmNlLCByZWxhdGVkIHNl
dHRpbmdzIHNob3VsZCBiZQo+ID4gbW92ZWQKPiA+IGZyb20gTURQIHRvIHRoZSBjb3JyZXNwb25k
aW5nIGRyaXZlci4KPiA+IFRoaXMgcGF0Y2ggYWRkcyA4MTgzIE1VVEVYIE1PRCBzZXR0aW5ncyBm
b3IgTURQLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0
ZWsuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMgfCAy
MSArKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4
LmMKPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMKPiA+IGluZGV4IDc3OGIw
MWNlOWU4Zi4uODhmYjRmYzhmMjE2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLW11dGV4LmMKPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tdXRleC5j
Cj4gPiBAQCAtODAsNiArODAsMTUgQEAKPiA+ICAjZGVmaW5lIE1UODE4M19NVVRFWF9NT0RfRElT
UF9HQU1NQTAJCTE2Cj4gPiAgI2RlZmluZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfRElUSEVSMAkJ
MTcKPiA+ICAKPiA+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9NT0RfTURQX1JETUEwCQlCSVQoMikK
PiAKPiBEaXNwbGF5IGRlZmluaXRpb24gaXMgYSBudW1iZXIsIHdoeSBNRFAgaXMgYml0IGRlZmlu
aXRpb24/Cj4gCj4gUmVnYXJkcywKPiBDSwo+IApIaSBDSywKClRoYW5rcyBmb3IgdGhlIHJlbWlu
ZGVyLgogKiBJdCB3YXMgaW50ZW5kZWQgdG8gYXBwbHkgdGhlIG5ldyBkZWNsYXJhdGlvbiBzdHls
ZSAocmVmOsKgCiAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYXRlay9wYXRjaC8yMDIyMDMxMTAxNTUwNi4xMTIzMi05LW5hbmN5LmxpbkBtZWRpYXRlay5j
b20vCiAgICksIGJ1dCBpdCBzZWVtcyByZWR1bmRhbnQuIEkgc2hvdWxkIGFkZCB0aGUgbmV3IHNl
dHRpbmdzIGluIHRoZQogICBvcmlnaW5hbCB3YXkgZmlyc3QsIHRoZW4ga2VlcCB0aGUgZGVmaW5p
dGlvbiBjaGFuZ2VzIGluIHRoZQogICBzdWJzZXF1ZW5jZSBwYXRjaC4KClRoYW5rcywKTW91ZHkK
PiA+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9NT0RfTURQX1JTWjAJCUJJVCg0KQo+ID4gKyNkZWZp
bmUgTVQ4MTgzX01VVEVYX01PRF9NRFBfUlNaMQkJQklUKDUpCj4gPiArI2RlZmluZSBNVDgxODNf
TVVURVhfTU9EX01EUF9URFNIUDAJCUJJVCg2KQo+ID4gKyNkZWZpbmUgTVQ4MTgzX01VVEVYX01P
RF9NRFBfV1JPVDAJCUJJVCg3KQo+ID4gKyNkZWZpbmUgTVQ4MTgzX01VVEVYX01PRF9NRFBfV0RN
QQkJQklUKDgpCj4gPiArI2RlZmluZSBNVDgxODNfTVVURVhfTU9EX01EUF9BQUwwCQlCSVQoMjMp
Cj4gPiArI2RlZmluZSBNVDgxODNfTVVURVhfTU9EX01EUF9DQ09SUjAJCUJJVCgyNCkKPiA+ICsK
PiA+ICAjZGVmaW5lIE1UODE3M19NVVRFWF9NT0RfRElTUF9PVkwwCQkxMQo+ID4gICNkZWZpbmUg
TVQ4MTczX01VVEVYX01PRF9ESVNQX09WTDEJCTEyCj4gPiAgI2RlZmluZSBNVDgxNzNfTVVURVhf
TU9EX0RJU1BfUkRNQTAJCTEzCj4gPiBAQCAtMjQ0LDYgKzI1MywxNyBAQCBzdGF0aWMgY29uc3Qg
dW5zaWduZWQgaW50Cj4gPiBtdDgxODNfbXV0ZXhfbW9kW0REUF9DT01QT05FTlRfSURfTUFYXSA9
IHsKPiA+ICAJW0REUF9DT01QT05FTlRfV0RNQTBdID0gTVQ4MTgzX01VVEVYX01PRF9ESVNQX1dE
TUEwLAo+ID4gIH07Cj4gPiAgCj4gPiAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
