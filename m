Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3BEC48BC2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 20:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E295660232
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 20:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E295660232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ftndcL7Qp79H50aHJxa2eqzWlHwTIslqCC9jACyysvw=; b=JzufRjIRKUDeWBHes3Q8QxoRol
	RxI5Xm95Vh4890pvzv0CkwvUQexXkts0ssz11E3qqqhgEgHRzr4A5DW1QM6hQ8eQUN+ciIePvcGvv
	alItAJXvtmthqVqAFi4Mxns3FAFKnYb5qPzH7Z6MsSG+DxCvaJYR80w3gshh2stwSrDMeu1Vw87Kz
	QvlcHonteA5Q4H24f9t616+Z9i2XjMqc90Kg5X9nnrkWHgbSz72SJCJvRWt9INGv7p+Xk85gRcCw3
	b1KLTOqhzRIFTuvjAn3ym6ouxrgAivYqiADmiha4185JTgPC2qDCslp/bVLNFBeSElwxRKzqddCc/
	sW9OQhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw9Ak-00BrT9-C9; Wed, 23 Jun 2021 20:08:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw9Ah-00BrS4-9z
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 20:08:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id a13so3980921wrf.10
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Jun 2021 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fDQ/n6QIAJKpmUfoND9p8+BLVwwuVL87V6voHYHsC3k=;
 b=xS24CJ1rpozxgSv2uvbmxNlR6VjqJjNAoq0xRU5s7zEgdffkyFfqUGPU/kA1BUeHFW
 ekbNh9nuFH8qBAiN+SC7ybGJ0T03RON6wtBnPJ8vVY79o33Q71CO4OCVyxu/f9qI14Nh
 Ba2k318cFUqxEw0A0U0Ubo7bzVs9NnWspNLRAkqGQSQWL0NhJu10wDEl8iFBw7vTuZyL
 HuVC9us/qDN/V3pU5K3gvxmPmL9WzpE2sVIjZi8pMIk+POOIcD10ZQvChWtFntcTN4rt
 ipaE8LndyDLAJYOB1ww3UtMbV963oPYesaBNHOEFoGfM3zfhKwyt94s1LN8X8RuOTcaV
 8u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fDQ/n6QIAJKpmUfoND9p8+BLVwwuVL87V6voHYHsC3k=;
 b=iZa6f0HA2hxFtCL0tbSwoW9dlUG3zguLHiGo6JN0RQYk2+Ff4y24ZsAvyxkp4SI3/N
 CiLfQsNjeocGfu+oJJJcdVTD1nCsfi5qTnOke5aNaJLMjNyR+MJ+ODf1o35fBOxxMGX0
 GQgMbPNCAv4vmI+XKtTuCKvNUmnKbQix5nv7wFm+/nBKZpzmJZtLnGtK4yc7yaU+67ja
 M2Ul+SxqVl7Jfd73R0vK31TFbk08cAUe0OtD6AekUw+A+GhWpEbfIWDHogpONzWzrqHd
 yiq4DAh2nlvpaMpTDNWeHBjyuC+UFX4laSmfOil5wc/wh9Y5lYaF707LJ35ubwtIqr1Z
 LkJQ==
X-Gm-Message-State: AOAM533gNPZtHCNIey2k8CR3ik44J7DmKpEomcWc9JWskiS4HE3GyHIx
 MgJ7uSFvkUrt9B31Vloir3qgBw==
X-Google-Smtp-Source: ABdhPJzgEUk2+RPzZJqOl3cQbMW9bslLbEqgO2qiPaZiG8680/7vFCtrFsXwnRmsb2adqROD476/4A==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr2157777wrn.409.1624478904577; 
 Wed, 23 Jun 2021 13:08:24 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a562:3d0a:cd98:9ffd?
 ([2a01:e34:ed2f:f020:a562:3d0a:cd98:9ffd])
 by smtp.googlemail.com with ESMTPSA id f13sm984756wrt.86.2021.06.23.13.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 13:08:24 -0700 (PDT)
Subject: Re: [PATCH] Fix mt7622.dtsi thermal cpu
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
Date: Wed, 23 Jun 2021 22:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_130827_464792_D60D02FE 
X-CRM114-Status: GOOD (  33.55  )
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

