Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i34FDYsK0ILRvPSLQo42//Fn0T5WVhWYvf38w/cGORI=; b=nF3giZDMOnWZlM
	B0OLprj2o10Eh1oJ0BN3uxQNrRHlA72sQAeG04cMfJIv/eTsUhmciNa6gORdOb8zNtlQd1KW0xoVy
	OzXWjBcqjvQc7sjPWo9ViaaehKVkR4QvIdx+rXhDLjavOVNdbnPHu1Dtydxj7VUfzQGsr2CSdc/RF
	lk83O61s/RCUgmgfvJFR/v+FBUSKI1RYjn01WbO3hxXzh1CcXlfLD83t21B6fnOfMIHxMTg3Lk5bk
	3zn0M1IpfKHZwHcBMupqT0LjMz/V5baCRu8jNMyYNsIEUWLV54XJ6gQbAPy/dzyAu6i8iOR77zHZr
	HsIGjmf7IT/7d5eR0uGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXEQ-00Eqw6-CP; Thu, 05 May 2022 08:53:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXEA-00Eqov-8L; Thu, 05 May 2022 08:52:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CF7DE1F44DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651740768;
 bh=gL+MfgXtaLijztUn2+qpxh5p8GDURmo5rL/MwSHGVsY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c98MzQTxkRnVSk9Y+nNeRtpz2nU6xrCYIWJQimUmRSwW9uenjftZc1eD/cOee1MHQ
 5G4/Tk1+ijKUdhRWjM0GwzWnHyRH5DEBBoTOD4wohGtfF8RI8OyOwzmVTKxwo1OPdg
 nrpq3cmNtYz0A4e3l37u8C/zJnM15A7vecvSz6Y9905FFqr11PRWSzjFIm10ioAVjA
 ftTVjEkvzvzTHsQfDU2ZgSuFOUWmQq//X0GizA5alJKjzMMlPAtzWrbD984EFnXcaA
 QiLKc9AgGbD0SnN9CLz+SyVzjakLqDOfvJR4dymNugj36+afvQyhQH11aK+tCLaAVx
 VXIhzovJg2miQ==
Message-ID: <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
Date: Thu, 5 May 2022 10:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
 <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_015250_483434_884A8BF2 
