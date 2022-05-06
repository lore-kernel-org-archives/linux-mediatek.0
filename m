Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D45C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I24gKUkM3EwXgjS8sb7y2uh3PXm5hMR4A8DV8kYkIVE=; b=c31etaQiObQ032
	4FPKLFFEHNwFJxpYoVGXugPc8J+3fQQ2bA0JARWJRHnfXqwF42v+oKMc1f2dP6ndzpLwAjReaa/5j
	RfLLZIwR0O0PLruTQffkUOBOC04ItuCsVXi2M8H9MLmo5+rEINcnxp9pLrrxarUYbaFnA28MWSunO
	mn2kwsYRUjX/E4ZZjAh5DMyd0PHNw3gnUnJ5wFUf9GBenaLUzI+HySsbrdMtRX+MYJpIXRWsbibS6
	tVF3v6jywLLz//DQSSCCXDIdupHXhePhjnC+/tEDulU9iRIRuHDPVNwrQKasZMjKc9ezwBPX6IL02
	AHIOYMvvBiq8ISOqKKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmvl8-002oeL-UX; Fri, 06 May 2022 11:04:30 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmvky-002obJ-7R
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 11:04:21 +0000
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ec42eae76bso77057527b3.10
 for <linux-mediatek@lists.infradead.org>; Fri, 06 May 2022 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4tHVHA8aVbeVaFoDlPql88Q/9NJ6rAQwn4GhNFwxTwM=;
 b=Y9CFhcWaUhjrECjyuSeOchnKMM/ukpyTQez4VqVCH4TtE9eAnEld+/aUwLzu6PDSaT
 ITUMkpj0Pq0svMYhThzFdRj8XblDNogk1iUv15ZpiS6X4YsqXQb101vDE7JxA4TT7Rdi
 3cQH5mDUrSBM6buak1ZnZKR89mpRc9JsOJAeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4tHVHA8aVbeVaFoDlPql88Q/9NJ6rAQwn4GhNFwxTwM=;
 b=LXDbIQ++d4AcEwnx9mQt25lE1fzHNvBtwbEJr2/YFgc6PcbBea5ZT3RR1sj/5gTCqT
 bAZyVslzGfK72BG+F0nyTwtW1x8OXiZhI61cGlJ3QziMymQGeoN6q6n4zQ1zhAE6DVS4
 h6TtDq6gq4u2TEAgvY3biBZ/ykRDDgI2V+wi8y8j5q2gn8u1ns3RMApyFs7umaq8Vw5u
 QUNriBJp1ZX6UEmxKxa2J1JnsGkanlaaE0Jmku1C3G8yd2lmWe0oTwgt47dICLo4XGMC
 gyuZmrNJhP35WuNlQPrsOsjviUxusp3XrfV81KN1qnpaWXSljGuhKPoPXmo2ecxLKFCD
 9Few==
X-Gm-Message-State: AOAM533TgG+aXRtXq+8NbRWkUBL6ly8hFP17uDj7X8sH06DsuoId8Dzu
 /Of6p8hJzIBkqKUi6UfjQ0l5uErj/wvy3xZT19Vkyg==
X-Google-Smtp-Source: ABdhPJzrxlYT0o+pbPyAyvmWw1o6bUmiDPRnLGsburai31NprtPoykzH2hgAePXKTKi3HgMgQsIV/TZZ2+XmP9IUnSc=
X-Received: by 2002:a81:998a:0:b0:2f9:5d24:e362 with SMTP id
 q132-20020a81998a000000b002f95d24e362mr2181373ywg.161.1651835056969; Fri, 06
 May 2022 04:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220505194550.3094656-1-nfraprado@collabora.com>
 <20220505194550.3094656-9-nfraprado@collabora.com>
In-Reply-To: <20220505194550.3094656-9-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 May 2022 19:04:06 +0800
Message-ID: <CAGXv+5H4r+OjFrtxQwoBBHttLo+YJa2+LWveVcL6YMhP0-xF2w@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] arm64: dts: mediatek: asurada: Add keyboard
 mapping for the top row
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_040420_327724_029CFEBD 
X-CRM114-Status: GOOD (  16.13  )
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

