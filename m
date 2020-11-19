Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74436C5519F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 01:42:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EA9246CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 01:42:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pS3XhIhb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUrWnpYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EA9246CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DFkMDc86Qfs+LHBC7UVGl0e7BlaKpbvHZzlvmIB+CA4=; b=pS3XhIhbYXhBNgG//hUq3/Yk6
	2yVIcdRZ6PJpOxIKkHt8kODfvQNm2+LQFPxPD4wcZlInTbgA9TbH03YP2rt/L7OslbseWfY8SwGJL
	lMUFJ54n0Ej284OOzXvc93O5NGXlZyFVdRPtHGAGgFD5OgxFvpVXbzJhN4Df8ZgeuACxPHqNXH3T/
	Voqx9qifSuK2vydfas+R0MifKzwJ7X3tA9/rD8/L56yyQkr2ZSuyt0MItnk5CwEd7x9iSTlFTVtk1
	zS4rh3NSYzsuQVQLZFnGa9mJFA/gzAowgABJVxDoueaUAuxEMzIdPs6+g10iy6/MLaQAVNMn3fNI1
	O9Mu2NfOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfYxj-00030M-08; Thu, 19 Nov 2020 01:42:15 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfYxc-0002zj-E6; Thu, 19 Nov 2020 01:42:09 +0000
Received: by mail-oi1-x244.google.com with SMTP id l206so4532509oif.12;
 Wed, 18 Nov 2020 17:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HQMhIHZ3aTJpncUVkD+NpgyJTfrrQV9a2wnrUxBWV9s=;
 b=gUrWnpYDZ4A5KKTnCoPJSbWPJSyJy+F546b1TQlbdqzZBHg233kqSsKgr1MAXafS4O
 55IVWBFlXd6rf3VsECf9j8D44eCJusz9ebFtc5ZIlBdclyMR8E9G6Yiml+1vEnZjrnXr
 t8UY+sM8QdPG/9dQcLOzvZir0SsHsP7O5uDjCwJdCXbNGMmxPcQQueTeNg3p+gdesEE9
 bsPeiv5nW3JySuxTLMSo3nbEuLgVU5WkLueugE1hpM27U86Ykp8MifUApGIbfHDKVgDJ
 RrBlNHEypkcEDXCfTTSeHkFidGBRfGCfTgsR8blHT8awS1w9quvaiqJrJ8y3wFYD3Rin
 u+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HQMhIHZ3aTJpncUVkD+NpgyJTfrrQV9a2wnrUxBWV9s=;
 b=G/AhFCpg7sdaOz8HCmo7v0NhjON2hNtQUlfTAr7NSapaPhRhgTQRQkYuH+2Eob93Em
 erYPrlCFWS6QATatuURBe9XgGmzRdiAywv2ee0+Ae/9L2SsFd4uR620qfD+I442MImc/
 tzmyB2G3iV80i2UqSCRauPtLb/SJ2M1Zcq3FQaZIRGXFWJaNs3NtwqGnPiYa/W23EKkp
 hbnZ0MjvVgYcU6WAk5DJFfqMvIoOBlOifV4uV5fZ41Oq16FxEdBrXQKP1hrQ1IXhzSba
 Z35cVmRTpfEjZNS8XJZtLxohPiH9fuD3AVlIM2evcFVrDdJKky5CTSojFvdlU0jD50s2
 Dnxw==
X-Gm-Message-State: AOAM5316vOmaXkxlnePnsIg2WJc03fRpa/gJ3/k4BSPF+vJozXwWlokr
 2k2y62G9NJzt8qZcMWBLT71dQJtm/koYEv1U6yM=
X-Google-Smtp-Source: ABdhPJxzxoYxtimzxZnBxPsknERuKrnU1EzP84HpcWrI5a/64zVwJuhtc/ECCXaD5HbJcxwn1vS/comGOpipkLtbivs=
X-Received: by 2002:aca:ac96:: with SMTP id v144mr1311823oie.51.1605750120687; 
 Wed, 18 Nov 2020 17:42:00 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com>
 <20201118212502.GA1839537@bogus>
In-Reply-To: <20201118212502.GA1839537@bogus>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 19 Nov 2020 09:41:48 +0800
Message-ID: <CAE+NS34JXTtoHtapxLAHF35Ybxe=m41Sg4PEfQSpxzA1Hg091g@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: leds: Add bindings for MT6360 LED
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_204208_605972_FC766430 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMeaciDE55pelIOmAseWb
myDkuIrljYg1OjI15a+r6YGT77yaCj4KPiBPbiBXZWQsIDE4IE5vdiAyMDIwIDE4OjQ3OjQxICsw
ODAwLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNo
dGVrLmNvbT4KPiA+Cj4gPiBBZGQgYmluZGluZ3MgZG9jdW1lbnQgZm9yIExFRCBzdXBwb3J0IG9u
IE1UNjM2MCBQTUlDCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5A
cmljaHRlay5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xl
ZHMtbXQ2MzYwLnlhbWwgICAgICB8IDE2NCArKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbAo+ID4K
Pgo+Cj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2sn
IG9uIHlvdXIgcGF0Y2g6Cj4KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4gLi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1sOjU3OjI6IFt3
YXJuaW5nXSB3cm9uZyBpbmRlbnRhdGlvbjogZXhwZWN0ZWQgMiBidXQgZm91bmQgMSAoaW5kZW50
YXRpb24pCj4KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9iaGVy
cmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvbGVkcy1tdDYzNjAuZXhhbXBsZS5kdC55YW1sOiBsZWQtY29udHJvbGxlcjogbGVkQDM6Y29s
b3I6MDowOiAxMCBpcyBncmVhdGVyIHRoYW4gdGhlIG1heGltdW0gb2YgOQo+ICAgICAgICAgRnJv
bSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbAo+IC9idWlsZHMvcm9i
aGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2xlZHMvbGVkcy1tdDYzNjAuZXhhbXBsZS5kdC55YW1sOiBsZWQtY29udHJvbGxlcjogbGVkQDM6
Y29sb3I6MDowOiAxMCBpcyBncmVhdGVyIHRoYW4gdGhlIG1heGltdW0gb2YgOQo+ICAgICAgICAg
RnJvbSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbAo+Cj4KCkFDSywg
SSB3aWxsIGFkZCBkZXNjcmlwdGlvbiB0byB0aGlzIHBhdGNoIGJ5CuKAnHRoaXMgcGF0Y2ggZGVw
ZW5kcyBvbiBwYXRjaCBbUEFUQ0ggdjcgMy81XSBkdC1iaW5kaW5nczogbGVkczogY29tbW9uOgpJ
bmNyZWFzZSBMRURfQ09MT1JfSURfKiBtYXhpbXVtIHNpemUiCgo+IFNlZSBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzE0MDIxOTMKPgo+IFRoZSBiYXNlIGZvciB0aGUgcGF0Y2gg
aXMgZ2VuZXJhbGx5IHRoZSBsYXN0IHJjMS4gQW55IGRlcGVuZGVuY2llcwo+IHNob3VsZCBiZSBu
b3RlZC4KPgo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQg
ZGlkbid0IHNlZSB0aGUgYWJvdmUKPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50
JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bwo+IGRhdGU6Cj4KPiBwaXAzIGlu
c3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCj4KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
