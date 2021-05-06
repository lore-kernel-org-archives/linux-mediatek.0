Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA11C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 02:10:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A87B61075
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 02:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A87B61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wvbQL/8cg+pjENQ4XkLgvCvGJykxfkiVH4gHucPpSfM=; b=pH5twazYSmR7rWl5vYU81Yu9U
	rN1CBC0ugkwEqa2HQoOeFh4T4xyaBXvbcoOk2FZvYQ7qvTKzVulO000n5PL17cGXj9WhcZAnCAk3Z
	OvZlktsIf7aZyIAtFvYZqCHcAeOa1ND5/kA98FYzdIn6uPPGrkmJ2aAsBRrKWR2p2XaCAzOgv5Kx0
	qyfaOuLhVu/EM8t739a2Pfaki1we3SS2XUBisnbtDbneUKE8w41/kOOdaa4k2PXhWQf7wcR4idkPI
	eNLX+/uz1QlNNVjigJwc7S7wO8V3tAnFV7YCmbzSU6ND6hojGGC2zkcnpPR8sW7wl57iyr+t/qibj
	sqhaxtFwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leTTD-002uEA-P5; Thu, 06 May 2021 02:10:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leTTB-002uDw-Om; Thu, 06 May 2021 02:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ze8nHKCTJVPZAxcqvpeEarc+m37v3jnk/1brv6JR/yY=; b=Ubqv1qkOtq7/aUPouGm2NTA9Eh
 4eZGvZMSoZdjbkQRiztOWuhd+k0ZlT2YWsvFoVKbNR2TJzrD3M9BPFNI1DetU74BFeW3Dman0v3Z+
 GAXS4RnDtgtzqRI+cfIUyT2TZLjUb85NdwEZNsLDPIzh8BagAGFXt0o6vwgHRjJwq4rKGd47BSF2q
 5yVjA2C7pf7RIpMcqP0gb8N54reqz+ioRExo221dsuqRf8B7755YtnRxf9mZUx3xU2ZhZRgGuLv9k
 qXcgK6AEme5sHIxzPlqCJajhGtDTMqNI8POLlESfSsAHsVOIUkCtaXJUigqgAtDEh/VXQVay0bNlD
 ojTLx7qg==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leTT9-005Utb-1h; Thu, 06 May 2021 02:10:28 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso3576203otn.3; 
 Wed, 05 May 2021 19:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ze8nHKCTJVPZAxcqvpeEarc+m37v3jnk/1brv6JR/yY=;
 b=Gh02vDtS3vVZBZrxQ2uZZWT9rXIwcfGmEiDhAXNKbS+6OH7HHljuhLFCb+8ldMvtme
 bypprO29OhPi12CKA8ueXpH1LxUgnLpv/kY5p5udC7x+VWBKsAKV4egY9iix6sLA7rcu
 ohgurC4HoMCZZiCLJKPE/WiETqKpVNSfxSPKYVIJERSxz7HaunNfIVp3Iaaco/2UVP6F
 jek7vBZPuhEc1SO2xBYG0SyitOkAywkdUBA2aU8Rg5+kF52GdH5z5/ps//Iu0oOI53Fw
 Ri8M07RORs0i3Buk2SDVXvQ3RgxPkJk0z415ws73Q8CnQD1wmNV/Fw3mwEfizLMrC1m4
 hC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ze8nHKCTJVPZAxcqvpeEarc+m37v3jnk/1brv6JR/yY=;
 b=MQFK030W3bedGwg+aguem1SCdhpfdnjJ4NXdsV6lHYStlLnNx9xsb7xx5aW5UlXLmN
 ucLzgPwkF/47KhYAZ/r7hBl3USUCbIRDrj0krAsBKmOXzd47PLxPmmkvxoVj11qUYn8/
 uzlYbLbQ0UUIRN6tXYBsZnvAoCFiVeo3tM2YQyjybyZaaLXs9FhDPe4wGFcOZGjAH8Ya
 jrCc5wGqPG06yJ1Dn6QM3Ab9ihVGD9LxaZ0WI6h87rDX1GuYJUkdWpbPC97rLEkRaHSZ
 xhhsW0y58f1gC8SB8cJYZBV5PHT3aQ5RcdhL0pudavnAb4TETd/ObckfI1kbNDx3QMdm
 YGHw==
X-Gm-Message-State: AOAM530L5NDgCCM7mZQi0B+WPzNHgNpN71KOgVSonDvdqLzdWhV6mAWn
 qIkliIwFbGJis2ajMWs5YYY=
