Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C865C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 15:24:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9869B206DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 15:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wjuI+7pV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zXJGw6+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9869B206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yZM6rRIWxIwnJ04GAsbRiPmKHHZFhDNRdzjdrqRis38=; b=wjuI+7pVW7E8wFkt8rYfNDqH0
	v43bYDaZVuK/J5IGEH0JuPE1rMNs5Q1LXFS1rkPDMGwW90/7c2APHQOMWEuPIMgtichyhodJUE7OG
	UQ1c6AT59HXVka4aI5iBLOawdOWQkVMUXBPWTvHr1NnqJF4td7Z724ZoTmnEPo9c1ftMtL6pRlPTs
	lV7D2dEBa8XvB6AdMfYcEWIQIlqcT5mRQzoGXfgnXUR3U2RP/LnWuniJjSw3gjFLCTGzlPKnIDAAU
	OnQCGFE7ocxgLgPnOzbCdjMwUgLeBTbE303f0VtBQZDhVk4ltboufeuUeltt36vDTerwtZrMnULj/
	R6MbrMZjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k83T8-0002fj-CM; Tue, 18 Aug 2020 15:24:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k83Sq-0002V5-4V
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 15:23:54 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2DF5206DA;
 Tue, 18 Aug 2020 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597764229;
 bh=HpQrw3dSRuULmu7pAjgDli/38IUo+15Aerb5BtWgGbk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zXJGw6+41RMiXqsi8HA1lcWAoe+ELCgZ+17PvoyKTcUMnCSfLrCqiTnRF7HlVDJx8
 Fkmv01FEVd4DxYxtfM35x8srBSm73NzP0cIc225181ZGgDcujUtT8OJpY61N0gx2Ft
 UuhvzcaHhJLMEIC1K6oh5TaKhBgDMaqEuVCdSoGE=
Date: Tue, 18 Aug 2020 08:23:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
Message-ID: <20200818082347.353fe926@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_112352_371661_21C0137C 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, andrew@lunn.ch, frank-w@public-files.de,
 f.fainelli@gmail.com, dqfext@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxOCBBdWcgMjAyMCAxNToxNDoxMCArMDgwMCBMYW5kZW4gQ2hhbyB3cm90ZToKPiBB
ZGQgbmV3IHN1cHBvcnQgZm9yIE1UNzUzMToKPiAKPiBNVDc1MzEgaXMgdGhlIG5leHQgZ2VuZXJh
dGlvbiBvZiBNVDc1MzAuIEl0IGlzIGFsc28gYSA3LXBvcnRzIHN3aXRjaCB3aXRoCj4gNSBnaWdh
IGVtYmVkZGVkIHBoeXMsIDIgY3B1IHBvcnRzLCBhbmQgdGhlIHNhbWUgTUFDIGxvZ2ljIG9mIE1U
NzUzMC4gQ3B1Cj4gcG9ydCA2IG9ubHkgc3VwcG9ydHMgU0dNSUkgaW50ZXJmYWNlLiBDcHUgcG9y
dCA1IHN1cHBvcnRzIGVpdGhlciBSR01JSQo+IG9yIFNHTUlJIGluIGRpZmZlcmVudCBIVyBza3Uu
IER1ZSB0byBTR01JSSBpbnRlcmZhY2Ugc3VwcG9ydCwgcGxsLCBhbmQKPiBwYWQgc2V0dGluZyBh
cmUgZGlmZmVyZW50IGZyb20gTVQ3NTMwLiBUaGlzIHBhdGNoIGFkZHMgZGlmZmVyZW50IGluaXRp
YWwKPiBzZXR0aW5nLCBhbmQgU0dNSUkgcGh5bGluayBoYW5kbGVycyBvZiBNVDc1MzEuCj4gCj4g
TVQ3NTMxIFNHTUlJIGludGVyZmFjZSBjYW4gYmUgY29uZmlndXJlZCBpbiBmb2xsb3dpbmcgbW9k
ZToKPiAtICdTR01JSSBBTiBtb2RlJyB3aXRoIGluLWJhbmQgbmVnb3RpYXRpb24gY2FwYWJpbGl0
eQo+ICAgICB3aGljaCBpcyBjb21wYXRpYmxlIHdpdGggUEhZX0lOVEVSRkFDRV9NT0RFX1NHTUlJ
Lgo+IC0gJ1NHTUlJIGZvcmNlIG1vZGUnIHdpdGhvdXQgaW4tYm5hZCBuZWdvdGlhdGlvbgo+ICAg
ICB3aGljaCBpcyBjb21wYXRpYmxlIHdpdGggMTBCLzhCIGVuY29kaW5nIG9mCj4gICAgIFBIWV9J
TlRFUkZBQ0VfTU9ERV8xMDAwQkFTRVggd2l0aCBmaXhlZCBmdWxsLWR1cGxleCBhbmQgZml4ZWQg
cGF1c2UuCj4gLSAyLjUgdGltZXMgZmFzdGVyIGNsb2NrZWQgJ1NHTUlJIGZvcmNlIG1vZGUnIHdp
dGhvdXQgaW4tYm5hZCBuZWdvdGlhdGlvbgo+ICAgICB3aGljaCBpcyBjb21wYXRpYmxlIHdpdGgg
MTBCLzhCIGVuY29kaW5nIG9mCj4gICAgIFBIWV9JTlRFUkZBQ0VfTU9ERV8yNTAwQkFTRVggd2l0
aCBmaXhlZCBmdWxsLWR1cGxleCBhbmQgZml4ZWQgcGF1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TGFuZGVuIENoYW8gPGxhbmRlbi5jaGFvQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBT
ZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+CgpQbGVhc2UgZml4IHRoZXNlIFc9MSB3
YXJuaW5nczoKCi4uL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYzoxOTc2OjE6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbXQ3NTMxX3NnbWlpX2xpbmtfdXBfZm9yY2XigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQogMTk3NiB8IG10NzUzMV9zZ21paV9saW5rX3VwX2ZvcmNl
KHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCiAgICAgIHwgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KLi4vZHJpdmVycy9uZXQvZHNhL210NzUzMC5jOjIwODE6Njogd2FybmluZzog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhtdDc1MzFfc2dtaWlfcmVzdGFydF9hbuKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCiAyMDgxIHwgdm9pZCBtdDc1MzFfc2dtaWlfcmVzdGFydF9h
bihzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0KQogICAgICB8ICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KLi4vZHJpdmVycy9uZXQvZHNhL210NzUzMC5jOjE5NzY6MTogd2Fybmlu
Zzogc3ltYm9sICdtdDc1MzFfc2dtaWlfbGlua191cF9mb3JjZScgd2FzIG5vdCBkZWNsYXJlZC4g
U2hvdWxkIGl0IGJlIHN0YXRpYz8KLi4vZHJpdmVycy9uZXQvZHNhL210NzUzMC5jOjIwODE6Njog
d2FybmluZzogc3ltYm9sICdtdDc1MzFfc2dtaWlfcmVzdGFydF9hbicgd2FzIG5vdCBkZWNsYXJl
ZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
