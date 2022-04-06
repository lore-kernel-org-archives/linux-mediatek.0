Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 22:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYUcmmq4KJMo0uJcxC11oQbD8oWHVxXePR5vq00cdWs=; b=qWVieVhOgxc7+g
	wl+u1Lxt3OAjlbQhskBKmrh5Dmh0lEDdugeSz5SXm5VAyhLnRGrjPIdvf2gtm3Z/BhjglsU0fiKY6
	gQjJsiKRxEPc8YtDCDhGu0C/Vku12k7V7K0C20uZBGl90LTWX+jxWA4X3T3oAFADKrC6iu2scy0kd
	7DzzRVGoc2iXW1ZvBwvLlEs76cp99qscxD5tYPPuZ80r2eENTVlzvbhblGhjFEUqgIE3ad2SSpggZ
	7Pbc4ZqC+w2oJS3R/BaP+JCh5H9I6hO7QlNukOFtRre/YZ443b/AypWPqfF7ScxC/Ha1xx50ehJpS
	mxSmHMRK9PNU2bS5lr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncEFf-0089A2-Eg; Wed, 06 Apr 2022 22:35:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncEFU-00898m-Ez; Wed, 06 Apr 2022 22:35:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CDF7CB825D3;
 Wed,  6 Apr 2022 22:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8E5C385A3;
 Wed,  6 Apr 2022 22:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649284533;
 bh=WtvLwqpqfTA6i1bljoO86kqfUjW/XBPRM3YdjFro7PA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lNvF2AoNmk1xXKVRvbDaaK+p+djtgyQNYLbZJWSuSkk9YSx1S2sklWDIBQh/5bjey
 xJQMHE7148QlIcJ7b5YSGvsFoj93HMeb907dHsO8vYd8je6DBlbTJfyII9O2jGaa9E
 b+bZyn25ClzpIS9klY6OraOKJbbrpy0GwsJNpMNozpO1VlvcmYrs0DdXcXv6IqrKyi
 1dbh1xvRJ4zqYwngRRRQuu5ewhFRBLl+23lb44GYbWCksebVsKCSX0yhOcov9815P6
 Y0FL9zyy2SBYooeG0cdsR+2VyqPsDkQamxclj1C7nrF8G28LGjlMn1JaI5dToVHBTF
 x0v/qH0jkR0Wg==
Date: Thu, 7 Apr 2022 00:35:26 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 0/9] net: dsa: mt7530: updates for phylink changes
Message-ID: <20220407003526.7d4c2ebb@thinkpad>
In-Reply-To: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
References: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_153536_834608_2E9B5215 
X-CRM114-Status: GOOD (  22.86  )
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

