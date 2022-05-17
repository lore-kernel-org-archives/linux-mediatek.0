Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB76C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHttJpjR1KcFZNz6+FyUE20UHLNo2a6lMo/N3CXLEDI=; b=1xqZY1DlLnnaxN
	dK51rOANtncz2UWAx2BQ1k0DxCo5vVi/JFz5rR6c5U0LU5HhxhOpCbPTqHVVYfhAB7/VzkqGuTgWa
	AMatTA3nCTW6VmqQ3UNfyLSkT5U3GgEA+R0cOlq3sE9z5NHE+eBpubvxz3oN4Ri5nkKnnWp98ZTNX
	/b6PZ6krSTYncdkbm33kJmMj7o4wPMdHLsGxufvDJ8dVRK/chNcQwATRhlIO0GfayphiftO1spA/X
	hN78bZJKQc0FpyZoZ5tXN1z3yClmD4Sj327EFZnZo54dvrEnsZNGOvzjxCdSTwweV8uflFnWmGm1B
	RVczP89jUBIWBbMPfg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtiJ-00Cp9I-E8; Tue, 17 May 2022 09:41:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqthu-00Coyv-9k; Tue, 17 May 2022 09:41:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6C4FE1F4444E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652780492;
 bh=PPIgkaWPk15dgyzq/HkLMqHpY+oCN4E+hy9YI/AB2gQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SZZBfKPMKBju08Lyb4AOiSQs6ZlnukomJCj4jXKLU2mNyz8OITOLZzAA4hJVeGhRR
 sySdPoksQFofTHDPdCT8We/pIPDYG8aa7/+T15Wv6ILq7X8k9UIIS/k3/rVKMc4xtM
 SMiHBMBSzHtFrBmFqLLieAj6+CJyFPJveZN421psOX1TRGHL0I+SviNhejNig4u+zJ
 KI04i3GQFvMDTu0aZNUqF+HcExc4UaRtIC0lFCBJ6fGt41pdRd6MMowsZqv+caa3tl
 wEbTLEiSTGcpxOFsF351xVItZjDn2S5vSnLo+HdtELq3qTXpxsmJDU5/1B+vwREv74
 8MUO+yL7LHvPQ==
Message-ID: <9f197c69-fe04-b636-afb7-8474763c8a3a@collabora.com>
Date: Tue, 17 May 2022 11:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/5] soc: mediatek: pwrap: Use readx_poll_timeout()
 instead of custom function
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-2-angelogioacchino.delregno@collabora.com>
 <f8acbc75-970c-62fb-ad0d-914e512104a7@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f8acbc75-970c-62fb-ad0d-914e512104a7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_024134_596423_755023B9 
X-CRM114-Status: GOOD (  20.19  )
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

