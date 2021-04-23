Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F3C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 14:11:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A55B613C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 14:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A55B613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzLZO6hv3L+Xt6rY16L++8pN9ndD8E2DyOTdaxFRZYw=; b=NE2kPzJL1juBF6a5C6RenSw4A
	f6l8eitzdvdhYm3XZhrY/5F1+/1NlpzoE1qhr0a32bYRMXq5zO04Eu3HswdJh6ThfhFhxlkKIwgNI
	eq9vg1Xen3+OpgkkS8hn+4dwZzFLBHX8xBXNudDexClKFegXGvWBuK2jCaA7pq0tWlBP9Y8lr7y0v
	bkYYCRRoNwInvOTRPiLP0aA79T0gwjBdBlybzIj7YZWpDANkVoqH+YQh+CsYjBbdmNzz2FUdJo1Uh
	NzesquRfWvAni9fgYZadFiwv8DETdJ4P97Omt7fqytVRCTHg5JBxohGyFGxSLDXhwGC7MNi317k53
	MikR2Pwew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZwWY-001fIZ-Ar; Fri, 23 Apr 2021 14:11:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwWG-001fHe-Jj; Fri, 23 Apr 2021 14:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=qak1guLsFaVMEg76NWs9738tomTF2Dz1lxZ3efNAG0U=; b=gRu22uEmmHZcGJbjmDig88wcf2
 0LCM3pfrQdasq3tII1Rzzvxk7j/N9Fnrz0ISyKxnui/lHq6nMF2F41zDo6ovJdqmCPYl0vSgoPyO1
 IL3XHhIVYT0dCIz8oWLWoNJfEhq55zImKp7zrUD0WugVlAbjemrreqBWFvGVX9GlN0CR5DfhE6g+/
 tYqWIEUEWI/evI9WMLbYO+4x5woOKlbkB6nv601KqKy7cVvKR6sWXkHkrcpJRF8CIlpv3NjsaBSzy
 Z9GYcdaPrBHaaARKujGLTfbavsw7dhinP5+VRD0UpIuIZQ/2JgKbUGzDt/+7PJG6Hyp52/CXc/rSy
 b8ewqlpw==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwWD-00ESea-Hr; Fri, 23 Apr 2021 14:10:55 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 e89-20020a9d01e20000b0290294134181aeso19594305ote.5; 
 Fri, 23 Apr 2021 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=qak1guLsFaVMEg76NWs9738tomTF2Dz1lxZ3efNAG0U=;
 b=jS9/Z3CCoeecneKXeYcJbiT0ZSETuulNxBA2Rks2IKP0nYOr+IJk/acLov7r0lRWiY
 XptUVazd19lCfjGWxOKlOwYv5H/G7GCg/0bSxU3mX43YOM4N1uVvQYSn0xm7+g1sP+8A
 xt3hyaBl4Ymb1qelw5VA44anr6Btfwdfp35/pSy7mbcq+LSdaJSP5+p1lU32MFVXbRUc
 AUdAfiHADCHTjHbZVkZ8lMqwd9XtqRPJXe/IWnGj40ELcKM1dcWEjtTX+3VzvG7CDR3l
 oeRa/4wm0eHSR3SagsNkZ1O/6eeO48Uj+uIVPrrt3lWpAd/MZbAVK0nWNfKY4OrW5GbI
 2YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=qak1guLsFaVMEg76NWs9738tomTF2Dz1lxZ3efNAG0U=;
 b=WseSTmE233SpbJMtqErpRCJ04m2Dp3AThBqPnROuXjWQEdcesIWIubRimLq/LEes26
 js4CjOOAo/82iAAQIHaEnaR5a//ULayptMRTs8OHT9wCNnXq50ncjQTFiJHayhqGT6UA
 oEK6514qNwwpsMPh2coBxvsmyrLA5Nw4YQCDoDKPDSaFjaahlGSKuwVPE5/Eogmt51P2
 ZJY7UatewS4ZUUwC2sAT6u1sdXRqSEElsW7VZw3au8dU0vf2FQmfX+C4GD/JEccJe9uq
 rq+TxVRXVEC4Jen3rzyvjuIjc8d3EQOC6gzm3k8e8jezJ4QXUKlsJ0AUu6zEUQYiSsdh
 gzbQ==
