Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2015FC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D987361463
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D987361463
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:CC:To:Date:From:Subject:
	MIME-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFGiTKYgXVWiENS+vQ1hVFdoKaIl29Kr4U0GRoPROGg=; b=njChGD96Gx2RhZ
	dcnzJo4iqXbltWVxar0ESDhD1UHz0DmepnXQI5wFoBq9EBZeLIjuGS67jdnTmwaBda4sCYouF0H4h
	9fonFwt4TXcGydql1beV/9ZVbBA8ms40Qed/lh0ziL04xjrqzAyBMEJ2VdY/Np91x+SEMsqENA5dZ
	yb0xLmRU5qQDLepJIYJD75Ul+i0E4VCYWop/hozKZV0vHvIUX7Hq9RULbFUdNxJjZW3IgCxWmw/4n
	4iMRHtqSUBfczocnlO2b89XknBztlrG98LLbndmnyjfIiVdSI2/i9R348QN8++DyoIKZHqtWMYYB/
	dqDRWKc1mV1leSQATNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjjN-001EnO-Vz; Fri, 25 Jun 2021 11:10:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwjgY-001DdK-QS; Fri, 25 Jun 2021 11:07:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id q14so12850457eds.5;
 Fri, 25 Jun 2021 04:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=in-reply-to:references:thread-topic:user-agent:mime-version
 :content-transfer-encoding:subject:from:date:to:cc:message-id;
 bh=zS+Sy2JuyXUjHyIS0w19cZln6zoHhOgeM0Qhc+/cXBs=;
 b=R9EzdJqKI8fn9iZhp0YgJ8pfmVFefMTQMKVqSscunCMLjkjqYZfF3rRvJKIsiNHY2R
 SzPAZOKlqWsCCjE8VOAunUzBWWUL2M/ep75WyXHfk0Ro8KUSvcPLV6Dxt6FObgsyB8eg
 JHL8+fxD/v9BEALcIQDv7HS/g/dgsLKOOxgfqMf1vSsWcXD/HjtTMg0PJrQWnuNHO6nq
 jWyi32oA/WGhWp1ww+q4UuecpGmmCBaqbDqaEGciBpqeuY/GTpgVEiPl52bBTr9w6Ttf
 JfRYrpXFPCRvLReavNC2tBgVdoxqFX/7GxPADzdV1No0Ln2xvCdvBGiXvuiqr8Bx97Id
 W8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
 :mime-version:content-transfer-encoding:subject:from:date:to:cc
 :message-id;
 bh=zS+Sy2JuyXUjHyIS0w19cZln6zoHhOgeM0Qhc+/cXBs=;
 b=tg+ZVlXRQjpDMPK0vOqi3gGLLpenBYxnNvD9CzCfKMpfdZqBx9o2fpJT/Z0GUdCvvQ
 moG+se36qXS/IyopsBwOsvQ2mr/WWBtaWFL5uhcHsUu2P3aoOcgyz+AnSVO7yUGJLK1T
 LAkiINDevz+WVOAu3fBrmugsScWy7ig0NpId5We1Vy0k0SMSO8wxR5CyCvR1ydLEo9iu
 SxDOHhbfAczDQ/uvDcB+3LWdcKKbb9AMbc1p6uwKL23ZObcSVXM6jt6x602IMjvAhwmK
 e8veRx9knajrkd80peXbG1vZeDDpgwR5Vsh6GQ1s9tumAa5sB3uP0pPT8hqEOyaRBDtg
 RqBw==
X-Gm-Message-State: AOAM531PjAC1RJU+S8qIKVvHfnGDyP9Rv9aTaWVpiRykQnBhBA6MkjtZ
 7qS8CZWuM8gOVS41ABvxf5w=
