Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90296C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 18:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C7561185
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 18:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C7561185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:CC:To:Date:From:Subject:
	MIME-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iByhjlu+ydvTHN14erNkqGsfMQmu0xLrvI/g7Ri7OUQ=; b=vE+aAW0YzoGqjy
	JV0/ysM0SQiGUAZdLu9DYitptKI4pwnVvVWjceuFLHNpTHCCltiZIYLqSyawpGO8cP+YVJZ7B97y0
	UK+RvPXOhNKHQxTjMNx4Ea5TEyzPfSPEG0GoVonHs3Ap2kwV63b1DUGW5ybS84pAHb1DULKXmuy6b
	7Uj7KzP6UJhoBekwlW55LjHoitk/p5iwJOhcfMbSLf0aG2GKDIuIjYsjgvc9MTzVtMXi1nV5ZVHVs
	H0/xZmjjo3YHjxyLWRppa7iUrEvb1bYzGv63RR6MorR+G6S2Ezq4Y43K4zFAjeg0iX/hlWKBnQc5I
	d0t59QYxUZTNCPVya9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw7sK-00Bh2X-CD; Wed, 23 Jun 2021 18:45:24 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw7s6-00Bh0C-Ss; Wed, 23 Jun 2021 18:45:12 +0000
Received: by mail-ed1-x536.google.com with SMTP id h17so4834847edw.11;
 Wed, 23 Jun 2021 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=in-reply-to:references:thread-topic:user-agent:mime-version
 :content-transfer-encoding:subject:from:date:to:cc:message-id;
 bh=ah7pBnbhzP9GnkQ3rGPkhU3+DWS7Z2OsFCqpYUElow8=;
 b=BpaIaUQ0ce5ob/JOAjBlVv9KSNyieeU75lx7Oa5EBtX0KVeCAmDz32DP88jgmxyEuV
 f9Q6pdyYTGNeDZBwzAyVuO3q5iE9Zp8faxFfC0qdZ3nV8JYztbuUQ1jL+RBf5cR6DrCz
 qpPnh7RMD0a6a8ENUr3R+YDmAymdkAlE/HoH2NBRDWz2ZCpWP5phK87DdN838uUFlHe2
 4V5DXvhm46VPf1n/pW+DFn0mRfefTPgz2tGgBtYp4+eeXNObwoSE2lTd0IVokYf+vqTG
 48axfLBYdyUw0jryfa0OCMnhUpBHS7S15VzedNegaqWU+URoq8Ast6I5N3pXnG867Bu6
 dLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
 :mime-version:content-transfer-encoding:subject:from:date:to:cc
 :message-id;
 bh=ah7pBnbhzP9GnkQ3rGPkhU3+DWS7Z2OsFCqpYUElow8=;
 b=gq5SHVFXxgSG6g5KTLJT6LXpKStzZI/KZMNiQ5n4CUJPkT/KHzpTEFT8UaSH3+pYdB
 wULK8+u8poTWel+cO6fOzcwA7Va+7ANRAouEPUfeI/sArGCzt/FqCr7ds01W2M83e3j1
 kKzu8xKWZxyRdPvKXxnHH7UBda6hhJP2cWQx8Khc0ix1ogv6EzGF1+zeVGlENX0rxfuL
 kdf6bmEyQlILiFwQMdGal/gQbXiy1H+K6vgwtd0TINfiAODsK5zWPLrFtMSc8usRS9PK
 cL9py518qmH7led6f3xrGyVOsmkmKutwnOEbnBb2wmE1TVYA00EJchq5qEX/pkDZdHtE
 8VMA==
X-Gm-Message-State: AOAM530Z5yb9tdbf9XXuAZH7ar4zeNF6g1Bhr6UwC/MuD78ev94w1nZp
 TVQg/sWSXY0lAHl1W/OBIPA=
X-Google-Smtp-Source: ABdhPJzDkrQhtZZC+CyPDsfo0g8ANdWq9ib6iNs7UYbxId9ryLzi0Ubw98iPpKpjsPeS1sq4mAl06w==
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr1656874edt.63.1624473909523;
 Wed, 23 Jun 2021 11:45:09 -0700 (PDT)
Received: from
 2001-1c01-471c-ce00-7d60-ae46-0c29-c0bb.cable.dynamic.v6.ziggo.nl
 (2001-1c01-471c-ce00-7d60-ae46-0c29-c0bb.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:471c:ce00:7d60:ae46:c29:c0bb])
 by smtp.gmail.com with ESMTPSA id c6sm460084ede.17.2021.06.23.11.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 11:45:08 -0700 (PDT)
In-Reply-To: <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
X-Referenced-Uid: 5591
Thread-Topic: Re: [PATCH] Fix mt7622.dtsi thermal cpu
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
Subject: Re: [PATCH] Fix mt7622.dtsi thermal cpu
From: Eric Woudstra <ericwouds@gmail.com>
Date: Wed, 23 Jun 2021 20:43:15 +0200
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org,linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,linux-kernel@vger.kernel.org
Message-ID: <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_114510_985257_C520F850 
X-CRM114-Status: GOOD (  20.78  )
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

