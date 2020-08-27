Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFA2C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 02:07:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAD42075B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 02:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GXEKDnBV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4jjyt8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBAD42075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=feCAcfUFOxPULRn/6cdJY7HMSkUqxppj3Sw64tiY+iw=; b=GXEKDnBVALcetVlthmTl0P9+S
	/+I5WQwJpFdPH0j2lm/ki56cFnL7zxTs/uV80kZjdo59Bcz3NffZuCBb3LOxg0p+1mVn18OUTfIyS
	87eYiEzdug0UMP1qyhrSDLob0+sVrvrTX8akg7OgthbiuBh8kaoaug0O9duKwTdk6R57QwbMArF/3
	KKsYawzOuGKVqIBaYkQt30Qx0QckeRV+/bJDBRm9xsxPiJFja9chEclFkRYmyv8fAM2Y1GYGyA7bz
	NqnpNCL9pmBRjaEPOOw48dERhN9KI2qz3QvZ6h/sxY7n5+7LJGEy37Oo0Lhg1vgogUSBxPoZ7LIca
	Dztr7UJxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB7Jm-0007df-Oe; Thu, 27 Aug 2020 02:07:10 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB7Jk-0007d0-Fv; Thu, 27 Aug 2020 02:07:09 +0000
Received: by mail-pg1-x542.google.com with SMTP id w186so2215528pgb.8;
 Wed, 26 Aug 2020 19:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmQyc9cOnlMajeIyevmiajMFAkFRM5x/wv6mfoxl6ZY=;
 b=q4jjyt8yfICicSohouW30P9BXnuXQZu/Q8n+opQm3ULTVVkZL6kgl9ZHzC7fMLx2Yk
 Bg8zp42JuOc8QQ1ti9QBBmuyYWXy5gI0ybopD/akhWF2qAYxWtToj9c7N4kPByJq48Js
 ISu6O7JqkH3uJnMJLwrUD6rOV4hSqwLz3KBAonUx05zu9rD40s/6WpDV961+9yCiOlh9
 8yolu2k4+Q0BYZHU5+JWR1zNldmDeMOopX9Z3e6gy/s6B9j5VAVYUCtsdTJJZ34Q+66Z
 qwiq4ObhmEk8SbrPd6V8iz1lCc5860FmbPLYQC81TDVsuzw+mtbsd8JFdtfDyuk83NC+
 cprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vmQyc9cOnlMajeIyevmiajMFAkFRM5x/wv6mfoxl6ZY=;
 b=boRZSJeXJmQQC5C0RlLR2ul38KxJKZogikUlCp6fhsARCuAbL8vITDNVIL+vFALT13
 j1QKsferTyNB14Z94/gna9AchOJZS1MtO8/fDUWfJlldyFTtWcJqclTSRcRLgpXii095
 SPcjW140XJXxBsQz8W2+cVo5lg3m44E1xqAovZeA3TML0rnaEXgrKWHj90DH1wEvsEb5
 WHTyBchUSq3zy3qqq5gozGqU4kTsg+ppHljLykyHFyMf1sX8eYdGdhh2fP3uAOI7+s+9
 OoHZ5c6Udl1AusO+eRD+Nu5nN5LKsaWNQvjIGAlBWNGVdlDyX/NVAOj35Ccp95bxBHP3
 eeXw==
X-Gm-Message-State: AOAM533IzwRP2IHlK/yBLR9rfe5Bu0cbuxR6S7GCnbmY34HpQbUuCdxL
 ZKSiMVKeyCncXox3ahlTEa4=
X-Google-Smtp-Source: ABdhPJwdOnclldZnEMkOvNOp+SVZFei8tTpvxnNhqZKhGPdD/NzwR9wCXmwM8BRb+2u8GZlC8Zq/eg==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
 i9mr14679877plt.128.1598494026370; 
 Wed, 26 Aug 2020 19:07:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v10sm499427pff.192.2020.08.26.19.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 19:07:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
