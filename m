Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B878C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 10:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FB2613F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 10:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7FB2613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8orBXQz5EAGKTZwwPF0YCo9Wby8bibe58ePlOoImb3I=; b=w3eu7AG0Qhtc7H
	WWfWf65HRRRQWgGLMZu6TN8IO3H3oG2Gj9B56yEBgSvjPTU7K5iDpjrZPcC8iDnhj7t5Hoaw1kHlO
	DrsLNwuka+iVSaEOaRTWFIe9tc5dD5y/dSBVf2V9x8AUPllNuOHfO/8FpJznBezhbi7mFAY0tOKPX
	fG8ZTfmRSxAcFeG8IHFMLBWwNMuJEspejFdj5F9RdqC0ntrVPgQ7e+LMHbHnjVheg2fF++hxlz2Kv
	xAxWWTDHZlfGBwo84y/NJJrRcLFYYnKpKTZFZuO7PdC27yaaMv8yV/8fmRDCxWlTX8JnTZVe0n4KU
	7FqE/AbLBjsLNd3bpD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4L1C-0044H5-1R; Fri, 16 Jul 2021 10:24:30 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4L0r-00446f-K5
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 10:24:11 +0000
Received: by mail-il1-x12f.google.com with SMTP id e13so7805811ilc.1
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Jul 2021 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ex/yhDEeIknXwXGk501wHnuwGxY//6Xn6CYZS4Q3oVI=;
 b=HlcKi3zt5byBuuvxCQ8kgWUUobfgYY4cnsEljSmwCN2glXyDeixxxRGywpRnQp2GRz
 yo9o3pO54zBM6SR4LK/BkA7ExQtc4D55fKjlDDREfmcBIZLG+ramZI/KBx2sA8Zg7LAJ
 WZlbJ0XL1v0YV/vqZEz4jjTERIHGEcZXKN/GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ex/yhDEeIknXwXGk501wHnuwGxY//6Xn6CYZS4Q3oVI=;
 b=fcebSI8hTPSxcvLN3+CyspV8yw2SGfrbrqHsqh2jfzmllp4C/inKJHanrx+36uLHWx
 w76JccB17KoeyTE99ZQU6I7lEjNLOyb5gNmisKjj+aZkJgeOPOW/11oBotNipu/yvijP
 Vr+TORjdZMVyKcvHosaRpZxyTYda6xyC5s+ObLH7hVtnxSU1sg477f318jtaieCpaY6M
 RrErv2XmWhfiI6A3mmdIp+tnypg7PHkmo4b0BlbArqFfTS7LwDL4ulr/Ph8P9sIz4IeN
 O8oEM/XJHO9zfkMsCIENCH+D1jIKpxPG3fjG23vgJwUiiNFa6Pk+HyJ5cbHkOzMh3ES0
 fpIg==
X-Gm-Message-State: AOAM533OzKwgFutEkI+X+olhyrbx1AvskT4lK9vuVnxxFTqyJxwNbuTV
 EFF9BH1FVu6C905o60t5pna5uPUU/U2W/w==
X-Google-Smtp-Source: ABdhPJw/SDSp6O9eC+lj3OWT9J9dsyNloKWDTQDBTdNgs1IwozrjTDsXFA6uv7C9I+aTQT9KM+zFKg==
X-Received: by 2002:a92:d2ca:: with SMTP id w10mr5580948ilg.38.1626431047499; 
 Fri, 16 Jul 2021 03:24:07 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id l11sm4958500ios.8.2021.07.16.03.24.06
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 03:24:06 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id b6so7787087iln.12
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Jul 2021 03:24:06 -0700 (PDT)
X-Received: by 2002:a92:3209:: with SMTP id z9mr6121460ile.115.1626431045834; 
 Fri, 16 Jul 2021 03:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210629094339.874120-1-fshao@chromium.org>
 <20210629094339.874120-2-fshao@chromium.org>
 <YPE9ZSu1lYtRb1DA@google.com>
In-Reply-To: <YPE9ZSu1lYtRb1DA@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 16 Jul 2021 18:23:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhc6a8JMn1DozTUGK=nvuP3ZB8Tmk9g-RtXwVvBHyQZLA@mail.gmail.com>
Message-ID: <CAC=S1nhc6a8JMn1DozTUGK=nvuP3ZB8Tmk9g-RtXwVvBHyQZLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: mt6360: Restore error message to regmap_read
 failure
