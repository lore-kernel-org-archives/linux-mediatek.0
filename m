Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B67C34026
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 09:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7CB206EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 09:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j8E/n6t2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gAXJuJ+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A7CB206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0nfbOE1JAoY3/MnkBrvUZqHwXpwy9RNRb+eYjaETCf8=; b=j8E/n6t2Z0iASzH1oBgidcBFv
	Qg4C3kS2YDVTgyvBmGvVDaRv2WK/byEvVnLe0HjBx6Tit6r6q2Qx/gSOgi/4HQ+r4f07hGQProb6W
	fs2JXAO481znHu6JCQlHUJ5YHwVM4i/DYuq6iEHvIXya9ai4XnaV/wejJ8hEBWDSdKwR44MY0aR4g
	7CIwjnBBJROIEea55j1WDSk2fSPdM/8it8jN4aQpn6/PdXGy1jpKilRaYtmVxrNande9wZjR5fMib
	56fEEBKhbaNKDFjWIMc2Iv9DR5n4+DofrDGZzPTVN+WF+nX3oIf1pUxQeZIVDr4wksR+hJrseKajX
	fAby7jxXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3zCL-0002wQ-Dq; Tue, 18 Feb 2020 09:29:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3zCI-0002vv-QE
 for linux-mediatek@lists.infradead.org; Tue, 18 Feb 2020 09:29:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id y11so22983087wrt.6
 for <linux-mediatek@lists.infradead.org>; Tue, 18 Feb 2020 01:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x2s9Vlm8Xs5SFKLJRgXyDkqsNds2RA2bN9hJWbCVdRM=;
 b=gAXJuJ+uw8vdRqvxDQ5IGA9/+4u2SieS59aen6xgMticqIjWF6jI7ZSQCy7l1P0Wir
 Fh+NSvhMTtYWt1S+7dyL7oZD1iPJlSfuPi2CDOGAm9SKQcTwWPh348RURitv4CZ/MWKL
 Mzeh3KZ2Rq1rGpk+N/RmL0IE0qFufOwsUo7qCLRLEN8zyB4kO0YcIC3LwH0VOkFaAGkT
 VrH1gf6Qp/I7uXsSJ6nmzsqJgdwxRsFw79p4FMYMU1FGZR7SmCf4NznFu75N/VUu5ESL
 UwGRsOrwH93wIaIxt60hygidHQPQO9cD+VflotRjpH/a4aLUeJyQwdhUY0qbv9tCYx0h
 m2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x2s9Vlm8Xs5SFKLJRgXyDkqsNds2RA2bN9hJWbCVdRM=;
 b=YysEZoZUG4f5weiegLcFT2qpYnLuEkNdPhpHJ2Z5fKX5sDqe28yLcFdjGWBNrLp3yr
 7vyTeyHGQXlHiLq+ozhltkj8jgXo4FOugRqyvWCOeCL2Yq6diYQP5iFmVL++Rj1YDskb
 fk0sv/ATsGh4eNVXyuhukXLlmTtHPvA9L+8ZChpx0l3XoCNFZ1EspFEhJ0InadMTCNXu
 JzzQSjR5Z5uEq1rimERAMhWuSAKTlUrxpeMYjT4R22DJsJosgqCs8i6cR/tRZZtOx/gF
 xZ0hAS/gkqr9ZIJa5ZT81BEkJm4bNPxk4+1aqj7EOSZSkbsksv6ZUIIadWpjMiM73R95
 YyZg==
X-Gm-Message-State: APjAAAW/bQkl+7Yoy6Xy28vusUQYwNMOWkcD/PX0kV2wzF+oziFC0O0O
 yBWf7LDkw6DOKBFoygacRBF+BA==
X-Google-Smtp-Source: APXvYqwX8ALABKiS1olnPwGRlGKw9pwwpknEwezan/AqLzPy5qaxx2VpgxtDGmNTBTDySCzR9fZ9jQ==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr29361219wrt.229.1582018181035; 
 Tue, 18 Feb 2020 01:29:41 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w11sm5103479wrt.35.2020.02.18.01.29.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:29:40 -0800 (PST)
Subject: Re: NVMEM usage consult for device information
To: =?UTF-8?B?TWFjIEx1ICjnm6flrZ/lvrcp?= <mac.lu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <06d083206a4f4f5981be9d2e628162f8@mtkmbs01n1.mediatek.inc>
 <11b42d7b-ff96-d377-5225-6f9fcd5c57b8@linaro.org>
 <57c79cb8f45449d3ba49609cdd4a0767@mtkmbs01n1.mediatek.inc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6db967dc-7776-a10e-21cd-ba47ff6f02c3@linaro.org>
