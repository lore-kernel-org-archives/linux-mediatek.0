Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsyRNEgYuBSoaLTQ9YvDHx7sOk/H9PxBMOXsuIKMvZQ=; b=cG3eb2uK60LbVk
	MSPNQntGjvWfpJoyslrZ6SKfD1hPoo11WGLAtB8HFlFqN6uhWctPeVUUGhwYHZZW06KJpFKTDBriI
	cA3JVULxUAGB27dvQnZrJ88dqiK42c7/AK0W0Lvcmbt/7nShfIoWexiFGZgJj4TAnrwztiFvni9O0
	BgDGJmXvebY+GxWNOqc7D9AT7pA2mQwnGyireAIV2ZUwkTvBWOs/TcSNialBv/0raDVJ6YGuWn/fy
	aEt07jPS2P1k2RexINDmBIjHVQ7EHcU7go5HLA9gNb7ILTVMyPrRIQ3gEoEUmSSTX0oQWFsVk7ZLX
	5zgKs71DIEVVPEQcLjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEaE-000gpO-0N; Thu, 09 Jun 2022 09:36:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEa1-000gl8-W4; Thu, 09 Jun 2022 09:35:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D1EC66016FD;
	Thu,  9 Jun 2022 10:35:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654767350;
	bh=BH72tA3Gv2tLURwDnY5UsSEkwsx+vUzwp5wTPxVczvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aFgguC5hMuyVbHwuGvCHFJ/j16RiTIEJQ4LRbUFOphEqEyKiRcnjJxU8B66h/GYQ3
	 GT4U+S2FDQS4S3AGCcCaRin3wtBLGC3hxCBCSeMrx2JX+jozSujwzsrd4N3kasKMZq
	 xb2PmVvm4z1F+7aYRKRxe32oRugDq2sax4108q+hp0dCiiAltoVHxLT5nLh84KlWZN
	 xykOEDKdoJSUMDP3HUAW7qeyPZCEq4cGi6nCaQ2Vq8TijxtaONgDPNjXKCDNkdTaCW
	 5XFKn7XzzqiLqvKcovYV+NFovRiH2SrZtWqaHEKxtODGlePSDyhrTS/200pYBUAocV
	 WLARRgsksZ3cw==
Message-ID: <1974b83e-967a-41ed-e790-52ceaf349ad3@collabora.com>
Date: Thu, 9 Jun 2022 11:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mediatek: Add CPUX System
 Timer and MT6795 compatible
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
References: <20220518112435.241116-1-angelogioacchino.delregno@collabora.com>
 <20220518112435.241116-2-angelogioacchino.delregno@collabora.com>
 <afd9ab8e-5bad-54ee-3f44-5e0cfdb22e75@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <afd9ab8e-5bad-54ee-3f44-5e0cfdb22e75@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_023554_285915_01ACCBBC 
X-CRM114-Status: GOOD (  15.11  )
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

SWwgMDcvMDYvMjIgMTg6MTEsIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPiAKPiAKPiBP
biAxOC8wNS8yMDIyIDEzOjI0LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4g
RG9jdW1lbnQgdGhlICJDUFVYR1BUIiBDUFUgR2VuZXJhbCBQdXJwb3NlIFRpbWVyLCB1c2VkIGFz
IEFSTS9BUk02NAo+PiBTeXN0ZW0gVGltZXIgb24gTWVkaWFUZWsgcGxhdGZvcm1zIGFuZCBhZGQg
dGhlIE1UNjc5NSBjb21wYXRpYmxlIGZvciBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4KPj4gLS0tCj4+IMKgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVr
LG10ay10aW1lci50eHTCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICsrKysKPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50eHQgCj4+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50
eHQKPj4gaW5kZXggNmYxZjlkYmE2ZTg4Li40OTcwNmNiZWY0NWQgMTAwNjQ0Cj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9tZWRpYXRlayxtdGstdGltZXIu
dHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9tZWRp
YXRlayxtdGstdGltZXIudHh0Cj4+IEBAIC0yLDYgKzIsNyBAQCBNZWRpYVRlayBUaW1lcnMKPj4g
wqAgLS0tLS0tLS0tLS0tLS0tCj4+IMKgIE1lZGlhVGVrIFNvQ3MgaGF2ZSB0d28gZGlmZmVyZW50
IHRpbWVycyBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zLAo+IAo+IE5pdDogVGhlcmUgYXJlIG5vdyB0
aHJlZSBkaWZmZXJlbnQgdGltZXJzIHNvIG1heWJlOgo+ICJNZWRpYVRlayBTb0NzIGhhdmUgZGlm
ZmVyZW50IHRpbWVycyBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zLCIKPiAKPiBSZXZpZXdlZC1ieTog
TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiAKCkhpIE1hdHRoaWFz
LApjYW4gd2UgcGxlYXNlIGlnbm9yZSB0aGF0IGRlc2NyaXB0aW9uIG5pdCBmb3IgdGhpcyBwYXRj
aD8KCkkgd2FzIGFueXdheSBwbGFubmluZyB0byBkbyBhIFlBTUwgY29udmVyc2lvbiBhZnRlciBn
ZXR0aW5nIHRoaXMgbWVyZ2VkIGluLCBwZXJoYXBzCndlIGNhbiBqdXN0IGZpeCB0aGF0IG9uIHRo
ZSBuZXcgb25lIGluc3RlYWQ/CgpDaGVlcnMsCkFuZ2VsbwoKPj4gKy0gQ1BVWCAoQVJNL0FSTTY0
IFN5c3RlbSBUaW1lcikKPj4gwqAgLSBHUFQgKEdlbmVyYWwgUHVycG9zZSBUaW1lcikKPj4gwqAg
LSBTWVNUIChTeXN0ZW0gVGltZXIpCj4+IEBAIC0yOSw2ICszMCw5IEBAIFJlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4+IMKgwqDCoMKgwqAgKiAibWVkaWF0ZWssbXQ3NjI5LXRpbWVyIiBmb3IgTVQ3NjI5
IGNvbXBhdGlibGUgdGltZXJzIChTWVNUKQo+PiDCoMKgwqDCoMKgICogIm1lZGlhdGVrLG10Njc2
NS10aW1lciIgZm9yIE1UNjc2NSBhbmQgYWxsIGFib3ZlIGNvbXBhdGlibGUgdGltZXJzIChTWVNU
KQo+PiArwqDCoMKgIEZvciB0aG9zZSBTb0NzIHRoYXQgdXNlIENQVVgKPj4gK8KgwqDCoCAqICJt
ZWRpYXRlayxtdDY3OTUtc3lzdGltZXIiIGZvciBNVDY3OTUgY29tcGF0aWJsZSB0aW1lcnMgKENQ
VVgpCj4+ICsKPj4gwqAgLSByZWc6IFNob3VsZCBjb250YWluIGxvY2F0aW9uIGFuZCBsZW5ndGgg
Zm9yIHRpbWVyIHJlZ2lzdGVyLgo+PiDCoCAtIGNsb2NrczogU2hvdWxkIGNvbnRhaW4gc3lzdGVt
IGNsb2NrLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
