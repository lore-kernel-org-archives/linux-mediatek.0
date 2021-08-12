Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E980C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2908D6104F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 13:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2908D6104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlxzTYvKFaJ1vYw2cMT9CTMXfdfAC/+G/DqcEHVy8KU=; b=gfe8G74A8QnCy+
	d/AftqTKo9+941Qa3KCcKeu4a4rByJQHFypD4ig3v+dvxmCdd1YzGsqZrxLBSBE/BiCDG8uRoQie2
	lyJ0bCXhd7hpKF7uGtb0xv49QSrG1tYulZLaLSFlLY9R2jqPUFvcXRbVt+lmX+M/L02kTSn5kA9+n
	pQEhE2zhsDn7jQEyrtmBBGMjQHKAHsDbZueh7DRfxXo27+eMHbvwswyROhASq6TGYETuQ3QMRKYjt
	c4Hw/rVEmlNjQzw3uYOTTWE1j56mRHpgbRmaETpO5pdSQhqnXa6YxvyXxPV623qjH8Wn8m0AzgMt5
	aCsofVZL53asDezB+t3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEBCt-00ALwQ-3M; Thu, 12 Aug 2021 13:57:15 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEB3W-00AIPy-9w
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 13:47:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so15298456pjr.1
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Aug 2021 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hyhelxpd7QUVPAkk5IYGM9KEnUOWxWDMxwO8ECoYdnU=;
 b=Rs4dAv5o9o6YzH/Kos2vl/SACHZatk/nOkTogbL/1EBFQ9n8+ZFw91oSx+CeUKBQ3H
 2m6mLxziThndH+V4UTq3JF0Qt/JuqFap8S5hupa6Ec5y4PXtz7ajadJH4M8D5rAQblUM
 2su3i/xOb5hBn41lp62bfbt0FSGbf+Admw2lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hyhelxpd7QUVPAkk5IYGM9KEnUOWxWDMxwO8ECoYdnU=;
 b=W6nYgnf1atQe9TTfyOlyN7y/1iEKG4ZETSbYsS0IKCsqCgtY5hqD2RlxS86PG2wik3
 BKRHyHiBQA0ip81d92HlFxhx0sx3khDkurrTIex+FEWWGxnl+dORFmbHbo0eP/IUdooV
 y0w+S2L0dB0lpCRuUahx9tHBbOizpHv9vhywnmMIrEIfgYUNO0W1K1M4dqc1zLb4YFL3
 L+p735qqcLXF+E1OyyrzneNWJhFiQbEsCW8UJdcN4xzMz2l0V46Kg5Y/eydMAvBeoczj
 YUMNzeTxJEWCSjBPDLjXK+6u5ybpVax+RKqLVIPaTjcMAkIhLA78YT50rZpx0SOmwpn0
 3+0g==
X-Gm-Message-State: AOAM533EfsnYuvQufxWngnnXTMBxBZnNDQsfQW72b/6kqlSsVD7AR+j7
 Y2LdglI3Fgs2fKxz/8ewoUfZguQF8emTUfJCnQN2Og==
X-Google-Smtp-Source: ABdhPJzinP+pujlw1HqtoYlTgrZfNU12HLzMgQ+D3ezfZIHtqfWhJuEgsvdCWLJhspWCTXhKmsXTVvomNXPsynDbZYk=
X-Received: by 2002:aa7:8387:0:b029:395:a683:a0e6 with SMTP id
 u7-20020aa783870000b0290395a683a0e6mr4295749pfm.12.1628776053473; Thu, 12 Aug
 2021 06:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
 <YRDxTodNNqtnpPpn@kroah.com>
 <CAATdQgDSCzZtiDSQk94CYHfSb9Mq28OH7-RdaTZNv3oPrW3nkQ@mail.gmail.com>
 <7b48f4c132a8b4b3819282e961fbe8b3ed753069.camel@mediatek.com>
 <CAATdQgD1paUUmWhiLVq-+zq0V6=RTJw89ggk=R6cBUZO+5dB-Q@mail.gmail.com>
 <efcd999aaf83cf73ed2f4f4b9efa1bb93efd2523.camel@mediatek.com>
In-Reply-To: <efcd999aaf83cf73ed2f4f4b9efa1bb93efd2523.camel@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 12 Aug 2021 21:47:22 +0800
Message-ID: <CAATdQgATOhAcr7uMyxAvZCdngMaa-bbG3GDpun11LHOHeLqMjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_064734_441780_EAD5A873 
X-CRM114-Status: GOOD (  39.09  )
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

