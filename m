Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8041CA90AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 08:10:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B2F206F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 08:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYMsRFxZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="I333cevq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B2F206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVrTVp1N5hAORWgvZOlFy8IVjid2F4sP0IojqpyyB8Y=; b=ZYMsRFxZyq14zk
	2eo3xS/gOKSOe+FeBUUSMwQ6g+TQNrqQi8ahvOGVeYjY5cgXJMaXCJ2kTAtn7ymArWjWanjvNsVT1
	jO7Q66vhWbjty4t+UHvsi0wlp+pp6b/Go8t16ONYSEnB+TdAW+fjZ6z4sPU62AFTAylamCb9TvEcj
	AaYhmWQsZXfMbjErb/QzXhGpFXCjPkPPSl13+pNFbPzivgAOzNtUUUVnOtC9ACyTnsXc1f1sEh5aR
	31teJAQQkjs1JcmrSnqcdxzBB2mY9VcCaIZkjgBwSOGSdm8eKun37uinMbv6bktQXkAX/4XYw/rXj
	lLgz3LCvU1d9LANUKXHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYmSx-0002Kz-VO; Wed, 13 May 2020 08:10:11 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYmSc-0000hh-Ch
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 08:09:52 +0000
Received: by mail-io1-xd41.google.com with SMTP id 79so7893238iou.2
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9UilNQk9S4BvXv27MvSXEo2VXDVsyD3FnEfjySXek3Q=;
 b=I333cevq/ZiYLBB2UEqQvcKtAGvuyLJZxdyLz+dw9rtzdUG3Rn5bsG6b+cpl7WJ7be
 gTKIH/JsA1vPwstSt1K87Da84h3nS6SdQlUWK+QTnSAYwi+CjJ/aL+J8zawKW++FhJMQ
 aAWwxITol5cIJWKXZHPmGp5Bv26XE5m8HS8GVMXZPkz9eAufEiFF137yzG71eVK31Y0h
 GRCKTv29IzTe96QDVL3EExYOvg7/+4BsAH4/rwxaCg0aboPZ4fdHNA+ZSezFo4H59XIF
 6YgL3Ztsxu7NdaF62XFuH+8rQKy6pIHash3BieKanuFtjzs07HWpQii/lNhRuYgekHNs
 jZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9UilNQk9S4BvXv27MvSXEo2VXDVsyD3FnEfjySXek3Q=;
 b=Hb8dTYa7y2JmPPvqhaDzqcQsV66yroBy/1bENxxnZ3fStASZxwzUh83ax2gLQPi69I
 LXdu33XeffAZXFzA4Q4NFTksfWNqXvE+dIQM/WNAVJyKOl5pAXT+thqS6vswDUODQZ+O
 k/BzArowMWOuo0rnV+G93G20JWZtRY1/3udPbna8tUiKdlxy65lAq2U+1Ycm89DrgAov
 gkpIezt+cKaH2nYlM0tLEdqLb5/JUL5W2Nd9DZrthcu0C4aLWE0Ahw+R6Mq/aN5Z2MG0
 vqxW9DBF6SBOZtLxJLGScYSAFx6+B6NLvDEs7+lXLFwPKT3C9amedbYVjsg4ud31HODA
 Kd3g==
X-Gm-Message-State: AGi0PuYBMADlr/EE9l0QraRIeOuL8rZABSmHpImuT64SojkePheFP3Zr
 uw8xTeIUfCiVOWO462Ll69YiY1H8ZYS9lCmQWY1seQ==
X-Google-Smtp-Source: APiQypLSKZpPbpZGWbIa6OCLB4vXnavWGW3O9jfduY7qGPjrWI211lZ+fRr7Evkrpn1Sok32KOFfgRA0O4qxfjO7Hmw=
X-Received: by 2002:a05:6602:2dd4:: with SMTP id
 l20mr1335649iow.13.1589357388989; 
 Wed, 13 May 2020 01:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-2-brgl@bgdev.pl>
 <20200513023855.GA23714@bogus>
