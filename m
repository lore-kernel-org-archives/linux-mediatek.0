Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077CAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEADoF4GaqV1AZMuNk8MgABmc47vHUmJAj0wntM72zg=; b=MZu3KGE8wV8Kyp
	YXAvkv/Z+qlRfsW9Puj6WHw+rO5v5O+BQfd61vW/Ibl+aCTwJlMiIgTRmAj1e1njOLb9uqXC0EikJ
	fGayc3b4PSyAbUr5nYU8wtVKIPx8e+p1cx1IMQH2Ho4mgeCZcIxnBbqHIjGn7jyazgtH3+kVKZlH6
	nqX8AxJU/MkvIdx9FTLIMC/Sief9LFSbLp8f4S/tQ5L9iTNVjk/SUUifNPSLuBocam9LoTGCnkk/Z
	F8ihHRrIDY4QRUUcXvyDkFLpZo9D1Egb59il+LcV7h2wl36C4jCISOu9g6IGSjsLtQgYdpvuccP4J
	+qqDWnOpxOuddd6LnStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC36x-004D42-IP; Mon, 24 Jan 2022 17:26:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC36u-004D3M-PY
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 17:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YalnhBnkU6wZ0N4VJgHQSOBIP0tBgxl1/ZtUR64V9oA=; b=fOFHPIrYVgBUmRQ1wEyMQVl1Oj
 J17+8bX+a2m4lyf00SWK0SbxEgp4DFByKGkICOOLjjK5UDLiqO0o5EVQO60/0NmnRCNDgSCJTRL2+
 XlcIantWF1sVzawTxf32wDMyo3ml8qMUfx464lpZ/WeCAVULy2M6DtMrb333/zQzYrzEJeJlrBH6J
 2t5dPHHaevgk7AsspzzLGYVLLoqF4ORiPBfhHCZ/hQFbo110/Rxr3gTd9zg/l621X8XcZ8++f1KH+
 TL6vTH/S0VvymwuILV4s/TRFyIzUyYPzKtW4H7+VwBdgNnM87UoKIhFI4sC9TtHoSQ23YH4dDregg
 qVLdckRA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56842)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nC36d-0000eK-0B; Mon, 24 Jan 2022 17:26:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nC36X-0001nW-Kl; Mon, 24 Jan 2022 17:26:09 +0000
Date: Mon, 24 Jan 2022 17:26:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, linux-mips@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 openwrt-devel@lists.openwrt.org, erkin.bozoglu@xeront.com
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
Message-ID: <Ye7hMWRR4URUnSFp@shell.armlinux.org.uk>
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
 <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
 <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com>
 <Ye1zwIFUa5LPQbQm@lunn.ch>
 <acf98ec3-1120-bcc0-2a2f-85d97c48febd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acf98ec3-1120-bcc0-2a2f-85d97c48febd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_092632_854273_327D0737 
X-CRM114-Status: GOOD (  20.82  )
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