T24gMjMvMDYvMjAyMSAyMDo0MywgRXJpYyBXb3Vkc3RyYSB3cm90ZToKPiAKPiBJIGNob29zZSAi
aG90IiBiZWZvcmUsIGJlY2F1c2UgODcgZGVncmVlcyBzZWVtcyBvayB0byBzdGFydCBmcmVxdWVu
Y3kKPiB0aHJvdHRsaW5nLiBCdXQsIHllcywgaXQgc2hvdWxkIGJlIHBhc3NpdmUuCj4gCj4gODcg
aXMgc3RpbGwgcXVpdGUgbG93IGlmIEkgY29tcGFyZSB0aGlzIHRlbXBlcmF0dXJlIHdpdGggdGhl
Cj4gd3J0MzIwMGFjbSBNYXJ2ZWxsIGR1YWwgY29yZSBhcm0gc29jLiBUaGV5IGV2ZW4gd2VudCBh
Ym92ZSAxMDAKPiBkZWdyZWVzIHNvIEkgZmVlbCBmb3IgYW4gYXJtIHByb2Nlc3NvciBpbnNpZGUg
YSByb3V0ZXIgYm94IGl0IGlzIGZpbmUKPiB0byB1c2UgODcgZGVncmVlcyBCdXQgbWF5YmUgc29t
ZW9uZSBhdCBNZWRpYXRlayBjYW4gZ2l2ZSBzb21lIG1vcmUKPiBkZXRhaWxzIGFib3V0IG9wZXJh
dGluZyB0ZW1wZXJhdHVyZXMuCgpTb21ldGltZXMsIHRoZSBTb0MgdmVuZG9yIHB1dHMgYSBoaWdo
IHRlbXBlcmF0dXJlIGluIHRoZSBEVCBqdXN0IHRvCmV4cG9ydCB0aGUgdGhlcm1hbCB6b25lIGFu
ZCBkZWFsIHdpdGggaXQgZnJvbSB1c2Vyc3BhY2UuIFNvIHB1dHRpbmcgdGhlCmhpZ2ggdGVtcCBh
bGxvdyB0aGUgdXNlcnNwYWNlICh1c3VhbGx5IGEgdGhlcm1hbCBlbmdpbmUgLSBBbmRyb2lkIHN0
dWZmKQp0byBkZWFsIHdpdGggdGhlIG1pdGlnYXRpb24gd2l0aG91dCBhIGtlcm5lbCBpbnRlcmFj
dGlvbi4KCkhhdmluZyBtb3JlIHRoYW4gMTAwwrBDIGNvdWxkIGJlIHRoaXMga2luZCBvZiBzZXR1
cC4gT25seSB0aGUgb3BlcmF0aW5nCnRlbXBlcmF0dXJlIGZyb20gdGhlIGhhcmR3YXJlIGRvY3Vt
ZW50YXRpb24gd2lsbCB0ZWxsIHRoZSBzYWZlCnRlbXBlcmF0dXJlIGZvciB0aGUgc2lsaWNvbi4K
CklNTywgNzfCsEMgaXMgYSBnb29kIGNvbXByb21pc2UgdW50aWwgZ2V0dGluZyB0aGUgZG9jdW1l
bnRlZCB0ZW1wLiA4N8KwQwpzb3VuZHMgdG8gbWUgYSBiaXQgdG9vIGhvdC4KCj4gSXQgbWF5IGJl
IHBvc3NpYmxlIHRvIGxlYXZlIHRoZSBhY3RpdmUgbWFwIGluIHRoZSBkZXZpY2UgdHJlZSBhcyBz
b21lCj4gdXNlcnMgb2YgdGhlIGJhbmFuYXBpIG1pZ2h0IGNob29zZSB0byBpbnN0YWxsIGEgZmFu
IGFzIGl0IGlzIG9uZSBvZgo+IHRoZSBvcHRpb25zLgoKVGhlIGFjdGl2ZSB0cmlwIG9ubHkgbWFr
ZXMgc2Vuc2UgaWYgdGhlIGNvb2xpbmcgZGV2aWNlIGlzIGEgZmFuIChvciBhbnkKYWN0aXZlIGRl
dmljZSksIHNvIHRoZSBtYXBwaW5nIHBvaW50cyB0byBhIGZhbiBub2RlLCBsaWtlOgoKaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGhlcm1hbC9saW51eC5n
aXQvdHJlZS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1raGFkYXMtZWRnZS5k
dHNpI24xOTIKCklmIHRoZXJlIGlzIG5vIHN1Y2ggW3B3bV0gZmFuIG91dHB1dCBvbiB0aGUgYm9h
cmQsIG5vIGFjdGl2ZSB0cmlwIHBvaW50CnNob3VsZCBiZSBhZGRlZC4KCj4g4oGjR2V0IEJsdWVN
YWlsIGZvciBBbmRyb2lkIOKAiwo+IAo+IE9uIEp1biAyMywgMjAyMSwgNTo1OCBQTSwgYXQgNTo1
OCBQTSwgRGFuaWVsIExlemNhbm8KPiA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6
Cj4+IE9uIDIzLzA2LzIwMjEgMTc6MzUsIEVyaWMgV291ZHN0cmEgd3JvdGU6Cj4+PiBJdCBpcyBv
bmx5IHVzZWZ1bCB0byBzZXQgMSBtYXAgd2l0aCB0aGUgcmVndWxhdGVkIHRlbXBlcmF0dXJlIGZv
cgo+Pj4gY3B1IGZyZXF1ZW5jeSB0aHJvdHRsaW5nLiBTYW1lIGFzIGluIHRoZSBrZXJuZWwgZG9j
dW1lbnQKPj4+IGV4YW1wbGUuCj4+PiAKPj4+IAo+Pj4gSXQgaGFzIG5vIHVzZSB0byBzZXQgZnJl
cXVlbmN5IHNjYWxpbmcgb24gMiBkaWZmZXJlbnQKPj4+IHRlbXBlcmF0dXJlIHRyaXAgcG9pbnRz
LCBhcyB0aGUgbG93ZXN0IG9uZSBtYWtlcyBzdXJlIHRoZSBoaWdoZXIKPj4+IG9uZShzKSBhcmUg
bmV2ZXIgcmVhY2hlZC4KPj4gCj4+IEkgbG9va2VkIG1vcmUgY2xvc2VseSB0aGUgRFQgYW5kIHRo
ZXJlIGlzIGEgbWlzdW5kZXJzdGFuZGluZyBvZgo+PiB0aGUgdGhlcm1hbCBmcmFtZXdvcmsgaW4g
dGhlIGRlZmluaXRpb24uCj4+IAo+PiBUaGVyZSBpcyBvbmUgdHJpcCBwb2ludCB3aXRoIHRoZSBw
YXNzaXZlIHR5cGUgYW5kIHRoZSBjcHUgY29vbGluZyAKPj4gZGV2aWNlLCBmb2xsb3dlZCBieSBh
IHNlY29uZCB0cmlwIHBvaW50IHdpdGggdGhlIGFjdGl2ZSB0eXBlICpidXQqCj4+IHRoZSBzYW1l
IGNwdSBjb29saW5nIGRldmljZS4gVGhhdCBpcyB3cm9uZy4KPj4gCj4+IEFuZCBmaW5hbGx5LCB0
aGVyZSBpcyB0aGUgaG90IHRyaXAgcG9pbnQgYXMgYSB0aGlyZCBtYXBwaW5nIGFuZAo+PiB0aGUg
c2FtZSBjb29saW5nIGRldmljZS4KPj4gCj4+IFRoZSBob3QgdHJpcCBwb2ludCBpcyBvbmx5IHRo
ZXJlIHRvIG5vdGlmeSB1c2Vyc3BhY2UgYW5kIGxldCBpdAo+PiB0YWtlIGFuIGltbWVkaWF0ZSBh
Y3Rpb24gdG8gcHJldmVudCBhbiBlbWVyZ2VuY3kgc2h1dGRvd24gd2hlbgo+PiByZWFjaGluZyB0
aGUgY3JpdGljYWwgdGVtcGVyYXR1cmUuCj4+IAo+Pj4gSXQgY2FuIGJlIGFwcGxpZWQgb25seSBh
dCAxIHRyaXAgcG9pbnQuIE11bHRpcGxlIHRyaXAgcG9pbnRzIGlzCj4+PiBvbmx5IHVzZWZ1bGx5
IGZvciBmYW4gY29udHJvbCB0byBtYWtlIHN1cmUgdGhlIGZhbiBpcyBub3QgdG9vIAo+Pj4gbm9p
c3kgd2hlbiBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGJlIG5vaXN5Lgo+Pj4gCj4+PiAKPj4+IFRo
ZSBDUFUgd2lsbCBhbG1vc3QgY29tZSB0byBhIGRlYWQgc3RvcCB3aGVuIGl0IHN0YXJ0cyB0byBw
YXNzCj4+PiB0aGUgbG93ZXN0IHRoZXJtYWwgbWFwIHdpdGggZnJlcXVlbmN5IHRocm90dGxpbmcu
Cj4+PiAKPj4+IFRoaXMgaXMgd2h5IGl0IGlzIGEgYnVnIGFuZCBuZWVkcyBhIGZpeCwgbm90IG9u
bHkgYWRqdXN0bWVudC4KPj4gCj4+IFllcywgeW91IGFyZSByaWdodC4gSXQgc2hvdWxkIGJlIHNv
bWV0aGluZyBsaWtlICh2ZXJiYXRpbSBjb3B5KToKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpIAo+PiBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kgaW5kZXgKPj4gODkwYTk0MmVjNjA4Li44OGM4MWQyNGY0
ZmYgMTAwNjQ0IC0tLQo+PiBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0
c2kgKysrCj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaSBAQCAt
MTM2LDI0ICsxMzYsMTggQEAKPj4gc2VjbW9uX3Jlc2VydmVkOiBzZWNtb25ANDMwMDAwMDAgewo+
PiAKPj4gdGhlcm1hbC16b25lcyB7IGNwdV90aGVybWFsOiBjcHUtdGhlcm1hbCB7IC0KPj4gcG9s
bGluZy1kZWxheS1wYXNzaXZlID0gPDEwMDA+OyArCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0g
PDI1MD47IAo+PiBwb2xsaW5nLWRlbGF5ID0gPDEwMDA+Owo+PiAKPj4gdGhlcm1hbC1zZW5zb3Jz
ID0gPCZ0aGVybWFsIDA+Owo+PiAKPj4gdHJpcHMgeyBjcHVfcGFzc2l2ZTogY3B1LXBhc3NpdmUg
eyAtCQkJCQl0ZW1wZXJhdHVyZSA9IDw0NzAwMD47ICsKPj4gdGVtcGVyYXR1cmUgPSA8NzcwMDA+
OyBoeXN0ZXJlc2lzID0gPDIwMDA+OyB0eXBlID0gInBhc3NpdmUiOyB9Owo+PiAKPj4gLQkJCQlj
cHVfYWN0aXZlOiBjcHUtYWN0aXZlIHsgLQkJCQkJdGVtcGVyYXR1cmUgPSA8NjcwMDA+OyAtCj4+
IGh5c3RlcmVzaXMgPSA8MjAwMD47IC0JCQkJCXR5cGUgPSAiYWN0aXZlIjsgLQkJCQl9OyAtIGNw
dV9ob3Q6Cj4+IGNwdS1ob3QgeyB0ZW1wZXJhdHVyZSA9IDw4NzAwMD47IGh5c3RlcmVzaXMgPSA8
MjAwMD47IEBAIC0xNzMsMTgKPj4gKzE2Nyw2IEBAIG1hcDAgeyBjb29saW5nLWRldmljZSA9IDwm
Y3B1MCBUSEVSTUFMX05PX0xJTUlUCj4+IFRIRVJNQUxfTk9fTElNSVQ+LCA8JmNwdTEgVEhFUk1B
TF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsgfTsgLSAKPj4gLQkJCQltYXAxIHsgLQkJCQkJ
dHJpcCA9IDwmY3B1X2FjdGl2ZT47IC0JCQkJCWNvb2xpbmctZGV2aWNlID0KPj4gPCZjcHUwIFRI
RVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sIC0JCQkJCQkJIDwmY3B1MQo+PiBUSEVS
TUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+OyAtCQkJCX07IC0gLQkJCQltYXAyIHsgLQo+
PiB0cmlwID0gPCZjcHVfaG90PjsgLQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1B
TF9OT19MSU1JVAo+PiBUSEVSTUFMX05PX0xJTUlUPiwgLQkJCQkJCQkgPCZjcHUxIFRIRVJNQUxf
Tk9fTElNSVQKPj4gVEhFUk1BTF9OT19MSU1JVD47IC0JCQkJfTsgfTsgfTsgfTsKPj4gCj4+IAo+
PiAtLSA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yCj4+IEFSTSBTb0NzCj4+IAo+PiBGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93
d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfCAKPj4gPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfCAKPj4gPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKPiAKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExp
bmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExp
bmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwK
PGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