X-Gm-Message-State: AOAM530GP+nkKP3HlRL76PNrVqRGFUaJeaS7/t6MPUDKOv22kNC1zJfb
 bCkyT8cv2iwXgW4/e/QQC7M=
X-Google-Smtp-Source: ABdhPJzSVkLH9+HgtRnqrxQZiXB8Wq3cxnjPCT8u2XksDMM50cM6xpu4hbW3pFN1lfgpHrF1XnUuxw==
X-Received: by 2002:a9d:6842:: with SMTP id c2mr3690276oto.139.1619187051462; 
 Fri, 23 Apr 2021 07:10:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v81sm1275222oie.13.2021.04.23.07.10.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 07:10:50 -0700 (PDT)
Date: Fri, 23 Apr 2021 07:10:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH V7 1/2] watchdog: mtk: support pre-timeout when the
 bark irq is available
Message-ID: <20210423141048.GA135134@roeck-us.net>
References: <3acb9bb1-763b-5af7-de3c-d7d8d3f5b2f7@roeck-us.net>
 <AGAAwgADDgCvfda5u2TY64qq.3.1619161944242.Hmail.wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AGAAwgADDgCvfda5u2TY64qq.3.1619161944242.Hmail.wangqing@vivo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_071053_640936_CD0A84A9 
X-CRM114-Status: GOOD (  45.66  )
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

