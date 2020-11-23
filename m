Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DB5C5519F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:00:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF15E20DD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ON2+qLdJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0bCyjkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF15E20DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0c7suhV5QeD8bdUDVdUyt4UHenFwwv0NlDg9P6ABtTg=; b=ON2+qLdJPKpygm+JQNDb/zI0u
	rhADxpCLVwFCuPRMewZXIpr7N6GHP5rlQoRjFatCT+eEF9g/Zjkb7lZzzhJ/FNhVslZQyBvHTdj2m
	a0jbzpY82dnGJn7tbNP78HDGBWh1OAu+ZdmG2tgcoaM8rTYiPBfjbjB0HTeI7ep92o3awgNOOKnJB
	4Zudjd29VUmcA3CHE5EGPXKZoWPLOVqp5u3pC4FcK31rTRIYmCz+Q4XjH032WFxdMIkL6koY/mVre
	ZFbymRemEnDlv9PsiZho+y0H4KqYeIT82Eh6F4ae/kHyJ4RVyWrq1ZFLOMWusTMjTDwyM5yBchCez
	rEC0IavXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh25d-0006Wz-Oi; Mon, 23 Nov 2020 03:00:29 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh25Z-0006WD-It; Mon, 23 Nov 2020 03:00:26 +0000
Received: by mail-ot1-x344.google.com with SMTP id n11so14617785ota.2;
 Sun, 22 Nov 2020 19:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X6ea8y+7o1VS2+hJJcwmIepII7pozzGa349DC5946o4=;
 b=O0bCyjkQ/bAlyYl/p3JN/CYCEM/L/vJ4GpfrG23A/z6KykNoJ0gli/NpFZQfNj+czP
 i0o0sQFjZ8RE/zL1dwgb1guZ56q5RD8nsTO0UvvMq751OO8OiGxqJGmY3SonCTQ5Lspn
 XYg6yJmsGkLWVLETDQprpFj4DNoJABK7ArAqKLW42zHl+xnpn/Bu7Jl4x/N17ilhzZwe
 +WJgrpCpIVAxxg+jOcLHmFvQ0OGa4ag0BSPCNfNWxztnDy2ZR3/vPrbEta1KIF+CuicY
 PhU93xVocYP8DlMNsSHS63hBpQhFIk79H4pGuTgLP9A/oooIGopj4i/hhUNDRA4Fq3V/
 WVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X6ea8y+7o1VS2+hJJcwmIepII7pozzGa349DC5946o4=;
 b=I6xtZk/OntN4WTpwWIWT2+uvBI8wv2ZN/A+WD//pgWy/qRLxO8O8ZluRPtjcLYcTLU
 /IbZpO0G6aA2+ODS/0FkO0mHUhw+ElIrelB0svvLY1nMvWiLe+Pa1BpBnnzp1PPLVNhn
 2244r8Pw0K9qSShLYvoHNObIhu1Jm45HnOrqGnfIsrgtphgHfPh1T4AkQqQ3cZ+/V0Uc
 LWU04qBLZ6qYAU2CdfPGsq7hQ2VyadnBIDevi0IWhOTa6LjPd0a3D5h6vBF+m6y6WT+w
 4OrMqNCkSiq44Y47zRfhb3b5fw1KfKIZLorRC8QzmY6P3XjSVUgJiQGR70FKNc5NSYVh
 Fsbg==
X-Gm-Message-State: AOAM5307mhAT5YGqKgrF6cQjmu7rfxyht0V2uUIjxMR7djJ12jhWmQdN
 I34lSno0Gu2o+YwLBiDO1t3urka/uCBnIAJ64Dw=
X-Google-Smtp-Source: ABdhPJxZjezUseMBEoGgj0Bb6+2zeayiCYTxLMkNBbkr2KfxEZ23lfObPxA14lZP64GdkYiIRfDnVIR4/Qm0SWsI+Vc=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr22787464otr.327.1606100418882; 
 Sun, 22 Nov 2020 19:00:18 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
