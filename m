Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOXoe4nF6mBl5qGla6gdQw/1GptJRTFCrjLLRvKXqr8=; b=wV7thpPpMZpyA4ZQne2/JTAaIz
	O543CenGmIvUyDjqSslithGSWMyRR/l9AwDshPnB/y5mUnpXtRO4bMlJbCdNEpGAtpQT4mZ7MT8qa
	zGvbB+hm6Di9D8CH0aOuyICRlWk9nHAaHGXprLz7S15NOXZgts+wPusGnYhA8Tq5ZPbAf7XWJfwq5
	iJ8EMKvL+3qwoC4CZMu/9PZUidQafmlbpTRWp2dvdxGLSXKjMzSdzbLrnrn3VBPg38Ueh7nSAaLbS
	82ANsiD2fnVolah5nMJO3pCsCTCsmASNBGHmd3n4pWOJOdnGUtlvkqgvNbUuVKkmD4JtInzCEkcAe
	ng1+Ol4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6Yz-004NNb-Om; Wed, 19 Jan 2022 08:43:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6Yl-004NK3-Rg; Wed, 19 Jan 2022 08:43:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5B9CD1F43EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642581794;
 bh=+B/hBYH7GoT/nMpZGsa7fzqnbMcaX/mKr3HkH43rjNs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B7fnRyEiv3YXlB6PoTAFo3/4bmFrAPkPYZFXQ9ynaU9m5DUkcG4cTDilG0Z8MXAkB
 fCNIaIGNgV/V/et8nXtADyCRV1h15fCAkpqkQgiFvrztHWGUkhJzzRhLaObUZDf/gT
 56fo+GEB82DGmRemXivmBGri3BrqlGBj9z1IWzaY47v/fETPFfTjxqYaPoITkiH+Yo
 Dn0SyHHEZwYeCiDo+bg9qvJsTZBb5J/C7PoZD8bQUxwOSrS8Rp5z88453txR9Xzrpb
 CAgHXlokVWdyN3C61jZiIHHe71rhJClBQnvABRyQTMGMBtidCT14NMP4THvVYn+yal
 LOto4upOWFIhA==
Subject: Re: [v10,2/3] drm/mediatek: implement the DSI HS packets aligned
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 daniel@ffwll.ch, airlied@linux.ie, p.zabel@pengutronix.de
Cc: xji@analogixsemi.com, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220119022543.26093-1-rex-bc.chen@mediatek.com>
 <20220119022543.26093-3-rex-bc.chen@mediatek.com>
 <4abe1f96-aafd-71bc-5f5e-bfcc4320c8c4@intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <35821437-8f62-e4f3-0614-2a6a59668938@collabora.com>
Date: Wed, 19 Jan 2022 09:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4abe1f96-aafd-71bc-5f5e-bfcc4320c8c4@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_004316_054766_EDB2D93F 
X-CRM114-Status: GOOD (  20.59  )
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

