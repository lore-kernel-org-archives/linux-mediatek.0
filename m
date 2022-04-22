Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F341C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SpaeZzKiaD8whXvojDQj/yIKomm4vH+V5XL3d9m9HA=; b=wBYfOVHovocpu6
	kSRWPRoLrMzDxuPWKIhLaviNKHSQrgo6stXxYTJbrx0xvgkS0BA91whBZlO/u4Q+6QanajLoFeAxe
	Mjb71YIt5x3n0yNy8zQDl5w0+fVIrPjuxuPjLLjHRnMKKmiuMS6SNd3UGrysR2m4/8UrL6aHoV0A1
	bK4ir0WmXs/dbbg6GmbUsLvjdzmXwkEOnxbHI1t20rbM0v1QCJ7q4RBjaNSkXaPeCQgiw9m/Zdw5Z
	VKiDyZabL5nQtXFJZ2oS6s2vlZni7a/zSnfHrglwP47RAtCdw7EeR4vFaOM2EjEUo/5oxxb+NkzAc
	aHJaboOAMZYFKGhm5F4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmkv-00GX4A-As; Fri, 22 Apr 2022 06:27:01 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmYg-00GR1j-MS; Fri, 22 Apr 2022 06:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1650608037; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Upc29wFEZbY9EpRHZYitREhkrRXSEoAPDtx8gDCsqYwhKkJNleVA5Fm4X91oEzQuYjB/8+Peb6ZTQLcub1fM3CiTv2KxB8Svg+igpE3DNeIc7BDu9BbhW2A0sUyRjzw/JZx26VqggDaF46jej7IGF4Y/lDzGmA/zFipRv9C5J3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1650608037;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=UFvld06qgXbqQi+xJzwXOyVaCMSC9MrrcLtY4RAgqNI=; 
 b=FfqMs5rwPZedfIDvP5jj+A32qjrU7nt89H46DUvNMa/vwrzj2jMNwbsj/4WeERRRX8cID6b+2fn0+Jny5wZe383wv34fq9+YrkznEULl0mppOhVEiYSL4iwTUA/kcZYig3/stDaP4uzPeUKHw9iAtKBNmW6ZlbwDHTgjvMp0LcY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650608037; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=UFvld06qgXbqQi+xJzwXOyVaCMSC9MrrcLtY4RAgqNI=;
 b=WfNpEQFRk5/DPSn8YyQZnbOY1qy0b5Ub/T9xf0jbigszz5Aipcm4k81w6k/txiz2
 xhD+WXL4Z3NLjJ8sy4UzEIjCndqiJ+gIbYrA/S81g9mgbV/M5woDGiFw6GijzyrsTHB
 c8W44JeyWq3sT0KWGLPoMZzDn5P6Gc+B3saEqbOs=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1650608035654467.1535935949838;
 Thu, 21 Apr 2022 23:13:55 -0700 (PDT)
Message-ID: <6cdec3bc-4715-29c8-f4a1-df1408940a75@arinc9.com>
Date: Fri, 22 Apr 2022 09:13:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
 <26418320-64e0-3ed2-c792-7f72878b7592@arinc9.com>
 <CAMhs-H_d8jUa4=4eVjQxo+h-XeRgiMYC1H_xYtPLb8jHDVYL2Q@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H_d8jUa4=4eVjQxo+h-XeRgiMYC1H_xYtPLb8jHDVYL2Q@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_231422_890478_16C92CED 
X-CRM114-Status: GOOD (  13.44  )
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