T24gV2VkLCA2IEFwciAyMDIyIDEwOjQ5OjE2ICswMTAwCiJSdXNzZWxsIEtpbmcgKE9yYWNsZSki
IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgoKPiBIaSwKPiAKPiBUaGlzIHJldmlzZWQg
c2VyaWVzIGlzIGEgcGFydGlhbCBjb252ZXJzaW9uIG9mIHRoZSBtdDc1MzAgRFNBIGRyaXZlciB0
bwo+IHRoZSBtb2Rlcm4gcGh5bGluayBpbmZyYXN0cnVjdHVyZS4gVGhpcyBkcml2ZXIgaGFzIHNv
bWUgZXhjZXB0aW9uYWwKPiBjYXNlcyB3aGljaCBwcmV2ZW50IC0gYXQgdGhlIG1vbWVudCAtIGl0
cyBmdWxsIGNvbnZlcnNpb24gKHBhcnRpY3VsYXJseQo+IHdpdGggdGhlIEF1dG9uZWcgYml0KSB0
byB1c2luZyBwaHlsaW5rX2dlbmVyaWNfdmFsaWRhdGUoKS4KPiAKPiBQYXRjaCAxIGZpeGVzIHRo
ZSBpbmNvcnJlY3QgdGVzdCBoaWdobGlnaHRlZCBpbiB0aGUgZmlyc3QgUkZDIHNlcmllcy4KPiAK
PiBQYXRjaCAyIGZpeGVzIHRoZSBpbmNvcnJlY3QgYXNzdW1wdGlvbiB0aGF0IFJHTUlJIGlzIHVu
YWJsZSB0byBzdXBwb3J0Cj4gMTAwMEJBU0UtWC4KPiAKPiBQYXRjaCAzIHBvcHVsYXRlcyB0aGUg
c3VwcG9ydGVkX2ludGVyZmFjZXMgZm9yIGVhY2ggcG9ydAo+IAo+IFBhdGNoIDQgcmVtb3ZlcyB0
aGUgaW50ZXJmYWNlIGNoZWNrcyB0aGF0IGJlY29tZSB1bm5lY2Vzc2FyeSBhcyBhIHJlc3VsdAo+
IG9mIHBhdGNoIDMuCj4gCj4gUGF0Y2ggNSByZW1vdmVzIHVzZSBvZiBwaHlsaW5rX2hlbHBlcl9i
YXNleF9zcGVlZCgpIHdoaWNoIGlzIG5vIGxvbmdlcgo+IHJlcXVpcmVkIGJ5IHBoeWxpbmsuCj4g
Cj4gUGF0Y2ggNiBiZWNvbWVzIHBvc3NpYmxlIGFmdGVyIHBhdGNoIDUsIG9ubHkgaW5kaWNhdGlu
ZyB0aGUgZXRodG9vbAo+IG1vZGVzIHRoYXQgY2FuIGJlIHN1cHBvcnRlZCB3aXRoIGEgcGFydGlj
dWxhciBpbnRlcmZhY2UgbW9kZSAtIHRoaXMKPiBpbnZvbHZlcyByZW1vdmluZyBzb21lIG1vZGVz
IGFuZCBhZGRpbmcgb3RoZXJzIGFzIHBlciBwaHlsaW5rCj4gZG9jdW1lbnRhdGlvbi4KPiAKPiBQ
YXRjaCA3IHN3aXRjaGVzIHRoZSBkcml2ZXIgdG8gdXNlIHBoeWxpbmtfZ2V0X2xpbmttb2Rlcygp
LCB3aGljaCBtb3Zlcwo+IHRoZSBkcml2ZXIgYXMgY2xvc2UgYXMgd2UgY2FuIHRvIHBoeWxpbmtf
Z2VuZXJpY192YWxpZGF0ZSgpIGR1ZSB0byB0aGUKPiBBdXRvbmVnIGJpdCBpc3N1ZSBtZW50aW9u
ZWQgYWJvdmUuCj4gCj4gUGF0Y2ggOCBjb252ZXJ0cyB0aGUgZHJpdmVyIHRvIHRoZSBwaHlsaW5r
IHBjcyBzdXBwb3J0LCByZW1vdmluZyBhIGJ1bmNoCj4gb2YgZHJpdmVyIHByaXZhdGUgaW5kaXJl
Y3RlZCBtZXRob2RzLiBXZSBpbmNsdWRlIFRSR01JSSBhcyBhIFBDUyBldmVuCj4gdGhvdWdoIHN0
cmljdGx5IFRSR01JSSBkb2VzIG5vdCBoYXZlIGEgUENTLiBUaGlzIGlzIGNvbnZlbmllbnQgdG8g
YWxsb3cKPiB0aGUgY2hhbmdlIGluIHBhdGNoIDkgdG8gYmUgbWFkZS4KPiAKPiBQYXRjaCA5IG1v
dmVzIHRoZSBzcGVjaWFsIGF1dG9uZWcgaGFuZGxpbmcgdG8gdGhlIFBDUyB2YWxpZGF0ZSBtZXRo
b2QsCj4gd2hpY2ggbWVhbnMgd2UgY2FuIGNvbnZlcnQgdGhlIE1BQyBzaWRlIHRvIHRoZSBnZW5l
cmljIHZhbGlkYXRvci4KPiAKPiBQYXRjaCAxMCBtYXJrcyB0aGUgZHJpdmVyIGFzIG5vbi1sZWdh
Y3kuCj4gCj4gVGhlIHNlcmllcyB3YXMgcG9zdGVkIG9uIDIzIEZlYnJ1YXJ5LCBhbmQgYSBwaW5n
IHNlbnQgb24gMyBNYXJjaCwgYnV0Cj4gbm8gZmVlZGJhY2sgaGFzIGJlZW4gcmVjZWl2ZWQuIFRo
ZSBwcmV2aW91cyBwb3N0aW5nIGFsc28gcmVjZWl2ZWQgbm8KPiBmZWVkYmFjayBvbiB0aGUgYWN0
dWFsIHBhdGNoZXMgZWl0aGVyLgo+IAo+ICBkcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgfCAzMzAg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVy
cy9uZXQvZHNhL210NzUzMC5oIHwgIDI2ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTkgaW5z
ZXJ0aW9ucygrKSwgMTk3IGRlbGV0aW9ucygtKQo+IAoKVGVzdGVkLWJ5OiBNYXJlayBCZWjDum4g
PGthYmVsQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