SWwgMTkvMDEvMjIgMDk6MzUsIEFuZHJ6ZWogSGFqZGEgaGEgc2NyaXR0bzoKPiAKPiBPbiAxOS4w
MS4yMDIyIDAzOjI1LCBSZXgtQkMgQ2hlbiB3cm90ZToKPj4gU29tZSBEU0kgUlggZGV2aWNlcyAo
Zm9yIGV4YW1wbGUsIGFueDc2MjUpIHJlcXVpcmUgbGFzdCBhbGlnbm1lbnQgb2YKPj4gcGFja2V0
cyBvbiBhbGwgbGFuZXMgYWZ0ZXIgZWFjaCByb3cgb2YgZGF0YSBpcyBzZW50Lgo+PiBPdGhlcndp
c2UsIHRoZXJlIHdpbGwgYmUgc29tZSBpc3N1ZXMgb2Ygc2hpZnQgb3Igc2Nyb2xsIGZvciBzY3Jl
ZW4uCj4+Cj4+IFRha2UgaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlIGZvciBhIGV4YW1wbGUs
Cj4+IHdlIHJvdW5kdXAgdGhlIEhTQSBwYWNrZXQgZGF0YSB0byBsYW5lIG51bWJlciwgYW5kIHRo
ZSBzdWJ0cmFjdGlvbiBvZiAyCj4+IGlzIHRoZSBwYWNrZXQgZGF0YSB2YWx1ZSBhZGRlZCBieSB0
aGUgcm91bmR1cCBvcGVyYXRpb24sIG1ha2luZyB0aGUKPj4gbG9uZyBwYWNrZXRzIGFyZSBpbnRl
Z2VyIG11bHRpcGxlcyBvZiBsYW5lIG51bWJlci4KPj4gVGhpcyB2YWx1ZSAoMikgdmFyaWVzIHdp
dGggdGhlIGxhbmUgbnVtYmVyLCBhbmQgdGhhdCBpcyB0aGUgcmVhc29uIHdlCj4+IGRvIHRoaXMg
b3BlcmF0aW9uIHdoZW4gdGhlIGxhbmUgbnVtYmVyIGlzIDQuCj4+Cj4+IEluIHRoZSBwcmV2aW91
cyBvcGVyYXRpb24gb2YgZnVuY3Rpb24gIm10a19kc2lfY29uZmlnX3Zkb190aW1pbmciLAo+PiB0
aGUgbGVuZ3RoIG9mIEhTQSBhbmQgSEZQIGRhdGEgcGFja2V0cyBoYXMgYmVlbiBhZGp1c3RlZCB0
byBhbgo+PiBpbnRlZ3JhdGlvbiBtdWx0aXBsZSBvZiBsYW5lIG51bWJlci4KPj4gU2luY2UgdGhl
IG51bWJlciBvZiBSR0IgZGF0YSBwYWNrZXRzIGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIGFu
Cj4+IGludGVnZXIgbXVsdGlwbGUgb2YgbGFuZSBudW1iZXIsIHdlIG1vZGlmeSB0aGUgZGF0YSBw
YWNrZXQgbGVuZ3RoIG9mCj4+IEhCUCBzbyB0aGF0IHRoZSBudW1iZXIgb2YgSEJQICsgUkdCIGlz
IGVxdWFsIHRvIHRoZSBsYW5lIG51bWJlci4KPj4gU28gYWZ0ZXIgc2VuZGluZyBhIGxpbmUgb2Yg
ZGF0YSAoSFNBICsgSEJQICsgUkdCICsgSEZQKSwgdGhlIGRhdGEKPj4gbGFuZXMgYXJlIGFsaWdu
ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+
Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29t
PgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cgo+IAo+IFJlZ2FyZHMKPiAKPiBBbmRyemVqCj4g
Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTIgKysr
KysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+PiBpbmRleCA1ZDkwZDJlYjAwMTkuLmU5MWIzZmZm
NDM0MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4+IEBAIC01MDAsNiAr
NTAwLDE4IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10
a19kc2kgKmRzaSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9XQVJOKCJIRlAgKyBIQlAgbGVz
cyB0aGFuIGQtcGh5LCBGUFMgd2lsbCB1bmRlciA2MEh6XG4iKTsKPj4gwqDCoMKgwqDCoCB9Cj4+
ICvCoMKgwqAgaWYgKChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9IU19QS1RfRU5EX0FMSUdO
RUQpICYmCj4+ICvCoMKgwqDCoMKgwqDCoCAoZHNpLT5sYW5lcyA9PSA0KSkgewo+PiArwqDCoMKg
wqDCoMKgwqAgaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlID0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcm91bmR1cChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUsIGRzaS0+bGFuZXMp
IC0gMjsKPj4gK8KgwqDCoMKgwqDCoMKgIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm91bmR1cChob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0
ZSwgZHNpLT5sYW5lcykgLSAyOwo+PiArwqDCoMKgwqDCoMKgwqAgaG9yaXpvbnRhbF9iYWNrcG9y
Y2hfYnl0ZSA9Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJvdW5kdXAoaG9yaXpvbnRhbF9i
YWNrcG9yY2hfYnl0ZSwgZHNpLT5sYW5lcykgLSAyOwo+PiArwqDCoMKgwqDCoMKgwqAgaG9yaXpv
bnRhbF9iYWNrcG9yY2hfYnl0ZSAtPQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodm0tPmhh
Y3RpdmUgKiBkc2lfdG1wX2J1Zl9icHAgKyAyKSAlIGRzaS0+bGFuZXM7Cj4+ICvCoMKgwqAgfQo+
PiArCj4+IMKgwqDCoMKgwqAgd3JpdGVsKGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNp
LT5yZWdzICsgRFNJX0hTQV9XQyk7Cj4+IMKgwqDCoMKgwqAgd3JpdGVsKGhvcml6b250YWxfYmFj
a3BvcmNoX2J5dGUsIGRzaS0+cmVncyArIERTSV9IQlBfV0MpOwo+PiDCoMKgwqDCoMKgIHdyaXRl
bChob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hGUF9XQyk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
