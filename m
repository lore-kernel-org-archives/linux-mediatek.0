Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17046C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 13:56:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C8F6142F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 13:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C8F6142F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z3bUXXQU1DCwsRlHgGfAvztnI6xXuOqq+XRFeG7/bNs=; b=W9TS1gBykAm0Ww0CTNpHfFNIS
	bnNcFs/vnjtbddY/0FmAMvJWB9XbLET251umw2gWkDjroB/48kDf8+dMtSmY9ae/14lwEa8UAa9Yc
	MzdkTBowgls9av5jENeGjyea0SeZhI02W0Y8wGJLm3NgEeAd3206MeoiWoxWMgHrZkVUYYO8Bl1sf
	8UEl189PVAWq5pwgjHP+3sAaLIxVQFmn+VyGmkbQD5Z46mvkNopxfdaxcTvfaEXL+IiPzrG/Nun50
	S1C+niZ/Z1YkCf9GRU10CnyqM10gdwIt7/TelJT2zJgtZLSOfai9A/JijXnMoyK2iOSKadHAoIJEs
	0HjrFVGjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZor-00Gq77-19; Thu, 22 Apr 2021 13:56:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZop-00Gq6j-8m; Thu, 22 Apr 2021 13:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=HZfLafI/IDvNf3tC/EcEnaGMSlDdEftiWqvB2zdaIMs=; b=TNZ4dApN4G3z7RcvMh0cBxXf8d
 ce+WneSBMRjX0C/lw0eVIL4unZUsteuYIjZxL3Eg5yMzwLP/onI5BlFZRTtyHgK2DlcT1elVJYL3v
 QYmNXgm1IR0FeZgwAb3G9P9tcZUK2ZFf/7gTZBrbOt491BjGywWh58WNDXqp5j9otF7YSnPKnPijm
 SkZPBpn26yL4ZAKKy+gYY+T/nhJXCo7O/8a6tdLaDxGH/QGLA7LzGxmlIO+vBMJZNWEK6nT7bCACE
 FIdSxY+UJBb4fHTcgtFCK07J/J1HpIzuvJrqFYwhP5i9jPGHnbzyEGQM1RWgjac8QFd/mStDVLteB
 VQpmn8qw==;
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZom-00Djkj-Bb; Thu, 22 Apr 2021 13:56:33 +0000
Received: by mail-oi1-x236.google.com with SMTP id x20so12120406oix.10;
 Thu, 22 Apr 2021 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HZfLafI/IDvNf3tC/EcEnaGMSlDdEftiWqvB2zdaIMs=;
 b=tMyGr+b2P8/zMWY7Cd2ZzlRPUzRewyV7dpglbKrUhh1IjQuVhp7PigSID7j2F7ufVn
 F10j2dg8Z5FpUS5NQWbbfLq79eeGr/h3r+1iXJpfpi3AwC+pXta8ausRU/ilbMeK5eMW
 X3AKtejloWnp9dgv3p10Yc+ujiUnigjIfnsXcXOLl4lbKWKmoJ3acPdnBfPP5QfVM18q
 P5TGAVYXxLVJseQfKDoQChFMkp3idt1R/rmURsAJrpFZzqAr7HgbCZT9XaRVBy4yJ0oW
 t4jx5VZCDO4P197bUH0BiqTgZ+G2+oQFuHc7AZFFqOZIgQ/LnnG4RMZ07yzlFVkzCztk
 ewjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HZfLafI/IDvNf3tC/EcEnaGMSlDdEftiWqvB2zdaIMs=;
 b=q9v29JIIFRl/v+T1o0i+iQhi7pzOeI7T8XlelbYgZ5iFWd500I8uX0C0vSaTuQz+a5
 Lgm007yPhHhdIlinEhu74n046/fa2gBNDcGlhlAEykdbT8rFzGP+Qujfp374/p1nFADX
 AWxgDzU94plpTgyM+uD9kEMW7qgWMHo9KnE9Bdqd/uuVSTtWTSSfREeKUY0VAhxVKqCL
 vra6dq+KLITxT2C16qPmk+E/1hXL4NlMJEYmdEyouUdINgrKoP8uMPX0iBcxkghpoRW2
 VP6NCkNC0g1UE/lZ2RjJLGVlql7DiAZXhW0NhtuNQezIHbf8hAjoiU/zOGM/RVRxnyxI
 f8kA==