SWwgMTcvMDUvMjIgMTE6MjUsIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPiAKPiAKPiBP
biAxNi8wNS8yMDIyIDE0OjQ2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4g
RnVuY3Rpb24gcHdyYXBfd2FpdF9mb3Jfc3RhdGUoKSBpcyBhIGZ1bmN0aW9uIHRoYXQgcG9sbHMg
YW4gYWRkcmVzcwo+PiB0aHJvdWdoIGEgaGVscGVyIGZ1bmN0aW9uLCBidXQgdGhpcyBpcyB0aGUg
dmVyeSBzYW1lIG9wZXJhdGlvbiB0aGF0Cj4+IHRoZSByZWFkeF9wb2xsX3RpbWVvdXQgbWFjcm8g
bWVhbnMgdG8gZG8uCj4+IENvbnZlcnQgYWxsIGluc3RhbmNlcyBvZiBjYWxsaW5nIHB3cmFwX3dh
aXRfZm9yX3N0YXRlKCkgdG8gaW5zdGVhZAo+PiB1c2UgdGhlIHJlYWRfcG9sbF90aW1lb3V0IG1h
Y3JvLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+PiBSZXZpZXdlZC1ieTogTsOt
Y29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+PiBUZXN0ZWQt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPj4g
LS0tCj4+IMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYyB8IDYwICsrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKyksIDI3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLXBtaWMtd3JhcC5jIAo+PiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbWlj
LXdyYXAuYwo+PiBpbmRleCBiZjM5YTY0ZjNlY2MuLjU0YTUzMDBhYjcyYiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jCj4+ICsrKyBiL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYwo+PiBAQCAtMTMsNiArMTMsOSBAQAo+PiDCoCAj
aW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+
PiArI2RlZmluZSBQV1JBUF9QT0xMX0RFTEFZX1VTwqDCoMKgIDEwCj4+ICsjZGVmaW5lIFBXUkFQ
X1BPTExfVElNRU9VVF9VU8KgwqDCoCAxMDAwMAo+PiArCj4+IMKgICNkZWZpbmUgUFdSQVBfTVQ4
MTM1X0JSSURHRV9JT1JEX0FSQl9FTsKgwqDCoMKgwqDCoMKgIDB4NAo+PiDCoCAjZGVmaW5lIFBX
UkFQX01UODEzNV9CUklER0VfV0FDUzNfRU7CoMKgwqDCoMKgwqDCoCAweDEwCj4+IMKgICNkZWZp
bmUgUFdSQVBfTVQ4MTM1X0JSSURHRV9JTklUX0RPTkUzwqDCoMKgwqDCoMKgwqAgMHgxNAo+PiBA
QCAtMTI0MSwyNyArMTI0NCwxNCBAQCBzdGF0aWMgYm9vbCBwd3JhcF9pc19mc21faWRsZV9hbmRf
c3luY19pZGxlKHN0cnVjdCAKPj4gcG1pY193cmFwcGVyICp3cnApCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAodmFsICYgUFdSQVBfU1RBVEVfU1lOQ19JRExFMCk7Cj4+IMKgIH0KPj4gLXN0YXRpYyBp
bnQgcHdyYXBfd2FpdF9mb3Jfc3RhdGUoc3RydWN0IHBtaWNfd3JhcHBlciAqd3JwLAo+PiAtwqDC
oMKgwqDCoMKgwqAgYm9vbCAoKmZwKShzdHJ1Y3QgcG1pY193cmFwcGVyICopKQo+PiAtewo+PiAt
wqDCoMKgIHVuc2lnbmVkIGxvbmcgdGltZW91dDsKPj4gLQo+PiAtwqDCoMKgIHRpbWVvdXQgPSBq
aWZmaWVzICsgdXNlY3NfdG9famlmZmllcygxMDAwMCk7Cj4+IC0KPj4gLcKgwqDCoCBkbyB7Cj4+
IC3CoMKgwqDCoMKgwqDCoCBpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZwKHdycCkgPyAwIDogLUVUSU1FRE9VVDsKPj4g
LcKgwqDCoMKgwqDCoMKgIGlmIChmcCh3cnApKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsKPj4gLcKgwqDCoCB9IHdoaWxlICgxKTsKPj4gLX0KPj4gLQo+PiDCoCBzdGF0aWMg
aW50IHB3cmFwX3JlYWQxNihzdHJ1Y3QgcG1pY193cmFwcGVyICp3cnAsIHUzMiBhZHIsIHUzMiAq
cmRhdGEpCj4+IMKgIHsKPj4gK8KgwqDCoCBib29sIHRtcDsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0
Owo+PiDCoMKgwqDCoMKgIHUzMiB2YWw7Cj4+IC3CoMKgwqAgcmV0ID0gcHdyYXBfd2FpdF9mb3Jf
c3RhdGUod3JwLCBwd3JhcF9pc19mc21faWRsZSk7Cj4+ICvCoMKgwqAgcmV0ID0gcmVhZHhfcG9s
bF90aW1lb3V0KHB3cmFwX2lzX2ZzbV9pZGxlLCB3cnAsIHRtcCwgdG1wLAo+IAo+IGhtLCBpZiB3
ZSBtYWtlIHRoZSBjb25kICh0bXAgPiAwKSB0aGF0IHdvdWxkIGhlbHAgdG8gdW5kZXJzdGFuZCB0
aGUgY29kZS4gQXQgbGVhc3QgCj4gSSBoYWQgdG8gdGhpbmsgYWJvdXQgaXQgZm9yIGEgbW9tZW50
LiBCdXQgSSBsZWF2ZSBpdCB0byB5b3UgaWYgeW91IHRoaW5rIGl0J3Mgd29ydGggCj4gdGhlIGVm
Zm9ydC4KPiAKCkkgd291bGQgcHJlZmVyIHNpemUgb3ZlciByZWFkYWJpbGl0eSBpbiB0aGlzIGNh
c2UuLi4gaWYgd2UgZG8gKHRtcCA+IDApLCBpdCB3b3VsZApiZSBpbmNvcnJlY3QgdG8ga2VlcCB0
bXAgYXMgYSBgYm9vbGAsIHdlIHdvdWxkIGhhdmUgdG8gc2V0IGl0IGFzIGFuIGludGVnZXIgdmFy
LAp3aGljaCBpcyB1bm5lY2Vzc2FyaWx5IGJpZ2dlciAodGhhdCdzIHRoZSByZWFzb24gd2h5IEkg
d3JvdGUgaXQgbGlrZSBzbyEpLgoKQW5vdGhlciB3YXkgdG8gaW5jcmVhc2UgaHVtYW4gcmVhZGFi
aWxpdHkgd291bGQgYmUgdG8gZG8gKHRtcCA9PSB0cnVlKSwgYnV0IGl0Cmxvb2tzIGEgYml0IHdl
aXJkIHRvIG1lLCBkb2Vzbid0IGl0PwpJZiB5b3UgZGlzYWdyZWUgYWJvdXQgdGhhdCBsb29raW5n
IHdlaXJkLCB0aG91Z2gsIEkgY2FuIGdvIHdpdGggdGhhdCBvbmUsIHBlcmhhcHMhCgpDaGVlcnMs
CkFuZ2VsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