To: =?UTF-8?B?5ZWf5Y6f6buD?= <u0084500@gmail.com>
References: <1598440602-8648-1-git-send-email-u0084500@gmail.com>
 <a7d1a5d9-97e9-bcf6-23f4-2c4be356913f@roeck-us.net>
 <CADiBU3_x5-P8A0erchFpWucX4_R8M01-CdOJv38FjrPGSn+55A@mail.gmail.com>
 <627dd188-9379-1179-432e-b53948052823@roeck-us.net>
 <CADiBU3_GX+BvxQCDkMtf70sXHnwFVNmBCJsrydROHjy5Lr9B4g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f844b044-9ac4-094d-0ff8-feaceb50185f@roeck-us.net>
Date: Wed, 26 Aug 2020 19:07:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADiBU3_GX+BvxQCDkMtf70sXHnwFVNmBCJsrydROHjy5Lr9B4g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_220708_542288_90515ECE 
X-CRM114-Status: GOOD (  13.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gOC8yNi8yMCA2OjExIFBNLCDllZ/ljp/pu4Mgd3JvdGU6Cj4gR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0PiDmlrwgMjAyMOW5tDjmnIgyN+aXpSDpgLHlm5sg5LiK5Y2IOTowMuWv
q+mBk++8mgo+Pgo+PiBPbiA4LzI2LzIwIDU6NTkgUE0sIOWVn+WOn+m7gyB3cm90ZToKPj4gWyAu
Li4gXQo+Pj4+PiArc3RhdGljIGludCBtdDYzNjBfdGNwY19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPj4+Pj4gK3sKPj4+Pj4gKyAgICAgc3RydWN0IG10NjM2MF90Y3BjX2lu
Zm8gKm10aSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+Pj4+PiArCj4+Pj4+ICsgICAg
IHRjcGNpX3VucmVnaXN0ZXJfcG9ydChtdGktPnRjcGNpKTsKPj4+Pgo+Pj4+IFRoYXQgbGVhdmVz
IGludGVycnVwdHMgZW5hYmxlZCwgd2hpY2ggbWlnaHQgYmUgcmFjeQo+Pj4+IGJlY2F1c2UgaW50
ZXJydXB0cyBhcmUgc3RpbGwgZW5hYmxlZCBoZXJlLgo+Pj4gTS4uLiwgeWVzLCBpdCB3aWxsIGNh
dXNlIHRoZSByYWNlIGNvbmRpdGlvbiBkdXJpbmcgbW9kdWxlIHJlbW92ZS4KPj4+IEknbGwgYWRk
IGRpc2FibGVfaXJxIGJlZm9yZSB0Y3BjaSB1bnJlZ2lzdGVyIHRvIHByZXZlbnQgaXQuCj4+Cj4+
IE9yIGp1c3Qgc2V0IFRDUENfQUxFUlRfTUFTSyB0byAwLCBhcyBpbiB0Y3BjaS5jLgo+IEJvdGgg
YXJlIHJpZ2h0LCBUaHguIEknbGwgY2hvb3NlIG9uZS4KPiAKPiBCVFcsIGl0IHNlZW1zIGVudW0g
dHlwZWNfY2Nfc3RhdHVzIGlzIHVzZWQgYnkgdGNwY2kuaC4KPiBJZiBJIGRvbid0IGluY2x1ZGUg
dGNwbS5oLCBpdCB3aWxsIHJhaXNlIGEgd2FybmluZyBkdXJpbmcgdGhlIGNvbXBpbGUgdGltZS4K
Ck9rLCB0aGFua3MgZm9yIHRoZSBub3RlICh0aGF0IG1lYW5zIHRjcGNpLmggc2hvdWxkIGluY2x1
ZGUKbGludXgvdXNiL3RjcG0uaCwgcmVhbGx5KS4KCkd1ZW50ZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
