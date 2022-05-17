Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2265CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gi7wM+K0rEGW8bE6Al4QOqJjHvv9kR2pKWVWxZaj3Uk=; b=F3JaJEchzboTbn
	pcTCK5E6J3Gzav8XJKUdvLsUGbR3R5KgXgERhT0RYy7cRda/UOD850KYTFcBeLjFintiuO7MwQbyh
	6IYDoCWKlx0bMT+Ch6hRevBAcOiyfVbSaJVy38hHqBrp0Pq5WP1hQPgjg5iwRAqZkpljKxyCyxlGD
	rpl9X3oi6u4x50azYtIcN7DXsBuroW3irw/Z9Fw4fg5FczICKPb9DYrR41bWG580NCdvoURdLlI2W
	hBKfJDN1WBR9SUJLovW2dS2SIuEgWpRZGrw2eXWqoGNzmIN9c/kZ8oyveeiVKrJIu/WFPJmXcfZoq
	vTHwMp72dWwrg9dsXPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtps-00CsJK-KV; Tue, 17 May 2022 09:49:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtph-00CsFL-4A; Tue, 17 May 2022 09:49:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 v191-20020a1cacc8000000b00397001398c0so1037797wme.5; 
 Tue, 17 May 2022 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DpqDpoQ86mGSjzackjYkVGZOrE1fChU7d/OHtDBy5EU=;
 b=JBJ4uw2WKDeIWvcfPr6VMC3QifoJJHZdiRve30tbTssMBsrWPXJjyCPE4OLjvTLhIl
 NfpC0Yr5uC7W4OoIJi6uPcYxeykP6LQDFomc0Mc97wUPX3Lx1L+yJ96wYwF9BxKoz11P
 3qYfDeLNaTA1z4tLD1DIVmiENnxUZZuBhsZQ+OXuEUmXDSU2jX/nsQkK/D+JiHsKYX6u
 r+3BlZTdD1i6WuQuHPAQI0DigRani3hSo/X4/VSuS2dQKxXtDsvJIBQ8l6kUuzZUTIl3
 lOUwkQYk6J67knsyfXbi+n+CPdm1j0BQUfyQY+99K025CyBM+oOqcAe2T2yIjyMj3jPI
 gu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DpqDpoQ86mGSjzackjYkVGZOrE1fChU7d/OHtDBy5EU=;
 b=NLYZ7UXVRtlSllId8HKxjC5Sf2+qXMcFPPIOqXdnIv3mvpY0NUybzt6kx1TpUKVmvR
 LsxaZ6ZZT7LxWChPukdPEL1jQQv2VXWEoYjk4d7BqX6c1RFv4K2+FQRW1/+3NuAzNWm3
 43xkQxz+1mtYdTiLrsfkaMMUivNGftkSig5XCKxZ9J48Wz5oWDx9iolSnJOUqyYAdmlz
 cwE1z513iYSs61sJp1pPR8RioZvqd+mUteC+H+J9hs2mZ2Lx6Xk2s5v7a5iXc+OtIxJq
 Mq3kxCw23s/iMt2K6Ces/z9bpsV5WjA+P4CBs/OYrvVhOcFsaEGb70yYsW54pwutd1r8
 CgkQ==
X-Gm-Message-State: AOAM530hPJ51fB0kaJatXv1xJHoNoZw13P7V3mkrXTBGKdoZlVe6i3DT
 45QU1t+q05oqJZ+8n7iOD+0=
X-Google-Smtp-Source: ABdhPJxc6NR92FTeptvCA4+hO3jyue1+FXlzsbJf5GQrUyJsTPK+G1Wfwa9RezLJurVEM4iHWeVcLA==
X-Received: by 2002:a05:600c:224a:b0:394:8ec:3d37 with SMTP id
 a10-20020a05600c224a00b0039408ec3d37mr20467646wmm.19.1652780973999; 
 Tue, 17 May 2022 02:49:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc301000000b003942a244f49sm1370233wmj.34.2022.05.17.02.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:49:33 -0700 (PDT)
Message-ID: <bb1aea80-a926-8545-646e-bb526bc5cb84@gmail.com>
Date: Tue, 17 May 2022 11:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/5] soc: mediatek: pwrap: Move and check return value
 of platform_get_irq()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-4-angelogioacchino.delregno@collabora.com>
 <ad736290-2e01-f867-d2ec-867a4385005a@gmail.com>
 <03ac9b18-cb5d-5ff6-d220-f2f4062cea7e@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <03ac9b18-cb5d-5ff6-d220-f2f4062cea7e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_024937_204385_D1D1C1B3 
X-CRM114-Status: GOOD (  25.29  )
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