T24gMjIvMDQvMjAyMiAwODoyMSwgU2VyZ2lvIFBhcmFjdWVsbG9zIHdyb3RlOgo+IEhpIEFyaW7D
pywKPiAKPiBPbiBUaHUsIEFwciAyMSwgMjAyMiBhdCA0OjQ0IFBNIEFyxLFuw6cgw5xOQUwgPGFy
aW5jLnVuYWxAYXJpbmM5LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDIxLzA0LzIwMjIgMTc6MjcsIExp
bnVzIFdhbGxlaWogd3JvdGU6Cj4+PiBPbiBXZWQsIEFwciAxMywgMjAyMiBhdCA4OjA4IEFNIEFy
xLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+IFRoaXMg
cGF0Y2ggc2VyaWVzIGJyaW5ncyBjb21wbGV0ZSByZWZhY3RvcmluZyB0byB0aGUgUmFsaW5rIHBp
bmN0cmwgZHJpdmVyCj4+Pj4gYW5kIGl0cyBzdWJkcml2ZXJzLgo+Pj4KPj4+IEkganVzdCBtZXJn
ZWQgYWxsIHRoZSBwYXRjaGVzLCB0aGUgY29tbWVudHMgc2VlbSBtaW5vciBhbmQgYW55IGZ1cnRo
ZXIKPj4+IGZpeGVzIGNhbiBjZXJ0YWlubHkgYmUgZG9uZSBvbiB0b3Agb2YgdGhpcy4gQW55b25l
IGludGVyZXN0ZWQgaW4gcmFsaW5rCj4+PiB3b3JraW5nIG5pY2VseSBpcyBsaWtlbHkgaW4gdGhl
IHRocmVhZCBhbmQgd2UgbW9zdGx5IGNhcmUgYWJvdXQgdGhhdCB0aGlzCj4+PiB3b3JrcyBmb3Ig
T3BlbldydCwgYW5kIGlmIGl0IHdvcmtzIGZvciB0aGVtIHdlIGFyZSBoYXBweS4KPj4+Cj4+Pj4g
ICAgIG1pcHM6IGR0czogcmFsaW5rOiBtdDc2MjE6IHVzZSB0aGUgbmV3IGNvbXBhdGlibGUgc3Ry
aW5nIGZvciBNVDc2MjEgcGluY3RybAo+Pj4KPj4+IFRoaXMgd2FzIGEgYml0IHNjYXJ5IHNpbmNl
IHdlIHVzdWFsbHkgdGFrZSB0aGVzZSB0aHJvdWdoIHRoZSByZXNwZWN0aXZlCj4+PiBTb0MgdHJl
ZSwgYnV0IEkganVzdCBhcHBsaWVkIGl0IGFueXdheSwgaXQgbWFrZXMgbG9naWNhbCBzZW5zZSBp
biB0aGUKPj4+IHNlcmllcy4KPj4+Cj4+PiBJIGhvcGUgaXQgd2lsbCBub3QgbGVhZCB0byBjb25m
bGljdHMuCj4+Pgo+Pj4gR29vZCB3b3JrIHdpdGggdGhpcyBzZXJpZXMhCj4+Cj4+IFRoYW5rcy4g
VGhlcmUgaXMgYSB2MiBvZiB0aGlzIHNlcmllcyB3aGljaCBoYXMgYmVlbiB3YWl0aW5nIGZvciBh
IHdlZWssCj4+IEkgaG9wZSB0aGF0IHdhcyB0aGUgb25lIHlvdSBhcHBsaWVkIGFzIHlvdSByZXBs
aWVkIHVuZGVyIHYxIChJJ20gbm90Cj4+IHN1cmUgd2hpY2ggcmVwb3NpdG9yeSB5b3UgYXBwbGll
ZCB0aGlzIHNvIEkgY2FuJ3QgY2hlY2sgbXlzZWxmKS4KPiAKPiBMaW51cyBhZGRzIHBhdGNoZXMg
dGhyb3VnaCB0aGUgbGludXgtcGluY3RybCB0cmVlIGFzIHBpbmN0cmwgbWFpbnRhaW5lci4gQ2hl
Y2s6Cj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bGludXN3L2xpbnV4LXBpbmN0cmwuZ2l0L2xvZy8/aD1kZXZlbAoKVGhhbmtzIFNlcmdpby4gSSBz
ZWUgdjEgd2FzIGFwcGxpZWQsIG9vcHMuIFdoYXQgdG8gZG8/CgpBcsSxbsOnCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
