Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9E1C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:48:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F66061603
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F66061603
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wFtRMF43clkru+GbrVwIy8ahyaYYVNQTI2lTYu56h/Q=; b=Gya25cWJSMCh5vtwsiDr5r1+ql
	rUc8fyLZDsRxSwWiN/dIBKNS7BGGz4aAaPcs+VfSj01BxKei8waFD3zbRpRhBnDrAD14IdlzceQGD
	1DdE4Ul8HAiPyXcGDzuDi71v32UyPtH7rwInhNXmnG0TrmKZ4xozCOi5iPBqG4JomSpHP/EoRh7p9
	eDSMHlfXm+bdM8Qk1069PnPMjMQdxwADLy48s4Ce1cB/bgC51g+q4NH8OO7j0aqGAxHbBCtr13Vf8
	zSJduV+cV2JSuO+J/7ifc7M7erAXMctath2jQtIUqAqbjOEkmWyIz+4nAgA95b3Stp06tGgfZ8yzp
	1BRN/bRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwkJj-001N4u-1u; Fri, 25 Jun 2021 11:48:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwkJV-001N31-K5
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 11:48:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id b3so10260540wrm.6
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Jun 2021 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kwcx9otKeRLrPfoujiGcv2pQL5iszSvQBvkikrZdgJ8=;
 b=qRWLJiX0JpHuLPVS/tsP1icZ/nNWiBpH/TQJnwa4S+y4rHPQTSSfRG7guZURO3rhRe
 ZNDaECZcynKUwMfpHkIzWWTjrdVlJlgr7u9dm9WpSpIwkcUK9LZdDvB+/lL1QWGFnhSE
 KQICngDxp8tDRBm81R43MzQO/eFrRrPdtav4Kuc91QxyxvlMk9LCqGNqXmfX/EjYx3MY
 ARdKNXoLuL2Yf2XywcbGcPWFn/lzZB+IR1I1LOZw0ih1iquHvTd8cIPnfwnXGoqqOBhP
 cRjTYmq12qjZY59gB3Pc8kr645aisuwJw4m8va8rIEaEaGITqBurUuz1hfdcV7m9YV9o
 gvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kwcx9otKeRLrPfoujiGcv2pQL5iszSvQBvkikrZdgJ8=;
 b=kILX1mbAtKLOIjngYwU7hXXtwTfSMjdtehV/2ZaSciRURBa1XaHXr/2o0tYgm0S7a5
 h+4cqqPAlCZ8LKl+wtRbjaZ1rM8k1WLbzeOmOb6OivuyYhUE/5NcNLetk5aELDY2JlXw
 cvbJb0XgIpQ4kUBFx754kflw9f9PuO522II/iTDdrl6QvkNGsxnPsqmhROeTu3TqmMi5
 FlmKfCBGb+GyZftxsZJ7bAdt+jvqpzCm84OGtD3wprqS8Q2eqXznjszgH2hg8BsYve1x
 B6ztcPWwneZuUK4f1TTYIaDwHRVjdxOAI8OvNBofqUcGiaItRXKsilOUtmV4FCGkFr1h
 ntag==
X-Gm-Message-State: AOAM532B5EFGAGFDpyn5j9DlwzHW7PoxMAwF7tSSPCFm27CFHeI0UGu/
 TT6dJNSDfUUwioNY7oFs7E0IcBSBxDyQZle0
X-Google-Smtp-Source: ABdhPJy5Gp4yNbeL/MczZpciQZE1+Pu7WBKPslzvha7jWE7uLGxGLe067X+TbgN8DO7YaMaJ9DInJw==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr10668163wrx.171.1624621678949; 
 Fri, 25 Jun 2021 04:47:58 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c52d:3cc5:c823:ade0?
 ([2a01:e34:ed2f:f020:c52d:3cc5:c823:ade0])
 by smtp.googlemail.com with ESMTPSA id s23sm5862861wmh.5.2021.06.25.04.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 04:47:58 -0700 (PDT)
Subject: Re: Aw: Re: Re: [PATCH] Fix mt7622.dtsi thermal cpu
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Woudstra <ericwouds@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
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
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <915b101a-6bea-ae96-78ed-d27fa5bfce3a@linaro.org>
Date: Fri, 25 Jun 2021 13:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-2eb7c0ac-d9dc-446c-8907-69b5f4df6838-1624618996538@3c-app-gmx-bs66>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_044801_719910_7D97F116 
X-CRM114-Status: GOOD (  27.40  )
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