X-Gm-Message-State: AOAM530Iu/PySnGrygP36jiOtb/h7eUn4p+kSRxt7Qi2lcsvjm53LLGg
 eIkI1XGmst9KpRcXErBJV2E=
X-Google-Smtp-Source: ABdhPJzNHtXVuCLj7dYY6j0LeN6zhR1wn1tTX5qyZupoVL5zfMqVjQxFSSvo3i78MJcfybtu4Hd+5Q==
X-Received: by 2002:aca:3286:: with SMTP id y128mr75632oiy.145.1619099790369; 
 Thu, 22 Apr 2021 06:56:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m5sm651589ots.13.2021.04.22.06.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 06:56:29 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <AHkAYwDkDhOuqx67*F9EB4r-.3.1619075149689.Hmail.wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <56f16371-5342-5c71-2393-41258cecb516@roeck-us.net>
Date: Thu, 22 Apr 2021 06:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AHkAYwDkDhOuqx67*F9EB4r-.3.1619075149689.Hmail.wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_065632_440263_A39B2F93 
X-CRM114-Status: GOOD (  31.64  )
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

T24gNC8yMi8yMSAxMjowNSBBTSwg546L5pOOIHdyb3RlOgo+IAo+PiBPbiA0LzIxLzIxIDg6NDYg
UE0sIOeOi+aTjiB3cm90ZToKPj4+Cj4+Pj4gT24gNC8yMS8yMSA3OjQ1IFBNLCBXYW5nIFFpbmcg
d3JvdGU6Cj4+Pj4+IFVzZSB0aGUgYmFyayBpbnRlcnJ1cHQgYXMgdGhlIHByZXRpbWVvdXQgbm90
aWZpZXIgaWYgYXZhaWxhYmxlLgo+Pj4+Pgo+Pj4+PiBXaGVuIHRoZSB3YXRjaGRvZyB0aW1lciBl
eHBpcmVzIGluIGR1YWwgbW9kZSwgYW4gaW50ZXJydXB0IHdpbGwgYmUKPj4+Pj4gdHJpZ2dlcmVk
IGZpcnN0LCB0aGVuIHRoZSB0aW1pbmcgcmVzdGFydHMuIFRoZSByZXNldCBzaWduYWwgd2lsbCBi
ZQo+Pj4+PiBpbml0aWF0ZWQgd2hlbiB0aGUgdGltZXIgZXhwaXJlcyBhZ2Fpbi4KPj4+Pj4KPj4+
Pj4gVGhlIHByZXRpbWVvdXQgbm90aWZpY2F0aW9uIHNoYWxsIG9jY3VyIGF0IHRpbWVvdXQtc2Vj
LzIuCj4+Pj4+Cj4+Pj4+IFYyOgo+Pj4+PiAtIHBhbmljKCkgYnkgZGVmYXVsdCBpZiBXQVRDSERP
R19QUkVUSU1FT1VUX0dPViBpcyBub3QgZW5hYmxlZC4KPj4+Pj4KPj4+Pj4gVjM6Cj4+Pj4+IC0g
TW9kaWZ5IHRoZSBwcmV0aW1lb3V0IGJlaGF2aW9yLCBtYW51YWxseSByZXNldCBhZnRlciB0aGUg
cHJldGltZW91dAo+Pj4+PiAtIGlzIHByb2Nlc3NlZCBhbmQgd2FpdCB1bnRpbCB0aW1lb3V0Lgo+
Pj4+Pgo+Pj4+PiBWNDoKPj4+Pj4gLSBSZW1vdmUgcHJldGltZW91dCByZWxhdGVkIHByb2Nlc3Np
bmcuIAo+Pj4+PiAtIEFkZCBkdWFsIG1vZGUgY29udHJvbCBzZXBhcmF0ZWx5Lgo+Pj4+Pgo+Pj4+
PiBWNToKPj4+Pj4gLSBGaXggc29tZSBmb3JtYXR0aW5nIGFuZCBwcmludGluZyBwcm9ibGVtcy4K
Pj4+Pj4KPj4+Pj4gVjY6Cj4+Pj4+IC0gUmVhbGl6ZSBwcmV0aW1lb3V0IHByb2Nlc3NpbmcgdGhy
b3VnaCBkdWFsbW9kZS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5n
cWluZ0B2aXZvLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQu
YyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPj4+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+
Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgYi9kcml2ZXJz
L3dhdGNoZG9nL210a193ZHQuYwo+Pj4+PiBpbmRleCA5N2NhOTkzLi5lYmM2NDhiCj4+Pj4+IC0t
LSBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hk
b2cvbXRrX3dkdC5jCj4+Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+Pj4+ICAjaW5jbHVkZSA8bGlu
dXgvcmVzZXQtY29udHJvbGxlci5oPgo+Pj4+PiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+
Pj4+ICAjaW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4KPj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4KPj4+Pj4gIAo+Pj4+PiAgI2RlZmluZSBXRFRfTUFYX1RJTUVPVVQJCTMxCj4+
Pj4+ICAjZGVmaW5lIFdEVF9NSU5fVElNRU9VVAkJMQo+Pj4+PiBAQCAtMTg0LDE1ICsxODUsMjIg
QEAgc3RhdGljIGludCBtdGtfd2R0X3NldF90aW1lb3V0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2Ug
KndkdF9kZXYsCj4+Pj4+ICB7Cj4+Pj4+ICAJc3RydWN0IG10a193ZHRfZGV2ICptdGtfd2R0ID0g
d2F0Y2hkb2dfZ2V0X2RydmRhdGEod2R0X2Rldik7Cj4+Pj4+ICAJdm9pZCBfX2lvbWVtICp3ZHRf
YmFzZSA9IG10a193ZHQtPndkdF9iYXNlOwo+Pj4+PiArCXVuc2lnbmVkIGludCB0aW1lb3V0X2lu
dGVydmFsOwo+Pj4+PiAgCXUzMiByZWc7Cj4+Pj4+ICAKPj4+Pj4gLQl3ZHRfZGV2LT50aW1lb3V0
ID0gdGltZW91dDsKPj4+Pj4gKwl0aW1lb3V0X2ludGVydmFsID0gd2R0X2Rldi0+dGltZW91dCA9
IHRpbWVvdXQ7Cj4+Pj4+ICsJLyoKPj4+Pj4gKwkgKiBJbiBkdWFsIG1vZGUsIGlycSB3aWxsIGJl
IHRyaWdnZXJlZCBhdCB0aW1lb3V0LzIKPj4+Pj4gKwkgKiB0aGUgcmVhbCB0aW1lb3V0IG9jY3Vy
cyBhdCB0aW1lb3V0Cj4+Pj4+ICsJICovCj4+Pj4+ICsJaWYgKHdkdF9kZXYtPnByZXRpbWVvdXQp
Cj4+Pj4+ICsJCXRpbWVvdXRfaW50ZXJ2YWwgPSB3ZHRfZGV2LT5wcmV0aW1lb3V0ID0gdGltZW91
dC8yOwo+Pj4+Cj4+Pj4gUGxlYXNlIHJ1biBjaGVja3BhdGNoIC0tc3RyaWN0IGFuZCBmaXggd2hh
dCBpdCByZXBvcnRzLgo+Pj4+IEFsc28sIHRoZXJlIHNob3VsZCBiZSBhIHNldF9wcmV0aW1lb3V0
IGZ1bmN0aW9uIHRvIHNldCB0aGUKPj4+PiBwcmV0aW1lb3V0LiBJdCBpcyBvayB0byB1cGRhdGUg
aXQgaGVyZSwgYnV0IGl0IHNob3VsZCBiZSBzZXQKPj4+PiBpbiBpdHMgb3duIGZ1bmN0aW9uIHRv
IG1ha2Ugc3VyZSB0aGF0IHRoZSBhY3R1YWwgdmFsdWUKPj4+PiBpcyByZXBvcnRlZCBiYWNrIHRv
IHVzZXJzcGFjZS4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBHdWVudGVyCj4+Pgo+Pj4gVGhlIHJl
YXNvbiB3aHkgdGhlIHNldF9wcmV0aW1lb3V0IGludGVyZmFjZSBpcyBub3QgcHJvdmlkZWQgaXMg
Cj4+PiBiZWNhdXNlIHRoZSBwcmV0aW1lb3V0IGlzIGZpeGVkIGFmdGVyIHRoZSB0aW1lb3V0IGlz
IHNldCwgIHdlIG5lZWQKPj4+IHRvIG1vZGlmeSB0aW1lb3V0IGFmdGVyIHNldHRpbmcgcHJldGlt
ZW91dCwgd2hpY2ggaXMgcHV6emxpbmcuCj4+Pgo+Pgo+PiBXaGF0IHlvdSBuZWVkIHRvIGRvIGlz
IHRvIHNldCBwcmV0aW1lb3V0ID0gdGltZW91dCAvIDIgaWYgYSBwcmV0aW1lb3V0Cj4+IGlzIHNl
dCB0byBhIHZhbHVlICE9IDAuIEp1c3QgbGlrZSB3ZSBhZGp1c3QgdGltZW91dCB0byB2YWxpZCB2
YWx1ZXMKPj4gd2hlbiBzZXQsIHdlIGFkanVzdCBwcmV0aW1lb3V0IGFzIHdlbGwuIEkgZG9uJ3Qg
c2VlIGEgcHJvYmxlbSB3aXRoIHRoYXQuCj4+Cj4+IEd1ZW50ZXIKPiAKPiBUaGFua3MsIEd1ZW50
ZXIuIEJ1dCB0aGlzIHdpbGwgY29tcGxpY2F0ZSB0aGUgc2l0dWF0aW9uOgo+IEZpcnN0LCBzZXRf
cHJldGltZW91dCB3aWxsIGJlY29tZSBhbiBpbnRlcmZhY2UgZm9yIGR5bmFtaWNhbGx5IGVuYWJs
ZSBhbmQKPiBkaXNhYmxlIHRoZSBwcmUtdGltZW91dCBmdW5jLCBpbnN0ZWFkIG9mIGFkanVzdGlu
ZyB0aGUgcHJldGltZW91dCB0aW1lLiAKPiAKRWZmZWN0aXZlbHkgeWVzLiBUaGF0IGlzIHdoYXQg
aXQgaXMsIGJhc2VkIG9uIGl0cyBsaW1pdGF0aW9ucy4gVGhhdCBpcwpub3QgYSBwcm9ibGVtLCBh
bmQgaW4gdHJ1ZSBmb3IgZXZlcnkgcHJldGltZW91dCBmdW5jdGlvbi4gU2V0IGl0IHRvIDAsCmFu
ZCBpdCBpcyB0dXJuZWQgb2ZmLiBTZXQgaXQgdG8gYSB2YWx1ZSBvdGhlciB0aGFuIDAsIGFuZCBp
dCBpcyB0dXJuZWQgb24uCgo+IFNlY29uZGx5LCB3aGVuIHRoZSBpcnEgaXMgbm90IHJlZ2lzdGVy
ZWQsIHRoZSB1c2VyIGNhbm5vdCBiZSBhbGxvd2VkIHRvIHNldAo+IHRoZSBwcmV0aW1lb3V0IHRv
IG5vbi16ZXJvLiBXaGVuIGlycSBpcyByZWdpc3RlcmVkLCBpdCBkb2Vzbid0IG1ha2UgYW55IHNl
bnNlCj4gdG8gdHVybiBvZmYgcHJlLXRpbWVvdXQgZnVuYy4gCj4gCgpUaGF0IGlzIHlvdXIgb3Bp
bmlvbi4gSXQgaXMgc3RpbGwgYSB1c2VyIGRlY2lzaW9uIHRvIHR1cm4gaXQgb24gb3Igb2ZmLApq
dXN0IGxpa2UgaXQgaXMgYSB1c2VyIGRlY2lzaW9uIHRvIHNldCB0aGUgdGltZW91dCB0byBhIHNw
ZWNpZmljIHZhbHVlCm9yIHRvIGVuYWJsZSB0aGUgd2F0Y2hkb2cgaW4gdGhlIGZpcnN0IHBsYWNl
LiBUaGVyZSBpcyBubyByZWFzb24gdG8KbWFrZSBpdCBtYW5kYXRvcnkganVzdCBiZWNhdXNlIGFu
IGludGVycnVwdCBoYXMgYmVlbiBwcm92aWRlZAoob3IsIHJhdGhlciwgY29ubmVjdGVkKS4KCkFs
c28sIGlmIHRoZSBpbnRlcnJ1cHQgaXMgbm90IHByb3ZpZGVkLCBXRElPRl9QUkVUSU1FT1VUIGlz
IG5vdCBzZXQsCmFuZCB0cnlpbmcgdG8gc2V0IHRoZSBwcmV0aW1lb3V0IHdvdWxkIHJldHVybiAt
RU9QTk9UU1VQUC4KCkd1ZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
