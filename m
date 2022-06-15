Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5803C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOAWvTO02AIg/Tw48nj5jK4SmTK33DGHV8y980e1HWI=; b=TBZ+gN6GQK2hOj
	FjMH9FJzXuzxv0E5sKLSI+nqlvyWyrAXUOcgNcRbZZ4n59315P7l25aO4QrlMJQbbldYat4yHQMEz
	fzKmBVBv3ifIsqty/QV2f1SBYKi72dilClGB9ipchzlkcK54qIcoUgfJqKmaKUQ/0oVqv7fcpRoKe
	mTO2H2MUX1+s1NjcweZuUuNbSVK0oX21skACj/skQ6cJEhI9jqiXLD4Oog8W1s86Snf4vmM3oWq2E
	lQbNnt9pqvD0dz76kh/rFVwHtMO5lolSq8JirKOrupnOGE9eLoQVaZEJFq/s9YRe4qxQvxYx+ohA/
	QwyyXBoUF7OauA+Us6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Oxh-00DPNw-95; Wed, 15 Jun 2022 09:05:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1OxL-00DPCy-QR; Wed, 15 Jun 2022 09:04:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CE3E66016CC;
	Wed, 15 Jun 2022 10:04:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655283892;
	bh=k6NEoZsjEYGP1QQyFCr7lIgY0FTshdoki5vnhmBsqGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X0Td8BpR6RVk71SDXY9PoAXRf/ZBNcH1Q3hSZtgI5enUId9VyYxt0lARaZWnl3F/8
	 KxIoDrrg14aNl0vmKrfPQn6J6kBypZ3w9eBKoXZuQ3LFZfQnuzow6202twCiBNdpca
	 AnVFtBrJI52x2O3ke8KdW+1kTVEXXtBj6ECTvRLs4tLX1pLF0aOIeL1WR8rQiP0pLa
	 UKCaFzCjmP8amAZj/B9MooWbr6QLbeKetNZesO0da5DWehXjNt3lR/iyUejhZhZhwa
	 BXkPC98coyDIYxxxLc7rcu1kVjMDJ2A+rstkYH7zVksrW/a9xTnEzLryRU+y/yNo76
	 YBc58jHBInDyQ==
Message-ID: <c025dd3d-00ce-d0a4-b7cb-540901c71f4e@collabora.com>
Date: Wed, 15 Jun 2022 11:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
 <20220613133819.35318-3-angelogioacchino.delregno@collabora.com>
 <277ec646-b709-4a4a-8216-49d528d0e43e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <277ec646-b709-4a4a-8216-49d528d0e43e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_020456_044028_873D6AAF 
X-CRM114-Status: GOOD (  21.50  )
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

