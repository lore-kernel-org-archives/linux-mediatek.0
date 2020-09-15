Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDE5C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 08:42:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D8420771
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 08:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TD3YkqMa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saOqAbec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D8420771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YIccGBAFtDlK0nHAPJ5jfd4KUGpaVQS/iHq9NGuNaqs=; b=TD3YkqMaFJE8bm+DJhyR31FQZ
	ATbdSB5T/sc6DuNevRKpgSURioCSEx466lG5ZPNVSirm1xHFCAFr6EAkpqu+zuOveiz6Qz9xWfOTD
	bQj+xRpbyjXFi1zxAzVbQupk17Woy8UKor8+BDvCASgfPSY0AMm7xrpAeImVg2yEe7FT9OcatvYWm
	PmXOaq7UXv18sWqqe9rdEF1rGQ6pRl7aVEGokb8GwCwx08ABCDCPFXoxa7r/7NR0cr8vYkNP5p79u
	nVMJL2mfaQkrP6FWIqAMtYuHZSkYWI+kpNS3NB3bLRNNLtMDzpLO88I5Hjt2a75JjfE4qiPKhwvLq
	0VPOj5vYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI6XH-0001mH-KN; Tue, 15 Sep 2020 08:41:59 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI6XF-0001lW-Cp
 for linux-mediatek@lists.infradead.org; Tue, 15 Sep 2020 08:41:58 +0000
Received: by mail-wm1-x341.google.com with SMTP id b79so2542910wmb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2020 01:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mWxyaW6253KQoFu0UHMqhP8AMPbDHxMp498wfuHOKQs=;
 b=saOqAbectSltZwthpuw0WtmRLXNslq/6YA27xlyKH+Ylqo/uY6YiGQhcX5SylY598U
 /4pxJWKWaFw3E16XlejBDo9W7PkY7tFbRw18KcFD9PmJ3Xt4Zm7sS8CXDAddd9JRmQZu
 +KzPkW6YysKzbKlSB0tygqQY5IdFqBKsaYrZwCaNgqXMkAE43NqCWl6fKy3/GI2DwYBK
 otwIGXfzLFKdY6fNDul1WeGmGb+VXJWn+xfX+j8KU58hd9xe1uzWxBkxOissd7CRzYbz
 XETlbz4gt+x+Bncp6QksrENLbE/Ni2xAGMHPVdnKZPUI7JhPEDd9Tsx3viieTQ+mGDua
 B8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mWxyaW6253KQoFu0UHMqhP8AMPbDHxMp498wfuHOKQs=;
 b=j9PjJ/4VoLbJhGsrwtxG4FA6FEvt5SE6DFt5bDgQZUaudGoDVQpMVzkOQttq9mzm8N
 k0mzSEz1N1fA8U3E4fhg/8Cvz5Q/UCfClxvCnuIYeP4QRhlKSC+aj149r72sylciyHMP
 MA56kETYEpfBW+FfKW25+kMC8YqUIfNEZOtou3MRx7YqhoJepjGqPRUT9jRYUM2IKboT
 +y0vt/7gW29TBT18MgGHIM8J4pE1aXOow6tsQQ8qUXL+Jx60R/kRUytYVwrwcerZuFlK
 Kuqj3jLv/akpfIqtGKxEtZ1mablxHZpelV8PRZW3ip97xFZhVMK2XFNPPOTGE2bpmdso
 BFmQ==
X-Gm-Message-State: AOAM531JGVQocbQQUTJufdXl/6m+0Rwd5ME46eT5cMkjIBSjRjznLQhs
 V8lB4wDZdx9JSEkI6OQINLI=
X-Google-Smtp-Source: ABdhPJw7fbniVY5pujFTy+9h14GxGq4rfw+vU0pN0UCtS1Q/6Sb6mViWzSz+ImsOlxBwh6Dn15tWTw==
X-Received: by 2002:a7b:ca56:: with SMTP id m22mr3340434wml.12.1600159316177; 
 Tue, 15 Sep 2020 01:41:56 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id k8sm23349010wma.16.2020.09.15.01.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 01:41:55 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
