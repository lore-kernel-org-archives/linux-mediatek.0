Return-Path: <SRS0=E2+4=AE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1E2C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 16:27:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A75F20780
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 16:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EvKCuc7M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="rNfsLC2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A75F20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qdID6p+VFj0AbJ9p8SjK7jcS0Y6fe1Hip/DtGx/DwnE=; b=EvKCuc7MzD4QtrYDtT+0EQEFs
	+ZtK7RLkrPF0KmAnjxFdGeVVZeeDtkjJQkJaQ8EHOekWpsszEHNmFj+pl01Q6mMYcEy6RIvvhudkj
	FF/rTxGsCNU5se5MJ6SYcrEeNVDDlAk+JV4yn/NqqA3/2GNPMY9nbeYfxKX02ms4Mu9IKg+4O+e5I
	tHvBLviUtTM0AEpB4wk52LUTJXrToWgEhM/iPs7OTHhDuYFn9hSBIY5O/tWkt5w4nMzYNl4wgpA68
	lUJ8etXrwsxvfGWJRN/J3lFVN81qgRbT5z6xsvlTgsBuBFJIVOWYvhZGMS23Y4FCfcne3VsPFegPM
	TAvJ6dbpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnllh-00013c-1g; Tue, 23 Jun 2020 16:27:29 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnllZ-00010J-3K
 for linux-mediatek@lists.infradead.org; Tue, 23 Jun 2020 16:27:22 +0000
Received: by mail-il1-x141.google.com with SMTP id x18so19971773ilp.1
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2020 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2HfYUl27ws6rzUdD3KtQEV+gfmF8af8Ah+cfE/GhpU0=;
 b=rNfsLC2jhNPskzrBCvMUiHmMQhtgQHZRNee+zxTRxsUSJ9sABsKMttIhODtAJEKc5Y
 ScZo4QlGKQZWPhsJ/n02X2L/URyh8JSsNhSmkT+OCYBiRLamvRZ7wCorHduH4pbUKmPC
 XgZGwZJ+VAIxJCX9rAlvnABk2Sv/XTe4g/vAiINxGvKjqaJ+msVJ4gQzyECvqGdXct7I
 GzYmJjf7Q0KbSU7qxIYlDOO+KRq/iZqe2yOmCpyN5uKCkmyTEUqY2Ler9C7PSVWe8JNP
 mEX2+5Ff4/qzcIN96B5xb5NyyEHc8oiHh8tuiDCAQQMVHvM04XX+j8WGQLMHSGs3O7HS
 2ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2HfYUl27ws6rzUdD3KtQEV+gfmF8af8Ah+cfE/GhpU0=;
 b=KbqbgimaGI55nXk6+lYe+Y4rCXnkwoUwoJC55dH5xOjCADkdqHf4X6Nu9ViyPRbJPR
 Z2h+dNOhoFiHjtVHhaiItWLkSLCY4o0XQTuGm1yPg0SL+MoUAy/1UFZwONFMvCN+sOHb
 zrk0Z933VKFiSVYP8HmDCf7kbPVhvCerl10QfpSIKuw+KkVu6IkUezVW3czvKuJXkFH0
 3G2LTfctmpbkuq6A6ILdgfOpkZ2EjIQqlU1/PAiHCJseE95ZwhfrCKjDLLaGcKMCyCKX
 pVZjuqz/746U+Bpatk6QpcCyegYJO1O7e1RzzXGPk7dCez5Z7068ojYWw1CVuFzYkx41
 9Pfw==
X-Gm-Message-State: AOAM532tM/x6v5IoSF2ZsqsNpLXK6yWd89ksXYJ5Hs69Mn6dk0VcfPcW
 lwY+0nYVPBQx3T/UJyRfZYooST1Yqz1YlqY7dsBX0w==
X-Google-Smtp-Source: ABdhPJxuRp1kY0Pjp+MMdWj5T/28lVrk2yLNcq6IbmjVHcQQMX5N/hsJ+Bg1RgVxEBhjOZebPX9QJrWrcsZrxc0i0U4=
X-Received: by 2002:a92:c509:: with SMTP id r9mr22887128ilg.189.1592929637036; 
 Tue, 23 Jun 2020 09:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-15-brgl@bgdev.pl>
 <20200622132921.GI1551@shell.armlinux.org.uk>
 <CAMRc=Me1r3Mzfg3-gTsGk4rEtvB=P9ESkn9q=c7z0Q=YQDsw2A@mail.gmail.com>
 <20200623094252.GS1551@shell.armlinux.org.uk>
 <CAMpxmJVP9db-4-AA4e1JkEfrajvJ4s0T6zo5+oFzpJHRBcuSsg@mail.gmail.com>
 <20200623095646.GT1551@shell.armlinux.org.uk>