In-Reply-To: <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 23 Nov 2020 11:00:09 +0800
Message-ID: <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_220025_732436_FBB8D9C0 
X-CRM114-Status: GOOD (  20.32  )
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
MTHmnIgyMOaXpSDpgLHkupQg5LiK5Y2INjoyNuWvq+mBk++8mgo+Cj4gT24gMTEvMTkvMjAgMTA6
NTcgUE0sIFBhdmVsIE1hY2hlayB3cm90ZToKPiA+IE9uIFRodSAyMDIwLTExLTE5IDIyOjAzOjE0
LCBKYWNlayBBbmFzemV3c2tpIHdyb3RlOgo+ID4+IEhpIFBhdmVsLCBHZW5lLAo+ID4+Cj4gPj4g
T24gMTEvMTgvMjAgMTA6MzcgUE0sIFBhdmVsIE1hY2hlayB3cm90ZToKPiA+Pj4gSGkhCj4gPj4+
Cj4gPj4+PiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Pj4+Cj4g
Pj4+PiBBZGQgTEVEX0NPTE9SX0lEX01PT05MSUdIVCBkZWZpbml0aW9ucwo+ID4+Pgo+ID4+PiBX
aHkgaXMgbW9vbmxpZ2h0IGEgY29sb3I/IENhbWVyYSBmbGFzaGVzIGFyZSB1c3VhbGx5IHdoaXRl
LCBubz8KPiA+Pj4KPiA+Pj4gQXQgbGVhc3QgaXQgbmVlZHMgYSBjb21tZW50Li4uCj4gPj4KPiA+
PiBUaGF0J3MgbXkgZmF1bHQsIEluIGZhY3QgSSBzaG91bGQgaGF2ZSBhc2tlZCBhYm91dCBhZGRp
bmcKPiA+PiBMRURfRlVOQ1RJT05fTU9PTkxJR0hULCBpdCB3YXMgZXZpZGVudGx5IHRvbyBsYXRl
IGZvciBtZSB0aGF0IGV2ZW5pbmcuLi4KPiA+Cj4gPiBBaGEsIHRoYXQgbWFrZXMgbW9yZSBzZW5z
ZS4KPiA+Cj4gPiBCdXQgcGxlYXNlIGxldCdzIGNhbGwgaXQgInRvcmNoIiBpZiB3ZSBkbyB0aGF0
LCBhcyB0aGF0IGlzIGFscmVhZHkKPiA+IHVzZWQgaW4ga2VybmVsIHNvdXJjZXMuLi4gYW5kIHBy
b2JhYmx5IGluIHRoZSBpbnRlcmZhY2UsIHRvbzoKPgo+IEknZCBzYXkgdGhhdCB0b3JjaCBpcyBz
b21ldGhpbmcgZGlmZmVyZW50IHRoYXQgbW9vbmxpZ2h0LAo+IGJ1dCB3ZSB3b3VsZCBuZWVkIG1v
cmUgaW5wdXQgZnJvbSBHZW5lIHRvIGxlYXJuIG1vcmUgYWJvdXQKPiB0aGUgbmF0dXJlIG9mIGxp
Z2h0IGVtaXR0ZWQgYnkgTUwgTEVEIG9uIGhpcyBkZXZpY2UuCj4KPiBQbGVhc2Ugbm90ZSB0aGF0
IHRvcmNoIGlzIHVzdWFsbHkgbWVhbnQgYXMgdGhlIG90aGVyIG1vZGUgb2YKPiBmbGFzaCBMRUQg
KHNvbWV0aW1lcyBpdCBpcyBjYWxsZWQgIm1vdmllIG1vZGUiKSwgd2hpY2ggaXMgYWxyZWFkeQo+
IGhhbmRsZWQgYnkgYnJpZ2h0bmVzcyBmaWxlIG9mIExFRCBjbGFzcyBmbGFzaCBkZXZpY2UgKGku
ZS4gaXRzIExFRCBjbGFzcwo+IHN1YnNldCksIGFuZCB3aGljaCBhbHNvIG1hcHMgdG8gdjRsMi1m
bGFzaCBUT1JDSCBtb2RlLgo+CgpJdCdzIHVzZWQgdG8gZnJvbnQgY2FtZXJhIGZpbGwgbGlnaHQu
Ck1vcmUgYnJpZ2h0bmVzcyB0aGFuIHNjcmVlbiBiYWNrbGlnaHQsIGFuZCBtb3JlIHNvZnQgbGln
aHQgdGhhbiBmbGFzaC4KSSB0aGluayBMRURfSURfQ09MT1JfV0hJVEUgaXMgb2theS4KCj4gPiAu
L2FyY2gvYXJtL21hY2gtcHhhL2V6eC5jOiAgICAgICAgICAgICAgICAgICAgICAubmFtZSA9ICJh
OTEwOjp0b3JjaCIsCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUGF2ZWwKPiA+Cj4KPiAtLQo+IEJl
c3QgcmVnYXJkcywKPiBKYWNlayBBbmFzemV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
