Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AD0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hw6Pnzec1p2ILtp5DtLTJ5TIVMczp+QivAwnxiNKW+Q=; b=jds9naMU3CHAlK
	EGxOc/aeNpf32KJ38PsPCE+aP77QmBJyI7VO9tVOUOHWNvDiUxA896t/OiFATJHZ3vXK+62gWhsgK
	yfjhuD7Z8371SCH9w0t2VHodAVd3fbsCS7cK8Kh78QRGGJ08Kh4tMf8TlY80XOU+rzNlnAmEthmEc
	qJAhNI4Ltnhy2x5Qmx49NglZyeeC8OicmW0W4MOwlFD9Q2E7Hn4mSgdEByX5a42pg26tRUIoiPWcD
	6OfFwAByU/UwoVs4joZE7S+1F1rH6e7olPf9IFzUNP9o7R/4MQZAf8+A9Fu4SosdSYdMK+GadMoBO
	mZe637qO/lROq2/5OkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrI4m-001e3k-DP; Wed, 18 May 2022 11:42:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrI4P-001dtr-TL; Wed, 18 May 2022 11:42:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8C8FD1F44EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652874144;
 bh=qf83SX+V7kjrLVMgax0hyCtsQnOzDUfXGrMJugntals=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eCcwRurnQ+5GicCiLUfL2+f27Skpz0cRymPx++02Gs/+Bm9y8LvMU+6E4zFbDOBbB
 aDxYHbubVrbCA+S5TsXAoq4U9wHNl9b0zGYGbzhdodANtmEmBbhrYx9e+w3rh5TOFb
 Vyps2S9Wcz1EzWXTa9lJTlDZFDQkW3J3QJ9bGZjEJEc85hByE99hCsirLDdS7SoW0w
 B66eXlc+ED801BFn9pFvgK96TKw7BuU6+8dsSUCijtBn62fPvpsJc8uT9XlYafrff6
 yV7b+39Yhj9HoBc5e05dpy412rFo6AmY0TE60FsflL/CVdY2d2PZVklvXG9KaoqU2t
 FAGEC8vUE9EJw==
Message-ID: <2550039f-1cfc-eb5d-bbc9-bf82666e9abd@collabora.com>
Date: Wed, 18 May 2022 13:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: mediatek: Add phandles for
 mediatek infra/pericfg
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
 <20220518100503.37279-2-angelogioacchino.delregno@collabora.com>
 <4cfbc8dd-83d3-80df-630d-6f8fb2efb9fd@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4cfbc8dd-83d3-80df-630d-6f8fb2efb9fd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_044226_141690_0A221893 
X-CRM114-Status: GOOD (  16.78  )
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

SWwgMTgvMDUvMjIgMTM6MjksIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPiAKPiAKPiBP
biAxOC8wNS8yMDIyIDEyOjA0LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4g
QWRkIHByb3BlcnRpZXMgIm1lZGlhdGVrLGluZnJhY2ZnIiBhbmQgIm1lZGlhdGVrLHBlcmljZmci
IHRvIGxldCB0aGUKPj4gbXRrX2lvbW11IGRyaXZlciByZXRyaWV2ZSBwaGFuZGxlcyB0byB0aGUg
aW5mcmFjZmcgYW5kIHBlcmljZmcgc3lzY29uKHMpCj4+IGluc3RlYWQgb2YgcGVyZm9ybWluZyBh
IHBlci1zb2MgY29tcGF0aWJsZSBsb29rdXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+Cj4+IC0tLQo+PiDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxp
b21tdS55YW1swqDCoMKgwqDCoMKgwqDCoCB8IDggKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnlhbWwgCj4+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnlhbWwKPj4gaW5k
ZXggMmFlM2JiYWQ3ZjFhLi5jNGFmNDE5NDc1OTMgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS55YW1sCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS55
YW1sCj4+IEBAIC0xMDEsNiArMTAxLDEwIEBAIHByb3BlcnRpZXM6Cj4+IMKgwqDCoMKgwqAgaXRl
bXM6Cj4+IMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGJjbGsKPj4gK8KgIG1lZGlhdGVrLGluZnJh
Y2ZnOgo+PiArwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUKPj4gK8KgwqDCoCBkZXNjcmlwdGlvbjogVGhlIHBoYW5kbGUgdG8gdGhlIG1lZGlhdGVr
IGluZnJhY2ZnIHN5c2Nvbgo+PiArCj4+IMKgwqDCoCBtZWRpYXRlayxsYXJiczoKPj4gwqDCoMKg
wqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5
Cj4+IMKgwqDCoMKgwqAgbWluSXRlbXM6IDEKPj4gQEAgLTExMiw2ICsxMTYsMTAgQEAgcHJvcGVy
dGllczoKPj4gwqDCoMKgwqDCoMKgwqAgUmVmZXIgdG8gYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL21lZGlhdGVrLHNtaS1sYXJiLnlhbWwuIEl0IG11c3Qgc29ydAo+PiDCoMKgwqDCoMKgwqDC
oCBhY2NvcmRpbmcgdG8gdGhlIGxvY2FsIGFyYml0ZXIgaW5kZXgsIGxpa2UgbGFyYjAsIGxhcmIx
LCBsYXJiMi4uLgo+PiArwqAgbWVkaWF0ZWsscGVyaWNmZzoKPj4gK8KgwqDCoCAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4+ICvCoMKgwqAgZGVzY3JpcHRp
b246IFRoZSBwaGFuZGxlIHRvIHRoZSBtZWRpYXRlayBwZXJpY2ZnIHN5c2Nvbgo+PiArCj4gCj4g
SSBkaWRuJ3QgZXhwbGFpbiBteXNlbGYuIFdoYXQgSSB3YXMgc3VndWVzdGluZyB3YXMgdG8gc3F1
YXNoIHRoZSBwYXRjaCB0aGF0IGFkZCAKPiByZXF1aWVyZWQgbWVkaWF0ZWssaW5mcmFjZmcgd2l0
aCB0aGUgcGF0Y2ggdGhhdCBhZGRzIG1lZGlhdGssaW5mcmFjZmcgdG8gdGhlIAo+IGJpbmRpbmcg
ZGVzY3JpcHRpb24uIEFuZCB0aGVuIHNxdWFzaCB0aGUgYm90aCBwYXRjaGVzIGFkZGluZyBwZXJp
Y2ZnIGFzIHdlbGwuCgpTb3JyeSBNYXR0aGlhcywgSSdtIG5vdCBzdXJlIC4uLiBJIHRoaW5rIEkn
bSBtaXN1bmRlcnN0YW5kaW5nIHlvdSBhZ2Fpbi4uLgouLi5idXQgaWYgSSdtIG5vdCwgSSBkb24n
dCB0aGluayB0aGF0IHNxdWFzaGluZyBhY3R1YWwgY29kZSBhbmQgYmluZGluZ3MgdG9nZXRoZXIK
aXMgc29tZXRoaW5nIGFjY2VwdGFibGU/CgpJJ3ZlIG1hZGUgdGhhdCBraW5kIG9mIG1pc3Rha2Ug
aW4gdGhlIHBhc3QgYW5kIEkgd2FzIHRvbGQgbXVsdGlwbGUgdGltZXMgdGhhdApkdC1iaW5kaW5n
cyBjaGFuZ2VzIHNoYWxsIGJlIHNlbnQgc2VwYXJhdGVseSBmcm9tIHRoZSBhY3R1YWwgZHJpdmVy
IGNoYW5nZXMuCgpDaGVlcnMsCkFuZ2VsbwoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
