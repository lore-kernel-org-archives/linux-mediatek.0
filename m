Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B5DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AF8OyvKTXctxWWIqYYNRSaWnHO/9QX1VRe0tn2At+2A=; b=poqLBkMc3Q7tuV
	twuaiFmI99YKnauzDKyn8cN/Ptmz6I9H0ScgHSXBgEGKuZfo77IM7/WYtZGBIgGJ7C3PJVreTS6I6
	VaGTxeqzdVFDpMebp1+XYMcc2m29K8N8FCrC3JxA8teK/vPnkUzcSXVchexlq0o78IIBTmjBJsk+k
	PkIrbUX4rw8h+QcNiFbMnDi+sEp4gVdNVkHSCmzSNZuEXWpz2CfBtUSmRCiCZs7B4f5WKzQf8BNJy
	yW0xSYYYoPvI5wfXbP81fes8+fYw8vREdx/EdpO7EsaoIc4f14BUXSKpoWUdAh1mvFrp/Gasu1Iqi
	Vz/RllcWD70Iq3yOV8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhY2h-00DqY4-QQ; Thu, 21 Apr 2022 14:44:23 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhY2S-00DqOi-DK; Thu, 21 Apr 2022 14:44:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1650552224; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nbdQctQ3NMB6Azygoollyi98j1+gOoW3m7kP8+kIzEJgV2tGoTDPbmS2Ivz8y7qFshxDSrpxgwFk5dgcGmgaee53NjiA8a9qEve8uyAWFYAp0dVaVaYM4xhHBpoyJCz95OKSxBM9Jj5VrWQ+FmMSMjKFGlG1AodNSubN9UMc2z8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1650552224;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ezL7d6UT6p1AeMHEGpnZeZmFAvnmD9WI18X7MSI3d/k=; 
 b=VH/Mi58H9v1KRSjeNyH5/jJxO+R2Pmhgf0IS1rGU8+ye0a/bG0kPsmQoiIEznVwPloJG1B626jzE9vE4hYg+7NfgF9Q07ENZZCkLD6azij+Onman5MacM6DnulqmGLv187YXghbXCu/WPAIw21QJvHOBwTvjs90U0dhPSQ28whk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650552224; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ezL7d6UT6p1AeMHEGpnZeZmFAvnmD9WI18X7MSI3d/k=;
 b=AUzbWmEBG1bhlGXpDr/3Us4XJfC5rsXEH98tYb0vsCF9C8tTnA9sUo/cF5OGp4fq
 MB+7YT28SwlppWnpZxqptnOLD8Ug3lDZ2CtaQWCcDrxus/QqBBTEG5DsOhdVCDbf/yc
 Uo0EkzlovbchG+nUvwQGgYsJCZ2swQEdYIHZJStE=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1650552221122931.4968849395214;
 Thu, 21 Apr 2022 07:43:41 -0700 (PDT)
Message-ID: <26418320-64e0-3ed2-c792-7f72878b7592@arinc9.com>
Date: Thu, 21 Apr 2022 17:43:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_074408_556185_97FA4AC3 
X-CRM114-Status: GOOD (  16.21  )
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

T24gMjEvMDQvMjAyMiAxNzoyNywgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBXZWQsIEFwciAx
MywgMjAyMiBhdCA4OjA4IEFNIEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4g
d3JvdGU6Cj4gCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGJyaW5ncyBjb21wbGV0ZSByZWZhY3Rvcmlu
ZyB0byB0aGUgUmFsaW5rIHBpbmN0cmwgZHJpdmVyCj4+IGFuZCBpdHMgc3ViZHJpdmVycy4KPiAK
PiBJIGp1c3QgbWVyZ2VkIGFsbCB0aGUgcGF0Y2hlcywgdGhlIGNvbW1lbnRzIHNlZW0gbWlub3Ig
YW5kIGFueSBmdXJ0aGVyCj4gZml4ZXMgY2FuIGNlcnRhaW5seSBiZSBkb25lIG9uIHRvcCBvZiB0
aGlzLiBBbnlvbmUgaW50ZXJlc3RlZCBpbiByYWxpbmsKPiB3b3JraW5nIG5pY2VseSBpcyBsaWtl
bHkgaW4gdGhlIHRocmVhZCBhbmQgd2UgbW9zdGx5IGNhcmUgYWJvdXQgdGhhdCB0aGlzCj4gd29y
a3MgZm9yIE9wZW5XcnQsIGFuZCBpZiBpdCB3b3JrcyBmb3IgdGhlbSB3ZSBhcmUgaGFwcHkuCj4g
Cj4+ICAgIG1pcHM6IGR0czogcmFsaW5rOiBtdDc2MjE6IHVzZSB0aGUgbmV3IGNvbXBhdGlibGUg
c3RyaW5nIGZvciBNVDc2MjEgcGluY3RybAo+IAo+IFRoaXMgd2FzIGEgYml0IHNjYXJ5IHNpbmNl
IHdlIHVzdWFsbHkgdGFrZSB0aGVzZSB0aHJvdWdoIHRoZSByZXNwZWN0aXZlCj4gU29DIHRyZWUs
IGJ1dCBJIGp1c3QgYXBwbGllZCBpdCBhbnl3YXksIGl0IG1ha2VzIGxvZ2ljYWwgc2Vuc2UgaW4g
dGhlCj4gc2VyaWVzLgo+IAo+IEkgaG9wZSBpdCB3aWxsIG5vdCBsZWFkIHRvIGNvbmZsaWN0cy4K
PiAKPiBHb29kIHdvcmsgd2l0aCB0aGlzIHNlcmllcyEKClRoYW5rcy4gVGhlcmUgaXMgYSB2MiBv
ZiB0aGlzIHNlcmllcyB3aGljaCBoYXMgYmVlbiB3YWl0aW5nIGZvciBhIHdlZWssIApJIGhvcGUg
dGhhdCB3YXMgdGhlIG9uZSB5b3UgYXBwbGllZCBhcyB5b3UgcmVwbGllZCB1bmRlciB2MSAoSSdt
IG5vdCAKc3VyZSB3aGljaCByZXBvc2l0b3J5IHlvdSBhcHBsaWVkIHRoaXMgc28gSSBjYW4ndCBj
aGVjayBteXNlbGYpLgoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LWFybS1rZXJuZWwvbGlzdC8/c2VyaWVzPTYzMjM3MAoKQXLEsW7DpwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
