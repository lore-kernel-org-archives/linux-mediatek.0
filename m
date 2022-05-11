Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E14FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsKHD5knczj0MerExUgx5LxDs9Ll/WM+fYIjc+hDfk4=; b=k7WY9k/qbpxfib
	f6f3uAEqiRD4bQjctvuiAA93H4Vstk/cE7pNZfpwujSC321FzmbhtfXqESO5mRo4oXp8hnlQ4SJIj
	ZGxiXO0UpzOGLAJj7Jc1fABlc76uDzY/8zJ9mPaaMr3nHviGQyvHvigpzJntKeuOC4Re3GxFzwA/1
	h0WFRIuPvV5DfyD/SVosQ52WBr/R644ujzIjO2WJDAExtLID223RezsD4p8ec/qqd02T2ELqzfok2
	0h235W8zlhJqV4mw0tK5DUtzGWv8q4IrvKYXttM7d6ZccB3iXtoAv7nC943qQYX7OHqMSWCa21WIL
	OhmDizViiGuR+p7EMz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noiP1-0065ur-Gf; Wed, 11 May 2022 09:13:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noiOp-0065rd-CC
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 09:12:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id y21so1783185edo.2
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iSM4KiWX5xiHYNImgQ6cDdJf0LCKtuaDlzcLfop++Jc=;
 b=FM/vJ5D6P9x5+MqRB5GdGmrNf9cYDyJXebGhlNhF2u1A7m2Q+A93DNdO8nK1CBEXer
 zqeo1Rkj7fSn7aO7BsPCAjVkbeq1WnvazQSNJeLEGXJzEr9BrC6MptVVEkqRqLDGqy9R
 ctQbLtbuvZ0bdkBsXU1A1mkJ5FBorUWEZZI9KYJiL/koaHgU+0cm2wnXhQV0KSO0mq5O
 rAQnl9p0rTja6EPjoI73YbS2GoLZZ5fKSQBQMDLQRaSLpVa3lHf6+czUrqLjcSkyzkfy
 90h3XmzZ9y/bIriHXMRqYwCUCiUTbZMVemBEwuFENyHguqz3IH6U79m8+QWZZgn6nEMk
 WHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iSM4KiWX5xiHYNImgQ6cDdJf0LCKtuaDlzcLfop++Jc=;
 b=PhW4y74zejqy0szIrXW0al5GyIJpdHmqG9A1nEftROIGox3UspEChGQPIMWQjzAMS1
 W1opNezC1oZSZ//MKZwnwoU1oEbcmghH2pRW1tmTnXK4ElArPvJJvocMNC6ZdPydBUEE
 N4LDKiVNPwv6uGn3UlCjyQv6USI1Za+1D2RSJXM8oY/fAb66X8oM8GqlLcpVrFYHZX5Y
 6YWrYt1rjvx6bCsRG+c8hpjik69sLkvDnJdKpxNk0uq3DJ27O924bwFgGmA97yP8bpER
 bapqIAa5muDV05OWVhhld0PMkV9N4/+BWbXuK41O0Cwi8AeNt/dJXNK4Cvz9bK7IhPVF
 d+bg==
X-Gm-Message-State: AOAM532T7/1blUKuWBSKFR/OBjfSgkyCGdBCPMqwfneCsh6M/X2EI2pU
 4E1E6mp7GtdmgHvpgprESRxtxg==
X-Google-Smtp-Source: ABdhPJwAJshh0pyoM8iVsERACEz5gij6am1vxgOpfUotlGosF/fppxLJBLF71r5SRAXCzg2PJZXhpA==
X-Received: by 2002:a05:6402:f13:b0:428:a849:d0c1 with SMTP id
 i19-20020a0564020f1300b00428a849d0c1mr11917128eda.346.1652260367481; 
 Wed, 11 May 2022 02:12:47 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 cb13-20020a0564020b6d00b0042617ba639asm893261edb.36.2022.05.11.02.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 02:12:46 -0700 (PDT)