X-Google-Smtp-Source: ABdhPJxAA2PYThH5HCe4nhv2JuPudiiWFmx883/ndYXLhIfPMVK4qdlr8pZNqHIVId0VJm5M1V6Ppg==
X-Received: by 2002:a05:6402:31b4:: with SMTP id
 dj20mr14094807edb.186.1624619264824; 
 Fri, 25 Jun 2021 04:07:44 -0700 (PDT)
Received: from [10.73.177.209] ([89.205.226.136])
 by smtp.gmail.com with ESMTPSA id j19sm2626800ejo.3.2021.06.25.04.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 04:07:44 -0700 (PDT)
In-Reply-To: <trinity-2eb7c0ac-d9dc-446c-8907-69b5f4df6838-1624618996538@3c-app-gmx-bs66>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
 <8b27246b-721e-fa0e-5c2b-b1b4b4d6fdd3@linaro.org>
 <trinity-2eb7c0ac-d9dc-446c-8907-69b5f4df6838-1624618996538@3c-app-gmx-bs66>
X-Referenced-Uid: 5607
Thread-Topic: Aw: Re:  Re: [PATCH] Fix mt7622.dtsi thermal cpu
X-Blue-Identity: !l=334&o=43&fo=5970&pl=224&po=0&qs=PREFIX&f=HTML&m=!%3ANzRiZDk5M2QtNTJhNy00MTE4LThlNmYtYTk2ZDg2NDQzNGU0%3ASU5CT1g%3D%3ANTYwNw%3D%3D%3AANSWERED&p=195&q=SHOW
X-Is-Generated-Message-Id: true
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <52767351-83da-41e2-a746-3407ee9c73e8@gmail.com>
Subject: Re:  Re: [PATCH] Fix mt7622.dtsi thermal cpu
From: Eric Woudstra <ericwouds@gmail.com>
Date: Fri, 25 Jun 2021 13:07:42 +0200
To: Frank Wunderlich <frank-w@public-files.de>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,Sean Wang <sean.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,Daniel Golle <daniel@makrotopia.org>
Message-ID: <52767351-83da-41e2-a746-3407ee9c73e8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_040746_968756_92B458F9 
X-CRM114-Status: GOOD (  16.19  )
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

