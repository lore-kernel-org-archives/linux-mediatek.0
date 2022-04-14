Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A63C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2ro1gMXd2Wfju92OoF85FHy8RPf+31ORzeJkHZefis=; b=cU1ioQE1AoueRl
	9oE8uGoLq2rQrskhzVt13pWmHKzCGVcyWud3/6JGiFbH8NX53VMCBs8aZI6haDsVHRDgYVB+mWKJ9
	T1ETqgxnF17qcRTPCSw2D3KP3ld3Om6YmpKbcUNl6b4pseACzYEb7shbC+Vq7Ak2GLdEqgimJh/XC
	cAv7rMruCUC5HK6xfR+h22GfyfcCi3VAFtA/GXB4foti+WMVSaiFm6LFb68YG6lX0nw+6zaKArYOs
	h5nWEcpENWNw39pr6n+ITx/fSe89DXGaSRM9l/hdKQN5ydJRHvG+FN9B+Kht+wcyCHGoSTkpkQ88z
	yp4AzHHJmlNx9Bp/wJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nev0J-004acm-4b; Thu, 14 Apr 2022 08:39:03 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nev05-004aX3-NX; Thu, 14 Apr 2022 08:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649925521; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NvD+He9LTHj4iPrpnA0nshq/DhpIAe2/QeIQIih2Va3vqj5AZCXdwggyysDWJF195Jcz4EizJ0tJlP2G/qLtn/OSOeFol1tRye3EDPEcbBboRd/hbQ5Oz8EU9AkZ7Zx8D90l7bB4zg4sYNnBhSd0jP9GhnI6gGMvkdKwNnWUH+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649925521;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=YYffcehGFoYVVT+n2RAolMjOhDAqqdJAaaNaFG5yQqU=; 
 b=ZLJ4342N5Q9Y4GPwgmzX2YMiWc2c4O8QTVwobaJN0dnZ6YgMJzyq2D9iCFpWqrThViLJp/jgnS9VKSpHVODVB74iI1b9ITvhSK+cHTg4cmlQXMIHRWy3L6UB9Edu8QCnJjPh3ZKE/ueSmZ0SyRWPSohw/E3rBRW4I6gevYm2v/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649925521; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=YYffcehGFoYVVT+n2RAolMjOhDAqqdJAaaNaFG5yQqU=;
 b=J0GqQTvciMcJUvBhIOBR9sw9kTm2fxjym5o68F4guSg+XqOUesLPNJSQXA1Em2VQ
 mn5dZwh+e6q6uOFVmIb56Qv7EU6Dn2/9mfNQSTH8rRtG2hq2pDLYJNzRSLvv6oV3vIV
 KU1B6Tzuem1YRfp35dZtFgBP3vUl8WEUiha9HsdU=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649925519751170.1146785751522;
 Thu, 14 Apr 2022 01:38:39 -0700 (PDT)
Message-ID: <8eb29967-83ca-97c5-d6b9-808cf3ddeb16@arinc9.com>
Date: Thu, 14 Apr 2022 11:38:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/14] mips: dts: ralink: mt7621: use the new compatible
 string for MT7621 pinctrl
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-10-arinc.unal@arinc9.com>
 <b415523c-34e3-28a1-bcce-4682e7c67e77@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <b415523c-34e3-28a1-bcce-4682e7c67e77@linaro.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_013849_864565_D5B4089F 
X-CRM114-Status: GOOD (  11.96  )
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

CgpPbiAxMy8wNC8yMDIyIDE4OjI3LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDEz
LzA0LzIwMjIgMDg6MDcsIEFyxLFuw6cgw5xOQUwgd3JvdGU6Cj4+IFVzZSB0aGUgbmV3IGNvbXBh
dGlibGUgc3RyaW5nICJyYWxpbmssbXQ3NjIxLXBpbmN0cmwiIGZvciB0aGUgUmFsaW5rIE1UNzYy
MQo+PiBwaW5jdHJsIHN1YmRyaXZlciBvbiBtdDc2MjEuZHRzaS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgo+PiAtLS0KPj4gICBhcmNo
L21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaSBiL2FyY2gvbWlwcy9ib290L2R0cy9y
YWxpbmsvbXQ3NjIxLmR0c2kKPj4gaW5kZXggMzIyMjY4NDkxNWFjLi5lZTJlYzc4Yzg5NTIgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kKPj4gKysr
IGIvYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaQo+PiBAQCAtMTUxLDcgKzE1
MSw3IEBAIHNwaTA6IHNwaUBiMDAgewo+PiAgIAl9Owo+PiAgIAo+PiAgIAlwaW5jdHJsOiBwaW5j
dHJsIHsKPj4gLQkJY29tcGF0aWJsZSA9ICJyYWxpbmsscnQyODgwLXBpbm11eCI7Cj4+ICsJCWNv
bXBhdGlibGUgPSAicmFsaW5rLG10NzYyMS1waW5jdHJsIjsKPiAKPiBUaGUgY2hhbmdlIGlzIG5v
bi1iaXNlY3RhYmxlIGFuZCBjYXVzZXMgaXNzdWVzIGFsbCBvdGhlciB1c2VycyBvZiBEVAo+IChv
dGhlciBwcm9qZWN0cywgc3lzdGVtcyBldGMpLiBUaGlzIGlzIGRpc2NvdXJhZ2VkIGluIGdlbmVy
YWwsIHNvIHlvdQo+IHNob3VsZCBkZXNjcmliZSBpdC4gVGhlIGNvbW1pdCBtc2cgbGFja3MgYW5z
d2VyIHRvIHRoZSBtYWluIHF1ZXN0aW9uOgo+IFdoeT8gWW91IGZvY3VzZWQgb25seSBvbiB3aGF0
IHlvdSBhcmUgZG9pbmcsIGJ1dCB3aHkgeW91IGFyZSBkb2luZyBpcwo+IGFjdHVhbGx5IG1vcmUg
aW1wb3J0YW50IGZvciBzdWNoIGNoYW5nZS4KCkFzIGl0J3Mgc2VlbiBvbiBhbnkgb3RoZXIgcGlu
Y3RybCBzdWJkcml2ZXIgdGhhdCBjYWxscyBjb2RlIGZyb20gYSBtYWluIApkcml2ZXIsIGVhY2gg
c3ViZHJpdmVyIG5lZWRzIHRvIGhhdmUgYSBkaWZmZXJlbnQgY29tcGF0aWJsZSBzdHJpbmcuIFdl
IApkb24ndCB3YW50IHRoZSBzYW1lIGNvbXBhdGlibGUgc3RyaW5nIHRvIG1hdGNoIGEgZGlmZmVy
ZW50IHN1YmRyaXZlcidzIApwaW5tdXggZGF0YSBhcyBpdCdzIG5vdCBmb3Igb3VyIFNvQy4KCkkn
bGwgYWRkIHdoYXQgSSB0eXBlZCBhYm92ZSB0byB0aGUgY29tbWl0IGxvZy4KCkFyxLFuw6cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
