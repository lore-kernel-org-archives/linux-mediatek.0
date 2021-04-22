Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F51C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:02:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BF76142B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BF76142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IyboQiXplmcYMU2T3ZWL9dVTDEE8GnQAvS6ok0ue+jU=; b=O1nYZLJtUFIYba+4CyikGHUPo
	D2Mt8gJJYpz0PNsMp2d4t0sqN4Y9eqRuzl+naM0cr3EQG14XJDmjSqshuRBY6gRq6HObLS2DPKYdn
	EMc472g0UgbySzOQl/bIB9i2F/MrAmjPBXAzO4pQR+6oPTaXsoTmPPB+kc2kC3mABAQYIY8FqPeJx
	mgPNt0aTQj78L3n508r0ZafS/rRcPLYxnpPy5WaPfE/ej9cW4SPuX1CsfLM13o6sJZNo6diqfCbq3
	vM1xLbkyF2Bv8AEsN2ndojheIiiOibSDRz0VsdrEt8kvYPcn0YZFcgOH5Enrc3B8qLxy4wMElT/ho
	EoYEJhJTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQXg-00FkQZ-B9; Thu, 22 Apr 2021 04:02:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQXZ-00FkPV-Bc; Thu, 22 Apr 2021 04:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ITBmDLLHz4eUEAesx065LH4ASYqLeFzaAtVhvUxkuzo=; b=UyVRjb+nXgkMUT3aGbWRSbuKcf
 q2H8uoGBZPFYKF+2N/IaJOwW+mmmmTFvo3u9MaQBUJb8ITNBe9eyKhcmAJzpz4dhxdsdI/1nHuAV1
 ZwWDaENuAfmyfK8bvFR6m7CIR+jrrc50fq+uThtkyL9Ep4oE1KHnPGA42qdZ0xLU8GkRM9Lc72qPs
 5f3YsMPA84K7N3uNmYpOtfyMRNZrs9VSI0WN813xeqeFs1rRfK3i8TkWjxWPEYKpgHNYAdMe69zXP
 hBWSnriSjSj4qA6ObM3rSOiI58Ny9afylU3cl5IR/5jfcD/oleZLVNVXHxuWpaPiJSIGTp+4yMP4U
 9Y/qjtuA==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQXW-00DLQm-Hr; Thu, 22 Apr 2021 04:02:07 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso39037064otb.13; 
 Wed, 21 Apr 2021 21:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ITBmDLLHz4eUEAesx065LH4ASYqLeFzaAtVhvUxkuzo=;
 b=pxOuQRsIHGzibblHMbiIsI0bVr8qo7MFIzg00Lviq4sYlEIlTCyM1GeESgKrUfWE8Q
 ZIPr+qUteAuxIGKZud6QfdMvVhOCzaRiFf//VC1LzxzmUrUZWMOJOHJBQVCMyzpGO4b8
 ra3adM3/Z8+2vYbwk/YnLVgDOhDTunxXJndQR3ZIIrcmFY69oE8xzXomn9aCw7y072Kj
 NpngQm2pihVTJxFraf3WsEtJ5LrjmJgFvNkCoGp+0mSBQn6cNQzm3smBmRRGSVZ/FgbF
 YezP31SVAUehk5Z7h9Wvj4jDPY3OAWaI5E6wbhspFKJrslwALC3dpAp1Fnt87GqEiP8n
 kZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ITBmDLLHz4eUEAesx065LH4ASYqLeFzaAtVhvUxkuzo=;
 b=LC2u9miQsUNQe/zi35z+JBvavw2R4C2UjsbWmgFO2Zz+tfY59c9qfIMpuOvVMXeFbC
 S6Tpkau8NEfcl+gAqDplSoS6/DN2sHEH0MBlcDLck4W5MGgJRnp9uux/uxm0Iy+2r4Yd
 rOp6tE8kwc7yehxo/hK67kdqD5uKKcmyf9O8jNZ7YRo03/LlCjJmtrlCWHczONjayE9T
 Jvvqd5fFff6DtULXDk5vMazxV4SpK+klNrEHdRL5tfvRI/9LjDwiLXqpv9A2rZFOY/kS
 UBFKECkN26bcQmVTh/Eq88WCw7OBnTeFCyqdZqzYhOm5Jq5YEe8Aw9cA7U2lSsunGXLq
 ypzg==