T24gMjUvMDYvMjAyMSAxMzowMywgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBIaQo+IAo+PiBH
ZXNlbmRldDogRnJlaXRhZywgMjUuIEp1bmkgMjAyMSB1bSAxMTo1NyBVaHIKPj4gVm9uOiAiRGFu
aWVsIExlemNhbm8iIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IAo+PiBZb3Ugc2hvdWxk
IG5vdCBhZGQgdGhlIGZhbiBpbiB0aGUgbXQ3NjIyLmR0c2kgaXRzZWxmIGJ1dCBpbiB0aGUgYm9h
cmQKPj4gc3BlY2lmaWMgZmlsZSB3aGVyZSB0aGVyZSBpcyBhIGZhbiBvdXRwdXQgb24gaXQuIG10
NzYyMi5kdHNpIGlzIHN1cHBvc2VkCj4+IHRvIGJlIHRoZSBTb0MgaXRzZWxmIEFGQUlDVC4KPj4K
Pj4gRm9yIGluc3RhbmNlOgo+Pgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90aGVybWFsL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cm9ja2NoaXAvcmszMzk5LXNhcHBoaXJlLmR0c2kjbjM5Cj4+Cj4+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RoZXJtYWwvbGludXguZ2l0L3RyZWUvYXJj
aC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktc2FwcGhpcmUuZHRzaSNuMTY0Cj4gCj4+
PiBAQCAtMTcwLDE0ICsxNzcsMTIgQEAKPj4+ICAJCQljb29saW5nLW1hcHMgewo+Pj4gIAkJCQlt
YXAwIHsKPj4+ICAJCQkJCXRyaXAgPSA8JmNwdV9wYXNzaXZlPjsKPj4+IC0JCQkJCWNvb2xpbmct
ZGV2aWNlID0gPCZjcHUwIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCj4+PiAt
CQkJCQkJCSA8JmNwdTEgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPj4+ICsJ
CQkJCWNvb2xpbmctZGV2aWNlID0gPCZmYW4wIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19M
SU1JVD47Cj4+PiAgCQkJCX07Cj4+Cj4+IGZhbiA9PSBhY3RpdmUgdHJpcCBwb2ludAo+Pgo+PiBU
aGlzIGlzIHJlZmVycmluZyB0byB0aGUgcGFzc2l2ZSB0cmlwIHBvaW50LiBTbyBpdCBzaG91bGQg
cG9pbnQgdG8gdGhlCj4+IENQVSBhcyBpdCBpcyBub3cuIE5vdGUgdGhlIG9yZGVyIG9mIG1pdGln
YXRpb24gaXMgaW52ZXJ0ZWQgcmVnYXJkaW5nIHRoZQo+PiBwcm9wb3NhbCBkZXNjcmlwdGlvbi4K
PiAKPiBidXQgd2UgbmVlZCB0byBkaXNhYmxlIHRoZSBwYXNzaXZlIHRyaXAgYXMgY3B1LXRyb3R0
ZWxpbmcgc3RhcnRzIHRoZXJlLi4udGhlIGhpZ2hlciB0ZW1wZXJhdHVyZSB0cmlwcyBhcmUgY3Vy
cmVudGx5IG5vdCByZWFjaGVkCgpTb3JyeSwgY2FuIHlvdSByZXBocmFzZSBpdCA/IEknbSBub3Qg
Z2V0dGluZyB0aGUgcG9pbnQuCgoKPiBzdW1tYXJ5Cj4gCj4gbW92aW5nIGZhbiBhbmQgY3B1X3Ro
ZXJtYWwtb3ZlcnJpZGUgdG8gYmFuYW5hcGktcjY0LmR0cwo+IAo+IHBhc3NpdmUtdHJpcDogY29v
bGluZy1kZXZpY2UgPSA8JmNwdTAvMSAwIDA+IGFzIGluIGVyaWNzIFBhdGNoCj4gYWN0aXZlIHRy
aXA6IGNvb2xpbmctZGV2aWNlID0gPCZmYW4wIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19M
SU1JVD47Cj4gdGhlIG90aGVyIDIgdW5jaGFuZ2VkCj4gCj4gYnV0IGkgc3VnZ2VzdCBjaGFuZ2lu
ZyB0aGUgdGVtcGVyYXR1cmUgcG9pbnRzIGluIG10NzYyMiBkdHNpIGFzIHRoaXMgaXMgU29DIHNw
ZWNpZmljCj4gCj4gc28gYmFzaWNseToKPiAKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210NzYyMi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDc2MjIuZHRzaQo+IEBAIC0xNDMsMTMgKzE0MywxMyBAQCBjcHVfdGhlcm1hbDogY3B1LXRoZXJt
YWwgewo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRyaXBzIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNwdV9wYXNzaXZlOiBjcHUtcGFzc2l2ZSB7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlbXBlcmF0dXJlID0gPDQ3MDAwPjsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1cmUgPSA8NzAw
MDA+OwoKTWF5IGJlIGluY3JlYXNlIHRoZSBwYXNzaXZlIHRlbXAgdG8gNzXCsEMuCgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoeXN0ZXJlc2lzID0gPDIwMDA+Owo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eXBlID0gInBhc3NpdmUi
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiAKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNwdV9hY3RpdmU6IGNwdS1hY3RpdmUgewo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZSA9IDw2NzAwMD47Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlbXBlcmF0dXJlID0gPDgwMDAw
PjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHlzdGVyZXNpcyA9
IDwyMDAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSA9
ICJhY3RpdmUiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKCk1vdmUgdGhl
IGFjdGl2ZSB0cmlwICdjcHVfYWN0aXZlJyB0byBtdDc2MjItYmFuYW5hcGktYnBpLXI2NC5kdHMu
IGFuZApzZXQgaXQgdG8gNzDCsEMgaW4gdGhlIG10NzYyMi1iYW5hbmFwaS1icGktcjY0LmR0cywg
c28gdGhlIGZhbiB3aWxsIGFjdApiZWZvcmUgdGhlIGNwdSB0aHJvdHRsaW5nLgoKVGhlIGJlaGF2
aW9yIHNob3VsZCBiZSB0aGUgZm9sbG93aW5nOiBUaGUgdGVtcGVyYXR1cmUgcmVhY2hlcyA3MMKw
QywgdGhlCmZhbiB3aWxsIHN0YXJ0LCBpZiB0aGUgdGVtcGVyYXR1cmUgY29udGludWVzIHRvIGlu
Y3JlYXNlLCBpdCB3aWxsCmluY3JlYXNlIHRoZSBzcGVlZC4gSWYgdGhlIHRlbXBlcmF0dXJlIHJl
YWNoZXMgNzXCsEMsIHRoZSBmYW4gaXMgc3RpbGwKcm90YXRpbmcgYXQgZnVsbCBzcGVlZCBidXQg
dGhlIGNwdSBiZWdpbnMgdG8gYmUgdGhyb3R0bGVkLgoKQUZBSVUsIGl0IGlzIGEgQ29ydGV4LUE1
MyBydW5uaW5nIEAxLjM1R0gsIHNvIGV4Y2VwdCB0aGUgYm9hcmQgaXMgaW4gYQpibGFjayBtZXRh
bCBib3ggdW5kZXIgdGhlIHN1biwgSSBkb24ndCBzZWUgaG93IHdlIGNhbiByZWFjaCB0aGlzIHRo
ZXJtYWwKbGltaXRzLgoKPiBAQCAtMTcwLDggKzE3MCw4IEBAIGNwdS1jcml0IHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBjb29saW5nLW1hcHMgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWFwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRyaXAgPSA8JmNwdV9wYXNzaXZlPjsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFM
X05PX0xJTUlUPiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JmNwdTEgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1kZXZpY2Ug
PSA8JmNwdTAgMCAwPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNwdTEgMCAwPjsKCllvdSBzaG91bGQga2VlcCBpdCB1bnRvdWNo
ZWQuCgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiAKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1hcDEgewo+IEBAIC00MjgsNiArNDI4LDcgQEAgdWFydDM6
IHNlcmlhbEAxMTAwNTAwMCB7Cj4gICAgICAgICBwd206IHB3bUAxMTAwNjAwMCB7Cj4gICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIyLXB3bSI7Cj4gICAgICAgICAg
ICAgICAgIHJlZyA9IDwwIDB4MTEwMDYwMDAgMCAweDEwMDA+Owo+ICsgICAgICAgICAgICAgICAj
cHdtLWNlbGxzID0gPDM+Owo+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
NzcgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ0b3Bj
a2dlbiBDTEtfVE9QX1BXTV9TRUw+LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICA8JnBlcmlj
ZmcgQ0xLX1BFUklfUFdNX1BEPiwKPiAKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210NzYyMi1iYW5hbmFwaS1icGktcjY0LmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ3NjIyLWJhbmFuYXBpLWJwaS1yNjQuZHRzCj4gQEAgLTM3LDYgKzM3LDEz
IEBAIGNwdUAxIHsKPiAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAgIH07Cj4gCj4gKyAgICAg
ICBmYW4wOiBwd20tZmFuIHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJwd20tZmFu
IjsKPiArICAgICAgICAgICAgICAgI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAg
ICAgIHB3bXMgPSA8JnB3bSAyIDEwMDAwIDA+Owo+ICsgICAgICAgICAgICAgICBjb29saW5nLWxl
dmVscyA9IDwwIDEwMiAxNzAgMjMwPjsKPiArICAgICAgIH07Cj4gKwo+ICAgICAgICAgZ3Bpby1r
ZXlzIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJncGlvLWtleXMiOwo+IAo+IEBA
IC01ODIsNiArNTg5LDI5IEBAICZ1M3BoeSB7Cj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4g
IH07Cj4gCj4gKyZjcHVfdGhlcm1hbCB7Cj4gKyAgICAgICBjb29saW5nLW1hcHMgewo+ICsgICAg
ICAgICAgICAgICBtYXAxIHsKPiArICAgICAgICAgICAgICAgICAgICAgICB0cmlwID0gPCZjcHVf
YWN0aXZlPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb29saW5nLWRldmljZSA9IDwmZmFu
MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+ICsgICAgICAgICAgICAgICB9
Owo+ICsgICAgICAgfTsKPiArfTsKPiArCj4gICZ1YXJ0MCB7Cj4gICAgICAgICBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwo+ICAgICAgICAgcGluY3RybC0wID0gPCZ1YXJ0MF9waW5zPjsKPiAK
CgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vi
b29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9s
aW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4g
QmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