T24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDM6MTI6MjRQTSArMDgwMCwg546L5pOOIHdyb3RlOgo+
IAo+ID5PbiA0LzIyLzIxIDg6NDggUE0sIOeOi+aTjiB3cm90ZToKPiA+PiAKPiA+Pj4gT24gNC8y
Mi8yMSA3OjUzIFBNLCBXYW5nIFFpbmcgd3JvdGU6Cj4gPj4+PiBVc2UgdGhlIGJhcmsgaW50ZXJy
dXB0IGFzIHRoZSBwcmV0aW1lb3V0IG5vdGlmaWVyIGlmIGF2YWlsYWJsZS4KPiA+Pj4+Cj4gPj4+
PiBXaGVuIHRoZSB3YXRjaGRvZyB0aW1lciBleHBpcmVzIGluIGR1YWwgbW9kZSwgYW4gaW50ZXJy
dXB0IHdpbGwgYmUKPiA+Pj4+IHRyaWdnZXJlZCBmaXJzdCwgdGhlbiB0aGUgdGltaW5nIHJlc3Rh
cnRzLiBUaGUgcmVzZXQgc2lnbmFsIHdpbGwgYmUKPiA+Pj4+IGluaXRpYXRlZCB3aGVuIHRoZSB0
aW1lciBleHBpcmVzIGFnYWluLgo+ID4+Pj4KPiA+Pj4+IFRoZSBwcmV0aW1lb3V0IG5vdGlmaWNh
dGlvbiBzaGFsbCBvY2N1ciBhdCB0aW1lb3V0LXNlYy8yLgo+ID4+Pj4KPiA+Pj4+IFYyOgo+ID4+
Pj4gLSBwYW5pYygpIGJ5IGRlZmF1bHQgaWYgV0FUQ0hET0dfUFJFVElNRU9VVF9HT1YgaXMgbm90
IGVuYWJsZWQuCj4gPj4+Pgo+ID4+Pj4gVjM6Cj4gPj4+PiAtIE1vZGlmeSB0aGUgcHJldGltZW91
dCBiZWhhdmlvciwgbWFudWFsbHkgcmVzZXQgYWZ0ZXIgdGhlIHByZXRpbWVvdXQKPiA+Pj4+IC0g
aXMgcHJvY2Vzc2VkIGFuZCB3YWl0IHVudGlsIHRpbWVvdXQuCj4gPj4+Pgo+ID4+Pj4gVjQ6Cj4g
Pj4+PiAtIFJlbW92ZSBwcmV0aW1lb3V0IHJlbGF0ZWQgcHJvY2Vzc2luZy4gCj4gPj4+PiAtIEFk
ZCBkdWFsIG1vZGUgY29udHJvbCBzZXBhcmF0ZWx5Lgo+ID4+Pj4KPiA+Pj4+IFY1Ogo+ID4+Pj4g
LSBGaXggc29tZSBmb3JtYXR0aW5nIGFuZCBwcmludGluZyBwcm9ibGVtcy4KPiA+Pj4+Cj4gPj4+
PiBWNjoKPiA+Pj4+IC0gUmVhbGl6ZSBwcmV0aW1lb3V0IHByb2Nlc3NpbmcgdGhyb3VnaCBkdWFs
bW9kZS4KPiA+Pj4+Cj4gPj4+PiBWNzoKPiA+Pj4+IC0gQWRkIHNldF9wcmV0aW1lb3V0KCkuCj4g
Pj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT4K
PiA+Pj4+IC0tLQo+ID4+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIHwgNzYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ID4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cv
bXRrX3dkdC5jCj4gPj4+PiBpbmRleCA5N2NhOTkzLi5hYjNhYzVkCj4gPj4+PiAtLS0gYS9kcml2
ZXJzL3dhdGNoZG9nL210a193ZHQuYwo+ID4+Pj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9tdGtf
d2R0LmMKPiA+Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4gPj4+PiAgI2luY2x1ZGUgPGxpbnV4L3Jl
c2V0LWNvbnRyb2xsZXIuaD4KPiA+Pj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+Pj4+
ICAjaW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4KPiA+Pj4+ICsjaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+Cj4gPj4+PiAgCj4gPj4+PiAgI2RlZmluZSBXRFRfTUFYX1RJTUVPVVQJCTMxCj4g
Pj4+PiAgI2RlZmluZSBXRFRfTUlOX1RJTUVPVVQJCTEKPiA+Pj4+IEBAIC0xODQsMTUgKzE4NSwy
MyBAQCBzdGF0aWMgaW50IG10a193ZHRfc2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2Rldmlj
ZSAqd2R0X2RldiwKPiA+Pj4+ICB7Cj4gPj4+PiAgCXN0cnVjdCBtdGtfd2R0X2RldiAqbXRrX3dk
dCA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkdF9kZXYpOwo+ID4+Pj4gIAl2b2lkIF9faW9tZW0g
KndkdF9iYXNlID0gbXRrX3dkdC0+d2R0X2Jhc2U7Cj4gPj4+PiArCXVuc2lnbmVkIGludCB0aW1l
b3V0X2ludGVydmFsID0gdGltZW91dDsKPiA+Pj4+ICAJdTMyIHJlZzsKPiA+Pj4+ICAKPiA+Pj4+
ICAJd2R0X2Rldi0+dGltZW91dCA9IHRpbWVvdXQ7Cj4gPj4+PiAtCj4gPj4+PiArCS8qCj4gPj4+
PiArCSAqIEluIGR1YWwgbW9kZSwgaXJxIHdpbGwgYmUgdHJpZ2dlcmVkIGF0IHRpbWVvdXQgLyAy
Cj4gPj4+PiArCSAqIHRoZSByZWFsIHRpbWVvdXQgb2NjdXJzIGF0IHRpbWVvdXQKPiA+Pj4+ICsJ
ICovCj4gPj4+PiArCWlmICh3ZHRfZGV2LT5wcmV0aW1lb3V0KSB7Cj4gPj4+PiArCQl3ZHRfZGV2
LT5wcmV0aW1lb3V0ID0gdGltZW91dCAvIDI7Cj4gPj4+Cj4gPj4+IG1pbl90aW1lb3V0IGlzIHNl
dCB0byAxLiBJIGRvbid0IHRoaXMgd29ya3Mgd2VsbCBpZiB0aW1lb3V0ID09IDEuCj4gPj4+IFlv
dSdsbCBlaXRoZXIgbmVlZCB0byBzZXQgbWluX3RpbWVvdXQgdG8gMiwgb3IgaGFuZGxlIHRoYXQg
Y2FzZS4KPiA+PiAKPiA+PiBJdCBpcyBhcHByb3ByaWF0ZSB0byBjaGFuZ2UgbWluX3RpbWVvdXQg
IHRvIDIuCj4gPj4gCj4gPj4+Cj4gPj4+PiArCQl0aW1lb3V0X2ludGVydmFsID0gd2R0X2Rldi0+
cHJldGltZW91dDsKPiA+Pj4KPiA+Pj4gdGltZW91dF9pbnRlcnZhbCBpcyB1bm5lY2Vzc2FyeS4g
SnVzdCB1cGRhdGUgdGltZW91dCBhY2NvcmRpbmdseS4KPiA+Pj4gSXQgbmVlZHMgdG8gdGFrZSB0
aGUgc2l0dWF0aW9uIG9mIHRpbWVvdXQgPT0gMSBpbnRvIGFjY291bnQsIHRob3VnaC4KPiAKPiBJ
IHBsYW4gdG8gcmVtb3ZlIHRpbWVvdXRfaW50ZXJ2YWwgYW5kIGRpcmVjdGx5IHVzZSAodGltZW91
dC1wcmV0aW1lb3V0KQo+IHVwZGF0ZSB0aW1lb3V0Lgo+IAo+ID4+IAo+ID4+IHRpbWVvdXQgcmVw
cmVzZW50cyB0aGUgcmVzZXQgdGltZS4gV2hlbiB0aGUgdXNlciBjYWxscyB0aW1lb3V0X3Nob3cs
IAo+ID4+IEhlIGhvcGVzIHRvIGdldCB0aGUgY29uZmlndXJlZCB0aW1lb3V0LCBub3QgdGhlIHZh
bHVlIGNoYW5nZWQKPiA+PiBieSBwcmUtdGltZW91dC4KPiA+PiBJIG1vZGlmeSBpdCBsaWtlIHRo
aXMgbW9yZSBpbiBsaW5lIHdpdGggdGhlIG9yaWdpbmFsIGludGVudGlvbi4KPiA+PiAKPiA+Pj4K
PiA+Pj4+ICsJfQo+ID4+Pj4gIAkvKgo+ID4+Pj4gIAkgKiBPbmUgYml0IGlzIHRoZSB2YWx1ZSBv
ZiA1MTIgdGlja3MKPiA+Pj4+ICAJICogVGhlIGNsb2NrIGhhcyAzMiBLSHoKPiA+Pj4+ICAJICov
Cj4gPj4+PiAtCXJlZyA9IFdEVF9MRU5HVEhfVElNRU9VVCh0aW1lb3V0IDw8IDYpIHwgV0RUX0xF
TkdUSF9LRVk7Cj4gPj4+PiArCXJlZyA9IFdEVF9MRU5HVEhfVElNRU9VVCh0aW1lb3V0X2ludGVy
dmFsIDw8IDYpIHwgV0RUX0xFTkdUSF9LRVk7Cj4gPj4+PiAgCWlvd3JpdGUzMihyZWcsIHdkdF9i
YXNlICsgV0RUX0xFTkdUSCk7Cj4gPj4+PiAgCj4gPj4+PiAgCW10a193ZHRfcGluZyh3ZHRfZGV2
KTsKPiA+Pj4+IEBAIC0yMzksMTMgKzI0OCw0NiBAQCBzdGF0aWMgaW50IG10a193ZHRfc3RhcnQo
c3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldikKPiA+Pj4+ICAJCXJldHVybiByZXQ7Cj4g
Pj4+PiAgCj4gPj4+PiAgCXJlZyA9IGlvcmVhZDMyKHdkdF9iYXNlICsgV0RUX01PREUpOwo+ID4+
Pj4gLQlyZWcgJj0gfihXRFRfTU9ERV9JUlFfRU4gfCBXRFRfTU9ERV9EVUFMX0VOKTsKPiA+Pj4+
ICsJaWYgKHdkdF9kZXYtPnByZXRpbWVvdXQpCj4gPj4+PiArCQlyZWcgfD0gKFdEVF9NT0RFX0lS
UV9FTiB8IFdEVF9NT0RFX0RVQUxfRU4pOwo+ID4+Pj4gKwllbHNlCj4gPj4+PiArCQlyZWcgJj0g
fihXRFRfTU9ERV9JUlFfRU4gfCBXRFRfTU9ERV9EVUFMX0VOKTsKPiA+Pj4+ICAJcmVnIHw9IChX
RFRfTU9ERV9FTiB8IFdEVF9NT0RFX0tFWSk7Cj4gPj4+PiAgCWlvd3JpdGUzMihyZWcsIHdkdF9i
YXNlICsgV0RUX01PREUpOwo+ID4+Pj4gIAo+ID4+Pj4gIAlyZXR1cm4gMDsKPiA+Pj4+ICB9Cj4g
Pj4+PiAgCj4gPj4+PiArc3RhdGljIGludCBtdGtfd2R0X3NldF9wcmV0aW1lb3V0KHN0cnVjdCB3
YXRjaGRvZ19kZXZpY2UgKndkZCwKPiA+Pj4+ICsJCQkJCXVuc2lnbmVkIGludCB0aW1lb3V0KQo+
ID4+Pj4gK3sKPiA+Pj4+ICsJc3RydWN0IG10a193ZHRfZGV2ICptdGtfd2R0ID0gd2F0Y2hkb2df
Z2V0X2RydmRhdGEod2RkKTsKPiA+Pj4+ICsJdm9pZCBfX2lvbWVtICp3ZHRfYmFzZSA9IG10a193
ZHQtPndkdF9iYXNlOwo+ID4+Pj4gKwl1MzIgcmVnID0gaW9yZWFkMzIod2R0X2Jhc2UgKyBXRFRf
TU9ERSk7Cj4gPj4+PiArCj4gPj4+PiArCWlmICh0aW1lb3V0ICYmICF3ZGQtPnByZXRpbWVvdXQp
IHsKPiA+Pj4+ICsJCXdkZC0+cHJldGltZW91dCA9IHdkZC0+dGltZW91dCAvIDI7Cj4gPj4+PiAr
CQlyZWcgfD0gKFdEVF9NT0RFX0lSUV9FTiB8IFdEVF9NT0RFX0RVQUxfRU4pOwo+ID4+Pj4gKwl9
IGVsc2UgaWYgKCF0aW1lb3V0ICYmIHdkZC0+cHJldGltZW91dCkgewo+ID4+Pj4gKwkJd2RkLT5w
cmV0aW1lb3V0ID0gMDsKPiA+Pj4+ICsJCXJlZyAmPSB+KFdEVF9NT0RFX0lSUV9FTiB8IFdEVF9N
T0RFX0RVQUxfRU4pOwo+ID4+Pj4gKwl9IGVsc2UKPiA+Pj4+ICsJCXJldHVybiAwOwoKUGxlYXNl
IHJ1biB5b3VyIHBhdGNoIHRocm91Z2ggY2hlY2twYXRjaDsgdGhlIGFib3ZlIHJlc3VsdHMKaW4g
YSBub3RlIGFib3V0IGEgbWlzc2luZyB7IH0uCgo+ID4+Pj4gKwo+ID4+Pj4gKwlpb3dyaXRlMzIo
cmVnLCB3ZHRfYmFzZSArIFdEVF9NT0RFKTsKPiA+Pj4KPiA+Pj4gV2hhdCBpcyB0aGUgcG9pbnQg
b2Ygc2V0dGluZyB0aGUgbW9kZSBoZXJlID8gSXQgd2lsbAo+ID4+PiBiZSBzZXQgYWdhaW4gaW4g
bXRrX3dkdF9zZXRfdGltZW91dCgpLiBTZWVtcyB0byBtZSBhbGwKPiA+Pj4geW91IG5lZWQgdG8g
ZG8gaGVyZSBpcyB0byBzZXQgd2RkLT5wcmV0aW1lb3V0LAo+ID4+PiB0aGVuIGNhbGwgbXRrX3dk
dF9zZXRfdGltZW91dCgpLgo+ID4+IAo+ID4+IG10a193ZHRfc2V0X3RpbWVvdXQoKSBvbmx5IHNl
dCB0aW1lb3V0IGFuZCBwaW5nKCkuCj4gPj4gSGVyZSBhbHNvIG5lZWQgdG8gY29uZmlnIHRvIHRo
ZSBkdWFsbW9kZSBvciBub3QuCj4gPj4gCj4gPkFoLCB5b3UgYXJlIGNvcnJlY3QuIFNvcnJ5LCBJ
IGNvbmZ1c2VkIHRoaXMgd2l0aCB0aGUgc3RhcnQgZnVuY3Rpb24uCj4gPlRoYXQgbWFrZXMgbWUg
d29uZGVyIGlmIGl0IHdvdWxkIGJlIGJldHRlciB0byBleHRyYWN0IGEgc2VwYXJhdGUKPiA+ZnVu
Y3Rpb24sIG10a193ZHRfc2V0X21vZGUoKSwgZm9yIHRoYXQgcHVycG9zZS4gVGhvdWdodHMgPwo+
IAo+IEkgaGF2ZSBkb25lIHRoaXMsIGJ1dCBJIGZvdW5kIHRoZXJlIGlzIG5vIGdvb2QgYWJzdHJh
Y3QgbWV0aG9kLCAKPiBiZWNhdXNlIHdkdCBtb2RlIGlzIHVzZWQgaW4gY29tYmluYXRpb24sIGZv
ciBleGFtcGxl77yaCj4gV0RUX01PREVfRU4gaXMgaW5jbHVkZWQgaW4gc3RhcnQoKSwgYW5kIGhl
cmUgaXMgbm90Lgo+IEFuZCB0aGUganVkZ21lbnQgb2YgcHJldGltZW91dCBoZXJlIGlzIGFsc28g
ZGlmZmVyZW50Lgo+IApPaywgbWFrZXMgc2Vuc2UuIEFub3RoZXIgbWlub3IgY29tbWVudCBhYm92
ZSwgdGhvdWdoLgoKVGhhbmtzLApHdWVudGVyCgo+IFRoYW5rcywKPiBRaW5nCj4gCj4gPgo+ID5U
aGFua3MsCj4gPkd1ZW50ZXIKPiA+Cj4gPj4gVGhhbmtzLAo+ID4+IFFpbmcKPiA+Pj4KPiA+Pj4g
R3VlbnRlcgo+ID4+Pgo+ID4+Pj4gKwo+ID4+Pj4gKwlyZXR1cm4gbXRrX3dkdF9zZXRfdGltZW91
dCh3ZGQsIHdkZC0+dGltZW91dCk7Cj4gPj4+PiArfQo+ID4+Pj4gKwo+ID4+Pj4gK3N0YXRpYyBp
cnFyZXR1cm5fdCBtdGtfd2R0X2lzcihpbnQgaXJxLCB2b2lkICphcmcpCj4gPj4+PiArewo+ID4+
Pj4gKwlzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQgPSBhcmc7Cj4gPj4+PiArCj4gPj4+PiAr
CXdhdGNoZG9nX25vdGlmeV9wcmV0aW1lb3V0KHdkZCk7Cj4gPj4+PiArCj4gPj4+PiArCXJldHVy
biBJUlFfSEFORExFRDsKPiA+Pj4+ICt9Cj4gPj4+PiArCj4gPj4+PiAgc3RhdGljIGNvbnN0IHN0
cnVjdCB3YXRjaGRvZ19pbmZvIG10a193ZHRfaW5mbyA9IHsKPiA+Pj4+ICAJLmlkZW50aXR5CT0g
RFJWX05BTUUsCj4gPj4+PiAgCS5vcHRpb25zCT0gV0RJT0ZfU0VUVElNRU9VVCB8Cj4gPj4+PiBA
QCAtMjUzLDEyICsyOTUsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB3YXRjaGRvZ19pbmZvIG10
a193ZHRfaW5mbyA9IHsKPiA+Pj4+ICAJCQkgIFdESU9GX01BR0lDQ0xPU0UsCj4gPj4+PiAgfTsK
PiA+Pj4+ICAKPiA+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHdhdGNoZG9nX2luZm8gbXRrX3dk
dF9wdF9pbmZvID0gewo+ID4+Pj4gKwkuaWRlbnRpdHkJPSBEUlZfTkFNRSwKPiA+Pj4+ICsJLm9w
dGlvbnMJPSBXRElPRl9TRVRUSU1FT1VUIHwKPiA+Pj4+ICsJCQkgIFdESU9GX1BSRVRJTUVPVVQg
fAo+ID4+Pj4gKwkJCSAgV0RJT0ZfS0VFUEFMSVZFUElORyB8Cj4gPj4+PiArCQkJICBXRElPRl9N
QUdJQ0NMT1NFLAo+ID4+Pj4gK307Cj4gPj4+PiArCj4gPj4+PiAgc3RhdGljIGNvbnN0IHN0cnVj
dCB3YXRjaGRvZ19vcHMgbXRrX3dkdF9vcHMgPSB7Cj4gPj4+PiAgCS5vd25lcgkJPSBUSElTX01P
RFVMRSwKPiA+Pj4+ICAJLnN0YXJ0CQk9IG10a193ZHRfc3RhcnQsCj4gPj4+PiAgCS5zdG9wCQk9
IG10a193ZHRfc3RvcCwKPiA+Pj4+ICAJLnBpbmcJCT0gbXRrX3dkdF9waW5nLAo+ID4+Pj4gIAku
c2V0X3RpbWVvdXQJPSBtdGtfd2R0X3NldF90aW1lb3V0LAo+ID4+Pj4gKwkuc2V0X3ByZXRpbWVv
dXQJPSBtdGtfd2R0X3NldF9wcmV0aW1lb3V0LAo+ID4+Pj4gIAkucmVzdGFydAk9IG10a193ZHRf
cmVzdGFydCwKPiA+Pj4+ICB9Owo+ID4+Pj4gIAo+ID4+Pj4gQEAgLTI2Nyw3ICszMTgsNyBAQCBz
dGF0aWMgaW50IG10a193ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+
Pj4+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+Pj4+ICAJc3RydWN0IG10
a193ZHRfZGV2ICptdGtfd2R0Owo+ID4+Pj4gIAljb25zdCBzdHJ1Y3QgbXRrX3dkdF9kYXRhICp3
ZHRfZGF0YTsKPiA+Pj4+IC0JaW50IGVycjsKPiA+Pj4+ICsJaW50IGVyciwgaXJxOwo+ID4+Pj4g
IAo+ID4+Pj4gIAltdGtfd2R0ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptdGtfd2R0KSwg
R0ZQX0tFUk5FTCk7Cj4gPj4+PiAgCWlmICghbXRrX3dkdCkKPiA+Pj4+IEBAIC0yNzksNyArMzMw
LDIyIEBAIHN0YXRpYyBpbnQgbXRrX3dkdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4+Pj4gIAlpZiAoSVNfRVJSKG10a193ZHQtPndkdF9iYXNlKSkKPiA+Pj4+ICAJCXJl
dHVybiBQVFJfRVJSKG10a193ZHQtPndkdF9iYXNlKTsKPiA+Pj4+ICAKPiA+Pj4+IC0JbXRrX3dk
dC0+d2R0X2Rldi5pbmZvID0gJm10a193ZHRfaW5mbzsKPiA+Pj4+ICsJaXJxID0gcGxhdGZvcm1f
Z2V0X2lycShwZGV2LCAwKTsKPiA+Pj4+ICsJaWYgKGlycSA+IDApIHsKPiA+Pj4+ICsJCWVyciA9
IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgaXJxLCBtdGtfd2R0X2lzciwgMCwgIndkdF9i
YXJrIiwKPiA+Pj4+ICsJCQkJCSZtdGtfd2R0LT53ZHRfZGV2KTsKPiA+Pj4+ICsJCWlmIChlcnIp
Cj4gPj4+PiArCQkJcmV0dXJuIGVycjsKPiA+Pj4+ICsKPiA+Pj4+ICsJCW10a193ZHQtPndkdF9k
ZXYuaW5mbyA9ICZtdGtfd2R0X3B0X2luZm87Cj4gPj4+PiArCQltdGtfd2R0LT53ZHRfZGV2LnBy
ZXRpbWVvdXQgPSBXRFRfTUFYX1RJTUVPVVQgLyAyOwo+ID4+Pj4gKwl9IGVsc2Ugewo+ID4+Pj4g
KwkJaWYgKGlycSA9PSAtRVBST0JFX0RFRkVSKQo+ID4+Pj4gKwkJCXJldHVybiAtRVBST0JFX0RF
RkVSOwo+ID4+Pj4gKwo+ID4+Pj4gKwkJbXRrX3dkdC0+d2R0X2Rldi5pbmZvID0gJm10a193ZHRf
aW5mbzsKPiA+Pj4+ICsJfQo+ID4+Pj4gKwo+ID4+Pj4gIAltdGtfd2R0LT53ZHRfZGV2Lm9wcyA9
ICZtdGtfd2R0X29wczsKPiA+Pj4+ICAJbXRrX3dkdC0+d2R0X2Rldi50aW1lb3V0ID0gV0RUX01B
WF9USU1FT1VUOwo+ID4+Pj4gIAltdGtfd2R0LT53ZHRfZGV2Lm1heF9od19oZWFydGJlYXRfbXMg
PSBXRFRfTUFYX1RJTUVPVVQgKiAxMDAwOwo+ID4+Pj4KPiA+Pj4KPiA+PiAKPiA+PiAKPiA+Cj4g
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