X-Google-Smtp-Source: ABdhPJyDfe/Vr0bIlEEgW1QLVfnkxK0Q+Ez92Z9YkHkRYyp/EYkR5hYMfsCyXLmT+HGErWJNF6gEGQ==
X-Received: by 2002:a05:6830:411b:: with SMTP id
 w27mr1398308ott.80.1620267024455; 
 Wed, 05 May 2021 19:10:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x18sm199395oix.28.2021.05.05.19.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 19:10:23 -0700 (PDT)
Subject: Re: [PATCH V9 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <APgAqgAuDm48oWX*tq6AkKqd.3.1620265890239.Hmail.wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ac2a3762-0b5d-a406-33e0-fca3073cd5ac@roeck-us.net>
Date: Wed, 5 May 2021 19:10:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <APgAqgAuDm48oWX*tq6AkKqd.3.1620265890239.Hmail.wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_191027_123947_B92E0B89 
X-CRM114-Status: GOOD (  14.38  )
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

T24gNS81LzIxIDY6NTEgUE0sIOeOi+aTjiB3cm90ZToKPiAKPj4gT24gNC8yNC8yMSA2OjUyIFBN
LCBXYW5nIFFpbmcgd3JvdGU6Cj4+PiBVc2UgdGhlIGJhcmsgaW50ZXJydXB0IGFzIHRoZSBwcmV0
aW1lb3V0IG5vdGlmaWVyIGlmIGF2YWlsYWJsZS4KPj4+Cj4+PiBXaGVuIHRoZSB3YXRjaGRvZyB0
aW1lciBleHBpcmVzIGluIGR1YWwgbW9kZSwgYW4gaW50ZXJydXB0IHdpbGwgYmUKPj4+IHRyaWdn
ZXJlZCBmaXJzdCwgdGhlbiB0aGUgdGltaW5nIHJlc3RhcnRzLiBUaGUgcmVzZXQgc2lnbmFsIHdp
bGwgYmUKPj4+IGluaXRpYXRlZCB3aGVuIHRoZSB0aW1lciBleHBpcmVzIGFnYWluLgo+Pj4KPj4+
IFRoZSBwcmV0aW1lb3V0IG5vdGlmaWNhdGlvbiBzaGFsbCBvY2N1ciBhdCB0aW1lb3V0LXNlYy8y
Lgo+Pj4KPj4+IFYyOgo+Pj4gLSBwYW5pYygpIGJ5IGRlZmF1bHQgaWYgV0FUQ0hET0dfUFJFVElN
RU9VVF9HT1YgaXMgbm90IGVuYWJsZWQuCj4+Pgo+Pj4gVjM6Cj4+PiAtIE1vZGlmeSB0aGUgcHJl
dGltZW91dCBiZWhhdmlvciwgbWFudWFsbHkgcmVzZXQgYWZ0ZXIgdGhlIHByZXRpbWVvdXQKPj4+
IC0gaXMgcHJvY2Vzc2VkIGFuZCB3YWl0IHVudGlsIHRpbWVvdXQuCj4+Pgo+Pj4gVjQ6Cj4+PiAt
IFJlbW92ZSBwcmV0aW1lb3V0IHJlbGF0ZWQgcHJvY2Vzc2luZy4gCj4+PiAtIEFkZCBkdWFsIG1v
ZGUgY29udHJvbCBzZXBhcmF0ZWx5Lgo+Pj4KPj4+IFY1Ogo+Pj4gLSBGaXggc29tZSBmb3JtYXR0
aW5nIGFuZCBwcmludGluZyBwcm9ibGVtcy4KPj4+Cj4+PiBWNjoKPj4+IC0gUmVhbGl6ZSBwcmV0
aW1lb3V0IHByb2Nlc3NpbmcgdGhyb3VnaCBkdWFsbW9kZS4KPj4+Cj4+PiBWNzoKPj4+IC0gQWRk
IHNldF9wcmV0aW1lb3V0KCkuCj4+Pgo+Pj4gVjgvVjk6Cj4+PiAtIEZpeCBzb21lIGZvcm1hdHRp
bmcgcHJvYmxlbXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2
aXZvLmNvbT4KPj4KPj4gUmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4KPj4KPj4gTm90ZSB0aGF0IHRoZSB2ZXJzaW9uIGhpc3Rvcnkgc2hvdWxkIGJlIGFmdGVy
ICItLS0iLgo+Pgo+PiBHdWVudGVyCj4+Cj4gCj4gVGhhbmtzLCBHdWVudGVyLgo+IEFuZCB3aGF0
IGRvIEkgbmVlZCB0byBkbyBpZiBJIHdhbnQgbWVyZ2UgaW50byB0aGUgbmV4dC10cmVlPwo+IApX
aW0gc2hvdWxkIHRha2UgY2FyZSBvZiB0aGF0LgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