In-Reply-To: <20200513023855.GA23714@bogus>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 May 2020 10:09:38 +0200
Message-ID: <CAMRc=MfScMKPMNeFAMA=6ObhFkU8T=8a+dVyiUyvGOXyBG8H=g@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: add a binding document for MediaTek
 PERICFG controller
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_010950_461532_E2B54FF8 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xZtyLiwgMTMgbWFqIDIwMjAgbyAwNDozOCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiBu
YXBpc2HFgihhKToKPgo+IE9uIFR1ZSwgTWF5IDA1LCAyMDIwIGF0IDA0OjAyOjIxUE0gKzAyMDAs
IEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4KPiA+IFRoaXMgYWRkcyBhIGJpbmRpbmcg
ZG9jdW1lbnQgZm9yIHRoZSBQRVJJQ0ZHIGNvbnRyb2xsZXIgcHJlc2VudCBvbgo+ID4gTWVkaWFU
ZWsgU29Dcy4gRm9yIG5vdyB0aGUgb25seSB2YXJpYW50IHN1cHBvcnRlZCBpcyAnbXQ4NTE2LXBl
cmljZmcnLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYXJtL21lZGlhdGVrL21lZGlh
dGVrLHBlcmljZmcueWFtbCAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxwZXJp
Y2ZnLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxwZXJpY2ZnLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHBlcmljZmcueWFtbAo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzRiMmE2MTcz
ZmZiCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHBlcmljZmcueWFtbAo+ID4gQEAgLTAsMCAr
MSwzNCBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0y
LUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6ICJodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWsscGVyaWNmZy55YW1sIyIKPiA+
ICskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Igo+ID4gKwo+ID4gK3RpdGxlOiBNZWRpYVRlayBQZXJpcGhlcmFsIENvbmZpZ3VyYXRpb24gQ29u
dHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4g
PiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBvbmVPZjoKPgo+IERvbid0IG5lZWQgb25lT2YuCj4K
PiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgLSBlbnVtOgo+ID4gKyAgICAgICAgICAt
IG1lZGlhdGVrLHBlcmljZmcKPgo+IFBFUklDRkcgaXMgZXhhY3RseSB0aGUgc2FtZSByZWdpc3Rl
ciBzZXQgYW5kIGZ1bmN0aW9ucyBvbiBhbGwgTWVkaWF0ZWsKPiBTb0NzPyBOZWVkcyB0byBiZSBt
b3JlIHNwZWNpZmljLgo+Cj4gPiArICAgICAgICAtIGNvbnN0OiBzeXNjb24KPiA+ICsKPiA+ICsg
IHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0g
Y29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBwZXJpY2ZnOiBw
ZXJpY2ZnQDEwMDAzMDUwIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
NTE2LXBlcmljZmciLCAic3lzY29uIjsKPiA+ICsgICAgICAgIHJlZyA9IDwwIDB4MTAwMDMwNTAg
MCAweDEwMDA+Owo+Cj4gRGVmYXVsdCBmb3IgZXhhbXBsZXMgaXMgMSBjZWxsIGZvciBhZGRyIGFu
ZCBzaXplLgo+Cj4gPiArICAgIH07Cj4gPiAtLQo+ID4gMi4yNS4wCj4gPgoKSGkgUm9iLAoKSSBz
b21laG93IG1pc3NlZCB0aGUgZmFjdCB0aGF0IHRoZXJlIGFscmVhZHkgaXMgYW4gb2xkLXN0eWxl
IHR4dApiaW5kaW5nIGRvY3VtZW50IGZvciBwZXJpY2ZnLiBJJ2xsIGZpcnN0IGNvbnZlcnQgaXQg
YW5kIHRoZW4gYWRkIHRoZQpuZXcgY29tcGF0aWJsZS4KCkJhcnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
