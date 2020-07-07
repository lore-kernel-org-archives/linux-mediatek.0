Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965C0C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 08:14:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A28206C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 08:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uoVD3pxd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+PP/J3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A28206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z+1pITSgBbGh3bx3ajDDJThqlGy4LDtVRriYzAHwuUA=; b=uoVD3pxdfLcQqnQ7zQBs7Spi3
	bJGKreDmlNYsT4OZhcPnKvBFNB66CzzHA7ZylIU6RWpZAfAH37DoGLJ/sHVYmEfz3fOKFhFwQ6AGG
	aoUMHAGMtKPCgklNr8UNmKSbfJ1+Sq8sZw3qwcHtt/2HVj8wnVi+xvmA8SBGKNUX8ETRKZs7X18/L
	5uz451tQ7Zsh0lDAzYCfHtgrjXzDmby+s1knB1KY61uwpeFl/ROeKXPR27A4kliZUaFtxunhdZrpT
	q2478i4ZOoY5Q7kGTw5R1Mvxd7g4fXNTiTQ4U+WueB5AtRWwc6vagoF3beaBCUMP3iQ9aMbNhB6JZ
	nBG5aNlDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsiji-0000AP-H1; Tue, 07 Jul 2020 08:13:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsijd-00008X-Ab
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 08:13:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id l2so44007672wmf.0
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=05xI6wJb+pvE4wHQ2qdDsXdX+BPzXeWRcihwoqOjd6U=;
 b=n+PP/J3kqkRrr/c7+eNimD9rRpfjE7IfpEMRiSGV9YCwHelXn8b/BUiPC0odXPJ9Lj
 Pk35HpivQKzprFoKVnlhMtQZ/GDkd8aQ2PStjrZ1X0Y8ZoWPLy1kVYKyoaIKMsrgAs0e
 uH9Wk/Q2I7r1qYRQIr9/RC2bKU8JqDbJkxJ2bapjEp6s7RwmUNBw7c8dF7rJ/uk8BADc
 lSOeTTNRTPrPMqchjvdNy3sQEIcRUaYxvGEhvnAGm4aoCl/Nus1MGTw7140hSpOVEoOb
 5Ilm9oHGJ/KAT0yE73lpzAOE0wbO2KlVK9VVnMbdb4ankQFT+e/b/nRaxEwbXYwN6Qrt
 GjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=05xI6wJb+pvE4wHQ2qdDsXdX+BPzXeWRcihwoqOjd6U=;
 b=GH2hcKtksI09K/BlWOxv0NOAcjttlphT2S7li3k35AFCUXiQ4zwgl/qhFoGIXKw/KE
 BO+/gbSnSnEz+y1SkldQU1Er62qPXvv1x/fU69Cq2jJaBhm7sq2c5tMg7YGleA/LogOk
 fPzElYsmA59FwNt6DBRNuFDqFHtNenTTBuNQjjMjDgyUr/CyXMTJJODlD7OhE/za/MLk
 svh8OCiPFAMUSd531TeS5Ms6IBXnCCpEta9U8xAMVBGzuojQEhOPeRIe7pUr7qCQ7pS9
 PtiYREB61TZIfJ/iifKDeIOw5K86FkwSiMjRYGAkQesHvMW7eVTV6ECZRFUoh+8LKNv1
 0xuw==
X-Gm-Message-State: AOAM532xhwrWUJ8OirBYfP1JItDYtLU89OFy7+9CDxmQLPtjb9C+2QZM
 t3EGgr3MGZuHy6xItETqtc0UiLnnwEc=
X-Google-Smtp-Source: ABdhPJymOd3pRu1aeygaJdWogJ2lVl28ew4bcNoyZooPVWuB6BUsMYd/al2WZYRoxJG2w6KApZ9B9g==
X-Received: by 2002:a7b:c0c9:: with SMTP id s9mr2747323wmh.166.1594109627674; 
 Tue, 07 Jul 2020 01:13:47 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:b4ff:29eb:619e:318?
 ([2a01:e34:ed2f:f020:b4ff:29eb:619e:318])
 by smtp.googlemail.com with ESMTPSA id g3sm18887963wrb.59.2020.07.07.01.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 01:13:47 -0700 (PDT)
