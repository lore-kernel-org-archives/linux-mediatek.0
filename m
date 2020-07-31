Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE33BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:59:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB9220829
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gs3JypQt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMBcfMGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB9220829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QSMIaxLLKBYQX0rO3aFgL1tpLGJ/owVSZ+pdHe8JHhA=; b=Gs3JypQtspC/xvQcDOB57J0PQ
	vrRvaIdYebGy17rkbS+o1uYFonBJdybzGWB1rwYCvOy5Sf6LVSeYgVN+qHSWj+9MUQzngs7McEM6E
	KMbQ73X/qBYvfZSv4qMFlqKgknTgqTRLtchvmGJUR0SKYtWW8a4X0CIN5CHsJXwModxQsSxg4oIvm
	eWqcLwHNnkwJHsTJvBLozXXxP3BMQIlfRWuYu597ovY4fph8bHdngHAiRzLjeYja6Lnw9VscyPn/8
	j7qi6CmjpobvM7cNIr7GZwLYPqk2Nc3vUV++gRY8dsasnfStFbdGdOsz3rs5EcTogHaOTBRBnUq62
	FgAqBSOMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1RpC-0006cb-O2; Fri, 31 Jul 2020 09:59:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Rp9-0006bb-V5
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 09:59:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id d190so8044183wmd.4
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=39y7P5Gwjtd3AnR6h3PLwZ8s2R2z4M9PxJEGWiapqVU=;
 b=gMBcfMGPW7ErBYTjBzW9QJveMfkgYy+NHBk+SKKkE3vKX6tn6MYhI5L9eaKWiCyrdT
 dpdxpJHinGrmrxPUESyzm42z/NBEQiFWdbEnpE1i9XCy7F3Bq6MdcMODWuhs70/YnNkm
 ki/EwEm6VNZJlhL6QTfSro3pePGkWLwPxHhweAuFvbMMHVKF5FaluqeHAWlhqN6ZKipk
 k3fR+QMmx1+gGaakLPIJ+GqWYoirAt0rEuK6jQQ4z2GkfH4RhHmHMFkmT80EaUBVRrf9
 dOB+yFdrvGIhzZt7yeSqOrXuPo/PihoNrsY1n5qO2BpPPhLlazO9ZUuTJ/OVGxL00hKj
 B2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39y7P5Gwjtd3AnR6h3PLwZ8s2R2z4M9PxJEGWiapqVU=;
 b=sd2e2g3utXnnFetDnQjnBX6LupjQMfdRHv9320P1Nzkt3Tepg/Ns8YmD2iSw079K4j
 9b4MuJnhqhdzFpKsibZ/iPEyN+0yNNh9i/wHJj3QL9cgofNk4kLWW4d5/R0m3hAGtJeJ
 /mBzTm8R1foem6BvceyqdjSLp9h5m+3K2Rtbwok+WPY6INxY6NFjqBeYTTsZSbDiPGMQ
 WNREl9C0MyzNARcA6puGzC0t1nesqbkND7NHYfTN7/6Ly2GLEGSXj6FGy/6aW0U+HxBQ
 MuK7Ks8ZpeDiC/1EIqJmlDh3AwPpc/yl63WNiLZGT84aBKBnN5jXYBSaVbC25LPW4TYM
 JD7Q==
X-Gm-Message-State: AOAM532QXJx7TypaI6dLkHuiqeQ8BDQObZmKKAQmSOtjGUXRT5B3AJgc
 I2pk4Q/oVL+GPP1vw1+SoDD4Bg==
X-Google-Smtp-Source: ABdhPJwX7zxARepQDDTP7uSmPjHKWK16wvj2up1Cti71adU9OAdqJiNWJ5CPpT1ecG7IJPqtGWIxxQ==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr3336543wmj.90.1596189574501;
 Fri, 31 Jul 2020 02:59:34 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e484:a7d1:6931:9059?
 ([2a01:e34:ed2f:f020:e484:a7d1:6931:9059])
 by smtp.googlemail.com with ESMTPSA id
 s125sm12875748wmf.14.2020.07.31.02.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 02:59:33 -0700 (PDT)
