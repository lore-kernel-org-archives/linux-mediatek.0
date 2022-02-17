Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7740EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH3ryKnfz4wjzCI6KJlnP94c9V9zx8kHWYpQ86SM7N4=; b=k/xTE1BczO+moP
	oTi5T+Xo5DSoJChETsWZwADaH47gwwXbRVHjTwuYXnD4uP6YLXp93e5nb9HgQn1bXRjkXnEn8lt0p
	4RrGNxAQE0GWTIHIG9DxhhvOh2LHdjgrJYp7fPuUhwZ2bj/+xxpYZTZsityvkamULhTlv0lHB6nHW
	bnu0A2YPDugd/prhVaiGYZzf6EJAv0SlOiUFcCPixySaYxkD/k7o8/lfTJDSFAYMpPcHV4OmyC+pu
	6VUyNQg43HcAVIO4GGobOsv4dxK70bfeXCd1yw9rgsCkSR0C3HAJksDTOURcGkw73b7V4bqAjYEBS
	im+ydOsshJuSXcGoJxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKmxs-00BysT-O2; Thu, 17 Feb 2022 20:01:20 +0000
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKmxa-00BykE-0Q
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 20:01:10 +0000
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id KmxUnmRTpBzeEKmxUng2RW; Thu, 17 Feb 2022 21:00:59 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 17 Feb 2022 21:00:59 +0100
X-ME-IP: 90.126.236.122
Message-ID: <bcd6688f-6f42-ca8f-ab9c-978eeff4f4e3@wanadoo.fr>
Date: Thu, 17 Feb 2022 21:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mmc: mtk-sd: use div64_u64() instead of do_div()
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Qing Wang <wangqing@vivo.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1644395927-4138-1-git-send-email-wangqing@vivo.com>
 <CAPDyKFqg5N1tCqQ2u2jt5qU0qLuDJRSJRtq_aMVDc7XNDbRvkw@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAPDyKFqg5N1tCqQ2u2jt5qU0qLuDJRSJRtq_aMVDc7XNDbRvkw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_120104_553171_724B080B 
X-CRM114-Status: GOOD (  14.69  )
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

TGUgMTcvMDIvMjAyMiDDoCAxNjozOSwgVWxmIEhhbnNzb24gYSDDqWNyaXTCoDoKPiBPbiBXZWQs
IDkgRmViIDIwMjIgYXQgMDk6MzksIFFpbmcgV2FuZyA8d2FuZ3FpbmdAdml2by5jb20+IHdyb3Rl
Ogo+Pgo+PiBGcm9tOiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPgo+Pgo+PiBkb19kaXYo
KSBkb2VzIGEgNjQtYnktMzIgZGl2aXNpb24uCj4+IFdoZW4gdGhlIGRpdmlzb3IgaXMgdTY0LCBk
b19kaXYoKSB0cnVuY2F0ZXMgaXQgdG8gMzIgYml0cywgdGhpcyBtZWFucyBpdAo+PiBjYW4gdGVz
dCBub24temVybyBhbmQgYmUgdHJ1bmNhdGVkIHRvIHplcm8gZm9yIGRpdmlzaW9uLgo+Pgo+PiBm
aXggZG9fZGl2LmNvY2NpIHdhcm5pbmc6Cj4+IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZp
c2lvbiwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIGRpdjY0X3U2NCBpbnN0ZWFkLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPgo+IAo+IEFwcGxpZWQgZm9y
IG5leHQsIHRoYW5rcyEKCgpUaGlzIGlzIHdyb25nLgoKU2VlIFsxXS4KCgpXYW5nIFFpbmcsIHlv
dSBzaG91bGQgcmVhbGx5IHdhcm4gYWxsIHRoZSBwZW9wbGUgeW91IGhhdmUgc2VudCBzdWNoIHBh
dGNoZXMuCgpDSgoKWzFdOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVsLzE5
Yjk2OTcyLWNlZTctOTM3Zi0yMWNlLWM3ODk4MmVkMjA0OEBsaW5hcm8ub3JnLwoKCj4gCj4gS2lu
ZCByZWdhcmRzCj4gVWZmZQo+IAo+IAo+PiAtLS0KPj4gICBkcml2ZXJzL21tYy9ob3N0L210ay1z
ZC5jIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyBiL2RyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMKPj4gaW5kZXggNjUwMzdlMS4uNzc3YzlhOAo+PiAtLS0gYS9k
cml2ZXJzL21tYy9ob3N0L210ay1zZC5jCj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNk
LmMKPj4gQEAgLTc2Niw3ICs3NjYsNyBAQCBzdGF0aWMgdTY0IG1zZGNfdGltZW91dF9jYWwoc3Ry
dWN0IG1zZGNfaG9zdCAqaG9zdCwgdTY0IG5zLCB1NjQgY2xrcykKPj4gICAgICAgICAgICAgICAg
ICBjbGtfbnMgID0gMTAwMDAwMDAwMFVMTDsKPj4gICAgICAgICAgICAgICAgICBkb19kaXYoY2xr
X25zLCBtbWMtPmFjdHVhbF9jbG9jayk7Cj4+ICAgICAgICAgICAgICAgICAgdGltZW91dCA9IG5z
ICsgY2xrX25zIC0gMTsKPj4gLSAgICAgICAgICAgICAgIGRvX2Rpdih0aW1lb3V0LCBjbGtfbnMp
Owo+PiArICAgICAgICAgICAgICAgZGl2NjRfdTY0KHRpbWVvdXQsIGNsa19ucyk7Cj4+ICAgICAg
ICAgICAgICAgICAgdGltZW91dCArPSBjbGtzOwo+PiAgICAgICAgICAgICAgICAgIC8qIGluIDEw
NDg1NzYgc2NsayBjeWNsZSB1bml0ICovCj4+ICAgICAgICAgICAgICAgICAgdGltZW91dCA9IERJ
Vl9ST1VORF9VUCh0aW1lb3V0LCBCSVQoMjApKTsKPj4gLS0KPj4gMi43LjQKPj4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
