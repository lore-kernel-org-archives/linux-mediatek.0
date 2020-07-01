Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8BAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 05:51:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A537206E9
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 05:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNlu7MQ6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2zrGl7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A537206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wiplJVoDy6G1HCxbbTg3u1yCGn3Yqsx05a2saOv7UZE=; b=UNlu7MQ6AUYoVYxLfk1/ajKvt
	wteJoMqgQJA6k/QdBG4cKCA33rSsUjJNgQg92JHYSvLQbBg3+GJbQFAe1n+pnD0CmpT3sXMPc7cGR
	W64RvDGeEAlTwPqScpjLEy4UbXKDgys3lHmT3TOFun3E86cK1Nz5n9IbJY8/DZ+VmdPdnWNrp6zkY
	cxwji0vU1txY5KA8obUQktIeWSs1ViCsBzOV4KBQb0yYIS+La+KDZrhnUFY6xz5KmeEw9pTwmMbZY
	rqYGyB/lDr87sAg57kUt0RckRpDB90+9VmMGxm0JWFr03McKljGEiiDpgyuuSSg65LP+5j96iprT7
	KareD5Pig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqVeB-0001Dy-48; Wed, 01 Jul 2020 05:51:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqVe8-0001CX-PW
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 05:51:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id h5so22467321wrc.7
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 22:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rrsdbtnDHSEEqCjThvhWQtIqv3m+7T/9br2G4plX4Zc=;
 b=K2zrGl7nEOpmf6z8uDnoMX7D2tfbTThdtS0HdVEwj0ErGb9XJaqYNlHJWq+GY4HvE7
 Kc2N9afgknGJRm+0xgb0ehJDk8TfjM5A4siUjUUHDY9iR+f1qMzGDovHrV1zb0nuzzZD
 RPPdSNYnPQjjGkE4BH2TP6+xFPioW8MSrXKYFPHjjObcSgQziy2jRmGMTgEmsBqiBd9a
 GZu1J0UmhtXShKz+uUxZVag9OsUw7xlwGNtoabQHXitZOK3f4o1JfWgMFqbijdJHjxNe
 WqF/KP6C7wVH7RYdLSLIK20LD50TA7lQO8EipwM8YM7DPs7/yudJfLGCfxd7Gkz4iJgB
 Qn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rrsdbtnDHSEEqCjThvhWQtIqv3m+7T/9br2G4plX4Zc=;
 b=HW+PRCRSjpPhp8do6myXM63B0jnlCM/KLUuq+yhDTH4KXlRhp9DdGmoa8LYZboq8J/
 IIxgiLf9OHV6aR/2Uu1NRMClspZwlv1zsuAE7er2ASIhCv47N1ZrS/zAi+xlZIAH2d1Y
 lIU+52wbD0uaTmloi8BrpS5X66yAeTuhTBOYWfUEBBjw054+rO3lXpiolAaPpKV2atUn
 xmakdMHFuRRuIaoyqd/gDL3DfBWADpaivOHLlo/TQYcU1aXwrZsipMV7nMLSEoPBUXDu
 pr8nGGpfAoFZoX0UelrgfYCOZC8uaJ+T2FHdxNOdih81ipRrfE08Wl9VKq2wmMxWLGBS
 7wQw==
X-Gm-Message-State: AOAM532t0MBYYPvZL+r4tjeEXjQ7n6fSWf0deOD1L3VaYb/REo2KmO+9
 0VotboWZjX878Y7//NVV6VA+Rg==
X-Google-Smtp-Source: ABdhPJwasB45K4yCXyxCNULMvHcQErc/DDp+uYqd1S+ZRpmt8sqpf2/4dPZq5GLCDaa0s2mUqlTisA==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr24674578wru.258.1593582658773; 
 Tue, 30 Jun 2020 22:50:58 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:54f4:a99f:ab88:bc07?
 ([2a01:e34:ed2f:f020:54f4:a99f:ab88:bc07])
 by smtp.googlemail.com with ESMTPSA id f12sm5949218wrw.53.2020.06.30.22.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 22:50:58 -0700 (PDT)
