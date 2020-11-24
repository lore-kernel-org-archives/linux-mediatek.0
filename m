Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BACC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 07:34:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64CCA2085B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 07:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MBE9Oq6m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeip3wVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64CCA2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1HeuWR0sOWW47N9v4yWIRHoGdhUTo+GW+nO3PGPHhbM=; b=MBE9Oq6mz+d4t78GBls9U2pGd
	dQXL+eOpPM9H4nkoF2LSd49A+FMs+4Et5PrHhCjnaRY5Q7CVTGRYKVp15smUfz5rdvhY+A5O/p11l
	dzFUhF7nxRjmCqAZ43C/L6RRGk9maae17RBLvjBKVu8vlytBuWaaijq7JXERFNtXIxvqyyZByZQlC
	rM7qSDXqxjrsGGOxmBQmdCqvEMOPBdHg9Lde9FQYXBM47WepB766VJu3NUM6HWMpXSIOcvtuXPUNj
	P6DkHi3Oy8nK0TAGZ60tsb3bvdFOvv38R/tb4jfQFfrU4uoGgizF/AaL0FTgENq3VvrPmK8m4aD7z
	OUa3uhiLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khSpq-0004sV-Io; Tue, 24 Nov 2020 07:33:58 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khSpn-0004rp-Ar; Tue, 24 Nov 2020 07:33:56 +0000
Received: by mail-oi1-x244.google.com with SMTP id d9so22800000oib.3;
 Mon, 23 Nov 2020 23:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KKRM9jTf5nSJd59wAkauAXklVp5cT6v6o379KchKHvM=;
 b=jeip3wVPozHymCziewDWg3eWSaxaRVyXd+LKi1graaO9ONwLpqo5ecMwhEtGPw99V3
 IzS9HuNtTFQ+q5p9UsRp7rRUesDybSBLjvsVTROA1c73C0+nLxlShnCKznBEWyoMc1iI
 6plsKOQuQL9W/PGM7q7/4HpWIdEbYlHtyg65bnKgKUWClcXw4B9azE5ccn+ahfOJMqO3
 pSMlMEmxHgJdp/OzoCfduaFszVd9t5mqPPDKVPKoIOl9OqdiV/VHtEdQcfLTa2MuDsMH
 h9NWBsQ5BH5acg2gvhjoiEzxZ3C6TxRZMU0qU45UOdKwLzPek4zTOLJErrKS04EVB/H6
 ymUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KKRM9jTf5nSJd59wAkauAXklVp5cT6v6o379KchKHvM=;
 b=Su0OUr0Yj0omJQ6DwVHgsZ/ATpoeJAh4scM1CIE6DhrxqVzG9Oz8EHcLTMvEsKluOo
 6+8+qxWyX+571Zz9su64g0Gwzd5BChz9i+qY93kQeIDPlfLCqnnw+vS+cNTwpN0kwNh4
 1ZhjV/F/N7qI4NGOctwYeB+Q9LoAQJvmwPEVCKkLEWopAs9h6o3m0d6T+tBJhpAmEUWg
 iCnD1pKHd8pSG2k+ZQLE8rLj7U8RxG+mXyFqfjwn5sEA5J+J+F+aHPw2g/BZtzSRlC7P
 jOSejquFuQIS1/f5PrY8GXX8UjzGp9gNYXdQFzWx7J8ZXdUh3TXwGim0NFVMjOj0+yT7
 Vckg==
X-Gm-Message-State: AOAM532Erl9EUy0XzsVVHBw8V6eBD554w6cZinaDJUEHiH8Fc4WPPTwE
 C08+qCAPmytqfEH0DA605DKlFDZM4ebloyzajws=
X-Google-Smtp-Source: ABdhPJxa1iV5tDEv3/kW7lm9TC/hZGVpHgpwrvtGKtIBec0//BiHzGgBa4Zwe1/6Ash6iLnYIrY7mkFnhBJRdlOR4j4=
X-Received: by 2002:aca:c209:: with SMTP id s9mr1790607oif.55.1606203232139;
 Mon, 23 Nov 2020 23:33:52 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
 <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