T24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgMDk6MTM6MzhBTSAtMDgwMCwgRmxvcmlhbiBGYWluZWxs
aSB3cm90ZToKPiBPbiAxLzIzLzIwMjIgNzoyNiBBTSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gPiBP
biBTdW4sIEphbiAyMywgMjAyMiBhdCAxMTozMzowNEFNICswMzAwLCBBcsSxbsOnIMOcTkFMIHdy
b3RlOgo+ID4gPiBIZXkgRGVuZywKPiA+ID4gCj4gPiA+IE9uIDIzLzAxLzIwMjIgMDk6NTEsIERF
TkcgUWluZ2Zhbmcgd3JvdGU6Cj4gPiA+ID4gSGksCj4gPiA+ID4gCj4gPiA+ID4gRG8geW91IHNl
dCB0aGUgZXRoZXJuZXQgcGlubXV4IGNvcnJlY3RseT8KPiA+ID4gPiAKPiA+ID4gPiAmZXRoZXJu
ZXQgewo+ID4gPiA+ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiA+ID4gICAg
ICAgcGluY3RybC0wID0gPCZyZ21paTFfcGlucyAmcmdtaWkyX3BpbnMgJm1kaW9fcGlucz47Cj4g
PiA+ID4gfTsKPiA+ID4gCj4gPiA+IFRoaXMgZml4ZWQgaXQhIFdlIGRpZCBoYXZlICZyZ21paTJf
cGlucyBvbiB0aGUgZ21hYzEgbm9kZSAoaXQgd2FzIG9yaWdpbmFsbHkKPiA+ID4gb24gZXh0ZXJu
YWxfcGh5KSBzbyB3ZSBuZXZlciB0aG91Z2h0IHRvIGludmVzdGlnYXRlIHRoZSBwaW5jdHJsCj4g
PiA+IGNvbmZpZ3VyYXRpb24gZnVydGhlciEgVHVybnMgb3V0ICZyZ21paTJfcGlucyBuZWVkcyB0
byBiZSBkZWZpbmVkIG9uIHRoZQo+ID4gPiBldGhlcm5ldCBub2RlIGluc3RlYWQuCj4gPiAKPiA+
IFBIWXMgYXJlIGdlbmVyYWxseSBleHRlcm5hbCwgc28gcGlubXV4IG9uIHRoZW0gbWFrZXMgbm8g
c2Vuc2UuIFBIWXMgaW4KPiA+IERUIGFyZSBub3QgZGV2aWNlcyBpbiB0aGUgdXN1YWwgc2Vuc2Us
IHNvIGkgZG9uJ3QgdGhpbmsgdGhlIGRyaXZlcgo+ID4gY29yZSB3aWxsIGhhbmRsZSBwaW5tdXgg
Zm9yIHRoZW0sIGV2ZW4gaWYgeW91IGRpZCBsaXN0IHRoZW0uCj4gCj4gTm90IHN1cmUgSSB1bmRl
cnN0YW5kIHlvdXIgY29tbWVudCBoZXJlLCB0aGlzIGlzIGNvbmZpZ3VyaW5nIHRoZSBwaW5tdXgg
b24KPiB0aGUgU29DIHNpZGUgaW4gb3JkZXIgZm9yIHRoZSBzZWNvbmQgUkdNSUkgaW50ZXJmYWNl
J3MgZGF0YSBwYXRoIHRvIHdvcmsuCgpUaGUgcGlubXV4IGNvbmZpZ3VyYXRpb24gd2FzIGxpc3Rl
ZCB1bmRlciB0aGUgZXh0ZXJuYWwgUEhZIG5vZGUsIHdoaWNoCmlzIHF1dGllIHVudXN1YWwuIElu
IHRoZSBjYXNlIG9mIHBoeWxpYiBhbmQgZXh0ZXJuYWwgZXRoZXJuZXQgUEhZcywKdGhpcyBjYW4g
YmUgYSBwcm9ibGVtLgoKVGhlIHBpbm11eCBjb25maWd1cmF0aW9uIGlzIG5vcm1hbGx5IGhhbmRs
ZWQgYXQgZGV2aWNlIHByb2JlIHRpbWUgYnkKdGhlIGRldmljZSBtb2RlbCwgYnV0IHJlbWVtYmVy
IHBoeWxpYiBieXBhc3NlcyB0aGF0IHdoZW4gaXQgYXR0YWNoZXMKdGhlIGdlbmVyaWMgUEhZIGRy
aXZlciAtIG1lYW5pbmcgeW91IGRvbid0IGdldCB0aGUgcGlubXV4IGNvbmZpZ3VyZWQuCgpXaGF0
IHRoaXMgbWVhbnMgaXMgdGhhdCBwaW5tdXggY29uZmlndXJhdGlvbiBpbiBldGhlcm5ldCBQSFkg
bm9kZXMgaXMKdW5yZWxpYWJsZS4gSXQgd2lsbCBvbmx5IGhhcHBlbiBpZiB3ZSBoYXZlIGEgc3Bl
Y2lmaWMgZHJpdmVyIGZvciB0aGUKUEhZIGFuZCB0aGUgZHJpdmVyIG1vZGVsIGJpbmRzIHRoYXQg
ZHJpdmVyLgoKT2YgY291cnNlLCBpZiB3ZSBraWxsZWQgdGhlIGdlbmVyaWMgZHJpdmVyLCB0aGF0
IHdvdWxkIGdldCBhcm91bmQgdGhpcwppc3N1ZSBieSByZXF1aXJpbmcgZXZlcnkgUEhZIHRvIGhh
dmUgaXRzIG93biBzcGVjaWZpYyBkcml2ZXIsIGJ1dCB0aGVyZQp3b3VsZCBiZSBtYW55IGNvbXBs
YWludHMgYmVjYXVzZSBsaWtlbHkgbG90cyB3b3VsZCBzdG9wIHdvcmtpbmcuCgotLSAKUk1LJ3Mg
UGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNo
ZXMvCkZUVFAgaXMgaGVyZSEgNDBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2
aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