X-CRM114-Status: GOOD (  22.83  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMDUvMDUvMjIgMTA6NDgsIEppYXhpbiBZdSBoYSBzY3JpdHRvOgo+IE9uIFRodSwgMjAyMi0w
NS0wNSBhdCAxMDowOCArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4+
IElsIDI5LzA0LzIyIDIyOjMwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyBoYSBzY3JpdHRvOgo+
Pj4gVGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4MTkyIGFsbG93cyBzaGFy
aW5nIG9mIGFuIEkyUwo+Pj4gYnVzCj4+PiBiZXR3ZWVuIHR3byBidXNzZXMuIEFkZCBhIHBhdHRl
cm4gZm9yIHRoZXNlIHByb3BlcnRpZXMgaW4gdGhlCj4+PiBkdC1iaW5kaW5nLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbT4KPj4+IC0tLQo+Pj4KPj4+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sIHwgNQo+Pj4gKysrKysKPj4+ICAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtCj4+PiBwY20ueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLQo+Pj4gcGNt
LnlhbWwKPj4+IGluZGV4IDdhMjViYzliODA2MC4uNWIwM2M4ZGJmMzE4IDEwMDY0NAo+Pj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNt
LnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9t
dDgxOTItYWZlLXBjbS55YW1sCj4+PiBAQCAtNTQsNiArNTQsMTEgQEAgcHJvcGVydGllczoKPj4+
ICAgICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV9jbGsKPj4+ICAgICAgICAgIC0gY29uc3Q6IGF1
ZF9pbmZyYV8yNm1fY2xrCj4+PiAgICAKPj4+ICtwYXR0ZXJuUHJvcGVydGllczoKPj4+ICsgICJe
aTJzWzAtMzUtOV0tc2hhcmUkIjoKPj4+ICsgICAgZGVzY3JpcHRpb246IE5hbWUgb2YgdGhlIEky
UyBidXMgdGhhdCBpcyBzaGFyZWQgd2l0aCB0aGlzIGJ1cwo+Pj4gKyAgICBwYXR0ZXJuOiAiXkky
U1swLTM1LTldJCIKPj4+ICsKPj4+ICAgIHJlcXVpcmVkOgo+Pj4gICAgICAtIGNvbXBhdGlibGUK
Pj4+ICAgICAgLSBpbnRlcnJ1cHRzCj4+Pgo+Pgo+PiBUaGUgb25seSBvdGhlciB3YXkgb2YgZG9p
bmcgdGhpcyB3b3VsZCBiZSB0byBjb21wbGljYXRlIHRoaXMgaW4gdGhlCj4+IGRyaXZlcgo+PiBz
byB0aGF0IHdlIGNhbiBkbyBzb21ldGhpbmcgbGlrZQo+Pgo+PiAiaTJzLXNoYXJlID0gPDAgMj4i
OyAgaW5zdGVhZCBvZiAgaTJzMC1zaGFyZSA9ICJJMlMyIjsKPj4KPj4gLi4uYW5kIEkgZG9uJ3Qg
dGhpbmsgdGhhdCB0aGlzIHdvdWxkIGJlIGFueSBtb3JlIHN0cmFpZ2h0Zm9yd2FyZCB0aGFuCj4+
IHRoZQo+PiBwcm92aWRlZCB3YXkuCj4+Cj4+IFRoZXJlJ3MgYW4gaW1wcm92ZW1lbnQgdGhhdCB3
ZSBjYW4gZG8gdG8gdGhhdCBwYXR0ZXJuIGRlc2NyaXB0aW9uCj4+IHRob3VnaCwKPj4gd2hpY2gg
d291bGQgYmUgZXhwbGFpbmluZyB0aGF0IGRlY2xhcmluZyAnaTJzMC1zaGFyZSA9ICJJMlMyIicg
bWVhbnMKPj4gdGhhdAo+PiBJMlMyJ3MgZGF0YSBwaW4gd2lsbCBiZSB1c2VkIGFzIERBVEEtT1VU
LCB3aGlsZSBpMnMwIGlzIERBVEEtSU4uCj4+Cj4+IEFub3RoZXIgdGhpbmcgdGhhdCBjb21lcyB0
byBtaW5kIGhlcmUgaXMgdGhhdCB0aGlzIGlzIGEgTWVkaWFUZWsKPj4gc3BlY2lmaWMKPj4gcHJv
cGVydHkgYW5kICpub3QqIGEgZ2VuZXJpYyBvbmUsIHdoaWNoIG1lYW5zIHRoYXQgYm90aCB0aGUg
ZHJpdmVyCj4+IGFuZAo+PiB0aGlzIGJpbmRpbmcgc2hvdWxkIGJlIGZpeGVkIHRvIGdldCBhICJt
ZWRpYXRlaywiIHByZWZpeCwgc28sIHRoaXMKPj4gcHJvcGVydHkKPj4gc2hvdWxkIC0gaW4gcmVh
bGl0eSAtIGJlICJtZWRpYXRlayxpMnNbMC0zNS05XS1zaGFyZSIgaW5zdGVhZC4KPj4KPj4gSSB0
aGluayB0aGF0IGV2ZXJ5b25lIGFncmVlcyBhYm91dCB0aGF0LCBidXQgbGV0J3Mgc2VlIHdoYXQg
dGhlCj4+IG90aGVycyBzYXkuCj4+Cj4+IENoZWVycywKPj4gQW5nZWxvCj4gCj4gSGkgQW5nZWxv
LAo+IAo+ICdpMnMwLXNoYXJlID0gIkkyUzIiJyBtZWFucyB0aGF0IGlmIHdlIHdhbnQgdXNlIEky
UzAsIHRoZXJlIG5lZWQgb3Blbgo+IEkyUzIgdG8gcHJvdmlkZSBjbG9jay4gQ29udmVyc2VseSwg
aWYgd2Ugd2FudCB0byB1c2UgSTJTMiwgd2UgZG9uJ3QKPiBuZWVkIHRvIG9wZW4gSTJTMC4gSG93
ZXZlciwgTWVkaWFUZWsgSTJTMCBhbmQgSTJTMiBoYXJkd2FyZSBhcmUKPiBnZW5lcmFsbHkgZGVz
aWduZWQgYXMgaW5wdXQuIFNvIHVzdWFsbHkgd2UgdXNlICdpMnMwLXNoYXJlID0gIkkyUzEiJy4K
PiBFdmVuIG51bWJlcnMgcmVwcmVzZW50IGlucHV0LCBvZGQgbnVtYmVycyByZXByZXNlbnQgb3V0
cHV0Lgo+IAo+IFllcywgSSB0aGluayBhZGRpbmcgdGhlICJtZWRpYXRlaywiIHByZWZpeCBpcyB0
aGUgcmlnaHQgd2F5IHRvIGRlZmluZSBhCj4gbm9uLWdlbmVyaWMgcHJvcGVydHkuCj4gCgpIZWxs
byBKaWF4aW4sCgppZiBJIGdldCB0aGlzIGNvcnJlY3RseSwgaTJzMC1zaGFyZSA9ICJJMlMyIiB3
b3VsZCBiZSAqaW52YWxpZCouLi4gYXMgeW91Cmp1c3QgZXhwbGFpbmVkLCBpMnNYLCB3aGVyZToK
ClggPSBldmVuIG51bWJlciAtPiBhbHdheXMgREFUQSBJTgpYID0gb2RkIG51bWJlciAgLT4gYWx3
YXlzIERBVEEgT1VUCgouLi50aGlzIG1lYW5zIHRoYXQgdGhlIGR0LWJpbmRpbmcgbmVlZHMgYSBw
YXR0ZXJuIHRvIHNwZWNpZnkgdGhhdCBvbmx5IG9kZApjYW4gYmUgYXNzaWduZWQgdG8gb25seSBl
dmVuLgoKTmljb2xhcywgdGFrZSBub3RlISA6LSkgOi0pCgpUaGFua3MsCkFuZ2VsbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