In-Reply-To: <20200623095646.GT1551@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jun 2020 18:27:06 +0200
Message-ID: <CAMRc=MeKE12sXZycyGA7vmjNai0JfDhRX+XDTp3r3YtrmLQj3A@mail.gmail.com>
Subject: Re: [PATCH 14/15] net: phy: add PHY regulator support
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

d3QuLCAyMyBjemUgMjAyMCBvIDExOjU2IFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbgo8
bGludXhAYXJtbGludXgub3JnLnVrPiBuYXBpc2HFgihhKToKPgo+IE9uIFR1ZSwgSnVuIDIzLCAy
MDIwIGF0IDExOjQ2OjE1QU0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiB3
dC4sIDIzIGN6ZSAyMDIwIG8gMTE6NDMgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluCj4g
PiA8bGludXhAYXJtbGludXgub3JnLnVrPiBuYXBpc2HFgihhKToKPiA+ID4KPiA+ID4gT24gVHVl
LCBKdW4gMjMsIDIwMjAgYXQgMTE6NDE6MTFBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToKPiA+ID4gPiBwb24uLCAyMiBjemUgMjAyMCBvIDE1OjI5IFJ1c3NlbGwgS2luZyAtIEFS
TSBMaW51eCBhZG1pbgo+ID4gPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IG5hcGlzYcWCKGEp
Ogo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFtzbmlwIV0KPiA+ID4gPgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoaXMgaXMgbGlrZWx5IHRvIGNhdXNlIGlzc3VlcyBmb3Igc29tZSBQSFkgZHJpdmVy
cy4gIE5vdGUgdGhhdCB3ZSBoYXZlCj4gPiA+ID4gPiBzb21lIFBIWSBkcml2ZXJzIHdoaWNoIHJl
Z2lzdGVyIGEgdGVtcGVyYXR1cmUgc2Vuc29yIGluIHRoZSBwcm9iZQo+ID4gPiA+ID4gZnVuY3Rp
b24sIHdoaWNoIG1lYW5zIHRoZXkgY2FuIGJlIGFjY2Vzc2VkIGluZGVwZW5kZW50bHkgb2YgdGhl
IGxpZmV0aW1lCj4gPiA+ID4gPiBvZiB0aGUgUEhZIGJvdW5kIHRvIHRoZSBuZXR3b3JrIGRyaXZl
ciAod2hpY2ggbWF5IG9ubHkgYmUgd2hpbGUgdGhlCj4gPiA+ID4gPiBuZXR3b3JrIGRldmljZSBp
cyAidXAiLikgIFdlIGNlcnRhaW5seSBkbyBub3Qgd2FudCBod21vbiBmYWlsaW5nIGp1c3QKPiA+
ID4gPiA+IGJlY2F1c2UgdGhlIG5ldHdvcmsgZGV2aWNlIGlzIGRvd24uCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhhdCdzIGtpbmQgb2Ygd29ya2VkIGFyb3VuZCBmb3IgdGhlIHJlc2V0IHN0dWZmLCBi
ZWNhdXNlIHRoZXJlIGFyZSB0d28KPiA+ID4gPiA+IGxheWVycyB0byB0aGF0OiB0aGUgbWRpbyBk
ZXZpY2UgbGF5ZXIgcmVzZXQgc3VwcG9ydCB3aGljaCBrbm93cyBub3RoaW5nCj4gPiA+ID4gPiBv
ZiB0aGUgUEhZIGJpbmRpbmcgc3RhdGUgdG8gdGhlIG5ldHdvcmsgZHJpdmVyLCBhbmQgdGhlIHBo
eWxpYiByZXNldAo+ID4gPiA+ID4gc3VwcG9ydCwgYnV0IGl0IGlzIG5vdCBuaWNlLgo+ID4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+IFJlZ3VsYXRvcnMgYXJlIHJlZmVyZW5jZSBjb3VudGVkIHNvIGlm
IHRoZSBod21vbiBkcml2ZXIgZW5hYmxlcyBpdAo+ID4gPiA+IHVzaW5nIG1kaW9fZGV2aWNlX3Bv
d2VyX29uKCkgaXQgd2lsbCBzdGF5IG9uIGV2ZW4gYWZ0ZXIgdGhlIFBIWSBkcml2ZXIKPiA+ID4g
PiBjYWxscyBwaHlfZGV2aWNlX3Bvd2VyX29mZigpLCByaWdodD8gQW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8KPiA+ID4KPiA+ID4gSWYgdGhhdCBpcyB0cnVlLCB5b3Ugd2lsbCBuZWVkIHRvIGF1ZGl0
IHRoZSBQSFkgZHJpdmVycyB0byBhZGQgdGhhdC4KPiA+ID4KPiA+Cj4gPiBUaGlzIGNoYW5nZSBk
b2Vzbid0IGhhdmUgYW55IGVmZmVjdCBvbiBkZXZpY2VzIHdoaWNoIGRvbid0IGhhdmUgYQo+ID4g
cmVndWxhdG9yIGFzc2lnbmVkIGluIERUIHRob3VnaC4gVGhlIG9uZSBJJ20gYWRkaW5nIGluIHRo
ZSBsYXN0IHBhdGNoCj4gPiBpcyB0aGUgZmlyc3QgdG8gdXNlIHRoaXMuCj4KPiBJdCdzIHF1YWxp
dHkgb2YgaW1wbGVtZW50YXRpb24uCj4KPiBTaG91bGQgd2Ugd2FpdCBmb3Igc29tZW9uZSBlbHNl
IHRvIG1ha2UgdXNlIG9mIHRoZSBuZXcgcmVndWxhdG9yCj4gc3VwcG9ydCB0aGF0IGhhcyBiZWVu
IGFkZGVkIHdpdGggYSBQSFkgdGhhdCB1c2VzIGh3bW9uLCBhbmQgdGhleQo+IGRvbid0IHJlYWxp
c2UgdGhhdCBpdCBicmVha3MgaHdtb24gb24gaXQsIGFuZCBzZXZlcmFsIGtlcm5lbCB2ZXJzaW9u
cwo+IGdvIGJ5IHdpdGhvdXQgaXQgYmVpbmcgbm90aWNlZC4gIEl0IHdpbGwgb25seSBiZSBhIG5v
dGljYWJsZSBpc3N1ZQo+IHdoZW4gdGhlIGFzc29jaWF0ZWQgbmV0d29yayBkZXZpY2UgaXMgZG93
biwgYW5kIHRoYXQgbmV0d29yayBkZXZpY2UKPiBkcml2ZXIgZGV0YWNoZXMgZnJvbSB0aGUgUEhZ
LCBzbyBfaXNfIGxpa2VseSBub3QgdG8gYmUgbm90aWNlZC4KPgo+IE9yIHNob3VsZCB3ZSBkbyBh
IHNtYWxsIGFtb3VudCBvZiB3b3JrIG5vdyB0byBwcm9wZXJseSBpbXBsZW1lbnQKPiByZWd1bGF0
b3Igc3VwcG9ydCwgd2hpY2ggaW5jbHVkZXMgYSB0cml2aWFsIGdyZXAgZm9yICJod21vbiIgYW1v
bmdzdAo+IHRoZSBQSFkgZHJpdmVycywgYW5kIGFkZCB0aGUgbmVjZXNzYXJ5IGNhbGwgdG8gYXZv
aWQgdGhlIHJlZ3VsYXRvcgo+IGJlaW5nIHNodXQgb2ZmLgo+CgpJJ20gbm90IHN1cmUgd2hhdCB0
aGUgY29ycmVjdCBhcHByb2FjaCBpcyBoZXJlLiBQcm92aWRlIHNvbWUgaGVscGVyCnRoYXQsIHdo
ZW4gY2FsbGVkLCB3b3VsZCBpbmNyZWFzZSB0aGUgcmVndWxhdG9yJ3MgcmVmZXJlbmNlIGNvdW50
IGV2ZW4KbW9yZSB0byBrZWVwIGl0IGVuYWJsZWQgZnJvbSB0aGUgbW9tZW50IGh3bW9uIGlzIHJl
Z2lzdGVyZWQgdG8gd2hlbgp0aGUgZHJpdmVyIGlzIGRldGFjaGVkPwoKQmFydAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