CkkgY2hvb3NlICJob3QiIGJlZm9yZSwgYmVjYXVzZSA4NyBkZWdyZWVzIHNlZW1zIG9rIHRvIHN0
YXJ0IGZyZXF1ZW5jeSB0aHJvdHRsaW5nLiBCdXQsIHllcywgaXQgc2hvdWxkIGJlIHBhc3NpdmUu
Cgo4NyBpcyBzdGlsbCBxdWl0ZSBsb3cgaWYgSSBjb21wYXJlIHRoaXMgdGVtcGVyYXR1cmUgd2l0
aCB0aGUgd3J0MzIwMGFjbSBNYXJ2ZWxsIGR1YWwgY29yZSBhcm0gc29jLiBUaGV5IGV2ZW4gd2Vu
dCBhYm92ZSAxMDAgZGVncmVlcyBzbyBJIGZlZWwgZm9yIGFuIGFybSBwcm9jZXNzb3IgaW5zaWRl
IGEgcm91dGVyIGJveCBpdCBpcyBmaW5lIHRvIHVzZSA4NyBkZWdyZWVzIEJ1dCBtYXliZSBzb21l
b25lIGF0IE1lZGlhdGVrIGNhbiBnaXZlIHNvbWUgbW9yZSBkZXRhaWxzIGFib3V0IG9wZXJhdGlu
ZyB0ZW1wZXJhdHVyZXMuCgpJdCBtYXkgYmUgcG9zc2libGUgdG8gbGVhdmUgdGhlIGFjdGl2ZSBt
YXAgaW4gdGhlIGRldmljZSB0cmVlIGFzIHNvbWUgdXNlcnMgb2YgdGhlIGJhbmFuYXBpIG1pZ2h0
IGNob29zZSB0byBpbnN0YWxsIGEgZmFuIGFzIGl0IGlzIG9uZSBvZiB0aGUgb3B0aW9ucy4KCuKB
o0dldCBCbHVlTWFpbCBmb3IgQW5kcm9pZCDigIsKCk9uIEp1biAyMywgMjAyMSwgNTo1OCBQTSwg
YXQgNTo1OCBQTSwgRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+IHdy
b3RlOgo+T24gMjMvMDYvMjAyMSAxNzozNSwgRXJpYyBXb3Vkc3RyYSB3cm90ZToKPj4gSXQgaXMg
b25seSB1c2VmdWwgdG8gc2V0IDEgbWFwIHdpdGggdGhlIHJlZ3VsYXRlZCB0ZW1wZXJhdHVyZSBm
b3IgY3B1Cj4+IGZyZXF1ZW5jeSB0aHJvdHRsaW5nLiBTYW1lIGFzIGluIHRoZSBrZXJuZWwgZG9j
dW1lbnQgZXhhbXBsZS4KPj4gCj4+IAo+PiBJdCBoYXMgbm8gdXNlIHRvIHNldCBmcmVxdWVuY3kg
c2NhbGluZyBvbiAyIGRpZmZlcmVudCB0ZW1wZXJhdHVyZQo+PiB0cmlwIHBvaW50cywgYXMgdGhl
IGxvd2VzdCBvbmUgbWFrZXMgc3VyZSB0aGUgaGlnaGVyIG9uZShzKSBhcmUgbmV2ZXIKPj4gcmVh
Y2hlZC4KPgo+SSBsb29rZWQgbW9yZSBjbG9zZWx5IHRoZSBEVCBhbmQgdGhlcmUgaXMgYSBtaXN1
bmRlcnN0YW5kaW5nIG9mIHRoZQo+dGhlcm1hbCBmcmFtZXdvcmsgaW4gdGhlIGRlZmluaXRpb24u
Cj4KPlRoZXJlIGlzIG9uZSB0cmlwIHBvaW50IHdpdGggdGhlIHBhc3NpdmUgdHlwZSBhbmQgdGhl
IGNwdSBjb29saW5nCj5kZXZpY2UsIGZvbGxvd2VkIGJ5IGEgc2Vjb25kIHRyaXAgcG9pbnQgd2l0
aCB0aGUgYWN0aXZlIHR5cGUgKmJ1dCogdGhlCj5zYW1lIGNwdSBjb29saW5nIGRldmljZS4gVGhh
dCBpcyB3cm9uZy4KPgo+QW5kIGZpbmFsbHksIHRoZXJlIGlzIHRoZSBob3QgdHJpcCBwb2ludCBh
cyBhIHRoaXJkIG1hcHBpbmcgYW5kIHRoZQo+c2FtZQo+Y29vbGluZyBkZXZpY2UuCj4KPlRoZSBo
b3QgdHJpcCBwb2ludCBpcyBvbmx5IHRoZXJlIHRvIG5vdGlmeSB1c2Vyc3BhY2UgYW5kIGxldCBp
dCB0YWtlIGFuCj5pbW1lZGlhdGUgYWN0aW9uIHRvIHByZXZlbnQgYW4gZW1lcmdlbmN5IHNodXRk
b3duIHdoZW4gcmVhY2hpbmcgdGhlCj5jcml0aWNhbCB0ZW1wZXJhdHVyZS4KPgo+PiBJdCBjYW4g
YmUgYXBwbGllZCBvbmx5IGF0IDEgdHJpcCBwb2ludC4gTXVsdGlwbGUgdHJpcCBwb2ludHMKPj4g
aXMgb25seSB1c2VmdWxseSBmb3IgZmFuIGNvbnRyb2wgdG8gbWFrZSBzdXJlIHRoZSBmYW4gaXMg
bm90IHRvbwo+PiBub2lzeSB3aGVuIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gYmUgbm9pc3kuCj4+
IAo+PiAKPj4gVGhlIENQVSB3aWxsIGFsbW9zdCBjb21lIHRvIGEgZGVhZCBzdG9wIHdoZW4gaXQg
c3RhcnRzIHRvIHBhc3MgdGhlCj4+IGxvd2VzdCB0aGVybWFsIG1hcCB3aXRoIGZyZXF1ZW5jeSB0
aHJvdHRsaW5nLgo+PiAKPj4gVGhpcyBpcyB3aHkgaXQgaXMgYSBidWcgYW5kIG5lZWRzIGEgZml4
LCBub3Qgb25seSBhZGp1c3RtZW50Lgo+Cj5ZZXMsIHlvdSBhcmUgcmlnaHQuIEl0IHNob3VsZCBi
ZSBzb21ldGhpbmcgbGlrZSAodmVyYmF0aW0gY29weSk6Cj4KPmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpCj5iL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ3NjIyLmR0c2kKPmluZGV4IDg5MGE5NDJlYzYwOC4uODhjODFkMjRmNGZmIDEw
MDY0NAo+LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+Kysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+QEAgLTEzNiwyNCAr
MTM2LDE4IEBAIHNlY21vbl9yZXNlcnZlZDogc2VjbW9uQDQzMDAwMDAwIHsKPgo+IAl0aGVybWFs
LXpvbmVzIHsKPiAJCWNwdV90aGVybWFsOiBjcHUtdGhlcm1hbCB7Cj4tCQkJcG9sbGluZy1kZWxh
eS1wYXNzaXZlID0gPDEwMDA+Owo+KwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwyNTA+Owo+
IAkJCXBvbGxpbmctZGVsYXkgPSA8MTAwMD47Cj4KPiAJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRo
ZXJtYWwgMD47Cj4KPiAJCQl0cmlwcyB7Cj4gCQkJCWNwdV9wYXNzaXZlOiBjcHUtcGFzc2l2ZSB7
Cj4tCQkJCQl0ZW1wZXJhdHVyZSA9IDw0NzAwMD47Cj4rCQkJCQl0ZW1wZXJhdHVyZSA9IDw3NzAw
MD47Cj4gCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+IAkJCQkJdHlwZSA9ICJwYXNzaXZlIjsK
PiAJCQkJfTsKPgo+LQkJCQljcHVfYWN0aXZlOiBjcHUtYWN0aXZlIHsKPi0JCQkJCXRlbXBlcmF0
dXJlID0gPDY3MDAwPjsKPi0JCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47Cj4tCQkJCQl0eXBlID0g
ImFjdGl2ZSI7Cj4tCQkJCX07Cj4tCj4gCQkJCWNwdV9ob3Q6IGNwdS1ob3Qgewo+IAkJCQkJdGVt
cGVyYXR1cmUgPSA8ODcwMDA+Owo+IAkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsKPkBAIC0xNzMs
MTggKzE2Nyw2IEBAIG1hcDAgewo+IAkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1B
TF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPiAJCQkJCQkJIDwmY3B1MSBUSEVSTUFMX05P
X0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+IAkJCQl9Owo+LQo+LQkJCQltYXAxIHsKPi0JCQkJ
CXRyaXAgPSA8JmNwdV9hY3RpdmU+Owo+LQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhF
Uk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPi0JCQkJCQkJIDwmY3B1MSBUSEVSTUFM
X05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+LQkJCQl9Owo+LQo+LQkJCQltYXAyIHsKPi0J
CQkJCXRyaXAgPSA8JmNwdV9ob3Q+Owo+LQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhF
Uk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPi0JCQkJCQkJIDwmY3B1MSBUSEVSTUFM
X05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+LQkJCQl9Owo+IAkJCX07Cj4gCQl9Owo+IAl9
Owo+Cj4KPi0tIAo+PGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29Dcwo+Cj5Gb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93
d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo+PGh0dHA6Ly90d2l0dGVy
LmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo+PGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5h
cm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