Date: Tue, 18 Feb 2020 09:29:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <57c79cb8f45449d3ba49609cdd4a0767@mtkmbs01n1.mediatek.inc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_012942_884467_182983D8 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxOC8wMi8yMDIwIDA5OjI2LCBNYWMgTHUgKOebp+Wtn+W+tykgd3JvdGU6Cj4gSGkgU3Jp
bmk6Cj4+SXMgdGhpcyBkYXRhIHN0b3JlZCBpbiBhIG5vbiB2b2xhdGlsZSBtZW1vcnkgb24gdGhl
IFNvQz8KPj5pZiB5ZXMsIHRoZW4gd2Ugc2hvdWxkIGhhdmUgYSBwcm9wZXIgbnZtZW0gcHJvdmlk
ZXIgZHJpdmVyLgo+IAo+IFllcy4gVGhpcyBkYXRhIGlzIHN0b3JlZCBpbiBub24gdm9sYXRpbGUg
bWVtb3J5IG9uIHRoZSBTb0MuCkl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgIG52bWVtIGRyaXZlciBp
biB0aGF0IGNhc2UuIHdoaWNoIGNhbiB0aGVuIGJlIAp1c2VkIGJ5IERldmljZSBUcmVlIHRvIHJl
dHJpZXZlIHRoZSByZXF1aXJlZCBjb25maWd1cmF0aW9ucyBmcm9tIE5WTUVNLgoKLS1zcmluaQo+
IEl0IHdvdWxkIGJlIHJlYWQgYXQgYm9vdGxvYWRlciBhbmQgZGVsaXZlcmVkIHRvIGtlcm5lbCBi
eSBEVEIuCgo+IAo+IAo+IFRoYW5rcwo+IE1hYwo+IAo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gRnJvbTogU3Jpbml2YXMgS2FuZGFnYXRsYSBbbWFpbHRvOnNyaW5pdmFzLmthbmRhZ2F0
bGFAbGluYXJvLm9yZ10KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxOCwgMjAyMCA1OjE5IFBN
Cj4gVG86IE1hYyBMdSAo55un5a2f5b63KSA8bWFjLmx1QG1lZGlhdGVrLmNvbT47IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBDYzogQW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qikgPEFuZHJldy1DVC5DaGVuQG1lZGlhdGVr
LmNvbT4KPiBTdWJqZWN0OiBSZTogTlZNRU0gdXNhZ2UgY29uc3VsdCBmb3IgZGV2aWNlIGluZm9y
bWF0aW9uCj4gCj4gCj4gCj4gT24gMTgvMDIvMjAyMCAwNToxNiwgTWFjIEx1ICjnm6flrZ/lvrcp
IHdyb3RlOgo+PiBIZWxsbywKPj4gCj4+IE1lZGlhdGVrwqBjaGlwIGhhdmUgc29tZSBTT0MgY29u
ZmlndXJhdGlvbnMgYW5kIHNwZWNpZmljIGRhdGEgd2hpY2ggCj4+IHdvdWxkIGJlIGRlbGl2ZXJl
ZCB0byBrZXJuZWwgYnkgRFRCLgo+PiAKPiBJcyB0aGlzIGRhdGEgc3RvcmVkIGluIGEgbm9uIHZv
bGF0aWxlIG1lbW9yeSBvbiB0aGUgU29DPwo+IGlmIHllcywgdGhlbiB3ZSBzaG91bGQgaGF2ZSBh
IHByb3BlciBudm1lbSBwcm92aWRlciBkcml2ZXIuCj4gCj4gLS1zcmluaQo+IAo+PiBTbyB3ZSB3
YW50IHRvIGltcGxlbWVudCBhIG5ldyBOVk1FTSBkcml2ZXIgdG8gcmV0cmlldmUgdGhlc2UgZGF0
YSBmb3IgCj4+IHVzZSBieSB0aGUgTlZNRU0gRnJhbWV3b3JrLgo+PiAKPj4gRG8geW91IGFncmVl
IHdpdGggdGhlIHVzYWdlIGZvciBvdXIgYXBwbGljYXRpb24/Cj4+IAo+PiBUaGFua3MKPj4gCj4+
IE1hYwo+PiAKPj4gKioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
ICoqKioqKioqKioqKioqKioqKioqIFRoZSAKPj4gaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkKPj4gYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciAKPj4gb3RoZXJ3aXNlIGV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCAKPj4gdG8gYmUgY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIAo+PiBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRh
aW5pbmcgb3IgY29weWluZyBvZiB0aGlzIAo+PiBlLW1haWwgKGluY2x1ZGluZyBpdHMKPj4gYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSAKPj4gYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJl
Y2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgCj4+IGJlbGlldmUgdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgCj4+IHNlbmRlciBp
bW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBh
bGwgCj4+IGNvcGllcyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgCj4+IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQo+PiAKPiAKPiAqKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioKPiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkKPiBhdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQo+IGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUg
dW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZQo+IGNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LAo+IGRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgaXRzCj4gYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heQo+IGJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGll
dmUKPiB0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIKPiBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mCj4gdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QKPiBkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
