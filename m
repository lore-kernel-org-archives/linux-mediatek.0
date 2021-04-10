Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422A2C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 04:36:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43B161182
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 04:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A43B161182
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UjTc4RUgv6L+ZdzsHoaxUSjVbAnqgLslwoPNIBBHtMY=; b=qHi6csf9yP2wmoGGH7VcDS0pB
	MX5K6SabnzlI4/KuX+3dzutWgr7a1JqPioh7ssvHZaYKvTqtzt4I7jdL+3AsBtchdxjy8MJoMlqex
	hksnBtTL7cw9aRJ0qP+Fr+oOmpEq7pfdA/RuzpUZwmau0ILCwqzihZUTCvRUZ+YcDZ9/pBfZWOf/A
	RUtc0iJ0JjbSDM4/0q5pRTq6sZzcjMC6AXjmTDrG3WdsS1F6p9xwSRUGZkxRPndrOIhG0gkYiQIOa
	iahxX4nznTconCQcg7h4WQDbyC8e+1kru1S7XKEp+OwsLHqG+gb5NDHsgSlUe7PqcHdMVq1L8WUWG
	OQKCDDkrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV5LZ-0028eE-5V; Sat, 10 Apr 2021 04:35:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5LW-0028e6-O0; Sat, 10 Apr 2021 04:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=WZZcv4dXPGfcweYSKUPtzUjMWPM1Ln7H/1gmkASy0xs=; b=3hZdSoxW4UDfnWNNedGZFItlO3
 kEh5DQ8ahaMPSAbw5iJ41rNcINNJw6gmXg9uku+S+wMHvpS47s8aHVhwute6AbWuvDKueM+c3nkB0
 KP6DEMW1kSnSqocQfUqXveYOtb3Ej5XUZoKWxQ4EzEnJa9wLdTFQNkjuvuyi4nsz7Qwbn8AHTz8tf
 l4OvsI2d5DOxTm9y440sTPTfj3Ybarji/xbiTNn3GrCjr7tVDiE2xbucFBjWwqSZRbFAtEOkRRtJ2
 JaWsu6ZAo3kW9BzTnRTrPjG0pr/2heNug+cAVONVHvxlJE03fFb3x5uFOcrS3K8VpaNvwtwMfXsE6
 0tv3EsTQ==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5LT-004vhY-3t; Sat, 10 Apr 2021 04:35:44 +0000
Received: by mail-oo1-xc35.google.com with SMTP id
 x187-20020a4a41c40000b02901b664cf3220so1814168ooa.10; 
 Fri, 09 Apr 2021 21:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WZZcv4dXPGfcweYSKUPtzUjMWPM1Ln7H/1gmkASy0xs=;
 b=trbbCTf2ankWYnd+6bz81jc8CfhhXEnnCpBUijGOD/SEYeT3b+xaZpYF5nqdznXCX8
 8UWL8wiOqlbAS5usAmskeL6RK6J5KVN2+hoXKEQxnnBwMO6En/+xMUDUPB7Lq6W+zhry
 MVdSF8Fgq8iWeL1C0bQWpVeUF3dOzw14rUHCLVsPFkb+VTnxde+fMd00lh5keku79+5K
 iPXeLQkjf/Ck+od+NLZY9pilZeKjmsTiBmTyxB4dEyg6nvTv4ej3jChfYOpgP4p9TIsV
 PO8LkvDUhXoRGOy43p+kQw5e6g0nRZOnzH7ydphSWlSImSXm7E5/fNECXh10WxqZAy4W
 TOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WZZcv4dXPGfcweYSKUPtzUjMWPM1Ln7H/1gmkASy0xs=;
 b=JWQ/mGhJTTR9XZz0oCVgCdOuWEM9X+1TYHA2sDnK/NORqEhG0XSCMxAmOaJX44wbOs
 r2IiC9+HjB7mVhqP8Tzpzo4DtMeAU9P4W3JzH9E8eb/zkChe78Npsdko91qNr/IxlAG4
 /1yyaozFF1Gkk77AlwrImLlXVFfIKu0JDvmsxBy9YXQN+5ty+0QOZIg3qDmgZF+0sxxd
 Nph+N7//m81KS+W0dI5FEEQKqY9aIM5LciHNggmSwYEh0CPhrJCYwjxLMAbu807Qu0BY
 zL5kmNl9lnStUZwXSrsrfQ8a+GdMoADxJo2yJfXxmCM7geP+SCy0eKm4gqd0Yq/gD/fU
 Sjbw==
X-Gm-Message-State: AOAM5306aHeQz7Tk0vQM5J0CzDM2qc3GZpPEvfOwvHl7unkbJi3+Dgjn
 oi2QPF0i7RLMVkMOjjtEVhk=
X-Google-Smtp-Source: ABdhPJz/ghvLOfdY8tPV2aFbdVuxLZl2L7ayPpRz0C+U0pyI0b+OVCaTSQtLrW/ifnsbtV+uI+9vPg==
X-Received: by 2002:a4a:8247:: with SMTP id t7mr14466269oog.53.1618029341237; 
 Fri, 09 Apr 2021 21:35:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e20sm1060496otl.15.2021.04.09.21.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 21:35:40 -0700 (PDT)
Subject: Re: [PATCH] watchdog: mtk: support pre-timeout when the bark irq is
 available
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <AKoADwCwDn4bllbdA00CnKoA.3.1618024305455.Hmail.wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <45e40a84-9d98-87e7-659e-6c34834e6280@roeck-us.net>
Date: Fri, 9 Apr 2021 21:35:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AKoADwCwDn4bllbdA00CnKoA.3.1618024305455.Hmail.wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_213543_197661_5E70CC1F 
X-CRM114-Status: GOOD (  20.86  )
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

