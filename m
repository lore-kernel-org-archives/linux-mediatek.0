Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B11EC07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:33:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD77761002
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD77761002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrBH3bX1ddG8Tlo5ubI9h3xxRjXa/UitpxphhOxNvCM=; b=RDsZh90KZ+RVPB
	YuQBz6OaH31kgQxN1Qm0BVVwsn8YkDwfZNc9FbAfN1r0YmbS9iu4XQve9xCDRNl+4llH5EOLlQmUt
	irsPVQqehZbOQG7/nsaBCGm9e8+EjFXUEnnXe9VJxgeZOQbQIExzzb/cV5H3B0sSBj61nDhSm0w4y
	Y+KAdz34haYWixpxQ4Wi9nkVKCc1NHifkTWltXL/EIpeEvcEhO7/CUciZsdNiy/L+mJVFh3eqbpZp
	HNH1+6cWJG3ziA4BSlq7pjl8bueqpFKn/icTUSvPocBdkCTOEsVTFYRxot/elt8YgA3oOJ+eBZ9uW
	vLUQU7YF0AJN1tULMEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2rNq-006ajm-IG; Mon, 12 Jul 2021 08:33:46 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2rNc-006aht-L8; Mon, 12 Jul 2021 08:33:34 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so18125926otl.3; 
 Mon, 12 Jul 2021 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SZxKyapcP95t3Qouqp7FF9LfmDjUWdzEBklTYWphkD4=;
 b=AqgwP0m7QXx6dnrcT1SEtsn//U14Fy1BMa8c18UQ1dFsB/vG4uCfbpCHLWWrF6raoC
 9+J7iqg++LqULNo1+GsN7Vpyamy1CZNzrAO5W9pJGpKWzA54QIZxkyGX4I3I2tzqnsIl
 Ob5Ja4V5ILkmJIq6GFYHXMdDElBRZWYDPoZ549jwR2UA5+xd0VwBPiNx99Xm8+x+wrAB
 Ckgv/8Ka/WiqFOLS2eMIMb9uIxwHXp78WhtQe6Zetr/v1Hyea1M0M8bzDvuYxhU2N7X9
 6QD0laCm4smuNktELur4Ei1Df5YGLOnOnicGRiV7/1A7adPhAV6bdi+TvtvY4OnGSIFE
 5eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SZxKyapcP95t3Qouqp7FF9LfmDjUWdzEBklTYWphkD4=;
 b=omRvkDbD1aK41MM0ySIxt6w0u9dAP6VMLRf21Yyh/b4/kaubU1XXs1bNWMJ3TmPZwu
 L2plA4ZDuywSo3oqOH/dvDWipM7TcorvPyC+72ugX1nSjKYivX5I2ErUN5UocPHzPmfA
 jpOBcrXPEPlL++uvnYcRIBGBuUA/2hH2INO/JBMcDWeEo1J8RDwt46BZsw2tN/Qdy08m
 kpczSW2mflVg210LaloYaxUtKXl7FAAKAg0kfb3v5S1E7UdbQlCGGq6lyOqGIoP+vvbs
 o12JdaYpRV16NTHw5odo7oNiGZLbmfXL3jvg5aEBEV1smqj5BOe8yPZZYZzps4/GpJYV
 +dIw==
X-Gm-Message-State: AOAM530bipcYPQTyOghhOYnx1W9WjDhducmsh0HHBKUJi6rxg9Pyu7aJ
 7gMQbMZwof0Vl4vZQ++1HLLaN/PE/yw9VULMBtI=
X-Google-Smtp-Source: ABdhPJyivpVPZ8cdSEoA3/WXmOk0cdeaWr9nSTp1nse+5dNXooOzccEZM5/E78bvn5OIBE8WXXCRvZClpvQy7pBbQH4=
X-Received: by 2002:a9d:7686:: with SMTP id j6mr39672095otl.232.1626078811219; 
 Mon, 12 Jul 2021 01:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
In-Reply-To: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 12 Jul 2021 16:33:19 +0800
Message-ID: <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
Subject: Re: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, shufan_lee@richtek.com, 
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_013332_741252_0D7ED867 
X-CRM114-Status: GOOD (  18.54  )
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

