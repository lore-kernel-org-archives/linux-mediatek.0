Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57649C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkbtCRhy2chL/Mt832ymT4Gf8QQLLwOQ3hUiSZls46E=; b=Hf601kpI5az5tc
	AwCUdtyyF1g9da2NuAxRSLbJPQn54pX7Q3Oo0WmP8xGPguo2Jdtwd1XyzmsPTR+BBsLvcZusWAZS6
	ZNPJ995VcKcTkZYG5IJUNtCnBNHF1nuj2F2UCidesRcP5yM5n5YlOqCewWntsLpqXp70CbPJqSePt
	SFVNx0Wm9591iEjqiUidLon5OixCY5dIiCuyE/EohEMJmbJv5IhuJ9dO7jPvcezsXAtnGKo/8chXT
	GRYmo8fCnsGwHo5wBPoRXxGpxX1I34EuXQX7m1Q3y/wvIagHkgBKwx0Fay5Q/HMsE47EMPmzgY6RN
	nz44R2kY94xAwldpkVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7EO-004AQk-5k; Mon, 23 May 2022 12:32:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6yY-0042qV-Im; Mon, 23 May 2022 12:15:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 106EB1F430CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653308153;
 bh=OWdjhw1YAsTUorGsOR2BtjPFSahtCs7HpdU+uvF1qak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ci4hDwZcJOJWbusqGkj9L1NaiEoJwkfa8tYgNkhpOIH3UQqOYQWGsFAXX0b8UdO9O
 u6LWRo+4sLf6jYxV6lCtFZG66ObvT5TnLRLJ/OrL/NbmbSTKU3P1kTwA2T2FyHQ2Ot
 hjGsBKFML9JmOFwrCiMiLpK7PkebZq3scBvAk6HOQfTzBb7rG2MAF0u0nOAbtdMOXJ
 EK3o7ij10s4pkaiarPjFwgO7cGRfV27yee5bcT4QIxzJbJrZLB671g5iEH31328qBi
 ZihHOv0MTOhoX8ZE2VEiNGEXju3mFAtoyMFt1BFQP7NxFanKZeA2GAYRMSM1GihSOJ
 NWb6ZZXRLihcg==
Message-ID: <9639208e-1afc-30ef-d0ea-5eaaa6316af3@collabora.com>
Date: Mon, 23 May 2022 14:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/4] dt-bindings: reset: Add MT6735 reset bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Rob Herring <robh@kernel.org>
References: <20220519142211.458336-1-y.oudjana@protonmail.com>
 <20220519142211.458336-3-y.oudjana@protonmail.com>
 <d54ea1d3-903f-0b2a-3db4-99f1adfadce0@collabora.com>
 <T9C6CR.ZDXJ22Q377EZ1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <T9C6CR.ZDXJ22Q377EZ1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_051554_988022_E473B318 
X-CRM114-Status: GOOD (  22.24  )
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