T24gNC85LzIxIDg6MTEgUE0sIOeOi+aTjiB3cm90ZToKPiAKPj4gT24gNC85LzIxIDc6NDIgUE0s
IOeOi+aTjiB3cm90ZToKPj4+Cj4+Pj4gT24gNC85LzIxIDI6NTUgQU0sIFdhbmcgUWluZyB3cm90
ZToKPj4+Pj4gVXNlIHRoZSBiYXJrIGludGVycnVwdCBhcyB0aGUgcHJldGltZW91dCBub3RpZmll
ciBpZiBhdmFpbGFibGUuCj4+Pj4+Cj4+Pj4+IEJ5IGRlZmF1bHQsIHRoZSBwcmV0aW1lb3V0IG5v
dGlmaWNhdGlvbiBzaGFsbCBvY2N1ciBvbmUgc2Vjb25kIGVhcmxpZXIKPj4+Pj4gdGhhbiB0aGUg
dGltZW91dC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2
aXZvLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyB8IDQ3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPj4+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgYi9kcml2ZXJzL3dhdGNo
ZG9nL210a193ZHQuYwo+Pj4+PiBpbmRleCA5N2NhOTkzLi44YjkxOWNjCj4+Pj4+IC0tLSBhL2Ry
aXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jCj4+Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+Pj4+ICAjaW5jbHVkZSA8bGludXgvcmVz
ZXQtY29udHJvbGxlci5oPgo+Pj4+PiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+Pj4+ICAj
aW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4KPj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4KPj4+Pj4gIAo+Pj4+PiAgI2RlZmluZSBXRFRfTUFYX1RJTUVPVVQJCTMxCj4+Pj4+ICAj
ZGVmaW5lIFdEVF9NSU5fVElNRU9VVAkJMQo+Pj4+PiBAQCAtMjM0LDE4ICsyMzUsMzUgQEAgc3Rh
dGljIGludCBtdGtfd2R0X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpCj4+
Pj4+ICAJdm9pZCBfX2lvbWVtICp3ZHRfYmFzZSA9IG10a193ZHQtPndkdF9iYXNlOwo+Pj4+PiAg
CWludCByZXQ7Cj4+Pj4+ICAKPj4+Pj4gLQlyZXQgPSBtdGtfd2R0X3NldF90aW1lb3V0KHdkdF9k
ZXYsIHdkdF9kZXYtPnRpbWVvdXQpOwo+Pj4+PiArCXJldCA9IG10a193ZHRfc2V0X3RpbWVvdXQo
d2R0X2Rldiwgd2R0X2Rldi0+dGltZW91dCAtIHdkdF9kZXYtPnByZXRpbWVvdXQpOwo+Pj4+Cj4+
Pj4gVGhhdCBsb29rcyBzdXNwaWNpb3VzbHkgbGlrZSB0aGUgcmVhbCB3YXRjaGRvZyB3b24ndCBo
YXBwZW4gYXQgYWxsLgo+Pj4+IFdoYXQgd2lsbCBoYXBwZW4gaWYgdGhlIHByZXRpbWVvdXQgZ292
ZXJub3IgaXMgc2V0IHRvIG5vbmUgPwo+Pj4+Cj4+Pj4gR3VlbnRlcgo+Pj4+Cj4+PiBUaGUgcHJl
dGltZW91dCBnb3Zlcm5vciBpcyBwYW5pYyBieSBkZWZhdWx0LiBJZiBwcmV0aW1lb3V0IGlzIGVu
YWJsZWQgYW5kIHRoZSBnb3Zlcm5vciBpcwo+Pj4gc2V0IHRvIG5vbmUsIGl0IG1lYW5zIHRoZSB0
aW1lb3V0IGJlaGF2aW9yIGRvZXMgbm90IG5lZWQgdG8gYmUgcHJvY2Vzc2VkLCBvbmx5IHByaW50
aW5nLgo+Pj4KPj4KPj4gVGhhdCB3YXMgbm90IG15IHF1ZXN0aW9uLiBNeSBxdWVzdGlvbiB3YXMg
aWYgdGhlIHJlYWwgdGltZW91dCBoYXBwZW5zIGluIHRoYXQgY2FzZS4KPj4KPj4gR3VlbnRlcgo+
Pgo+IFllcywgdGhlIHJlYWwgdGltZW91dCB3aWxsIGhhcHBlbi4gQWZ0ZXIgV0RUIHRpbWVvdXQs
IElSUSBpcyBzZW50IG91dCBpbnN0ZWFkIG9mIAo+IHJlc2V0IHNpZ25hbCBmaXJzdC4gSW4gb3Jk
ZXIgdG8gZW5zdXJlIHRoYXQgQ1BVIGRvZXMgbm90IGdldCBzdHVjayBhZnRlciBJUlEgaXMgc2Vu
dCBvdXQsIAo+IFdEVCB3aWxsIHRpbWUgYWdhaW4gYW5kIHNlbmQgcmVzZXQgc2lnbmFsIHRvIHJl
c2V0Lgo+IAoKV2hlbiB3aWxsIHRoYXQgYmUsIG9yIGluIG90aGVyIHdvcmRzIGhvdyBkb2VzIHRo
ZSBjaGlwIGtub3cgd2hlbiB0byB0aW1lIG91dCA/CkFmdGVyIGFsbCwgb25seSBhIHNpbmdsZSB0
aW1lb3V0IHZhbHVlIGlzIHdyaXR0ZW4gaW50byB0aGUgY2hpcC4gSSBkb24ndCBzZWUgaG93Cml0
IHdvdWxkIGtub3cgdG8gcmVzZXQgdGhlIGNoaXAgYWZ0ZXIgd2R0X2Rldi0+dGltZW91dC4KCkd1
ZW50ZXIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