Subject: Re: [PATCH] thermal: mediatek: Fix missing selection
To: Henry Yen <henry.yen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <1596096304-16422-1-git-send-email-henry.yen@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <69a4b653-9f47-63f1-7eb0-4880bf19497a@linaro.org>
Date: Fri, 31 Jul 2020 11:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596096304-16422-1-git-send-email-henry.yen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_055936_049846_61D4FE16 
X-CRM114-Status: GOOD (  21.42  )
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
Cc: Steven Liu <steven.liu@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd.bergmann@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CkhpIEhlbnJ5LAoKY2MnaW5nIEFybmQKCk9uIDMwLzA3LzIwMjAgMTA6MDUsIEhlbnJ5IFllbiB3
cm90ZToKPiBNZWRpYXRlayB0aGVybWFsIGRyaXZlciBpcyBjb21wYXRpYmxlIHdpdGggbXVsdGlw
bGUgcGxhdGZvcm1zLgo+IFNvbWUgb2YgdGhlIHBsYXRmb3JtcyAoZS5nLiwgTVQyNzAxKSByZXF1
aXJlcyB0byBlbmFibGUKPiBNRURJQVRFS19NVDY1NzdfQVVYQURDIG9wdGlvbi4gSWYgbGFja3Mg
dGhlIGNvbmZpZywgdGhlIGRyaXZlcgo+IHdpbGwgbm90IGJlIGFibGUgdG8gcmVhZCBjb3JyZWN0
IHRlbXBlcmF0dXJlLgo+IAo+IFRvIGZpeCBpdCwgc2VsZWN0IG1pc3NpbmcgTUVESUFURUtfTVQ2
NTc3X0FVWEFEQyBjb25maWcuCgpUaGUgZGVzY3JpcHRpb24gc3RhdGVzIHRoZXJlIGlzIGEgZGVw
ZW5kZW5jeSBmb3Igc29tZSBwbGF0Zm9ybXMgbm90IGFsbApvZiB0aGVtLgoKVGhlIGNoYW5nZSB3
aWxsIHNlbGVjdCB0aGUgb3B0aW9uIGV2ZXJ5IHRpbWUgZm9yIGFueSBtZWRpYXRlayBwbGF0Zm9y
bQpvciBjb21waWxlIHRlc3QuCgpJIGRvbid0IHRoaW5rIGl0IGlzIHRoZSBwbGFjZSB0byBzZWxl
Y3QgdGhlIG9wdGlvbi4KCj4gU2lnbmVkLW9mZi1ieTogSGVucnkgWWVuIDxoZW5yeS55ZW5AbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvS2NvbmZpZyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVy
bWFsL0tjb25maWcgYi9kcml2ZXJzL3RoZXJtYWwvS2NvbmZpZwo+IGluZGV4IDNlYjIzNDhlNTI0
Mi4uM2EzN2Y2NzRmN2YzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9LY29uZmlnCj4g
KysrIGIvZHJpdmVycy90aGVybWFsL0tjb25maWcKPiBAQCAtNDA5LDYgKzQwOSw3IEBAIGNvbmZp
ZyBNVEtfVEhFUk1BTAo+ICAJZGVwZW5kcyBvbiBOVk1FTSB8fCBOVk1FTT1uCj4gIAlkZXBlbmRz
IG9uIFJFU0VUX0NPTlRST0xMRVIKPiAgCWRlZmF1bHQgeQo+ICsJc2VsZWN0IE1FRElBVEVLX01U
NjU3N19BVVhBREMKPiAgCWhlbHAKPiAgCSAgRW5hYmxlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50
IHRvIGhhdmUgc3VwcG9ydCBmb3IgdGhlcm1hbCBtYW5hZ2VtZW50Cj4gIAkgIGNvbnRyb2xsZXIg
cHJlc2VudCBpbiBNZWRpYXRlayBTb0NzCj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcv
PiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxv
dyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9v
ayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93
d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