SSBjaG9vc2UgImhvdCogd2l0aCBDUFUsIGJlY2F1c2UgaXQgd2FzIHRoZSBiZXN0IHRlbXBlcmF0
dXJlLiBCdXQgaXQgc2hvdWxkIHJlYWxseSBiZSBwYXNzaXZlIG9ubHkgd2l0aCB0aGUgY29vbGlu
ZyBkZXZpY2UgQ1BVIGJ1dCB3aXRoIGEgbXVjaCBoaWdoZXIgdGVtcGVyYXR1cmUuIEZvciBtZSA4
NyBkZWdyZWVzIGlzIGZpbmUgYW5kIHRlc3RlZC4gQnV0IGZvciBtYWlubGluZSB3ZSB3b3VsZCBi
ZXR0ZXIgYXNrIE1lZGlhdGVrIGZvciB0aGUgY29ycmVjdCBtYXhpbXVtIHRlbXBlcmF0dXJlLgoK
4oGjR2V0IEJsdWVNYWlsIGZvciBBbmRyb2lkIOKAiwoKT24gSnVuIDI1LCAyMDIxLCAxOjAzIFBN
LCBhdCAxOjAzIFBNLCBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4g
d3JvdGU6Cj5IaQo+Cj4+IEdlc2VuZGV0OiBGcmVpdGFnLCAyNS4gSnVuaSAyMDIxIHVtIDExOjU3
IFVocgo+PiBWb246ICJEYW5pZWwgTGV6Y2FubyIgPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+
Cj4KPj4gWW91IHNob3VsZCBub3QgYWRkIHRoZSBmYW4gaW4gdGhlIG10NzYyMi5kdHNpIGl0c2Vs
ZiBidXQgaW4gdGhlIGJvYXJkCj4+IHNwZWNpZmljIGZpbGUgd2hlcmUgdGhlcmUgaXMgYSBmYW4g
b3V0cHV0IG9uIGl0LiBtdDc2MjIuZHRzaSBpcwo+c3VwcG9zZWQKPj4gdG8gYmUgdGhlIFNvQyBp
dHNlbGYgQUZBSUNULgo+Pgo+PiBGb3IgaW5zdGFuY2U6Cj4+Cj4+Cj5odHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aGVybWFsL2xpbnV4LmdpdC90cmVlL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXNhcHBoaXJlLmR0c2kjbjM5Cj4+Cj4+
Cj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aGVybWFs
L2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXNhcHBo
aXJlLmR0c2kjbjE2NAo+Cj4+ID4gQEAgLTE3MCwxNCArMTc3LDEyIEBACj4+ID4gIAkJCWNvb2xp
bmctbWFwcyB7Cj4+ID4gIAkJCQltYXAwIHsKPj4gPiAgCQkJCQl0cmlwID0gPCZjcHVfcGFzc2l2
ZT47Cj4+ID4gLQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBU
SEVSTUFMX05PX0xJTUlUPiwKPj4gPiAtCQkJCQkJCSA8JmNwdTEgVEhFUk1BTF9OT19MSU1JVCBU
SEVSTUFMX05PX0xJTUlUPjsKPj4gPiArCQkJCQljb29saW5nLWRldmljZSA9IDwmZmFuMCBUSEVS
TUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+PiA+ICAJCQkJfTsKPj4KPj4gZmFuID09
IGFjdGl2ZSB0cmlwIHBvaW50Cj4+Cj4+IFRoaXMgaXMgcmVmZXJyaW5nIHRvIHRoZSBwYXNzaXZl
IHRyaXAgcG9pbnQuIFNvIGl0IHNob3VsZCBwb2ludCB0bwo+dGhlCj4+IENQVSBhcyBpdCBpcyBu
b3cuIE5vdGUgdGhlIG9yZGVyIG9mIG1pdGlnYXRpb24gaXMgaW52ZXJ0ZWQgcmVnYXJkaW5nCj50
aGUKPj4gcHJvcG9zYWwgZGVzY3JpcHRpb24uCj4KPmJ1dCB3ZSBuZWVkIHRvIGRpc2FibGUgdGhl
IHBhc3NpdmUgdHJpcCBhcyBjcHUtdHJvdHRlbGluZyBzdGFydHMKPnRoZXJlLi4udGhlIGhpZ2hl
ciB0ZW1wZXJhdHVyZSB0cmlwcyBhcmUgY3VycmVudGx5IG5vdCByZWFjaGVkCj4KPnN1bW1hcnkK
Pgo+bW92aW5nIGZhbiBhbmQgY3B1X3RoZXJtYWwtb3ZlcnJpZGUgdG8gYmFuYW5hcGktcjY0LmR0
cwo+Cj5wYXNzaXZlLXRyaXA6IGNvb2xpbmctZGV2aWNlID0gPCZjcHUwLzEgMCAwPiBhcyBpbiBl
cmljcyBQYXRjaAo+YWN0aXZlIHRyaXA6IGNvb2xpbmctZGV2aWNlID0gPCZmYW4wIFRIRVJNQUxf
Tk9fTElNSVQKPlRIRVJNQUxfTk9fTElNSVQ+Owo+dGhlIG90aGVyIDIgdW5jaGFuZ2VkCj4KPmJ1
dCBpIHN1Z2dlc3QgY2hhbmdpbmcgdGhlIHRlbXBlcmF0dXJlIHBvaW50cyBpbiBtdDc2MjIgZHRz
aSBhcyB0aGlzIGlzCj5Tb0Mgc3BlY2lmaWMKPgo+c28gYmFzaWNseToKPgo+LS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+KysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+QEAgLTE0MywxMyArMTQzLDEzIEBAIGNwdV90aGVy
bWFsOiBjcHUtdGhlcm1hbCB7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgIHRyaXBzIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3Bhc3NpdmU6IGNwdS1wYXNzaXZlIHsK
Pi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZSA9IDw0
NzAwMD47Cj4rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1
cmUgPSA8NzAwMDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh5
c3RlcmVzaXMgPSA8MjAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdHlwZSA9ICJwYXNzaXZlIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsK
Pgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfYWN0aXZlOiBjcHUtYWN0aXZl
IHsKPi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZSA9
IDw2NzAwMD47Cj4rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVtcGVy
YXR1cmUgPSA8ODAwMDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGh5c3RlcmVzaXMgPSA8MjAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHlwZSA9ICJhY3RpdmUiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9
Owo+QEAgLTE3MCw4ICsxNzAsOCBAQCBjcHUtY3JpdCB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICBjb29saW5nLW1hcHMgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAwIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmlwID0gPCZjcHVfcGFz
c2l2ZT47Cj4tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1k
ZXZpY2UgPSA8JmNwdTAKPlRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCj4tICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNw
dTEKPlRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Cj4rICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgMCAwPiwKPisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y3B1MSAwIDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1hcDEgewo+QEAgLTQyOCw2ICs0MjgsNyBAQCB1YXJ0
Mzogc2VyaWFsQDExMDA1MDAwIHsKPiAgICAgICAgcHdtOiBwd21AMTEwMDYwMDAgewo+ICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIyLXB3bSI7Cj4gICAgICAgICAg
ICAgICAgcmVnID0gPDAgMHgxMTAwNjAwMCAwIDB4MTAwMD47Cj4rICAgICAgICAgICAgICAgI3B3
bS1jZWxscyA9IDwzPjsKPiAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzcg
SVJRX1RZUEVfTEVWRUxfTE9XPjsKPiAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnRvcGNrZ2Vu
IENMS19UT1BfUFdNX1NFTD4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgPCZwZXJpY2ZnIENM
S19QRVJJX1BXTV9QRD4sCj4KPi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3
NjIyLWJhbmFuYXBpLWJwaS1yNjQuZHRzCj4rKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210NzYyMi1iYW5hbmFwaS1icGktcjY0LmR0cwo+QEAgLTM3LDYgKzM3LDEzIEBAIGNwdUAx
IHsKPiAgICAgICAgICAgICAgICB9Owo+ICAgICAgICB9Owo+Cj4rICAgICAgIGZhbjA6IHB3bS1m
YW4gewo+KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicHdtLWZhbiI7Cj4rICAgICAgICAg
ICAgICAgI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4rICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdt
IDIgMTAwMDAgMD47Cj4rICAgICAgICAgICAgICAgY29vbGluZy1sZXZlbHMgPSA8MCAxMDIgMTcw
IDIzMD47Cj4rICAgICAgIH07Cj4rCj4gICAgICAgIGdwaW8ta2V5cyB7Cj4gICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJncGlvLWtleXMiOwo+Cj5AQCAtNTgyLDYgKzU4OSwyOSBAQCAmdTNw
aHkgewo+ICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gfTsKPgo+KyZjcHVfdGhlcm1hbCB7Cj4r
ICAgICAgIGNvb2xpbmctbWFwcyB7Cj4rICAgICAgICAgICAgICAgbWFwMSB7Cj4rICAgICAgICAg
ICAgICAgICAgICAgICB0cmlwID0gPCZjcHVfYWN0aXZlPjsKPisgICAgICAgICAgICAgICAgICAg
ICAgIGNvb2xpbmctZGV2aWNlID0gPCZmYW4wIFRIRVJNQUxfTk9fTElNSVQKPlRIRVJNQUxfTk9f
TElNSVQ+Owo+KyAgICAgICAgICAgICAgIH07Cj4rICAgICAgIH07Cj4rfTsKPisKPiAmdWFydDAg
ewo+ICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICAgICAgICBwaW5jdHJsLTAg
PSA8JnVhcnQwX3BpbnM+OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