To: David Woodhouse <dwmw2@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <14193442-3b41-29f2-4380-e2cbcc00e5d4@gmail.com>
Date: Tue, 15 Sep 2020 10:41:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_044157_498056_9245C44A 
X-CRM114-Status: GOOD (  26.90  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxNC8wOS8yMDIwIDE2OjEyLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gT24gTW9uLCAy
MDIwLTA5LTE0IGF0IDE2OjAxICswMjAwLCBMdWthcyBCdWx3YWhuIHdyb3RlOgo+Pj4+IEkgYW0g
bm90IHN1YnNjcmliZWQgdG8gbGludXgtbWVkaWF0ZWsuIFdoZW4gSSBzZW50IGFuIGVtYWlsIHRv
IHRoZSBsaXN0LAo+Pj4+IGl0IHNob3dlZCB1cCByZWFsbHkgc2Vjb25kcyBsYXRlciBpbiB0aGUg
bG9yZS5rZXJuZWwub3JnIG9mIHRoZQo+Pj4+IGxpbnV4LW1lZGlhdGVrIHB1YmxpYy1pbmJveCBy
ZXBvc2l0b3J5LiBTbywgZWl0aGVyIGl0IHdhcyBkZWxpdmVyZWQKPj4+PiBxdWlja2x5IGFzIGl0
IGlzIG5vdCBtb2RlcmF0ZWQgb3IgbXkgY2hlY2sgd2l0aCBsb3JlLmtlcm5lbC5vcmcgaXMgd3Jv
bmcsCj4+Pj4gZS5nLiwgbWFpbHMgc2hvdyB1cCBpbiB0aGUgbG9yZS5rZXJuZWwub3JnIGFyY2hp
dmUsIGV2ZW4gdGhleSB3ZXJlIG5vdAo+Pj4+IHlldCBwZXJtaXR0ZWQgb24gdGhlIGFjdHVhbCBs
aXN0Lgo+Pj4+Cj4+Pgo+Pj4gSSdtIHRoZSBtb2RlcmF0b3IgYW5kIEkgZ2V0IHJlcXVlc3RzIHRv
IG1vZGVyYXRlIGVtYWlscy4gSSBzdXBwb3NlIEkgYWRkZWQgeW91Cj4+PiB0byB0aGUgYWNjZXB0
ZWQgbGlzdCBiZWNhdXNlIG9mIGVhcmxpZXIgZW1haWxzIHlvdSBzZW5kLgo+Pj4KPj4KPj4gT2th
eSwgSSBzZWUuIEkgZGlkIHNlbmQgc29tZSBjbGVhbi11cCBwYXRjaCBpbiB0aGUgcGFzdCwgYnV0
IEkgY29tcGxldGVseQo+PiBmb3Jnb3QgdGhhdCwgYnV0IG15IG1haWxib3ggZGlkIG5vdCBmb3Jn
ZXQuIFNvLCBub3cgaXQgaXMgY2xlYXIgdG8gbWUgd2h5Cj4+IHRoYXQgbWFpbCBzaG93ZWQgdXAg
c28gcXVpY2tseS4KPj4KPj4gVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCj4gCj4gQUZBSUNU
IHRoZSBsaW51eC1tZWRpYXRlayBsaXN0IGlzbid0IGNvbmZpZ3VyZWQgdG8gYXV0b21hdGljYWxs
eQo+IG1vZGVyYXRlIG1lc3NhZ2VzIGZyb20gbm9uLXN1YnNjcmliZXJzLiBJdHMgZ2VuZXJpY19u
b25tZW1iZXJfYWN0aW9uCj4gc2V0dGluZyBpcyAnQWNjZXB0Jy4gVGhhdCBpcyB0aGUgZGVmYXVs
dCBzZXR0aW5nIGZvciBsaXN0cyBvbgo+IGluZnJhZGVhZC5vcmcgYW5kIEkgc3Ryb25nbHkgZW5j
b3VyYWdlIGxpc3QgbWFpbnRhaW5lcnMgdG8gbGVhdmUgaXQKPiB0aGF0IHdheS4KCk9rLCB0aGFu
a3MgZm9yIGNsYXJpZmljYXRpb24uIEkgbmV2ZXIgYm90aGVyZWQgdG9vIG11Y2ggd2l0aCBhbGwg
dGhlIApjb25maWd1cmF0aW9uIG9wdGlvbiBvZiB0aGUgbGlzdC4gOnwKCj4gCj4gTHVrYXMsIEkg
ZG9uJ3Qgc2VlIHlvdXIgYWRkcmVzcyBpbiB0aGUgYWxsb3dsaXN0IGVpdGhlci4KCkkgdHJpZWQg
dG8gZmluZCB0aGF0IGluIHRoZSB3ZWIgaW50ZXJmYWNlLCBidXQgd2Fzbid0IGFibGUgdG8gZmlu
ZCB0aGUgbGlzdC4KClJlZ2FyZHMsCk1hdHRoaWFzCgo+IAo+IFRoZXJlIGFyZSBvdGhlciByZWFz
b25zIHdoeSBzb21lIG1lc3NhZ2VzIGdldCBtaWdodCB0cmFwcGVkIGZvcgo+IG1vZGVyYXRpb24g
4oCUIHRoZSBtZXNzYWdlIHNpemUsIG51bWJlciBvZiByZWNpcGllbnRzLCBzcGFtIHNjb3JlLCBl
dGMuCj4gCj4gVGhlIG1lcmUgZmFjdCB0aGF0ICpzb21lKiBtZXNzYWdlcyBhcmUgbW9kZXJhdGVk
IGRvZXMgbm90IG1lYW4gdGhhdCB0aGUKPiBsaXN0IGlzICJtb2RlcmF0ZWQgZm9yIG5vbi1zdWJz
Y3JpYmVycyIgaW4gdGhlIHNlbnNlIHRoYXQgdGhlCj4gTUFJTlRBSU5FUlMgZmlsZSBsaXN0cy4K
PiAKPj4gQmpvcm4sIHdpdGggdGhhdCBjb25maXJtYXRpb24gYW5kIFJldmlld2VkLWJ5IGZyb20g
TWF0dGhpYXMsIGNvdWxkIHlvdQo+PiBwbGVhc2UgcGljayB0aGlzIHBhdGNoPwo+IAo+IEkgdGhp
bmsgd2Ugc2hvdWxkIGJlIGZpeGluZyB0aGUgb25lcyB0aGF0ICpkbyogc2F5IGl0J3MgbW9kZXJh
dGVkIGZvcgo+IG5vbi1zdWJzY3JpYmVycywgbm90IHRoZSBvbmUgdGhhdCBjb3JyZWN0bHkgZGlk
bid0IDopCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
