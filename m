Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC42FC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 02:58:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D10F611AD
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 02:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D10F611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZAONU0GqCYpF0+NPh0Q2i6uHfgyVZl9cz1CjB2fRcWI=; b=P8dyuHUCSsqDQMm6FsU++6TY+
	46TLel3W68ShmW6AyP1FZsQtkltoCuAZBJfbBE9QezU7Cvu5hvbq4+yIQvYpNRZTKSMzENgc9iSxJ
	4GQAg4umZf4FdC8fQeTvuFvefzzLQZ7UFBBzSlyAtwGALe7X3bH/VlmzDHaw3UyTt4LosxA6RpTDF
	Qd4U4LfbugL5+lBFNpqYBlktWwxxZm6W6d7tQ43upOldvuyEpdr9Bmm4OWrzWXKCcPkJgIFNaY56A
	+4bNNFuu88FdIXbLHhrPgMdV9O4onAEy+zxWql4LyLzV9LXp7C1mKloeTW71sQZ/silChMptmg9/Y
	L/Xrj9tGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV3oq-0020uE-QR; Sat, 10 Apr 2021 02:57:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV3nn-0020nc-PH; Sat, 10 Apr 2021 02:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=SVR2eN/8DGiy/V1JHUR96/GaDSzjKtaVBwZ1h8GZUN0=; b=SvWc7oibrswL7ZDQLl4a1sa8St
 7xflR0BR9GMAo/wpSYrUZnqTJjCz3ossd827pwzsO7rJh+oVolzx8jNEPfbx3iEweW5swHy9Umkt+
 FkZr+P2rslYcHMTwwtQ51ywAqjC2TV9cWAOBxqheZQlLqSEJWbKHP5wOWYFGf1d1QWy6/wYrzlz+W
 VvqZ4f4FUkAB+/xbeMFsrBHHhSA1fKq4O1C2XJ84cnEMhonxPlmyN0PRVN+m6Fa9foJ4u7c/7+cpC
 DT7IsRoTo6ta5e/4ZwsdwHvpmNQq32v9HV1ESeVFXcP7NlGxQesTmRQ72xzE8MbMeN8CbHObjXeSE
 kwiSreFA==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV3nl-004ul4-27; Sat, 10 Apr 2021 02:56:50 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso2853106otv.6; 
 Fri, 09 Apr 2021 19:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SVR2eN/8DGiy/V1JHUR96/GaDSzjKtaVBwZ1h8GZUN0=;
 b=uUD2O/y51KW3JSdZbAgToXoJGs1ixszwRykqnfHRQ0eyrS5GFry/NNWbdnQENL21/P
 IlBQhUQ0P5UQqllx0WvT6Nfsir3Pl9SdSz3F3OZAi9Sd/AsPfjywMRoouGGUlmyFX1U3
 i7p1oiVpmO7FqR720vxGGvjpj731Jtp5AF88MtKYdYrXaZsGUqQu9q+NkDJzlu17zDKM
 3m4+v+hxRBZVo54UyauBlwxlN8MSc2DXUu/tocFpD/2eoBS8TfnIP2LoKhv2mSRVq38a
 SKj/WwGiSuPqWRG9fKc3fp5+DQNgbeUOSv3U0pyhYCbLtFRkUsCJdKwTYl7IEoV1+txW
 BPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SVR2eN/8DGiy/V1JHUR96/GaDSzjKtaVBwZ1h8GZUN0=;
 b=UX/sCZO9o3VEBgtThw8Xj57FQHwVhtxhSdpjZdyNBWoyx5OAdDzRmai7tUtkTVfhuP
 yFh99+8741gpesirlSbaKtTeTaU603r5IjPnqsBlJP7Gad9r6tKmZP1htYQwIcPf0IGk
 jiCEOMmV2QrLM4/dX1VccrQ84N4d+2KZMgVcLpmBW7aMMaHiePOla+bkNN/HfLJ3hy1H
 hvgQ/cvLstgl7BU8SjRV0f0BeRNpxtIrPbq7UZCY2neGWUp6HMOwXm2dd1urEBwH8S8o
 UpY9QI3wh++rJKggkIA36gUMLHmGIxkHWn/doX6PRifoRtw/dmrXVSFeN5m+5oz2vWXw
 0IHg==
X-Gm-Message-State: AOAM533W0qCIPBL9Jh7RI+nCwVemLu94NXMwW+yLGkAc2UzonE4dbcTA
 8bOCMTW16aod1V5lBtszVAw=
X-Google-Smtp-Source: ABdhPJxK9Xr35G5Tb9LyWMJhEbLRDKeNHIScNazBc5xFbZnU/yYYo9l8G376bIhW8g2jw9Gfk1VhbQ==
X-Received: by 2002:a05:6830:1af6:: with SMTP id
 c22mr14123458otd.291.1618023407436; 
 Fri, 09 Apr 2021 19:56:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j10sm882405oos.27.2021.04.09.19.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 19:56:46 -0700 (PDT)