Subject: Re: [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL
To: Michael Kao <michael.kao@mediatek.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <20200323121537.22697-8-michael.kao@mediatek.com>
 <1afbf412-fbeb-8abe-66d8-bd7ac4e9dd83@linaro.org>
 <1591329023.12739.0.camel@mtksdccf07>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4c9e9abf-1f87-ae68-3827-22df52adfd19@linaro.org>
Date: Tue, 7 Jul 2020 10:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591329023.12739.0.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_041349_412884_B0D7899B 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDUvMDYvMjAyMCAwNTo1MCwgTWljaGFlbCBLYW8gd3JvdGU6Cj4gT24gRnJpLCAyMDIwLTA1
LTIyIGF0IDE3OjM2ICswMjAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gT24gMjMvMDMvMjAy
MCAxMzoxNSwgTWljaGFlbCBLYW8gd3JvdGU6Cj4+PiBGcm9tOiAibWljaGFlbC5rYW8iIDxtaWNo
YWVsLmthb0BtZWRpYXRlay5jb20+Cj4+Pgo+Pj4gVGhlIGRyaXZlciBvZiB0aGVybWFsIGFuZCBz
dnMgd2lsbCB1c2UgdGhlCj4+PiBzYW1lIHJlZ2lzdGVyIGZvciB0aGUgcHJvamVjdCB3aGljaCBz
aG91bGQgc2VsZWN0Cj4+PiBiYW5rIGJlZm9yZSByZWFkaW5nIHNlbnNvciB2YWx1ZS4KPj4KPj4g
SGVyZSB0aGVyZSBpcyBhIGRlc2lnbiBwcm9ibGVtIEFGQUlDVC4gVGhlIHNlbnNvciBzaG91bGQg
bm90IGJlIHVzaW5nCj4+IGV4dGVybmFsIGxvY2tzLgo+Pgo+IFRoZSBQVFBDT1JFU0VMIGlzIGEg
Y29tbW9uIHJlZ2lzdGVyIHVzZWQgYnkgc3ZzIGFuZCB0aGVybWFsLgo+IFRoZSB0aGVybWFsIG5l
ZWQgdG8gZW5zdXJlIFBUUENPUkVTRUwgcmVnaXN0ZXIgd2lsbCBub3QgYmUgY2hhbmdlZCBieQo+
IHN2cyB3aGVuIHRoZXJtYWwgc3dpdGNoIGJhbmsgdG8gcmVhZCByYXcgZGF0YSBvZiB0ZW1wZXJh
dHVyZS4KPiBTbyB3ZSB1c2Ugc3ZzX2xvY2sgdG8gbWFrZSBzdXJlIHRoZXJlIGlzIG5vIGNvbmZs
aWN0IGJldHdlZW4gdGhlIHR3bwo+IGRyaXZlcnMuCgpXaHkgbm90IHVzZSByZWdtYXAgPwoKPj4+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgS2FvIDxtaWNoYWVsLmthb0BtZWRpYXRlay5jb20+Cj4+
PiAtLS0KPj4+ICBkcml2ZXJzL3RoZXJtYWwvbXRrX3RoZXJtYWwuYyB8IDkgKysrKy0tLS0tCj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL210a190aGVybWFsLmMgYi9kcml2ZXJzL3Ro
ZXJtYWwvbXRrX3RoZXJtYWwuYwo+Pj4gaW5kZXggOWVhY2E0MzI5MjBlLi41OTRhZDRmMGY4Y2Qg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvbXRrX3RoZXJtYWwuYwo+Pj4gKysrIGIv
ZHJpdmVycy90aGVybWFsL210a190aGVybWFsLmMKPj4+IEBAIC0yMiw2ICsyMiw3IEBACj4+PiAg
I2luY2x1ZGUgPGxpbnV4L3RoZXJtYWwuaD4KPj4+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4K
Pj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvcG93ZXIv
bXRrX3N2cy5oPgo+Pj4gIAo+Pj4gIC8qIEFVWEFEQyBSZWdpc3RlcnMgKi8KPj4+ICAjZGVmaW5l
IEFVWEFEQ19DT04xX1NFVF9WCTB4MDA4Cj4+PiBAQCAtMjYyLDcgKzI2Myw3IEBAIHN0cnVjdCBt
dGtfdGhlcm1hbCB7Cj4+PiAgCXN0cnVjdCBjbGsgKmNsa19wZXJpX3RoZXJtOwo+Pj4gIAlzdHJ1
Y3QgY2xrICpjbGtfYXV4YWRjOwo+Pj4gIAkvKiBsb2NrOiBmb3IgZ2V0dGluZyBhbmQgcHV0dGlu
ZyBiYW5rcyAqLwo+Pj4gLQlzdHJ1Y3QgbXV0ZXggbG9jazsKPj4+ICsJdW5zaWduZWQgbG9uZyBm
bGFnczsKPj4+ICAKPj4+ICAJLyogQ2FsaWJyYXRpb24gdmFsdWVzICovCj4+PiAgCXMzMiBhZGNf
Z2U7Cj4+PiBAQCAtNTYxLDcgKzU2Miw3IEBAIHN0YXRpYyB2b2lkIG10a190aGVybWFsX2dldF9i
YW5rKHN0cnVjdCBtdGtfdGhlcm1hbF9iYW5rICpiYW5rKQo+Pj4gIAl1MzIgdmFsOwo+Pj4gIAo+
Pj4gIAlpZiAobXQtPmNvbmYtPm5lZWRfc3dpdGNoX2JhbmspIHsKPj4+IC0JCW11dGV4X2xvY2so
Jm10LT5sb2NrKTsKPj4+ICsJCW10LT5mbGFncyA9IGNsYWltX210a19zdnNfbG9jaygpOwo+Pj4g
IAo+Pj4gIAkJdmFsID0gcmVhZGwobXQtPnRoZXJtYWxfYmFzZSArIFBUUENPUkVTRUwpOwo+Pj4g
IAkJdmFsICY9IH4weGY7Cj4+PiBAQCAtNTgxLDcgKzU4Miw3IEBAIHN0YXRpYyB2b2lkIG10a190
aGVybWFsX3B1dF9iYW5rKHN0cnVjdCBtdGtfdGhlcm1hbF9iYW5rICpiYW5rKQo+Pj4gIAlzdHJ1
Y3QgbXRrX3RoZXJtYWwgKm10ID0gYmFuay0+bXQ7Cj4+PiAgCj4+PiAgCWlmIChtdC0+Y29uZi0+
bmVlZF9zd2l0Y2hfYmFuaykKPj4+IC0JCW11dGV4X3VubG9jaygmbXQtPmxvY2spOwo+Pj4gKwkJ
cmVsZWFzZV9tdGtfc3ZzX2xvY2sobXQtPmZsYWdzKTsKPj4+ICB9Cj4+PiAgCj4+PiAgLyoqCj4+
PiBAQCAtOTM4LDggKzkzOSw2IEBAIHN0YXRpYyBpbnQgbXRrX3RoZXJtYWxfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+ICAJaWYgKHJldCkKPj4+ICAJCXJldHVybiByZXQ7
Cj4+PiAgCj4+PiAtCW11dGV4X2luaXQoJm10LT5sb2NrKTsKPj4+IC0KPj4+ICAJbXQtPmRldiA9
ICZwZGV2LT5kZXY7Cj4+PiAgCj4+PiAgCWF1eGFkYyA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJt
ZWRpYXRlayxhdXhhZGMiLCAwKTsKPj4+Cj4+Cj4+Cj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFy
by5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
CkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBG
YWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0
dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
