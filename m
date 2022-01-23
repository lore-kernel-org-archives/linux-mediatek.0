Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F149FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jan 2022 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgVSFKZSaWlKx7C6KMMdn7JukfDo6ObYpIHmOGRocZc=; b=xxtBPuZdVtBcSe
	7CS2neSQohbTL6YRuLdRaA8LREEVrvcG0GvdpCDlL8N++aNPgIMqDSGxXQB5Sx6HexGSxRypQ3je8
	jyhKEnbg4Qj2Vrp/qTT+MTitpBzhuNCrkFFezZORN+BHwkPllVdCVnTeorDjNtSQ7asnhUv8funH+
	vEhM7P5VU9FqNyijwRfaVaMTshJnyjnM8twVZyegmQd5ESdM5yml8BWDhUejaX6dOJHp6TQKdfviw
	HhGamsOCjCHGu2xh0yPcDLnbSDIh+tNN4O4b0S/YdR2PwsndwdpBzJd3uoT2BVellNnRRUqQpDq3h
	yZ5qhXbVk7EqBnQWERNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBely-0014ZN-7W; Sun, 23 Jan 2022 15:27:18 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBelu-0014XM-KR; Sun, 23 Jan 2022 15:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=CDXH3slO3ImdP5p+Qxn309qZZbRCzo4mZK6/h2SqEPI=; b=Px
 ZodgiK3xqJxqUn06GVYRp3qh+CtF8LPumMDL3kOpW4O4W3gNg5pi68ozY97QXkzF7BxLCCy7rsf1R
 4SMD2uklnSJO0yWmyQH/1VY8fA87yX4XLuvpRYlus34qOGJpai14qqxUGABTzu9GHIibeL9gXhk3y
 hjTSY1hcs0wAOwM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nBelc-002OC8-St; Sun, 23 Jan 2022 16:26:56 +0100
Date: Sun, 23 Jan 2022 16:26:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: DENG Qingfang <dqfext@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, linux-mips@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 openwrt-devel@lists.openwrt.org, erkin.bozoglu@xeront.com
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
Message-ID: <Ye1zwIFUa5LPQbQm@lunn.ch>
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
 <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
 <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072714_714723_2AB52ACA 
X-CRM114-Status: GOOD (  12.57  )
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

T24gU3VuLCBKYW4gMjMsIDIwMjIgYXQgMTE6MzM6MDRBTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBIZXkgRGVuZywKPiAKPiBPbiAyMy8wMS8yMDIyIDA5OjUxLCBERU5HIFFpbmdmYW5n
IHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IERvIHlvdSBzZXQgdGhlIGV0aGVybmV0IHBpbm11eCBj
b3JyZWN0bHk/Cj4gPiAKPiA+ICZldGhlcm5ldCB7Cj4gPiAgICAgIHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7Cj4gPiAgICAgIHBpbmN0cmwtMCA9IDwmcmdtaWkxX3BpbnMgJnJnbWlpMl9waW5z
ICZtZGlvX3BpbnM+Owo+ID4gfTsKPiAKPiBUaGlzIGZpeGVkIGl0ISBXZSBkaWQgaGF2ZSAmcmdt
aWkyX3BpbnMgb24gdGhlIGdtYWMxIG5vZGUgKGl0IHdhcyBvcmlnaW5hbGx5Cj4gb24gZXh0ZXJu
YWxfcGh5KSBzbyB3ZSBuZXZlciB0aG91Z2h0IHRvIGludmVzdGlnYXRlIHRoZSBwaW5jdHJsCj4g
Y29uZmlndXJhdGlvbiBmdXJ0aGVyISBUdXJucyBvdXQgJnJnbWlpMl9waW5zIG5lZWRzIHRvIGJl
IGRlZmluZWQgb24gdGhlCj4gZXRoZXJuZXQgbm9kZSBpbnN0ZWFkLgoKUEhZcyBhcmUgZ2VuZXJh
bGx5IGV4dGVybmFsLCBzbyBwaW5tdXggb24gdGhlbSBtYWtlcyBubyBzZW5zZS4gUEhZcyBpbgpE
VCBhcmUgbm90IGRldmljZXMgaW4gdGhlIHVzdWFsIHNlbnNlLCBzbyBpIGRvbid0IHRoaW5rIHRo
ZSBkcml2ZXIKY29yZSB3aWxsIGhhbmRsZSBwaW5tdXggZm9yIHRoZW0sIGV2ZW4gaWYgeW91IGRp
ZCBsaXN0IHRoZW0uCgpUaGlzIGNvdWxkIGJlIGludGVyZXN0aW5nIGZvciB0aGUgRFQgY29tcGxp
YW5jZSBjaGVja2VyLiBJZGVhbGx5IHdlCndhbnQgaXQgdG8gd2FybiBpZiBpdCBmaW5kcyBhIHBp
bm11eCBjb25maWd1cmF0aW9uIGluIGEgUEhZIG5vZGUuCgpJdCBhbHNvIHNvdW5kcyBsaWtlIHlv
dSBoYWQgdGhlbSBzb21ld2hlcmUgZWxzZSB3cm9uZz8KCiAgICAgQW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