Subject: Re: [PATCH] cpuidle: change enter_s2idle() prototype
To: Neal Liu <neal.liu@mediatek.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
 <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
 <9963896.lEaLCsxmBZ@kreacher> <1593571181.7383.5.camel@mtkswgap22>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a65bb456-d5f4-2208-f924-0af989b8dd5f@linaro.org>
Date: Wed, 1 Jul 2020 07:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593571181.7383.5.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_015100_957810_267DF538 
X-CRM114-Status: GOOD (  25.15  )
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-tegra@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-acpi@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDEvMDcvMjAyMCAwNDozOSwgTmVhbCBMaXUgd3JvdGU6Cj4gT24gTW9uLCAyMDIwLTA2LTI5
IGF0IDE3OjE3ICswMjAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPj4gT24gTW9uZGF5LCBK
dW5lIDI5LCAyMDIwIDExOjA1OjQwIEFNIENFU1QgTmVhbCBMaXUgd3JvdGU6Cj4+PiBDb250cm9s
IEZsb3cgSW50ZWdyaXR5KENGSSkgaXMgYSBzZWN1cml0eSBtZWNoYW5pc20gdGhhdCBkaXNhbGxv
d3MKPj4+IGNoYW5nZXMgdG8gdGhlIG9yaWdpbmFsIGNvbnRyb2wgZmxvdyBncmFwaCBvZiBhIGNv
bXBpbGVkIGJpbmFyeSwKPj4+IG1ha2luZyBpdCBzaWduaWZpY2FudGx5IGhhcmRlciB0byBwZXJm
b3JtIHN1Y2ggYXR0YWNrcy4KPj4+Cj4+PiBpbml0X3N0YXRlX25vZGUoKSBhc3NpZ25zIHNhbWUg
ZnVuY3Rpb24gcG9pbnRlciB0byBpZGxlX3N0YXRlLT5lbnRlcgo+Pj4gYW5kIGlkbGVfc3RhdGUt
PmVudGVyX3MyaWRsZS4gVGhpcyBkZWZpbml0ZWx5IGNhdXNlcyBDRkkgZmFpbHVyZQo+Pj4gd2hl
biBjYWxsaW5nIGVpdGhlciBlbnRlcigpIG9yIGVudGVyX3MyaWRsZSgpLgo+Pj4KPj4+IEFsaWdu
IGVudGVyX3MyaWRsZSgpIHdpdGggZW50ZXIoKSBmdW5jdGlvbiBwcm90b3R5cGUgdG8gZml4IENG
SQo+Pj4gZmFpbHVyZS4KPj4KPj4gVGhhdCBuZWVkcyB0byBiZSBkb2N1bWVudGVkIHNvbWV3aGVy
ZSBjbG9zZSB0byB0aGUgZGVmaW5pdGlvbiBvZiB0aGUKPj4gY2FsbGJhY2tzIGluIHF1ZXN0aW9u
Lgo+Pgo+PiBPdGhlcndpc2UgaXQgaXMgY29tcGxldGVseSB1bmNsZWFyIHdoeSB0aGlzIGlzIGEg
Z29vZCBpZGVhLgo+Pgo+IAo+IFRoZSBwcm9ibGVtIGlzLCBpbml0X3N0YXRlX21vZGUoKSBhc3Np
Z24gc2FtZSBmdW5jdGlvbiBjYWxsYmFjayB0bwo+IGRpZmZlcmVudCBmdW5jdGlvbiBwb2ludGVy
IGRlY2xhcmF0aW9ucy4KPiAKPiBzdGF0aWMgaW50IGluaXRfc3RhdGVfbm9kZShzdHJ1Y3QgY3B1
aWRsZV9zdGF0ZSAqaWRsZV9zdGF0ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaGVzLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqc3RhdGVfbm9kZSkKPiB7Cj4gLi4uCj4gICAgICAgICBp
ZGxlX3N0YXRlLT5lbnRlciA9IG1hdGNoX2lkLT5kYXRhOwo+IC4uLgo+ICAgICAgICAgaWRsZV9z
dGF0ZS0+ZW50ZXJfczJpZGxlID0gbWF0Y2hfaWQtPmRhdGE7Cj4gfQo+IAo+IEZ1bmN0aW9uIGRl
Y2xhcmF0aW9uczoKPiAKPiBzdHJ1Y3QgY3B1aWRsZV9zdGF0ZSB7Cj4gLi4uCj4gICAgICAgICBp
bnQgKCplbnRlcikgICAgKHN0cnVjdCBjcHVpZGxlX2RldmljZSAqZGV2LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBjcHVpZGxlX2RyaXZlciAqZHJ2LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBpbmRleCk7Cj4gCj4gICAgICAgICB2b2lkICgqZW50ZXJfczJpZGxlKSAo
c3RydWN0IGNwdWlkbGVfZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGNwdWlkbGVfZHJpdmVyICpkcnYsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50IGluZGV4KTsKPiB9Owo+IAo+IEluIHRoaXMgY2FzZSwgZWl0aGVyIGVudGVyKCkg
b3IgZW50ZXJfczJpZGxlKCkgd291bGQgY2F1c2UgQ0ZJIGNoZWNrCj4gZmFpbGVkIHNpbmNlIHRo
ZXkgdXNlIHNhbWUgY2FsbGVlLgo+IAo+IFdlIHRyeSB0byBhbGlnbiBmdW5jdGlvbiBwcm90b3R5
cGUgb2YgZW50ZXIoKSBzaW5jZSBpdCBuZWVkcyByZXR1cm4KPiB2YWx1ZSBmb3Igc29tZSB1c2Ug
Y2FzZXMuIFRoZSByZXR1cm4gdmFsdWUgb2YgZW50ZXJfczJpZGxlKCkgaXMgbm8gbmVlZAo+IGN1
cnJlbnRseS4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24sIHlvdSBtYXkgYWRkIHRoaXMg
ZGVzY3JpcHRpb24gYWxvbmcgd2l0aAp0aGUgY2hhbmdlbG9nLgoKCj4+PiBTaWduZWQtb2ZmLWJ5
OiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9h
Y3BpL3Byb2Nlc3Nvcl9pZGxlLmMgICB8ICAgIDYgKysrKy0tCj4+PiAgZHJpdmVycy9jcHVpZGxl
L2NwdWlkbGUtdGVncmEuYyB8ICAgIDggKysrKystLS0KPj4+ICBkcml2ZXJzL2lkbGUvaW50ZWxf
aWRsZS5jICAgICAgIHwgICAgNiArKysrLS0KPj4+ICBpbmNsdWRlL2xpbnV4L2NwdWlkbGUuaCAg
ICAgICAgIHwgICAgNiArKystLS0KPj4+ICA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcHJv
Y2Vzc29yX2lkbGUuYyBiL2RyaXZlcnMvYWNwaS9wcm9jZXNzb3JfaWRsZS5jCj4+PiBpbmRleCA3
NTUzNGM1Li42ZmZiNmM5IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9hY3BpL3Byb2Nlc3Nvcl9p
ZGxlLmMKPj4+ICsrKyBiL2RyaXZlcnMvYWNwaS9wcm9jZXNzb3JfaWRsZS5jCj4+PiBAQCAtNjU1
LDggKzY1NSw4IEBAIHN0YXRpYyBpbnQgYWNwaV9pZGxlX2VudGVyKHN0cnVjdCBjcHVpZGxlX2Rl
dmljZSAqZGV2LAo+Pj4gIAlyZXR1cm4gaW5kZXg7Cj4+PiAgfQo+Pj4gIAo+Pj4gLXN0YXRpYyB2
b2lkIGFjcGlfaWRsZV9lbnRlcl9zMmlkbGUoc3RydWN0IGNwdWlkbGVfZGV2aWNlICpkZXYsCj4+
PiAtCQkJCSAgIHN0cnVjdCBjcHVpZGxlX2RyaXZlciAqZHJ2LCBpbnQgaW5kZXgpCj4+PiArc3Rh
dGljIGludCBhY3BpX2lkbGVfZW50ZXJfczJpZGxlKHN0cnVjdCBjcHVpZGxlX2RldmljZSAqZGV2
LAo+Pj4gKwkJCQkgIHN0cnVjdCBjcHVpZGxlX2RyaXZlciAqZHJ2LCBpbnQgaW5kZXgpCj4+PiAg
ewo+Pj4gIAlzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfY3ggKmN4ID0gcGVyX2NwdShhY3BpX2NzdGF0
ZVtpbmRleF0sIGRldi0+Y3B1KTsKPj4+ICAKPj4+IEBAIC02NzQsNiArNjc0LDggQEAgc3RhdGlj
IHZvaWQgYWNwaV9pZGxlX2VudGVyX3MyaWRsZShzdHJ1Y3QgY3B1aWRsZV9kZXZpY2UgKmRldiwK
Pj4+ICAJCX0KPj4+ICAJfQo+Pj4gIAlhY3BpX2lkbGVfZG9fZW50cnkoY3gpOwo+Pj4gKwo+Pj4g
KwlyZXR1cm4gMDsKPj4+ICB9Cj4+PiAgCj4+PiAgc3RhdGljIGludCBhY3BpX3Byb2Nlc3Nvcl9z
ZXR1cF9jcHVpZGxlX2N4KHN0cnVjdCBhY3BpX3Byb2Nlc3NvciAqcHIsCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtdGVncmEuYyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVp
ZGxlLXRlZ3JhLmMKPj4+IGluZGV4IDE1MDA0NTguLmExMmZiMTQgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2NwdWlkbGUvY3B1aWRsZS10ZWdyYS5jCj4+PiArKysgYi9kcml2ZXJzL2NwdWlkbGUv
Y3B1aWRsZS10ZWdyYS5jCj4+PiBAQCAtMjUzLDExICsyNTMsMTMgQEAgc3RhdGljIGludCB0ZWdy
YV9jcHVpZGxlX2VudGVyKHN0cnVjdCBjcHVpZGxlX2RldmljZSAqZGV2LAo+Pj4gIAlyZXR1cm4g
ZXJyID8gLTEgOiBpbmRleDsKPj4+ICB9Cj4+PiAgCj4+PiAtc3RhdGljIHZvaWQgdGVncmExMTRf
ZW50ZXJfczJpZGxlKHN0cnVjdCBjcHVpZGxlX2RldmljZSAqZGV2LAo+Pj4gLQkJCQkgIHN0cnVj
dCBjcHVpZGxlX2RyaXZlciAqZHJ2LAo+Pj4gLQkJCQkgIGludCBpbmRleCkKPj4+ICtzdGF0aWMg
aW50IHRlZ3JhMTE0X2VudGVyX3MyaWRsZShzdHJ1Y3QgY3B1aWRsZV9kZXZpY2UgKmRldiwKPj4+
ICsJCQkJIHN0cnVjdCBjcHVpZGxlX2RyaXZlciAqZHJ2LAo+Pj4gKwkJCQkgaW50IGluZGV4KQo+
Pj4gIHsKPj4+ICAJdGVncmFfY3B1aWRsZV9lbnRlcihkZXYsIGRydiwgaW5kZXgpOwo+Pj4gKwo+
Pj4gKwlyZXR1cm4gMDsKPj4+ICB9Cj4+PiAgCj4+PiAgLyoKPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lkbGUvaW50ZWxfaWRsZS5jIGIvZHJpdmVycy9pZGxlL2ludGVsX2lkbGUuYwo+Pj4gaW5k
ZXggZjQ0OTU4NC4uYjE3OGRhMyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaWRsZS9pbnRlbF9p
ZGxlLmMKPj4+ICsrKyBiL2RyaXZlcnMvaWRsZS9pbnRlbF9pZGxlLmMKPj4+IEBAIC0xNzUsMTMg
KzE3NSwxNSBAQCBzdGF0aWMgX19jcHVpZGxlIGludCBpbnRlbF9pZGxlKHN0cnVjdCBjcHVpZGxl
X2RldmljZSAqZGV2LAo+Pj4gICAqIEludm9rZWQgYXMgYSBzdXNwZW5kLXRvLWlkbGUgY2FsbGJh
Y2sgcm91dGluZSB3aXRoIGZyb3plbiB1c2VyIHNwYWNlLCBmcm96ZW4KPj4+ICAgKiBzY2hlZHVs
ZXIgdGljayBhbmQgc3VzcGVuZGVkIHNjaGVkdWxlciBjbG9jayBvbiB0aGUgdGFyZ2V0IENQVS4K
Pj4+ICAgKi8KPj4+IC1zdGF0aWMgX19jcHVpZGxlIHZvaWQgaW50ZWxfaWRsZV9zMmlkbGUoc3Ry
dWN0IGNwdWlkbGVfZGV2aWNlICpkZXYsCj4+PiAtCQkJCQlzdHJ1Y3QgY3B1aWRsZV9kcml2ZXIg
KmRydiwgaW50IGluZGV4KQo+Pj4gK3N0YXRpYyBfX2NwdWlkbGUgaW50IGludGVsX2lkbGVfczJp
ZGxlKHN0cnVjdCBjcHVpZGxlX2RldmljZSAqZGV2LAo+Pj4gKwkJCQkgICAgICAgc3RydWN0IGNw
dWlkbGVfZHJpdmVyICpkcnYsIGludCBpbmRleCkKPj4+ICB7Cj4+PiAgCXVuc2lnbmVkIGxvbmcg
ZWF4ID0gZmxnMk1XQUlUKGRydi0+c3RhdGVzW2luZGV4XS5mbGFncyk7Cj4+PiAgCXVuc2lnbmVk
IGxvbmcgZWN4ID0gMTsgLyogYnJlYWsgb24gaW50ZXJydXB0IGZsYWcgKi8KPj4+ICAKPj4+ICAJ
bXdhaXRfaWRsZV93aXRoX2hpbnRzKGVheCwgZWN4KTsKPj4+ICsKPj4+ICsJcmV0dXJuIDA7Cj4+
PiAgfQo+Pj4gIAo+Pj4gIC8qCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jcHVpZGxl
LmggYi9pbmNsdWRlL2xpbnV4L2NwdWlkbGUuaAo+Pj4gaW5kZXggZWMyZWY2My4uYmVlMTBjMCAx
MDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvY3B1aWRsZS5oCj4+PiArKysgYi9pbmNsdWRl
L2xpbnV4L2NwdWlkbGUuaAo+Pj4gQEAgLTY2LDkgKzY2LDkgQEAgc3RydWN0IGNwdWlkbGVfc3Rh
dGUgewo+Pj4gIAkgKiBzdXNwZW5kZWQsIHNvIGl0IG11c3Qgbm90IHJlLWVuYWJsZSBpbnRlcnJ1
cHRzIGF0IGFueSBwb2ludCAoZXZlbgo+Pj4gIAkgKiB0ZW1wb3JhcmlseSkgb3IgYXR0ZW1wdCB0
byBjaGFuZ2Ugc3RhdGVzIG9mIGNsb2NrIGV2ZW50IGRldmljZXMuCj4+PiAgCSAqLwo+Pj4gLQl2
b2lkICgqZW50ZXJfczJpZGxlKSAoc3RydWN0IGNwdWlkbGVfZGV2aWNlICpkZXYsCj4+PiAtCQkJ
ICAgICAgc3RydWN0IGNwdWlkbGVfZHJpdmVyICpkcnYsCj4+PiAtCQkJICAgICAgaW50IGluZGV4
KTsKPj4+ICsJaW50ICgqZW50ZXJfczJpZGxlKShzdHJ1Y3QgY3B1aWRsZV9kZXZpY2UgKmRldiwK
Pj4+ICsJCQkgICAgc3RydWN0IGNwdWlkbGVfZHJpdmVyICpkcnYsCj4+PiArCQkJICAgIGludCBp
bmRleCk7Cj4+PiAgfTsKPj4+ICAKPj4+ICAvKiBJZGxlIFN0YXRlIEZsYWdzICovCj4+PiAtLSAK
Pj4+IDEuNy45LjUKPj4+Cj4+Cj4+Cj4+Cj4+Cj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZv
bGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNl
Ym9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