R2VuZSBDaGVuIDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0NeaciDI0
5pelIOmAseS4gCDkuIvljYgxMToyNOWvq+mBk++8mgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRk
IE1UNjM2MCBMRUQgc3VwcG9ydCBjb250YWlucyBkcml2ZXIgYW5kIGJpbmRpbmcgZG9jdW1lbnQK
Pgo+IEdlbmUgQ2hlbiAoMikKPiAgZHQtYmluZGluZ3M6IGxlZHM6IEFkZCBiaW5kaW5ncyBmb3Ig
TVQ2MzYwIExFRAo+ICBsZWRzOiBtdDYzNjA6IEFkZCBMRUQgZHJpdmVyIGZvciBNVDYzNjAKPgo+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1s
IHwgIDE1OSArKwo+ICBkcml2ZXJzL2xlZHMvZmxhc2gvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxMwo+ICBkcml2ZXJzL2xlZHMvZmxhc2gvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgMQo+ICBkcml2ZXJzL2xlZHMvZmxhc2gvbGVkcy1t
dDYzNjAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkxMCArKysrKysrKysrKysrKysrCj4g
IDQgZmlsZXMgY2hhbmdlZCwgMTA4MyBpbnNlcnRpb25zKCspCj4KPiBjaGFuZ2Vsb2dzIGJldHdl
ZW4gdjEgJiB2Mgo+ICAtIGFkZCBsZWQgZHJpdmVyIHdpdGggbWZkCj4KPiBjaGFuZ2Vsb2dzIGJl
dHdlZW4gdjIgJiB2Mwo+ICAtIGluZGVwZW5kZW50IGFkZCBsZWQgZHJpdmVyCj4gIC0gYWRkIGR0
LWJpbmRpbmcgZG9jdW1lbnQKPiAgLSByZWZhY3RvciBtYWNyb3MgZGVmaW5pdGlvbiBmb3IgZWFz
eSB0byBkZWJ1Zwo+ICAtIHBhcnNlIGRldmljZSB0cmVlIGJ5IGZ3bm9kZQo+ICAtIHVzZSBkZXZt
KmV4dCB0byByZWdpc3RlciBsZWQgY2xhc3MgZGV2aWNlCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4g
djMgJiB2NAo+ICAtIGZpeCBiaW5kaW5nIGRvY3VtZW50IGRlc2NyaXB0aW9uCj4gIC0gdXNlIEdF
Tk1BU0sgYW5kIGFkZCB1bml0IHBvc3RmaXggdG8gZGVmaW5pdGlvbgo+ICAtIGlzaW5rIHJlZ2lz
dGVyIGxlZCBjbGFzcyBkZXZpY2UKPgo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2NCAmIHY1Cj4gIC0g
Y2hhbmdlIHJnYiBpc2luayB0byBtdWx0aWNvbG9yIGNvbnRyb2wKPiAgLSBhZGQgYmluZGluZyBy
ZWZlcmVuY2UgdG8gbWZkIHlhbWwKPgo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2NSAmIHY2Cj4gIC0g
VXNlIERUIHRvIGRlY2lkZSBSR0IgTEVEIGlzIG11bHRpY29sb3IgZGV2aWNlIG9yIGluZGljYXRv
ciBkZXZpY2Ugb25seQo+Cj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY2ICYgdjcKPiAgLSBBZGQgYmlu
ZGluZyBtdWx0aWNvbG9yIGRldmljZSBzYW1wbGUgY29kZQo+ICAtIEFkZCBmbGFzaCBvcHMgbXV0
ZXggbG9jawo+ICAtIFJlbW92ZSBWNEwyIGluaXQgd2l0aCBpbmRpY2F0b3IgZGV2aWNlCj4KPiBj
aGFuZ2Vsb2dzIGJldHdlZW4gdjcgJiB2OAo+ICAtIEFkZCBtdXRleCBmb3IgbGVkIGZhdWx0IGdl
dCBvcHMKPiAgLSBGaXggZmxhc2ggYW5kIG11bHRpY29sb3Igbm8tb3BzIHJldHVybiAwCj4gIC0g
QWRkIExFRF9GVU5DVElPTl9NT09OTElHSFQKPgo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2OCAmIHY5
Cj4gIC0gcmV1c2UgYXBpIGluIGZsYXNoIGFuZCBtdWx0aWNvbG9yIGhlYWRlcgo+Cj4gY2hhbmdl
bG9ncyBiZXR3ZWVuIHY5ICYgdjEwCj4gIC0gYWRkIGNvbW1lbnQgZm9yIHJldXNlIHJlZ2lzdHJh
dGlvbiBmdW5jdGlvbnMgaW4gZmxhc2ggYW5kIG11bHRpY29sb3IKPgo+IGNoYW5nZWxvZ3MgYmV0
d2VlbiB2MTAgJiB2MTEKPiAgLSBtYXRjaCBkdC1iaW5kaW5nIHJlZyBwcm9wZXJ0eSBjb21tZW50
IHRvIHRoZSBmdW5jdGlvbmFsaXR5IG5hbWUKPiAgLSByZW1vdmUgZXhpc3QgcGF0Y2ggaW4gbGlu
dXgtbmV4dAo+ICAtIGRpY2lkZSBtdWx0aWNvbG9yIGNoYW5uZWwgYnkgY29sb3IgZGVmaW5pdGlp
b24KPgo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2MTEgJiB2MTIKPiAgLSBGaXggcHJpbnQgc2l6ZV90
IGJ5ICV6dQo+ICAtIEZpeCBkdC1iaW5kaW5nIG5hbWUgcmVndWxhciBleHBlcnNzaW9uCj4KPiBj
aGFuZ2Vsb2dzIGJldHdlZW4gdjEyICYgdjEzCj4gIC0gRml4IGtidWlsZCB0ZXN0IHJlYm90IGJ1
aWxkIGVycm9yCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjEzICYgdjE0Cj4gIC0gTW92ZSBkcml2
ZXIgdG8gZmxhc2ggZm9sZGVyCj4gIC0gUmVtb3ZlIExFRCBGVU5DVElPTiBNT09OTElHSFQKPiAg
LSBLZWVwIDgwIGNoYXIgcGVyIGxpbmUKPgo+CgpEZWFyIFJldmlld2VycywKClBsZWFzZSBsZXQg
bWUga25vdyBpZiBhbnkgdXBkYXRlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