SWwgMjAvMDUvMjIgMTE6MTMsIFlhc3NpbmUgT3VkamFuYSBoYSBzY3JpdHRvOgo+IAo+IE9uIEZy
aSwgTWF5IDIwIDIwMjIgYXQgMTA6NTU6MjQgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIAo+IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+
PiBJbCAxOS8wNS8yMiAxNjoyMiwgWWFzc2luZSBPdWRqYW5hIGhhIHNjcml0dG86Cj4+PiBGcm9t
OiBZYXNzaW5lIE91ZGphbmEgPHkub3VkamFuYUBwcm90b25tYWlsLmNvbT4KPj4+Cj4+PiBBZGQg
cmVzZXQgZGVmaW5pdGlvbnMgZm9yIE1lZGlhdGVrIE1UNjczNSByZXNldHMgcHJvdmlkZWQgYnkK
Pj4+IGluZnJhY2ZnIGFuZCBwZXJpY2ZnLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlhc3NpbmUg
T3VkamFuYSA8eS5vdWRqYW5hQHByb3Rvbm1haWwuY29tPgo+Pj4gQWNrZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDIgKysKPj4+IMKgIC4uLi9yZXNldC9tZWRpYXRlayxtdDY3MzUtaW5mcmFjZmcuaMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDMxICsrKysrKysrKysrKysrKysrKysKPj4+IMKgIC4uLi9yZXNl
dC9tZWRpYXRlayxtdDY3MzUtcGVyaWNmZy5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzMSArKysr
KysrKysrKysrKysrKysrCj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykK
Pj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L21lZGlh
dGVrLG10NjczNS1pbmZyYWNmZy5oCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZXNldC9tZWRpYXRlayxtdDY3MzUtcGVyaWNmZy5oCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4+IGluZGV4IGE1OTA2OTI2M2NmYi4u
MWMwYWY1NTRhN2I2IDEwMDY0NAo+Pj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4+ICsrKyBiL01BSU5U
QUlORVJTCj4+PiBAQCAtMTI1MDMsNiArMTI1MDMsOCBAQCBGOiAgICAKPj4+IGluY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svbWVkaWF0ZWssbXQ2NzM1LWFwbWl4ZWRzeXMuaAo+Pj4gwqAgRjrCoMKg
wqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tZWRpYXRlayxtdDY3MzUtaW5mcmFjZmcuaAo+
Pj4gwqAgRjrCoMKgwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tZWRpYXRlayxtdDY3MzUt
cGVyaWNmZy5oCj4+PiDCoCBGOsKgwqDCoCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21lZGlh
dGVrLG10NjczNS10b3Bja2dlbi5oCj4+PiArRjrCoMKgwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9tZWRpYXRlayxtdDY3MzUtaW5mcmFjZmcuaAo+Pj4gK0Y6wqDCoMKgIGluY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQvbWVkaWF0ZWssbXQ2NzM1LXBlcmljZmcuaAo+Pj4gwqAgf8KgIE1FRElB
VEVLIE1UNzYgV0lSRUxFU1MgTEFOIERSSVZFUgo+Pj4gwqAgTTrCoMKgwqAgRmVsaXggRmlldGth
dSA8bmJkQG5iZC5uYW1lPgo+Pgo+PiAuLnNuaXAuLgo+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvcmVzZXQvbWVkaWF0ZWssbXQ2NzM1LXBlcmljZmcuaCAKPj4+IGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tZWRpYXRlayxtdDY3MzUtcGVyaWNmZy5oCj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi42Y2RmYWE3ZGRhZGYKPj4+
IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbWVkaWF0
ZWssbXQ2NzM1LXBlcmljZmcuaAo+Pj4gQEAgLTAsMCArMSwzMSBAQAo+Pj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8KPj4+ICsK
Pj4+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19SU1RfTVQ2NzM1X1BFUklDRkdfSAo+Pj4gKyNkZWZp
bmUgX0RUX0JJTkRJTkdTX1JTVF9NVDY3MzVfUEVSSUNGR19ICj4+PiArCj4+PiArI2RlZmluZSBV
QVJUMF9TV19SU1TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAKPj4+ICsjZGVmaW5lIFVBUlQxX1NX
X1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+Pj4gKyNkZWZpbmUgVUFSVDJfU1dfUlNUwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAyCj4+PiArI2RlZmluZSBVQVJUM19TV19SU1TCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDMKPj4+ICsjZGVmaW5lIFVBUlQ0X1NXX1JTVMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgNAo+Pgo+PiB3aGVyZSdzIG51bWJlciA1Pwo+Pgo+Pj4gKyNkZWZpbmUgQlRJRl9TV19S
U1TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDYKPj4+ICsjZGVmaW5lIERJU1BfUFdNX1NXX1JTVMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgNwo+Pj4gKyNkZWZpbmUgUFdNX1NXX1JTVMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgOAo+Pgo+PiAuLi5hbmQgd2hlcmUncyA5Pwo+Pgo+Pj4gKyNkZWZpbmUgQVVY
QURDX1NXX1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTAKPj4+ICsjZGVmaW5lIERNQV9TV19S
U1TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDExCj4+PiArI2RlZmluZSBJUkRBX1NXX1JTVMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMTIKPj4+ICsjZGVmaW5lIElSVFhfU1dfUlNUwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxMwo+Pgo+PiBhbmQgMTQsIDE1Pwo+Pgo+Pj4gKyNkZWZpbmUgVEhFUk1fU1df
UlNUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNgo+Pj4gKyNkZWZpbmUgTVNEQzJfU1dfUlNUwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAxNwo+Pj4gKyNkZWZpbmUgTVNEQzNfU1dfUlNUwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAxNwo+Pgo+PiBNU0RDIDIgYW5kIDMgYXJlIGJvdGggMTc/ISA6LSkKPj4K
Pj4+ICsjZGVmaW5lIE1TREMwX1NXX1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTkKPj4+ICsj
ZGVmaW5lIE1TREMxX1NXX1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjAKPj4KPj4gMjE/Cj4+
Cj4+PiArI2RlZmluZSBJMkMwX1NXX1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjIKPj4+ICsj
ZGVmaW5lIEkyQzFfU1dfUlNUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyMwo+Pj4gKyNkZWZpbmUg
STJDMl9TV19SU1TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI0Cj4+PiArI2RlZmluZSBJMkMzX1NX
X1JTVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjUKPj4+ICsjZGVmaW5lIFVTQl9TV19SU1TCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDI4Cj4+PiArCj4+Cj4+IGFuZCAyOS0zMj8KPj4KPj4+ICsjZGVm
aW5lIFNQSTBfU1dfUlNUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAzMwo+Pj4gKwo+Pj4gKyNlbmRp
Zgo+Pgo+PiBJIGhhdmUgYSBodW5jaCB0aGF0IHlvdSd2ZSBtaXN1bmRlcnN0b29kIHRoZSBjaGFu
Z2VzIGluIHRoZSByZXNldHMuLi4KPj4KPj4gV2hhdCBSZXgtQkMgaGFzIGRvbmUgaW4gaGlzIHJl
c2V0IGNsZWFudXAgaXMgZXhhY3RseSB0byBzdG9wIGRpcmVjdGx5Cj4+IG1hcHBpbmcgdGhlc2Ug
dG8gdGhlIGFjdHVhbCBiaXRzIHRoYXQgd2UncmUgdXNpbmcuLi4gc28gdGhlIGRlZmluaXRpb25z
Cj4+IGluIHRoZXJlIHdpbGwgc2ltcGx5IGJlIHNlcXVlbnRpYWwsIGFuZCB0aGUgYWN0dWFsIG1h
cHBpbmcgaXMgZG9uZSBpbgo+PiB5b3VyIGNsay1tdDY3MzUtcGVyaWNmZy5jIGRyaXZlci4KPiAK
PiBJIGRpZCBub3RpY2UgdGhhdCwgYnV0IHJlYWRpbmcgdGhlIGRvY3VtZW50YXRpb24gaW4gcmVz
ZXQuaDoKPiAKPiAqIEByc3RfaWR4X21hcDpQb2ludGVyIHRvIGFuIGFycmF5IGNvbnRhaW5pbmcg
aWRzIGlmIGlucHV0IGFyZ3VtZW50IGlzIGluZGV4Lgo+ICrCoMKgwqDCoMKgwqDCoCBUaGlzIGFy
cmF5IGlzIG5vdCBuZWNlc3NhcnkgaWYgb3VyIGlucHV0IGFyZ3VtZW50IGRvZXMgbm90IG1lYW4g
aW5kZXguCj4gCj4gSSB0aG91Z2h0IHRoYXQgaXQgd2Fzbid0IG5lY2Vzc2FyeSB0byB1c2UgaXQu
IFRoaW5raW5nCj4gYWJvdXQgaXQgbm93IGhvd2V2ZXIsIEkgZ3Vlc3MgdGhhdCB3YXMgdG8gbWFp
bnRhaW4gY29tcGF0aWJpbGl0eQo+IHdpdGggb2xkIGRldmljZSB0cmVlcy4gSSdsbCBjaGFuZ2Ug
aXQgbmV4dCB0aW1lLgo+IE1heWJlIGEgbm90ZSBzaG91bGQgYmUgcHV0IHRoZXJlIHRvIGF2b2lk
IGNvbmZ1c2lvbgo+IGluIHRoZSBmdXR1cmUuCgpJIGFncmVlIHRoaXMgY29tbWVudCBzaG91bGQg
YmUgY2xhcmlmaWVkLgoKVGhhbmtzLApBbmdlbG8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
