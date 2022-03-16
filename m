Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E451FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1vsCeUyoLYhL6Ema2YUVsWG/+8dX5Jaon2IExueIBE=; b=v7vg8VU2euy69q
	dYMnEjkKv/I5pUUsuCZ/du5AcilfZ7zTLOIenK57FzMCTEkKauMYSQsuwryl2Eib022VDnW9WvJbt
	nIqz85KZg+4Hvuv3bos3fMh1XAHCsejlAnHo7j34g48eJS8R2RxXlSKn7N+fXDnaYqip3d/w2Dhf9
	kBgGC1Cm3QJNBpQe0Utzf8bI5bdb7jsZ60s5GWtVazwiJQQlclLIH+V4vZ4GJouqbFCD6S9fvLftb
	dfKUXSwGH4ZlVJXZ0E7nkuycdtZMNwA6Lgl9iGau1V4wP3xh4UhuNxuKoa+N98hgj7N3mfJ1N3dwo
	NBXpeytbFo5dCLlhEcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUWju-00DpHa-3m; Wed, 16 Mar 2022 16:43:10 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUWjh-00DpFg-Qw; Wed, 16 Mar 2022 16:42:59 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso5211255pjb.0; 
 Wed, 16 Mar 2022 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BW2d8Dyp2cExpWVtXoA7gtuiOGkjmYFfLPkZZvWUWuE=;
 b=KTPQ3uR8oeOAQeb5ExlWZJScxO5hlkacl9opU8+ox5Jddua98cFnBMapXDGeqN7AkN
 /j4abslLcK+1h1QI8EqWclCxcmHVY0VE8vFQJjy3dbM8ihSDevc9bLzIJbhAVHUzCfvX
 iD0ZW0Mt7qxvC64oowDzxsc22nMuPkrEIEf32pk/yj4DQEVw9oWcp/5niCeuejTEGEH3
 /Vi9J1E7nYZXK7tB9OVb/oDQqBr913EvSUfMpBT8x5fNq5upmuH4T8dO6ZoSnUiHkGzy
 FBiF6kWlU72k/jM0uVJLy89jT95HvLBO8VnM8p0WfYggGfXytUdIVrDYXLrGh8qD6mTf
 oCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BW2d8Dyp2cExpWVtXoA7gtuiOGkjmYFfLPkZZvWUWuE=;
 b=fH0xy7FmHDCc8Z2myhWntyul1woxOvQNGWe3g4MjaPBklnZuKhtTCkIp85KA+f8FLs
 EZxSGGXXgCidtYQ77A6Xeur6EwPNmdM/7/oVo1N42YJX8V4KoXiMbqXkbq7J/nxG0yYR
 Ho3BZ2wDJ1W0uIRMf2lqFmZByqnEXg4ekd+EYZ8+2+M/eqdAZWvMZm8g+lulLPLNzJjF
 twqMH5LDtZz0wton9rRHDn1VMA2J54Fs4EredK+HFUjNCcRWy7axt/8mhGocC9poT9Ad
 eeXZ+1g8yt0W5m0XowdjeHMmsLmDmUws0e6zP5zsh3+fJXIl9syzwX0tSpPn9TfQ455I
 9VNw==
X-Gm-Message-State: AOAM530U7tsJlPLaYpqT0q93eT+RmJeBHOOnsvulnftXNpJhge3jaQbs
 sVUka63k3WoYwEEYvW486D626Wh2uhqSEqKqQQQ=
X-Google-Smtp-Source: ABdhPJxnKoIl7zAlULOj1fpixYM20e2JbUK5BjJshGSKsdnWuYUurDE8vJC0f1qon7v4/DPLgFKc5Ioa6Hmgzs6ZUs0=
X-Received: by 2002:a17:902:f686:b0:151:d866:f657 with SMTP id
 l6-20020a170902f68600b00151d866f657mr534723plg.112.1647448976845; Wed, 16 Mar
 2022 09:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220316151327.564214-1-nfraprado@collabora.com>
 <20220316151327.564214-7-nfraprado@collabora.com>
In-Reply-To: <20220316151327.564214-7-nfraprado@collabora.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Wed, 16 Mar 2022 17:42:20 +0100
Message-ID: <CAO_Mup+XApZBaSQLqBBxBPY5U1kOoRNwcWBhoaS+p_gCPx3XCg@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] arm64: dts: mediatek: asurada: Add keyboard
 mapping for the top row
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_094257_915410_2B802527 
X-CRM114-Status: GOOD (  17.56  )
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