To: Lee Jones <lee.jones@linaro.org>
Cc: Gene Chen <gene_chen@richtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_032409_686961_159C2AD8 
X-CRM114-Status: GOOD (  23.63  )
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

T24gRnJpLCBKdWwgMTYsIDIwMjEgYXQgNDowMyBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjkgSnVuIDIwMjEsIEZlaSBTaGFvIHdyb3RlOgo+
Cj4gPiBUaGlzIGFkZHMgYmFjayBhIG1pc3NpbmcgZXJyb3IgbWVzc2FnZSBmb3IgYmV0dGVyIGxv
ZyByZWFkYWJpbGl0eS4KPiA+Cj4gPiBGaXhlczogZTg0NzAyOTQwNjEzICgibWZkOiBtdDYzNjA6
IEZpeCBmbG93IHdoaWNoIGlzIHVzZWQgdG8gY2hlY2sgaWMKPiA+IGV4aXN0IikKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBGZWkgU2hhbyA8ZnNoYW9AY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPgo+
ID4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWZkL210NjM2MC1jb3JlLmMgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiBp
bmRleCA2ZWFhNjc3NWI4ODguLjBmZjhkYWU0NTM2YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+
IEBAIC0zNTEsOCArMzUxLDEwIEBAIHN0YXRpYyBpbnQgbXQ2MzYwX2NoZWNrX3ZlbmRvcl9pbmZv
KHN0cnVjdCBtdDYzNjBfZGRhdGEgKmRkYXRhKQo+ID4gICAgICAgaW50IHJldDsKPiA+Cj4gPiAg
ICAgICByZXQgPSByZWdtYXBfcmVhZChkZGF0YS0+cmVnbWFwLCBNVDYzNjBfUE1VX0RFVl9JTkZP
LCAmaW5mbyk7Cj4gPiAtICAgICBpZiAocmV0IDwgMCkKPiA+ICsgICAgIGlmIChyZXQgPCAwKSB7
Cj4gPiArICAgICAgICAgICAgIGRldl9lcnIoZGRhdGEtPmRldiwgIkZhaWxlZCB0byByZWFkIGRl
dmljZSBpbmZvIGZyb20gcmVnbWFwXG4iKTsKPgo+IEknbSBub3QgZnVzc2VkIGFib3V0IHRoaXMg
Y2hhbmdlIGVpdGhlciwgYnV0IGlmIHlvdSBpbnNpc3QsIHBsZWFzZQo+IGNoYW5nZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gYmUgYSBsaXR0bGUgbW9yZSBnZW5lcmljLiAgVXNlcnMgZG9uJ3QKPiBj
YXJlIGFib3V0IFJlZ21hcHMgYW5kIGRldmVsb3BlcnMgY2FuIGdyZXAgaXQgaW4gdGhlIHNvdXJj
ZS4KPgo+IFN1Z2dlc3Q6ICJGYWlsZWQgdG8gZmV0Y2ggZGV2aWNlIGluZm9ybWF0aW9uIGZyb20g
SC9XIgoKSSB0aGluayBJIHdhcyBhIGJpdCB0b28gcGFyYW5vaWQgYWJvdXQgdGhpcy4gUGxlYXNl
IGlnbm9yZSB0aGlzIGFzIGl0CmRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlLCBhbmQgdGhhbmtzIGJv
dGggb2YgeW91IGZvciB0aGUgZmVlZGJhY2suIDopCgpGZWkKCj4KPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPiA+ICsgICAgIH0KPiA+Cj4gPiAgICAgICBpZiAoKGluZm8gJiBDSElQX1ZF
Tl9NQVNLKSAhPSBDSElQX1ZFTl9NVDYzNjApIHsKPiA+ICAgICAgICAgICAgICAgZGV2X2Vycihk
ZGF0YS0+ZGV2LCAiRGV2aWNlIG5vdCBzdXBwb3J0ZWRcbiIpOwo+Cj4gLS0KPiBMZWUgSm9uZXMg
W+adjueQvOaWr10KPiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
PiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