SWwgMTQvMDYvMjIgMjA6MzUsIERhbmllbCBMZXpjYW5vIGhhIHNjcml0dG86Cj4gT24gMTMvMDYv
MjAyMiAxNTozOCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4+IFNvbWUgTWVk
aWFUZWsgcGxhdGZvcm1zIHdpdGggYSBidWdneSBUcnVzdFpvbmUgQVRGIGZpcm13YXJlIHdpbGwg
bm90Cj4+IGluaXRpYWxpemUgdGhlIEFBcmNoNjQgU3lzdGVtIFRpbWVyIGNvcnJlY3RseTogaW4g
dGhlc2UgY2FzZXMsIHRoZQo+PiBTeXN0ZW0gVGltZXIgYWRkcmVzcyBpcyBjb3JyZWN0bHkgcHJv
Z3JhbW1lZCwgYXMgd2VsbCBhcyB0aGUgQ05URlJRX0VMMAo+PiByZWdpc3RlciAocmVhZGluZyAx
M01IeiwgYXMgaXQgc2hvdWxkIGJlKSwgYnV0IHRoZSBhc3NpZ25lZCBoYXJkd2FyZQo+PiB0aW1l
cnMgYXJlIG5ldmVyIHN0YXJ0ZWQgYmVmb3JlIChvciBhZnRlcikgYm9vdGluZyBMaW51eC4KPj4K
Pj4gSW4gdGhpcyBjb25kaXRpb24sIGFueSBjYWxsIHRvIGZ1bmN0aW9uIGdldF9jeWNsZXMoKSB3
aWxsIGJlIHJldHVybmluZwo+PiB6ZXJvLCBhcyBDTlRWQ1RfRUwwIHdpbGwgYWx3YXlzIHJlYWQg
emVyby4KPj4KPj4gT25lIGNvbW1vbiBjcml0aWNhbCBzeW1wdG9tIG9mIHRoYXQgaXMgdHJ5aW5n
IHRvIHVzZSB0aGUgdWRlbGF5KCkKPj4gZnVuY3Rpb24gKGNhbGxpbmcgX19kZWxheSgpKSwgd2hp
Y2ggZXhlY3V0ZXMgdGhlIGZvbGxvd2luZyBsb29wOgo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhcnQgPSBnZXRfY3ljbGVzKCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
aGlsZSAoKGdldF9jeWNsZXMoKSAtIHN0YXJ0KSA8IGN5Y2xlcykKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcHVfcmVsYXgoKTsKPj4KPj4gd2hpY2gsIHdoZW4g
Q05UVkNUX0VMMCBhbHdheXMgcmVhZHMgemVybywgdHJhbnNsYXRlcyB0bzoKPj4KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlKCgwIC0gMCkgPCAwKcKgID09PiB3aGlsZSgwIDwgMCkK
Pj4KPj4gLi4uIGdlbmVyYXRpbmcgYW4gaW5maW5pdGUgbG9vcCwgZXZlbiB0aG91Z2ggemVybyBp
cyBuZXZlciBsZXNzCj4+IHRoYW4gemVybywgYnV0IGFsd2F5cyBlcXVhbCB0byBpdCAodGhpcyBo
YXMgdG8gYmUgcmVzZWFyY2hlZCwKPj4gYnV0IGl0J3Mgb3V0IG9mIHRoZSBzY29wZSBvZiB0aGlz
IGNvbW1pdCkuCj4+Cj4+IFRvIGZpeCB0aGlzIGlzc3VlIG9uIHRoZSBhZmZlY3RlZCBNZWRpYVRl
ayBwbGF0Zm9ybXMsIHRoZSBzb2x1dGlvbgo+PiBpcyB0byBzaW1wbHkgc3RhcnQgdGhlIHRpbWVy
cyB0aGF0IGFyZSBkZXNpZ25lZCB0byBiZSBTeXN0ZW0gVGltZXIocykuCj4+IFRoZXNlIHRpbWVy
cywgZG93bnN0cmVhbSwgYXJlIGNhbGxlZCAiQ1BVWEdQVCIgYW5kIHRoZXJlIGlzIG9uZQo+PiB0
aW1lciBwZXIgQ1BVIGNvcmU7IGx1Y2tpbHksIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gc2V0IGEg
c3RhcnQgYml0Cj4+IG9uIGVhY2ggQ1BVWCBHZW5lcmFsIFB1cnBvc2UgVGltZXIsIGJ1dCBpdCdz
IGNvbnZlbmllbnRseSBlbm91Z2ggdG86Cj4+IMKgIC0gU2V0IHRoZSBjbG9jayBkaXZpZGVyIChp
bnB1dCA9IDI2TUh6LCBkaXZpZGVyID0gMiwgb3V0cHV0ID0gMTNNSHopOwo+PiDCoCAtIFNldCB0
aGUgRU5BQkxFIGJpdCBvbiBhIGdsb2JhbCByZWdpc3RlciAoc3RhcnRzIGFsbCBDUFVYIHRpbWVy
cykuCj4+Cj4+IFRoZSBvbmx5IHNtYWxsIGh1cmRsZSB3aXRoIHRoaXMgc2V0dXAgaXMgdGhhdCBp
dCdzIGFsbCBkb25lIHRocm91Z2gKPj4gdGhlIE1DVVNZUyB3cmFwcGVyLCB3aGVyZSBpdCBpcyBu
ZWVkZWQsIGZvciBlYWNoIHJlYWQgb3Igd3JpdGUsIHRvCj4+IHNlbGVjdCBhIHJlZ2lzdGVyIGFk
ZHJlc3MgKGJ5IHdyaXRpbmcgaXQgdG8gYW4gaW5kZXggcmVnaXN0ZXIpIGFuZAo+PiB0aGVuIHRv
IHBlcmZvcm0gYW55IFIvVyBvbiBhICJDT04iIHJlZ2lzdGVyLgo+Pgo+PiBGb3IgZXhhbXBsZSwg
d3JpdGluZyAiMHgxIiB0byB0aGUgQ1BVWEdQVCByZWdpc3RlciBvZmZzZXQgMHg0Ogo+PiAtIFdy
aXRlIDB4NCB0byBtY3VzeXMgSU5ERVggcmVnaXN0ZXIKPj4gLSBXcml0ZSAweDEgdG8gbWN1c3lz
IENPTiByZWdpc3Rlcgo+Pgo+PiBSZWFkaW5nIGZyb20gQ1BVWEdQVCByZWdpc3RlciBvZmZzZXQg
MHg0Ogo+PiAtIFdyaXRlIDB4NCB0byBtY3VzeXMgSU5ERVggcmVnaXN0ZXIKPj4gLSBSZWFkIG1j
dXN5cyBDT04gcmVnaXN0ZXIuCj4+Cj4+IEZpbmFsbHksIHN0YXJ0aW5nIHRoaXMgdGltZXIgbWFr
ZXMgcGxhdGZvcm1zIGFmZmVjdGVkIGJ5IHRoaXMgaXNzdWUKPj4gdG8gd29yayBjb3JyZWN0bHku
Cj4gCj4gV2h5IG5vdCBmaXggdGhlIEFURiA/Cj4gCj4gCgpIZWxsbyBEYW5pZWwsCgp0aGF0J3Mg
bm90IHRoZSBmaXJzdCB0aW1lIHRoaXMgcXVlc3Rpb24gZ2V0cyBhc2tlZCwgYW5kIEkndmUgYWxy
ZWFkeQpwcm92aWRlZCBhbiBleHBsYW5hdGlvbiBmb3IgdGhhdCwgcGxlYXNlIGxvb2sgYXQgWzFd
IGZvciB0aGUgbG9uZyBhbnN3ZXIuCgpBcyBmb3IgdGhlIHNob3J0ZXIgYW5zd2VyOiBPRU0vT0RN
IHNpZ25hdHVyZXMsIHlvdSBjYW4ndCBqdXN0IGNvbXBpbGUgYW5kCmZsYXNoIGEgbmV3IEFURiBv
biB5b3VyIG93biAoYW5kIHNvbWUgT0RNcyBkb24ndCBldmVuIGV4aXN0IGFueW1vcmUpLgpUaGVy
ZSdzIG5vIHdheSBvdGhlciB0aGFuIHRoaXMuCgpbMV06IApodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMjA1MDkyMTA3NDEuMTIwMjAt
My1hbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20vIzI0ODYzMDc3CgpSZWdh
cmRzLApBbmdlbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