X-Gm-Message-State: AOAM5338Ulr/NjMrKB2X3VhUDmWsua1SwTYVZm2ffsjdJXwFNyEyfpyO
 VFlZjNebpr7M/jjsJeA3Ih0=
X-Google-Smtp-Source: ABdhPJwZn+kalZMmuwlslp4kjozhVPGyz+amC40rMJBjJ3+5HjN8KZ84FN09nCgiflwBKIM7LWhZNw==
X-Received: by 2002:a9d:6749:: with SMTP id w9mr1198603otm.24.1619064125556;
 Wed, 21 Apr 2021 21:02:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e2sm358399otk.70.2021.04.21.21.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 21:02:04 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <AJYA1QBSDhatYsq-n3vbqqrl.3.1619063178146.Hmail.wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <26bed2e5-6ec8-72ae-ff2c-c707c00d5125@roeck-us.net>
Date: Wed, 21 Apr 2021 21:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AJYA1QBSDhatYsq-n3vbqqrl.3.1619063178146.Hmail.wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210206_619315_38B857AF 
X-CRM114-Status: GOOD (  24.68  )
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

T24gNC8yMS8yMSA4OjQ2IFBNLCDnjovmk44gd3JvdGU6Cj4gCj4+IE9uIDQvMjEvMjEgNzo0NSBQ
TSwgV2FuZyBRaW5nIHdyb3RlOgo+Pj4gVXNlIHRoZSBiYXJrIGludGVycnVwdCBhcyB0aGUgcHJl
dGltZW91dCBub3RpZmllciBpZiBhdmFpbGFibGUuCj4+Pgo+Pj4gV2hlbiB0aGUgd2F0Y2hkb2cg
dGltZXIgZXhwaXJlcyBpbiBkdWFsIG1vZGUsIGFuIGludGVycnVwdCB3aWxsIGJlCj4+PiB0cmln
Z2VyZWQgZmlyc3QsIHRoZW4gdGhlIHRpbWluZyByZXN0YXJ0cy4gVGhlIHJlc2V0IHNpZ25hbCB3
aWxsIGJlCj4+PiBpbml0aWF0ZWQgd2hlbiB0aGUgdGltZXIgZXhwaXJlcyBhZ2Fpbi4KPj4+Cj4+
PiBUaGUgcHJldGltZW91dCBub3RpZmljYXRpb24gc2hhbGwgb2NjdXIgYXQgdGltZW91dC1zZWMv
Mi4KPj4+Cj4+PiBWMjoKPj4+IC0gcGFuaWMoKSBieSBkZWZhdWx0IGlmIFdBVENIRE9HX1BSRVRJ
TUVPVVRfR09WIGlzIG5vdCBlbmFibGVkLgo+Pj4KPj4+IFYzOgo+Pj4gLSBNb2RpZnkgdGhlIHBy
ZXRpbWVvdXQgYmVoYXZpb3IsIG1hbnVhbGx5IHJlc2V0IGFmdGVyIHRoZSBwcmV0aW1lb3V0Cj4+
PiAtIGlzIHByb2Nlc3NlZCBhbmQgd2FpdCB1bnRpbCB0aW1lb3V0Lgo+Pj4KPj4+IFY0Ogo+Pj4g
LSBSZW1vdmUgcHJldGltZW91dCByZWxhdGVkIHByb2Nlc3NpbmcuIAo+Pj4gLSBBZGQgZHVhbCBt
b2RlIGNvbnRyb2wgc2VwYXJhdGVseS4KPj4+Cj4+PiBWNToKPj4+IC0gRml4IHNvbWUgZm9ybWF0
dGluZyBhbmQgcHJpbnRpbmcgcHJvYmxlbXMuCj4+Pgo+Pj4gVjY6Cj4+PiAtIFJlYWxpemUgcHJl
dGltZW91dCBwcm9jZXNzaW5nIHRocm91Z2ggZHVhbG1vZGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBi
L2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+PiBpbmRleCA5N2NhOTkzLi5lYmM2NDhiCj4+
PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYwo+Pj4gKysrIGIvZHJpdmVycy93YXRj
aGRvZy9tdGtfd2R0LmMKPj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+PiAgI2luY2x1ZGUgPGxpbnV4
L3Jlc2V0LWNvbnRyb2xsZXIuaD4KPj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+ICAj
aW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0
Lmg+Cj4+PiAgCj4+PiAgI2RlZmluZSBXRFRfTUFYX1RJTUVPVVQJCTMxCj4+PiAgI2RlZmluZSBX
RFRfTUlOX1RJTUVPVVQJCTEKPj4+IEBAIC0xODQsMTUgKzE4NSwyMiBAQCBzdGF0aWMgaW50IG10
a193ZHRfc2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldiwKPj4+ICB7
Cj4+PiAgCXN0cnVjdCBtdGtfd2R0X2RldiAqbXRrX3dkdCA9IHdhdGNoZG9nX2dldF9kcnZkYXRh
KHdkdF9kZXYpOwo+Pj4gIAl2b2lkIF9faW9tZW0gKndkdF9iYXNlID0gbXRrX3dkdC0+d2R0X2Jh
c2U7Cj4+PiArCXVuc2lnbmVkIGludCB0aW1lb3V0X2ludGVydmFsOwo+Pj4gIAl1MzIgcmVnOwo+
Pj4gIAo+Pj4gLQl3ZHRfZGV2LT50aW1lb3V0ID0gdGltZW91dDsKPj4+ICsJdGltZW91dF9pbnRl
cnZhbCA9IHdkdF9kZXYtPnRpbWVvdXQgPSB0aW1lb3V0Owo+Pj4gKwkvKgo+Pj4gKwkgKiBJbiBk
dWFsIG1vZGUsIGlycSB3aWxsIGJlIHRyaWdnZXJlZCBhdCB0aW1lb3V0LzIKPj4+ICsJICogdGhl
IHJlYWwgdGltZW91dCBvY2N1cnMgYXQgdGltZW91dAo+Pj4gKwkgKi8KPj4+ICsJaWYgKHdkdF9k
ZXYtPnByZXRpbWVvdXQpCj4+PiArCQl0aW1lb3V0X2ludGVydmFsID0gd2R0X2Rldi0+cHJldGlt
ZW91dCA9IHRpbWVvdXQvMjsKPj4KPj4gUGxlYXNlIHJ1biBjaGVja3BhdGNoIC0tc3RyaWN0IGFu
ZCBmaXggd2hhdCBpdCByZXBvcnRzLgo+PiBBbHNvLCB0aGVyZSBzaG91bGQgYmUgYSBzZXRfcHJl
dGltZW91dCBmdW5jdGlvbiB0byBzZXQgdGhlCj4+IHByZXRpbWVvdXQuIEl0IGlzIG9rIHRvIHVw
ZGF0ZSBpdCBoZXJlLCBidXQgaXQgc2hvdWxkIGJlIHNldAo+PiBpbiBpdHMgb3duIGZ1bmN0aW9u
IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBhY3R1YWwgdmFsdWUKPj4gaXMgcmVwb3J0ZWQgYmFjayB0
byB1c2Vyc3BhY2UuCj4+Cj4+IFRoYW5rcywKPj4gR3VlbnRlcgo+IAo+IFRoZSByZWFzb24gd2h5
IHRoZSBzZXRfcHJldGltZW91dCBpbnRlcmZhY2UgaXMgbm90IHByb3ZpZGVkIGlzIAo+IGJlY2F1
c2UgdGhlIHByZXRpbWVvdXQgaXMgZml4ZWQgYWZ0ZXIgdGhlIHRpbWVvdXQgaXMgc2V0LCAgd2Ug
bmVlZAo+IHRvIG1vZGlmeSB0aW1lb3V0IGFmdGVyIHNldHRpbmcgcHJldGltZW91dCwgd2hpY2gg
aXMgcHV6emxpbmcuCj4gCgpXaGF0IHlvdSBuZWVkIHRvIGRvIGlzIHRvIHNldCBwcmV0aW1lb3V0
ID0gdGltZW91dCAvIDIgaWYgYSBwcmV0aW1lb3V0CmlzIHNldCB0byBhIHZhbHVlICE9IDAuIEp1
c3QgbGlrZSB3ZSBhZGp1c3QgdGltZW91dCB0byB2YWxpZCB2YWx1ZXMKd2hlbiBzZXQsIHdlIGFk
anVzdCBwcmV0aW1lb3V0IGFzIHdlbGwuIEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3aXRoIHRoYXQu
CgpHdWVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