SGksCgpPbiBGcmksIE1heSA2LCAyMDIyIGF0IDM6NDYgQU0gTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8KPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IENocm9tZWJvb2tzJyBlbWJl
ZGRlZCBrZXlib2FyZHMgZGlmZmVyIGZyb20gc3RhbmRhcmQgbGF5b3V0cyBmb3IgdGhlCj4gdG9w
IHJvdyBpbiB0aGF0IHRoZXkgaGF2ZSBzaG9ydGN1dHMgaW4gcGxhY2Ugb2YgdGhlIHN0YW5kYXJk
IGZ1bmN0aW9uCj4ga2V5cy4gTWFwIHRoZXNlIGtleXMgdG8gYWNoaWV2ZSB0aGUgZnVuY3Rpb25h
bGl0eSB0aGF0IGlzIHBpY3R1cmVkIG9uCj4gdGhlIHByaW50b3V0cy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+
Cj4gIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAgICB8IDI5ICsr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRh
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kK
PiBpbmRleCA2NjIyMDdkMGViNzUuLmExY2JmN2EzNzViNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKPiBAQCAtNTI1LDMgKzUy
NSwzMiBAQCAmdWFydDAgewo+Cj4gICNpbmNsdWRlIDxhcm0vY3Jvcy1lYy1rZXlib2FyZC5kdHNp
Pgo+ICAjaW5jbHVkZSA8YXJtL2Nyb3MtZWMtc2JzLmR0c2k+Cj4gKwo+ICsma2V5Ym9hcmRfY29u
dHJvbGxlciB7Cj4gKyAgICAgICBmdW5jdGlvbi1yb3ctcGh5c21hcCA9IDwKPiArICAgICAgICAg
ICAgICAgTUFUUklYX0tFWSgweDAwLCAweDAyLCAwKSAgICAgICAvKiBUMSAqLwo+ICsgICAgICAg
ICAgICAgICBNQVRSSVhfS0VZKDB4MDMsIDB4MDIsIDApICAgICAgIC8qIFQyICovCj4gKyAgICAg
ICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMiwgMHgwMiwgMCkgICAgICAgLyogVDMgKi8KPiArICAg
ICAgICAgICAgICAgTUFUUklYX0tFWSgweDAxLCAweDAyLCAwKSAgICAgICAvKiBUNCAqLwo+ICsg
ICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDMsIDB4MDQsIDApICAgICAgIC8qIFQ1ICovCj4g
KyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMiwgMHgwNCwgMCkgICAgICAgLyogVDYgKi8K
PiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAxLCAweDA0LCAwKSAgICAgICAvKiBUNyAq
Lwo+ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDIsIDB4MDksIDApICAgICAgIC8qIFQ4
ICovCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMSwgMHgwOSwgMCkgICAgICAgLyog
VDkgKi8KPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAwLCAweDA0LCAwKSAgICAgICAv
KiBUMTAgKi8KPiArICAgICAgID47Cj4gKyAgICAgICBsaW51eCxrZXltYXAgPSA8Cj4gKyAgICAg
ICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMCwgMHgwMiwgS0VZX0JBQ0spCj4gKyAgICAgICAgICAg
ICAgIE1BVFJJWF9LRVkoMHgwMywgMHgwMiwgS0VZX1JFRlJFU0gpCj4gKyAgICAgICAgICAgICAg
IE1BVFJJWF9LRVkoMHgwMiwgMHgwMiwgS0VZX1pPT00pCj4gKyAgICAgICAgICAgICAgIE1BVFJJ
WF9LRVkoMHgwMSwgMHgwMiwgS0VZX1NDQUxFKQo+ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZ
KDB4MDMsIDB4MDQsIEtFWV9TWVNSUSkKPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAy
LCAweDA0LCBLRVlfQlJJR0hUTkVTU0RPV04pCj4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVko
MHgwMSwgMHgwNCwgS0VZX0JSSUdIVE5FU1NVUCkKPiArICAgICAgICAgICAgICAgTUFUUklYX0tF
WSgweDAyLCAweDA5LCBLRVlfTVVURSkKPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAx
LCAweDA5LCBLRVlfVk9MVU1FRE9XTikKPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAw
LCAweDA0LCBLRVlfVk9MVU1FVVApCgpUaGVyZSdzIGEgc2xpZ2h0IG51YW5jZSBoZXJlLCB0aGUg
a2V5Ym9hcmRzIGZvciBIYXlhdG8gYW5kIFNwaGVyaW9uCmFyZSBub3QgdGhlIHNhbWUgb25lLiBI
YXlhdG8gZm9sbG93cyB0aGUga2V5Ym9hcmQgZGVzaWduIG9mIG9sZGVyCkNocm9tZWJvb2tzLCBz
dWNoIGFzIEtldmluOgoKICAgIGJhY2ssIGZvcndhcmQsIHJlZnJlc2gsIHpvb20sIHNjYWxlLCBi
cmlnaHRuZXNzIHVwIC4uLgogICAgKHRoZSByaWdodCBzaWRlIHBhcnQgaXMgdGhlIHNhbWUpCgpT
cGhlcmlvbidzIGtleWJvYXJkIGxheW91dCBtYXRjaGVzIHdoYXQgeW91IGhhdmUgYWJvdmUuCgpB
bHNvLCAiem9vbSIgc2hvdWxkIHByb2JhYmx5IGJlIGZ1bGwtc2NyZWVuLCBldmVuIHRob3VnaCB0
aGUgdHdvCm1hcCB0byB0aGUgc2FtZSBrZXljb2RlLgoKClJlZ2FyZHMKQ2hlbll1Cgo+ICsKPiAr
ICAgICAgICAgICAgICAgQ1JPU19TVERfTUFJTl9LRVlNQVAKPiArICAgICAgID47Cj4gK307Cj4g
LS0KPiAyLjM2LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