In-Reply-To: <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 24 Nov 2020 15:33:42 +0800
Message-ID: <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_023355_421800_FBE77F11 
X-CRM114-Status: GOOD (  23.54  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0
MTHmnIgyNOaXpSDpgLHkuowg5LiK5Y2INDo1MuWvq+mBk++8mgo+Cj4gT24gMTEvMjMvMjAgNDow
MCBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pl
d3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0MTHmnIgyMOaXpSDpgLHkupQg5LiK5Y2INjoyNuWv
q+mBk++8mgo+ID4+Cj4gPj4gT24gMTEvMTkvMjAgMTA6NTcgUE0sIFBhdmVsIE1hY2hlayB3cm90
ZToKPiA+Pj4gT24gVGh1IDIwMjAtMTEtMTkgMjI6MDM6MTQsIEphY2VrIEFuYXN6ZXdza2kgd3Jv
dGU6Cj4gPj4+PiBIaSBQYXZlbCwgR2VuZSwKPiA+Pj4+Cj4gPj4+PiBPbiAxMS8xOC8yMCAxMDoz
NyBQTSwgUGF2ZWwgTWFjaGVrIHdyb3RlOgo+ID4+Pj4+IEhpIQo+ID4+Pj4+Cj4gPj4+Pj4+IEZy
b206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4+Pj4+Pgo+ID4+Pj4+PiBB
ZGQgTEVEX0NPTE9SX0lEX01PT05MSUdIVCBkZWZpbml0aW9ucwo+ID4+Pj4+Cj4gPj4+Pj4gV2h5
IGlzIG1vb25saWdodCBhIGNvbG9yPyBDYW1lcmEgZmxhc2hlcyBhcmUgdXN1YWxseSB3aGl0ZSwg
bm8/Cj4gPj4+Pj4KPiA+Pj4+PiBBdCBsZWFzdCBpdCBuZWVkcyBhIGNvbW1lbnQuLi4KPiA+Pj4+
Cj4gPj4+PiBUaGF0J3MgbXkgZmF1bHQsIEluIGZhY3QgSSBzaG91bGQgaGF2ZSBhc2tlZCBhYm91
dCBhZGRpbmcKPiA+Pj4+IExFRF9GVU5DVElPTl9NT09OTElHSFQsIGl0IHdhcyBldmlkZW50bHkg
dG9vIGxhdGUgZm9yIG1lIHRoYXQgZXZlbmluZy4uLgo+ID4+Pgo+ID4+PiBBaGEsIHRoYXQgbWFr
ZXMgbW9yZSBzZW5zZS4KPiA+Pj4KPiA+Pj4gQnV0IHBsZWFzZSBsZXQncyBjYWxsIGl0ICJ0b3Jj
aCIgaWYgd2UgZG8gdGhhdCwgYXMgdGhhdCBpcyBhbHJlYWR5Cj4gPj4+IHVzZWQgaW4ga2VybmVs
IHNvdXJjZXMuLi4gYW5kIHByb2JhYmx5IGluIHRoZSBpbnRlcmZhY2UsIHRvbzoKPiA+Pgo+ID4+
IEknZCBzYXkgdGhhdCB0b3JjaCBpcyBzb21ldGhpbmcgZGlmZmVyZW50IHRoYXQgbW9vbmxpZ2h0
LAo+ID4+IGJ1dCB3ZSB3b3VsZCBuZWVkIG1vcmUgaW5wdXQgZnJvbSBHZW5lIHRvIGxlYXJuIG1v
cmUgYWJvdXQKPiA+PiB0aGUgbmF0dXJlIG9mIGxpZ2h0IGVtaXR0ZWQgYnkgTUwgTEVEIG9uIGhp
cyBkZXZpY2UuCj4gPj4KPiA+PiBQbGVhc2Ugbm90ZSB0aGF0IHRvcmNoIGlzIHVzdWFsbHkgbWVh
bnQgYXMgdGhlIG90aGVyIG1vZGUgb2YKPiA+PiBmbGFzaCBMRUQgKHNvbWV0aW1lcyBpdCBpcyBj
YWxsZWQgIm1vdmllIG1vZGUiKSwgd2hpY2ggaXMgYWxyZWFkeQo+ID4+IGhhbmRsZWQgYnkgYnJp
Z2h0bmVzcyBmaWxlIG9mIExFRCBjbGFzcyBmbGFzaCBkZXZpY2UgKGkuZS4gaXRzIExFRCBjbGFz
cwo+ID4+IHN1YnNldCksIGFuZCB3aGljaCBhbHNvIG1hcHMgdG8gdjRsMi1mbGFzaCBUT1JDSCBt
b2RlLgo+ID4+Cj4gPgo+ID4gSXQncyB1c2VkIHRvIGZyb250IGNhbWVyYSBmaWxsIGxpZ2h0Lgo+
ID4gTW9yZSBicmlnaHRuZXNzIHRoYW4gc2NyZWVuIGJhY2tsaWdodCwgYW5kIG1vcmUgc29mdCBs
aWdodCB0aGFuIGZsYXNoLgo+ID4gSSB0aGluayBMRURfSURfQ09MT1JfV0hJVEUgaXMgb2theS4K
Pgo+IFNvIHdoeSBpbiB2NiB5b3UgYXNzaWduZWQgTEVEX0NPTE9SX0lEX0FNQkVSIHRvIGl0Pwo+
Cj4gUmVnYXJkbGVzcyBvZiB0aGF0LCBub3cgd2UncmUgdGFsa2luZyBhYm91dCBMRUQgZnVuY3Rp
b24gLSB5b3UgY2hvc2UKPiBMRURfRlVOQ1RJT05fSU5ESUNBVE9SIGZvciBpdCwgYnV0IGluZmVy
cmluZyBmcm9tIHlvdXIgYWJvdmUgZGVzY3JpcHRpb24KPiAtIGl0IGNlcnRhaW5seSBkb2Vzbid0
IGZpdCBoZXJlLgo+Cj4gQWxzbyByZWdpc3RlciBuYW1lcywgY29udGFpbmluZyBwYXJ0ICJNTCIg
aW5kaWNhdGUgdGhhdCB0aGlzIExFRCdzCj4gaW50ZW5kZWQgZnVuY3Rpb24gaXMgbW9vbmxpbmdo
dCwgd2hpY2ggeW91ciBkZXNjcmlwdGlvbiBzb21laG93Cj4gY29ycm9ib3JhdGVzLgo+Cj4gTW9v
bmxpZ2h0IExFRHMgYmVjb21lIHViaXF1aXRvdXMgbm93YWRheXMgc28gc29vbmVyIG9yIGxhdGVy
IHdlIHdpbGwKPiBuZWVkIHRvIGFkZCB0aGlzIGZ1bmN0aW9uIGFueXdheSBbMF0uCj4KPiBbMF0K
PiBodHRwczovL2xhbmRzY2FwZWxpZ2h0aW5nb2FrdmlsbGUuY29tL3doYXQtaXMtbW9vbi1saWdo
dGluZy1hbmQtd2h5LWRvZXMtaXQtcmVtYWluLXNvLXBvcHVsYXIvCj4KCldlIHVzZSB0ZXJtICJN
b29ubGlnaHQiIGFzIHJlZmVyZW5jZSBzYXlzCiJXaGVuIHlvdSBhcmUgdHJ5aW5nIHRvIGltaXRh
dGUgbW9vbmxpZ2h0IHlvdSBuZWVkIHRvIHVzZSBsb3cgdm9sdGFnZSwKc29mdGVyIGxpZ2h0aW5n
LiBZb3UgZG9u4oCZdCB3YW50IHNvbWV0aGluZyB0aGF04oCZcyB0b28gYnJpZ2h0Igp3aGljaCBp
cyBmb2N1cyBvbiBicmlnaHRuZXNzIGluc3RlYWQgb2YgY29sb3IuCgpTbyB3ZSBzdXJwb3NlIE1v
b25saWdodCBjYW4gYmUgd2hpdGUgb3IgYW1iZXIuCgpTaG91bGQgSSBhZGQgTEVEX0ZVTkNUSU9O
X01PT05MSUdIVCBhbmQgc2V0IExFRF9DT0xPUl9JRF9XSElURT8KCj4gLS0KPiBCZXN0IHJlZ2Fy
ZHMsCj4gSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
