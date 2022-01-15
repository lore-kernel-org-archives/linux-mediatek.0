Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25125C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 01:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fO58j/jXC6opEoTVlucTThKLMcAKOuGiPzBs8UrNCdM=; b=qVkDSzCLyHxS7K
	RTI2CYvqH2l15TmohWXlNVoMfRG+1EYLNfLdO4aK/NzxZHqROLvVFQXCzs4/GhbxRP9NwDuQitnFq
	5viwuqPEgiSD+GH+FVu7waEV+yj15itpCrbIqczUf6anupe0+mySvrIsCXgmxY6unn5eI4NmAbLLy
	S5ov1OsuC/uMD4smTC2x9EspTh7/6AcUmkt24j1HZaSdDvWXBGV5tPocc5w8flKKo95Ac4xlJCihQ
	/VXzFgzHrnubRRaeiA1kOMy9rNwOKLT7xKtWJpDsLH19n2wGbaOQjl81JR1g5/SG4fd50PwBgASFT
	ud2lUoAlF8DZtWjEaVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Xho-00AWv0-Bh; Sat, 15 Jan 2022 01:18:08 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Xhb-00AWt8-Ip
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 01:17:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id m3so21618192lfu.0
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 17:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DSUCsXvUq5CC+YLJR6sM+UncKVzG/eChv6GRiJ5ewuo=;
 b=Km7B94yItHq7aVfP1T9NUkUg0CfyYu53x8ocQbPhc+dKDkm2Z3Qdmqq6lhxvM80Pks
 16ttYCCVWt7dbiTvfB/TJxujAvsC6cSa06GEpsKkkuaeQlcM8M+t4u99s5lARvhfxInW
 Ci1oy5mNVTaPwV+2dSBlSscKmvmZ+mg0LMkcK6MV3GSRb+XMtxMOJgcgXRxQrrOziDKZ
 Bc7zRC9XKZDw0XoE+bVrA4iEkQtZ7fVhKAaqedPN8V6l0oR6BZz+wRBmSzU31XZDthCr
 spefGhSvdjB+tbrWX7EjLUw/q7lrjUel8Kaldz+FP/57vDBGGjvW2MPQW/bngKKnr/RE
 IoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DSUCsXvUq5CC+YLJR6sM+UncKVzG/eChv6GRiJ5ewuo=;
 b=I/ALFOAS7+/RgAipthJRUitvDvc7a2zQth4K0WyPLSjXYpXU4Yf/KybbfQZApZEdF1
 aicEI9JwoG/mYEoN+ydg0yqqq8UQkoHJ2hG6zGljInPU4rDh2oijPLG2lrqZP+zNzSTm
 kqCzLpWSY0Bl7ZvNazLCvDAMgMEXZ5LzgX8LF8RtjlxD/XAYq49XLae9CGJZqFVeI62e
 4mwRqneCNunOPkRTypU09kBcT908nmnQCOtGSg7fPwaMyK63K7NyC5revDw3I0wjE4Vn
 Hxv7sGFXfwMouC+cjLZ9SQ7qScDoeMP/R7CQl95GO4H/ADPIdBk9j1xeNQKp0RbGwNVa
 pGIQ==
X-Gm-Message-State: AOAM531rA0JFJgHYmTLOxKAbJkbvCnN9IUdgcvbBbO8HvZ7mnG4zUEiH
 KXnJxLaMOJpBvW5UbYXrtVf6y+zjCunEJsx1BXzYvg==
X-Google-Smtp-Source: ABdhPJySDowHRxGMfXN2K9VReVwH+SUfch9JrimtyE5ccTX6eX5LjL8lOKhq1C4RF1mflvPlwsqfGtTGOZn0hxrfPFg=
X-Received: by 2002:a05:6512:3e1f:: with SMTP id
 i31mr4004663lfv.661.1642209473081; 
 Fri, 14 Jan 2022 17:17:53 -0800 (PST)
MIME-Version: 1.0
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
 <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
 <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