Message-ID: <66796853-efe7-f661-9637-ac6cfefc68e5@linaro.org>
Date: Wed, 11 May 2022 11:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220506213226.257859-1-nfraprado@collabora.com>
 <20220506213226.257859-2-nfraprado@collabora.com>
 <d3e027ca-9ccf-cf91-2414-85d2b9b680f0@linaro.org>
 <20220510165016.r7nyck2abt5m4djp@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510165016.r7nyck2abt5m4djp@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_021251_457988_170C05BB 
X-CRM114-Status: GOOD (  19.86  )
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

T24gMTAvMDUvMjAyMiAxODo1MCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4+PiBB
bHNvIEkgaGFkIHRvIGFkZCBhIGRlc2NyaXB0aW9uIHRvIHRoZSBnbG9iYWwgcmVnLW5hbWVzLCBz
aW5jZSBpdAo+Pj4gY291bGRuJ3QgYmUgbmVpdGhlciBtaXNzaW5nIG5vciBlbXB0eS4KPj4KPj4g
SXQgaXMgcG9zc2libGU6Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2V4YW1wbGUtc2NoZW1h
LnlhbWwjTDkxCj4+Cj4+IEtlZXAgY29uc3RyYWludHMgYW5kIGxpc3Qgb2YgbmFtZXMgaW4gcHJv
cGVydGllcy4gVGhlbiBpbiBhbGxPZjppZjp0aGVuCj4+IHJhaXNlIG1pbkl0ZW1zIG9yIGxvd2Vy
IG1heEl0ZW1zLCBkZXBlbmRpbmcgb24gdGhlIHZhcmlhbnQuCj4gCj4gSGkgS3J6eXN6dG9mLAo+
IAo+IHRoYXQgZXhhbXBsZSBvbmx5IHNob3dzIHNldHRpbmcgbWluSXRlbXMgdG8gb3ZlcnJpZGUg
dGhlIGRlZmF1bHQgdmFsdWUsIGJ1dCB0aGUKPiBpc3N1ZSBoZXJlIGlzIHRoYXQgaXQncyBub3Qg
cG9zc2libGUgdG8gb3ZlcnJpZGUgbWluSXRlbXMvbWF4SXRlbXMgKGFmdGVyCj4gdGhleSdyZSBh
bHJlYWR5IHNldCwgZXZlbiBpZiBpbXBsaWNpdGx5KSB3aXRoIGEgZGlmZmVyZW50IHZhbHVlIGlu
IHRoZSBpZi4KCk5vLCB0aGlzIGV4YW1wbGUgc2hvd3MgZXhhY3RseSB3aGF0IHlvdSBuZWVkIGlu
IGZpcnN0IHN0ZXAgLSBtYWtlIG9uZQppdGVtIG9uIHRoZSBsaXN0IG9wdGlvbmFsLgoKVGhlcmUg
YXJlIHNldmVyYWwgb3RoZXIgZXhhbXBsZXMgZm9yIHRoZSBlbnRpcmUgcGljdHVyZSBvciBkaWZm
ZXJlbnQKYXByb2FjaDoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3Nv
dXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZXhhbXBsZS1zY2hlbWEueWFt
bCNMOTEKCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4LXJjMi9zb3VyY2Uv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NhbXN1bmcsZXh5bm9zNzg4
NS1jbG9jay55YW1sI0w1MwoKPiAKPiBUaGF0IGlzOgo+IAo+IAlwcm9wZXJ0aWVzOgo+IAkgIHJl
Zy1uYW1lczoKPiAJICAgIGl0ZW1zOgo+IAkgICAgICAtIGNvbnN0OiBzcmFtCj4gCSAgICAgIC0g
Y29uc3Q6IGNmZwo+IAkgICAgICAtIGNvbnN0OiBsMXRjbQoKWW91IGRpZCBub3QgdXNlIHRoZSBl
eGFtcGxlIEkgZ2F2ZSB5b3UuIFdoZXJlIGlzIHRoZSBtaW5JdGVtcz8KCj4gCj4gCWlmOgo+IAkg
IHByb3BlcnRpZXM6Cj4gCSAgICBjb21wYXRpYmxlOgo+IAkgICAgICBlbnVtOgo+IAkJLSBtZWRp
YXRlayxtdDgxODMtc2NwCj4gCQktIG1lZGlhdGVrLG10ODE4Ni1zY3AKPiAJdGhlbjoKPiAJICBw
cm9wZXJ0aWVzOgo+IAkgICAgcmVnLW5hbWVzOgo+IAkgICAgICBtaW5JdGVtczogMgo+IAkgICAg
ICBtYXhJdGVtczogMgo+IAo+IEdlbmVyYXRlcyB0aGUgZXJyb3Igb24gZHRic19jaGVjazoKPiAK
PiAvaG9tZS9uZnJhcHJhZG8vZXh0L2dpdC9saW51eC9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE4My1rdWt1aS1rYWthZHUuZHRiOiBzY3BAMTA1MDAwMDA6IHJlZy1uYW1lczogWydz
cmFtJywgJ2NmZyddIGlzIHRvbyBzaG9ydAoKTWlzc2luZyBtaW5JdGVtcyBpbiBmaXJzdCBwcm9w
ZXJ0aWVzLgoKPiAKPiBJIGJlbGlldmUgdGhlIHRvb2xpbmcgaXMgaW1wbGljaXRseSBhZGRpbmcK
PiAKPiAJICAgICAgbWluSXRlbXM6IDMKPiAJICAgICAgbWF4SXRlbXM6IDMKPiAKPiB0byB0aGUg
Y29tbW9uIHJlZy1uYW1lcywgYW5kIHNpbmNlIGl0J3Mgbm90IHBvc3NpYmxlIHRvIG92ZXJyaWRl
IHRoZW0sIHRoZQo+IG92ZXJyaWRlIHRvIDIgZG9lc24ndCB3b3JrIHNvIHRoZXkgYXJlIGtlcHQg
YXQgMywgY2F1c2luZyB0aGUgZXJyb3IuCj4gCj4gTW92aW5nIHRoZSBtaW5JdGVtcy9tYXhJdGVt
cyB0byB0aGUgY29tbW9uIHJlZy1uYW1lcyBhcyBhIHRlc3QgZ2l2ZXM6CgpZb3UgY2Fubm90IGp1
c3QuIFlvdSBuZWVkIGl0IGluIGJvdGggcGxhY2VzLgoKPiAKPiAvaG9tZS9uZnJhcHJhZG8vZXh0
L2dpdC9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9t
dGssc2NwLnlhbWw6IHByb3BlcnRpZXM6cmVnLW5hbWVzOiB7J21pbkl0ZW1zJzogMiwgJ21heEl0
ZW1zJzogMiwgJ2l0ZW1zJzogW3snY29uc3QnOiAnc3JhbSd9LCB7J2NvbnN0JzogJ2NmZyd9LCB7
J2NvbnN0JzogJ2wxdGNtJ31dfSBzaG91bGQgbm90IGJlIHZhbGlkIHVuZGVyIHsncmVxdWlyZWQn
OiBbJ21heEl0ZW1zJ119Cj4gCWhpbnQ6ICJtYXhJdGVtcyIgaXMgbm90IG5lZWRlZCB3aXRoIGFu
ICJpdGVtcyIgbGlzdAo+IAo+IFRoYXQgZXJyb3IsIHBsdXMgbG9va2luZyBpbiB0aGUgaXRlbXMg
bWV0YS1zY2hlbWEsIHN1Z2dlc3RzIG1lIHRoYXQgbWF4SXRlbXMKPiBpc24ndCBzdXBwb3NlZCB0
byBiZSBzZXQgbG93ZXIgdGhlbiB0aGUgbGVuZ3RoIG9mIGl0ZW1zLiBTbyBldmVuIGlmIHRoZQo+
IG1pbkl0ZW1zL21heEl0ZW1zIG92ZXJyaWRlIGlzIGZpeGVkLCB0aGVyZSdzIHN0aWxsIHRoaXMg
aXNzdWUuIEl0IHNlZW1zIGxpa2UKPiBkZWZpbmluZyB0aGUgcmVnLW5hbWVzIGxpc3Qgc2VwYXJl
dGVseSBpbiBlYWNoIGlmIGJyYW5jaCBpcyBpbmRlZWQgdGhlIHJpZ2h0IHdheQo+IHRvIGdvLgoK
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