CgpPbiAxNy8wNS8yMDIyIDExOjM0LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
PiBJbCAxNy8wNS8yMiAxMToxOCwgTWF0dGhpYXMgQnJ1Z2dlciBoYSBzY3JpdHRvOgo+Pgo+Pgo+
PiBPbiAxNi8wNS8yMDIyIDE0OjQ2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
Pj4+IE1vdmUgdGhlIGNhbGwgdG8gcGxhdGZvcm1fZ2V0X2lycSgpIGVhcmxpZXIgaW4gdGhlIHBy
b2JlIGZ1bmN0aW9uCj4+PiBhbmQgY2hlY2sgZm9yIGl0cyByZXR1cm4gdmFsdWU6IGlmIG5vIGlu
dGVycnVwdCBpcyBzcGVjaWZpZWQsIGl0Cj4+PiB3b3VsZG4ndCBtYWtlIHNlbnNlIHRvIHRyeSB0
byBjYWxsIGRldm1fcmVxdWVzdF9pcnEoKSBzbywgaW4gdGhhdAo+Pj4gY2FzZSwgd2UgY2FuIHNp
bXBseSByZXR1cm4gZWFybHkuCj4+Pgo+Pj4gTW92aW5nIHRoZSBwbGF0Zm9ybV9nZXRfaXJxKCkg
Y2FsbCBhbHNvIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHVzZQo+Pj4gb25lIGxlc3MgZ290bywgYXMg
Y2xvY2tzIGFyZW4ndCByZXF1aXJlZCBhdCB0aGF0IHN0YWdlLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIAo+Pj4gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4+PiBUZXN0ZWQtYnk6IE7DrWNvbGFzIEYu
IFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jIHwgNSArKysrLQo+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13cmFwLmMgCj4+PiBiL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYwo+Pj4gaW5kZXggODUyNTE0MzY2ZjFmLi4zMzJj
YmNhYmMyOTkgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13
cmFwLmMKPj4+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYwo+Pj4g
QEAgLTIyMDQsNiArMjIwNCwxMCBAQCBzdGF0aWMgaW50IHB3cmFwX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiDCoMKgwqDCoMKgIGlmICghd3JwKQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4gK8KgwqDCoCBpcnEgPSBwbGF0Zm9ybV9nZXRf
aXJxKHBkZXYsIDApOwo+Pj4gK8KgwqDCoCBpZiAoaXJxIDwgMCkKPj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gaXJxOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCB3cnApOwo+Pj4gwqDCoMKgwqDCoCB3cnAtPm1hc3RlciA9IG9mX2RldmljZV9nZXRfbWF0
Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPj4+IEBAIC0yMzE2LDcgKzIzMjAsNiBAQCBzdGF0aWMgaW50
IHB3cmFwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiDCoMKgwqDCoMKg
IGlmIChIQVNfQ0FQKHdycC0+bWFzdGVyLT5jYXBzLCBQV1JBUF9DQVBfSU5UMV9FTikpCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcHdyYXBfd3JpdGVsKHdycCwgd3JwLT5tYXN0ZXItPmludDFfZW5f
YWxsLCBQV1JBUF9JTlQxX0VOKTsKPj4+IC3CoMKgwqAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShw
ZGV2LCAwKTsKPj4KPj4gRm9yIGJldHRlciByZWFkYWJpbGl0eSBvZiB0aGUgY29kZSBJJ2QgcHJl
ZmVyIHRvIGtlZXAgcGxhdGZvcm1fZ2V0X2lycSBuZXh0IHRvIAo+PiBkZXZtX3JlcXVlc3RfaXJx
LiBJIHVuZGVyc3RhbmQgdGhhdCB5b3UgZGlkIHRoaXMgY2hhbmdlIHNvIHRoYXQgeW91IGRvbid0
IGhhdmUgCj4+IHRvIGNvZGUKPj4gaWYgKGlycSA8IDApIHsKPj4gwqDCoMKgwqAgcmV0ID0gaXJx
Owo+PiDCoMKgwqDCoCBnb3RvIGVycl9vdXQyOwo+PiB9Cj4+Cj4+IE9yIGRvIEkgbWlzcyBzb21l
dGhpbmc/Cj4+Cj4gCj4gVGhhdCdzIGZvciB0aGUgc2FrZSBvZiByZWR1Y2luZyBnb3RvcyBpbiB0
aGUgY29kZS4uLiBidXQgdGhlcmUncyBhIGJpZ2dlcgo+IHBpY3R1cmUgdGhhdCBJIGhhdmVuJ3Qg
ZXhwbGFpbmVkIGluIHRoaXMgY29tbWl0IGFuZCB0aGF0IHdpbGwgY29tZSBsYXRlcgo+IGJlY2F1
c2UgSSBjdXJyZW50bHkgZG9uJ3QgaGF2ZSB0aGUgbmVjZXNzYXJ5IHRpbWUgdG8gcGVyZm9ybSBh
ICJkZWNlbnQiCj4gdGVzdGluZy4KPiAKPiBBcyBJIHdhcyBleHBsYWluaW5nIC0gdGhlIGJpZ2dl
ciBwaWN0dXJlcyBpbXBsaWVzIGFkZGluZyBhIG5ldyBmdW5jdGlvbiBmb3IKPiBjbG9jayB0ZWFy
ZG93biwgdGhhdCB3ZSB3aWxsIGFkZCBhcyBhIGRldm0gYWN0aW9uOgo+IAo+IGRldm1fYWRkX2Fj
dGlvbl9vcl9yZXNldCgmcGRldi0+ZGV2LCBwd3JhcF9jbGtfZGlzYWJsZV91bnByZXBhcmUsIHdy
cCkKPiAKPiAuLi5zbyB0aGF0IHdlIHdpbGwgYmUgYWJsZSB0byByZW1vdmUgKmFsbCogZ290b3Mg
ZnJvbSB0aGUgcHJvYmUgZnVuY3Rpb24uCj4gCj4gU291bmRzIGdvb2Q/Cj4gCgpTb3VuZHMgZ29v
ZCwgYnV0IHRoYXQgbWVhbnMgd2UgY291bGQgZ2V0IHJpZCBvZiB0aGUgZ290byBhcyB3ZWxsLiBB
bnl3YXkgSSAKcHJlZmVyIHRvIGhhdmUgcGxhdGZvcm1fZ2V0X2lycSBuZXh0IHRvIGRldm1fcmVx
dWVzdF9pcnEuIElmIHdlIGNhbiBnZXQgcmlkIG9mIAp0aGUgZ290byBpbiB0aGUgZnV0dXJlLCBn
cmVhdC4KClJlZ2FyZHMsCk1hdHRoaWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