Subject: Re: [PATCH] watchdog: mtk: support pre-timeout when the bark irq is
 available
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <ANUA4QBkDhibiES5bK7X8Ko8.3.1618022553315.Hmail.wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <95861c15-0294-ddda-6080-ca15f19eb048@roeck-us.net>
Date: Fri, 9 Apr 2021 19:56:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ANUA4QBkDhibiES5bK7X8Ko8.3.1618022553315.Hmail.wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_195649_126437_04D7DD37 
X-CRM114-Status: GOOD (  17.70  )
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

T24gNC85LzIxIDc6NDIgUE0sIOeOi+aTjiB3cm90ZToKPiAKPj4gT24gNC85LzIxIDI6NTUgQU0s
IFdhbmcgUWluZyB3cm90ZToKPj4+IFVzZSB0aGUgYmFyayBpbnRlcnJ1cHQgYXMgdGhlIHByZXRp
bWVvdXQgbm90aWZpZXIgaWYgYXZhaWxhYmxlLgo+Pj4KPj4+IEJ5IGRlZmF1bHQsIHRoZSBwcmV0
aW1lb3V0IG5vdGlmaWNhdGlvbiBzaGFsbCBvY2N1ciBvbmUgc2Vjb25kIGVhcmxpZXIKPj4+IHRo
YW4gdGhlIHRpbWVvdXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5ncWlu
Z0B2aXZvLmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIHwgNDcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jCj4+PiBpbmRleCA5N2NhOTkzLi44YjkxOWNjCj4+PiAtLS0gYS9kcml2ZXJzL3dhdGNo
ZG9nL210a193ZHQuYwo+Pj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMKPj4+IEBA
IC0yNSw2ICsyNSw3IEBACj4+PiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaD4K
Pj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+ICAjaW5jbHVkZSA8bGludXgvd2F0Y2hk
b2cuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4+PiAgCj4+PiAgI2RlZmlu
ZSBXRFRfTUFYX1RJTUVPVVQJCTMxCj4+PiAgI2RlZmluZSBXRFRfTUlOX1RJTUVPVVQJCTEKPj4+
IEBAIC0yMzQsMTggKzIzNSwzNSBAQCBzdGF0aWMgaW50IG10a193ZHRfc3RhcnQoc3RydWN0IHdh
dGNoZG9nX2RldmljZSAqd2R0X2RldikKPj4+ICAJdm9pZCBfX2lvbWVtICp3ZHRfYmFzZSA9IG10
a193ZHQtPndkdF9iYXNlOwo+Pj4gIAlpbnQgcmV0Owo+Pj4gIAo+Pj4gLQlyZXQgPSBtdGtfd2R0
X3NldF90aW1lb3V0KHdkdF9kZXYsIHdkdF9kZXYtPnRpbWVvdXQpOwo+Pj4gKwlyZXQgPSBtdGtf
d2R0X3NldF90aW1lb3V0KHdkdF9kZXYsIHdkdF9kZXYtPnRpbWVvdXQgLSB3ZHRfZGV2LT5wcmV0
aW1lb3V0KTsKPj4KPj4gVGhhdCBsb29rcyBzdXNwaWNpb3VzbHkgbGlrZSB0aGUgcmVhbCB3YXRj
aGRvZyB3b24ndCBoYXBwZW4gYXQgYWxsLgo+PiBXaGF0IHdpbGwgaGFwcGVuIGlmIHRoZSBwcmV0
aW1lb3V0IGdvdmVybm9yIGlzIHNldCB0byBub25lID8KPj4KPj4gR3VlbnRlcgo+Pgo+IFRoZSBw
cmV0aW1lb3V0IGdvdmVybm9yIGlzIHBhbmljIGJ5IGRlZmF1bHQuIElmIHByZXRpbWVvdXQgaXMg
ZW5hYmxlZCBhbmQgdGhlIGdvdmVybm9yIGlzCj4gc2V0IHRvIG5vbmUsIGl0IG1lYW5zIHRoZSB0
aW1lb3V0IGJlaGF2aW9yIGRvZXMgbm90IG5lZWQgdG8gYmUgcHJvY2Vzc2VkLCBvbmx5IHByaW50
aW5nLgo+IAoKVGhhdCB3YXMgbm90IG15IHF1ZXN0aW9uLiBNeSBxdWVzdGlvbiB3YXMgaWYgdGhl
IHJlYWwgdGltZW91dCBoYXBwZW5zIGluIHRoYXQgY2FzZS4KCkd1ZW50ZXIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