In-Reply-To: <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 14 Jan 2022 17:17:39 -0800
Message-ID: <CALAqxLUSjHoLpgFLcvqmDfv7Uip2VwHS5d_5x2nzw=P3rA2NDA@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To: "Guangming.Cao" <guangming.cao@mediatek.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>, 
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "lmark@codeaurora.org" <lmark@codeaurora.org>, 
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, 
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "labbott@redhat.com" <labbott@redhat.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>, 
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_171755_694199_20F8C2B6 
X-CRM114-Status: GOOD (  30.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMTQsIDIwMjIgYXQgNDowNCBBTSBHdWFuZ21pbmcuQ2FvCjxndWFuZ21pbmcu
Y2FvQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIDIwMjItMDEtMTQgYXQgMDg6MTYg
KzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiBBbSAxNC4wMS4yMiB1bSAwMDoyNiBz
Y2hyaWViIEpvaG4gU3R1bHR6Ogo+ID4gPiBPbiBUaHUsIEphbiAxMywgMjAyMiBhdCA1OjA1IEFN
IENocmlzdGlhbiBLw7ZuaWcKPiA+ID4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gQW0gMTMuMDEuMjIgdW0gMTQ6MDAgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4g
PiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gPiA+IEZyb206IGRy
aS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbgo+ID4g
PiA+ID4gPiBCZWhhbGYgT2YKPiA+ID4gPiA+ID4gUnVobCwgTWljaGFlbCBKCj4gPiA+ID4gPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiA+ID4gPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KPiA+ID4gPiA+ID4g
PiBPbiBCZWhhbGYgT2YKPiA+ID4gPiA+ID4gPiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbQo+
ID4gPiA+ID4gPiA+ICsgICAvKgo+ID4gPiA+ID4gPiA+ICsgICAgKiBJbnZhbGlkIHNpemUgY2hl
Y2suIFRoZSAibGVuIiBzaG91bGQgYmUgbGVzcyB0aGFuCj4gPiA+ID4gPiA+ID4gdG90YWxyYW0u
Cj4gPiA+ID4gPiA+ID4gKyAgICAqCj4gPiA+ID4gPiA+ID4gKyAgICAqIFdpdGhvdXQgdGhpcyBj
aGVjaywgb25jZSB0aGUgaW52YWxpZCBzaXplIGFsbG9jYXRpb24KPiA+ID4gPiA+ID4gPiBydW5z
IG9uIGEgcHJvY2Vzcwo+ID4gPiA+ID4gPiA+IHRoYXQKPiA+ID4gPiA+ID4gPiArICAgICogY2Fu
J3QgYmUga2lsbGVkIGJ5IE9PTSBmbG93KHN1Y2ggYXMgImdyYWxsb2MiIG9uCj4gPiA+ID4gPiA+
ID4gQW5kcm9pZCBkZXZpY2VzKSwgaXQKPiA+ID4gPiA+ID4gPiB3aWxsCj4gPiA+ID4gPiA+ID4g
KyAgICAqIGNhdXNlIGEga2VybmVsIGV4Y2VwdGlvbiwgYW5kIHRvIG1ha2UgbWF0dGVycyB3b3Jz
ZSwKPiA+ID4gPiA+ID4gPiB3ZSBjYW4ndCBmaW5kCj4gPiA+ID4gPiA+ID4gd2hvIGFyZSB1c2lu
Zwo+ID4gPiA+ID4gPiA+ICsgICAgKiBzbyBtYW55IG1lbW9yeSB3aXRoICJkbWFfYnVmX2RlYnVn
X3Nob3ciIHNpbmNlIHRoZQo+ID4gPiA+ID4gPiA+IHJlbGV2YW50Cj4gPiA+ID4gPiA+ID4gZG1h
LWJ1ZiBoYXNuJ3QgZXhwb3J0ZWQuCj4gPiA+ID4gPiA+ID4gKyAgICAqLwo+ID4gPiA+ID4gPiA+
ICsgICBpZiAobGVuID4+IFBBR0VfU0hJRlQgPiB0b3RhbHJhbV9wYWdlcygpKQo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBJZiB5b3VyICJoZWFwIiBpcyBmcm9tIGNtYSwgaXMgdGhpcyBzdGlsbCBh
IHZhbGlkIGNoZWNrPwo+ID4gPiA+ID4KPiA+ID4gPiA+IEFuZCB0aGlua2luZyBhIGJpdCBmdXJ0
aGVyLCBpZiBJIGNyZWF0ZSBhIGhlYXAgZnJvbSBzb21ldGhpbmcKPiA+ID4gPiA+IGVsc2UgKHNh
eSBkZXZpY2UgbWVtb3J5KSwKPiA+ID4gPiA+IHlvdSB3aWxsIG5lZWQgdG8gYmUgYWJsZSB0byBm
aWd1cmUgb3V0IHRoZSBtYXhpbXVtIGFsbG93YWJsZQo+ID4gPiA+ID4gY2hlY2sgZm9yIHRoZSBz
cGVjaWZpYwo+ID4gPiA+ID4gaGVhcC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBNYXliZSB0aGUgaGVh
cCBuZWVkcyBhIGNhbGxiYWNrIGZvciBtYXggc2l6ZT8KPiBZZXMsIEkgYWdyZWUgd2l0aCB0aGlz
IHNvbHV0aW9uLgo+IElmIGRtYS1oZWFwIGZyYW1ld29yayBzdXBwb3J0IHRoaXMgdmlhIGFkZGlu
ZyBhIGNhbGxiYWNrIHRvIHN1cHBvcnQgaXQsCj4gc2VlbXMgaXQncyBtb3JlIGNsZWFyIHRoYW4g
YWRkaW5nIGEgbGltaXRhdGlvbiBpbiBkbWEtaGVhcCBmcmFtZXdvcmsKPiBzaW5jZSBlYWNoIGhl
YXAgbWF5YmUgaGFzIGRpZmZlcmVudCBsaW1pdGF0aW9uLgo+IElmIHlvdSBwcmVmZXIgYWRkaW5n
IGNhbGxiYWNrLCBJIGNhbiB1cGRhdGUgdGhpcyBwYXRjaCBhbmQgYWRkIHRvdGFscmFtCj4gbGlt
aXRhdGlvbiB0byBzeXN0ZW0gZG1hLWhlYXAuCgpJZiB0aGUgbWF4IHZhbHVlIGlzIHBlci1oZWFw
LCB3aHkgbm90IGVuZm9yY2UgdGhhdCB2YWx1ZSBpbiB0aGUKcGVyLWhlYXAgYWxsb2NhdGlvbiBm
dW5jdGlvbj8KCk1vdmluZyB0aGUgY2hlY2sgdG8gdGhlIGhlYXAgYWxsb2MgdG8gbWUgc2VlbXMg
c2ltcGxlciB0byBtZSB0aGFuCmFkZGluZyBjb21wbGV4aXR5IHRvIHRoZSBpbmZyYXN0cnVjdHVy
ZSB0byBhZGQgYSBoZWFwIG1heF9zaXplCmNhbGxiYWNrLiBJcyB0aGVyZSBzb21lIG90aGVyIHVz
ZSBmb3IgdGhlIGNhbGxiYWNrIHRoYXQgeW91IGVudmlzaW9uPwoKdGhhbmtzCi1qb2huCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