b29wcyBzb3JyeSBJIHNlbnQgYSBwcmlvciBtYWlsIGluIEhUTUwuClJlc2VuZCB0aGlzIG1haWwg
aW4gcGxhaW4gdGV4dC4KCk9uIFRodSwgQXVnIDEyLCAyMDIxIGF0IDc6NDkgUE0gQ2h1bmZlbmcg
WXVuICjkupHmmKXls7ApCjxDaHVuZmVuZy5ZdW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+IE9u
IFRodSwgMjAyMS0wOC0xMiBhdCAxNzozMSArMDgwMCwgSWtqb29uIEphbmcgd3JvdGU6Cj4gPiBI
SSwKPiA+Cj4gPiBPbiBXZWQsIEF1ZyAxMSwgMjAyMSBhdCA1OjAyIFBNIENodW5mZW5nIFl1biAo
5LqR5pil5bOwKQo+ID4gPENodW5mZW5nLll1bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPbiBNb24sIDIwMjEtMDgtMDkgYXQgMTc6NDIgKzA4MDAsIElram9vbiBKYW5nIHdyb3Rl
Ogo+ID4gPiA+IE9uIE1vbiwgQXVnIDksIDIwMjEgYXQgNToxMSBQTSBHcmVnIEtyb2FoLUhhcnRt
YW4KPiA+ID4gPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIE1vbiwgQXVnIDA5LCAyMDIxIGF0IDA0OjU5OjI5UE0gKzA4MDAsIElram9v
biBKYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiB4aGNpLW10ayBoYXMgNjQgc2xvdHMgZm9yIHBlcmlv
ZGljIGJhbmR3aWR0aCBjYWxjdWxhdGlvbnMgYW5kCj4gPiA+ID4gPiA+IGVhY2gKPiA+ID4gPiA+
ID4gc2xvdCByZXByZXNlbnRzIGJ5dGUgYnVkZ2V0cyBvbiBhIG1pY3JvZnJhbWUuIFdoZW4gYW4K
PiA+ID4gPiA+ID4gZW5kcG9pbnQncwo+ID4gPiA+ID4gPiBhbGxvY2F0aW9uIHNpdHMgb24gdGhl
IGJvdW5kYXJ5IG9mIHRoZSB0YWJsZSwgYnl0ZSBidWRnZXRzJwo+ID4gPiA+ID4gPiBzbG90Cj4g
PiA+ID4gPiA+IHNob3VsZCBiZSByb2xsZWQgb3ZlciBidXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gZG9lc24ndC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBhcHBsaWVz
IGEgNiBiaXRzIG1hc2sgdG8gdGhlIG1pY3JvZnJhbWUgaW5kZXggdG8KPiA+ID4gPiA+ID4gaGFu
ZGxlCj4gPiA+ID4gPiA+IGl0cyByb2xsb3ZlciA2NCBzbG90cyBhbmQgcHJldmVudCBvdXQtb2Yt
Ym91bmRzIGFycmF5IGFjY2Vzcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogSWtqb29uIEphbmcgPGlram5AY2hyb21pdW0ub3JnPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMgfCA3OSAr
KysrKysrKystLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gLS0tLQo+ID4gPiA+ID4gPiAtLS0tLS0t
LQo+ID4gPiA+ID4gPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay5oICAgICB8ICAxICsKPiA+
ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25z
KC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2h5IGlzIHRoaXMgIlJGQyI/ICBXaGF0IG5lZWRzIHRv
IGJlIGFkZHJlc3NlZCBpbiB0aGlzIGNoYW5nZQo+ID4gPiA+ID4gYmVmb3JlIGl0Cj4gPiA+ID4g
PiBjYW4gYmUgYWNjZXB0ZWQ/Cj4gPiA+ID4KPiA+ID4gPiBzb3JyeSwgSSBoYWQgdG8gbWVudGlv
biB3aHkgdGhpcyBpcyBSRkM6Cj4gPiA+ID4KPiA+ID4gPiBJIHNpbXBseSBkb24ndCBrbm93IGFi
b3V0IHRoZSBkZXRhaWxzIG9mIHRoZSB4aGNpLW10ayBpbnRlcm5hbHMuCj4gPiA+ID4gSXQgd2Fz
IG9rYXkgZnJvbSBteSB0ZXN0cyB3aXRoIG10ODE3MyBhbmQgSSB0aGluayB0aGlzIHdpbGwgYmUK
PiA+ID4gPiBoYXJtbGVzcwo+ID4gPiA+IGFzIHRoaXMgaXMgImJldHRlciB0aGFuIGJlZm9yZSIu
Cj4gPiA+ID4KPiA+ID4gPiBCdXQgd2hlbiBJIHJlbW92ZWQgZ2V0X2VzaXRfYm91bmRhcnkoKSwg
SSByZWFsbHkgaGF2ZSBubyBpZGVhIHdoeQo+ID4gPiA+IGl0IHdhcyB0aGVyZS4gSSdtIHdvbmRl
cmluZyBpZiB0aGVyZSB3YXMgYW5vdGhlciByZWFzb24gb2YgdGhhdAo+ID4gPiA+IGZ1bmN0aW9u
Cj4gPiA+ID4gb3RoZXIgdGhhbiBqdXN0IHByZXZlbnRpbmcgb3V0LW9mLWJvdW5kcy4gTWF5YmUg
Y2h1bmZlbmcgY2FuCj4gPiA+ID4gYW5zd2VyCj4gPiA+ID4gdGhpcz8KPiA+ID4KPiA+ID4gV2Ug
dXNlIEBlc2l0IHRvIHByZXZlbnQgb3V0LW9mLWJvdW5kcyBhcnJheSBhY2Nlc3MuIGl0J3Mgbm90
IGEKPiA+ID4gcmluZywKPiA+ID4gY2FuJ3QgaW5zZXJ0IG91dC1vZi1ib3VuZHMgdmFsdWUgaW50
byBoZWFkIHNsb3QuCj4gPgo+ID4gVGhhbmtzLCBzbyB0aGF0IGZ1bmN0aW9uIHdhcyBvbmx5IGZv
ciBvdXQtb2YtYm91bmRzIGFycmF5IGFjY2Vzcy4KPiA+IHRoZW4gSSB0aGluayB3ZSBqdXN0IGNh
biByZW1vdmUgdGhhdCBmdW5jdGlvbiBhbmQgdXNlIGl0IGFzIGEgcmluZy4KPiA+IENhbiB5b3Ug
dGVsbCBtZSBfd2h5XyBpdCBjYW4ndCBiZSB1c2VkIGFzIGEgcmluZz8KPiBUcmVhdCBpdCBhcyBh
IHBlcmlvZCwgcm9sbCBvdmVyIHNsb3QgZXF1YWxzIHRvIHB1dCBpdCBpbnRvIHRoZSBuZXh0Cj4g
cGVyaW9kLgo+Cj4gPgo+ID4gSSB0aGluayBhIHRyYW5zYWN0aW9uIChlLmcuIGVzaXRfYm91bmRh
cnkgPSA3KSBjYW4gc3RhcnQgaXRzIGZpcnN0Cj4gPiBTU1BMSVQKPiA+IGZyb20gWV83IChvZmZz
ZXQgPSA3KS4gQnV0IHdpbGwgdGhhdCBhbGxvY2F0aW9uIGJlIG1hdGNoZWQgd2l0aCB0aGlzPwo+
ID4KPiA+IC0gICAgICAgICAgICAgICBpZiAoKG9mZnNldCArIHNjaF9lcC0+bnVtX2J1ZGdldF9t
aWNyb2ZyYW1lcykgPgo+ID4gZXNpdF9ib3VuZGFyeSkKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4KPiA+IEkgbWVhbiBJJ20gbm90IHN1cmUgd2h5IHRoaXMgaXMgbmVlZGVk
Lgo+IFByZXZlbnQgb3V0LW9mLWJvdW5kcy4KPgo+ID4KPiA+IFVudGlsIG5vdywgSSBjb3VsZG4n
dCBmaW5kIGEgd2F5IHRvIGFjY2VwdCB0aGUgVVNCIGF1ZGlvIGhlYWRzZXQKPiA+IHdpdGggYSBj
b25maWd1cmF0aW9uIG9mIHsgSU5ULUlOIDY0ICsgSVNPQy1PVVQgMzg0ICsgSVNPQy1JTiAxOTIg
fQo+ID4gd2l0aG91dCB0aGlzIHBhdGNoLgo+IHdoYXQgaXMgdGhlIGludGVydmFsIHZhbHVlIG9m
IGVhY2ggZW5kcG9pbnQ/CgppbnRlcnJ1cHQgZXAgaXMgMm1zIGFuZCBvdGhlcnMgYXJlIDFtcwpU
aGFua3MuCgo+Cj4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gdGhhbmtzLAo+ID4gPiA+ID4KPiA+ID4gPiA+IGdyZWcgay1oCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