xZtyLiwgMTYgbWFyIDIwMjIgbyAxNjoyNiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbwo8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+IG5hcGlzYcWCKGEpOgo+Cj4gQ2hyb21lYm9va3MnIGVtYmVkZGVk
IGtleWJvYXJkcyBkaWZmZXIgZnJvbSBzdGFuZGFyZCBsYXlvdXRzIGZvciB0aGUKPiB0b3Agcm93
IGluIHRoYXQgdGhleSBoYXZlIHNob3J0Y3V0cyBpbiBwbGFjZSBvZiB0aGUgc3RhbmRhcmQgZnVu
Y3Rpb24KPiBrZXlzLiBNYXAgdGhlc2Uga2V5cyB0byBhY2hpZXZlIHRoZSBmdW5jdGlvbmFsaXR5
IHRoYXQgaXMgcGljdHVyZWQgb24KPiB0aGUgcHJpbnRvdXRzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IFJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+Cj4gIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgx
OTItYXN1cmFkYS5kdHNpICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKPiBpbmRleCBiZDI3MzBhYjYyNjYuLjFkMWE0Yjlh
OTg5YSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLmR0c2kKPiBAQCAtNTI1LDMgKzUyNSwzMiBAQCAmdWFydDAgewo+Cj4gICNpbmNsdWRl
IDxhcm0vY3Jvcy1lYy1rZXlib2FyZC5kdHNpPgo+ICAjaW5jbHVkZSA8YXJtL2Nyb3MtZWMtc2Jz
LmR0c2k+Cj4gKwo+ICsma2V5Ym9hcmRfY29udHJvbGxlciB7Cj4gKyAgICAgICBmdW5jdGlvbi1y
b3ctcGh5c21hcCA9IDwKPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAwLCAweDAyLCAw
KSAgICAgICAvKiBUMSAqLwo+ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDMsIDB4MDIs
IDApICAgICAgIC8qIFQyICovCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMiwgMHgw
MiwgMCkgICAgICAgLyogVDMgKi8KPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAxLCAw
eDAyLCAwKSAgICAgICAvKiBUNCAqLwo+ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDMs
IDB4MDQsIDApICAgICAgIC8qIFQ1ICovCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgw
MiwgMHgwNCwgMCkgICAgICAgLyogVDYgKi8KPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgw
eDAxLCAweDA0LCAwKSAgICAgICAvKiBUNyAqLwo+ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZ
KDB4MDIsIDB4MDksIDApICAgICAgIC8qIFQ4ICovCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9L
RVkoMHgwMSwgMHgwOSwgMCkgICAgICAgLyogVDkgKi8KPiArICAgICAgICAgICAgICAgTUFUUklY
X0tFWSgweDAwLCAweDA0LCAwKSAgICAgICAvKiBUMTAgKi8KPiArICAgICAgID47Cj4gKyAgICAg
ICBsaW51eCxrZXltYXAgPSA8Cj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMCwgMHgw
MiwgS0VZX0JBQ0spCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMywgMHgwMiwgS0VZ
X1JFRlJFU0gpCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMiwgMHgwMiwgS0VZX1pP
T00pCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMSwgMHgwMiwgS0VZX1NDQUxFKQo+
ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDMsIDB4MDQsIEtFWV9TWVNSUSkKPiArICAg
ICAgICAgICAgICAgTUFUUklYX0tFWSgweDAyLCAweDA0LCBLRVlfQlJJR0hUTkVTU0RPV04pCj4g
KyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMSwgMHgwNCwgS0VZX0JSSUdIVE5FU1NVUCkK
PiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAyLCAweDA5LCBLRVlfTVVURSkKPiArICAg
ICAgICAgICAgICAgTUFUUklYX0tFWSgweDAxLCAweDA5LCBLRVlfVk9MVU1FRE9XTikKPiArICAg
ICAgICAgICAgICAgTUFUUklYX0tFWSgweDAwLCAweDA0LCBLRVlfVk9MVU1FVVApCj4gKwo+ICsg
ICAgICAgICAgICAgICBDUk9TX1NURF9NQUlOX0tFWU1BUAo+ICsgICAgICAgPjsKPiArfTsKPiAt
LQo+IDIuMzUuMQo+CkknbSBob25lc3RseSBhIGJpdCBjb25mdXNlZCBhYm91dCBmdW5jdGlvbiBv
ZiB0aGlzLgpEb2VzIHRoaXMgY2hhbmdlIHRoZSByZXBvcnRlZCBrZXkgY29kZXMgdmlhIGV2ZGV2
IGludGVyZmFjZT8KT3IgaXMgdGhpcyBqdXN0IGEgaGludCB0byB1c2Vyc3BhY2U/IElmIHllcywg
d291bGQgbGliaW5wdXQgcmVwb3J0CmtleSBwcmVzc2VzIGFzIEYta2V5cyBvciB0aGUgY3VzdG9t
IGZ1bmN0aW9uIGtleXM/CldvdWxkIHVzZXJzIGJlIGFibGUgdG8gdXNlIHRoZSB1c3VhbCBrZXkg
Y29tYmluYXRpb24gdG8gc3dpdGNoCmJldHdlZW4gVFRZcz8KV291bGQgcHJvZ3JhbXMgcmVxdWly
aW5nIEYta2V5cyBzdGlsbCB3b3JrPwoKQmVzdCByZWdhcmRzLApNYXlhIE1hdHVzemN6eWsKCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
