Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B0AC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 22:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB7264E00
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 22:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CB7264E00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AfmTwKKj4/KIqweaffP+Dcgr4X4dJ89wpi9h6HlROAo=; b=bnjZxSqHNr+G12q5e6NBAsjde
	cW584RYux3mRuUahejKP3/san6cyTCJiwtVXu4a7AFQuZUR6hotlBnSX8gKoT0P5ql0F17JVsd3bG
	TC3GhKraYVH++z5txU0RMxsAhziSxJLtKJvToT9PX36W2DFpVY+GW+17f/lQTA/fNfOQnRykq76fx
	tGBkMG30hEik/5fBLJSBPlBCUUgVMcTyasygorZTwvTo42qqMLC0i3YtdR4egrgNej0KrB6vwyJuS
	+vbXA+odlPi4rgkQ9icVWVZtrSH/Ia2bgwLvRvCANUip7uJBw9YqPbpPt4sm6zJEvCDVh8NsObyZF
	xLQoxvScg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEg3b-0003qr-Q3; Tue, 23 Feb 2021 22:21:27 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEg3X-0003pb-8B
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 22:21:24 +0000
Received: by mail-il1-x132.google.com with SMTP id g9so15655863ilc.3
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Feb 2021 14:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LEcALUw+Ty7WADH2Iskbz7Ee6By7axHCN5qWv+9W+/I=;
 b=E456ChIVK35vWmad5T2YGkGQ7KUKHuDky09HwMWP6Yz77TkwzKsi1qMLbHsqd3N+nm
 atwPSjj9pwAcAz3yoXPCWO2ADl63NiYWVshwYCRwAl60Cn1GCBrJB2dEstLEmKjbkntG
 Xc5ULLDqJpR5depbTcOc7zrpie7XgpFPny8boDXAdSqTSBH2KuATfy/EswPY4A4eMnrJ
 a98hLwgxnV4t4o3S3b0wxV/h+XbzTqSj6LDvl+kzb2pQCH+oS+ELRax67EqdBs9hxtvT
 aJDS6okh61l4d2SCFGB5nVo+YPkO/+JGrXrupbz0y/WuFZGOR9oHW+oyP72Xs7gLjsfu
 nzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LEcALUw+Ty7WADH2Iskbz7Ee6By7axHCN5qWv+9W+/I=;
 b=E79O20s9yVo5ZIG0EYgxRbJRIzM4U+7DZaf2Crm47QIh7NIL3HFkF6j/b4LzlOCBu2
 HPbU6yQY+CyyycBKya9LGeG55rHL67nhANfUqbNi3oUTPDde8eOfEc+N4OpYnO4xJEV1
 jGc07ND3lfWCgwXGw1nDYuJOrna7t2FbZgOrol5/z/OsDGyoOtuBvTBaqbBByB0wP2q8
 vGlqYvj+VUFKqzzbZ1ZH4A8+LGEt3QrzcitQksh7pF00bLIzVSjmjljId6QZTsyYKh6G
 g7yYYqIbCpnomIfP928+oyT+T5ulmhrWTNnyniN5Mr34vKeKdNC3fHk2uOT4yM9XbWee
 HDBA==
X-Gm-Message-State: AOAM530rAuLxx/fdadKEibEDfrYVyQzZAOP7zHk88fa+vUqmsCwh+rBn
 qtx3WbfuWkw9cHPo5kHSvFg+J5iq4eMi6DxECpyg6Q==
X-Google-Smtp-Source: ABdhPJyUOVtj2PH6HPYVpWLVirmeiv0o+zvzSum7huMb/iyMDSQ9gsCDt50uMhWJ331RVrYvlXGupc5df9J51GgQhhI=
X-Received: by 2002:a92:8711:: with SMTP id m17mr20891909ild.48.1614118881378; 
 Tue, 23 Feb 2021 14:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20201027160631.608503-1-fparent@baylibre.com>
 <20201030191714.GA4171611@bogus>
 <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
In-Reply-To: <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 23 Feb 2021 23:21:10 +0100
Message-ID: <CAOwMV_wWqCsVTmt-0DDeB-WHdQKiKqT63O6sX2nFM27t34Osug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_172123_305233_CE0FB4E1 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgpQaW5naW5nIHlvdSBpbiBjYXNlIHlvdSBkaWRuJ3Qgc2VlIEBDaHVuLUt1
YW5nIEh1J3MgcXVlc3Rpb24gZm9yIHlvdS4KClRoYW5rcywKQmVzdCByZWdhcmRzLApGYWJpZW4K
Ck9uIFN1biwgSmFuIDEwLCAyMDIxIGF0IDEyOjE4IEFNIENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpLCBNYXR0aGlhczoKPgo+IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIgzMeaXpSDpgLHlha0g5LiK5Y2IMzox
N+Wvq+mBk++8mgo+ID4KPiA+IE9uIFR1ZSwgMjcgT2N0IDIwMjAgMTc6MDY6MjkgKzAxMDAsIEZh
YmllbiBQYXJlbnQgd3JvdGU6Cj4gPiA+IEFkZCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIE1U
ODE2NyBTb0MuCj4KPiBFdmVuIHRob3VnaCB0aGUgdGl0bGUgbmVlZCB0byBjaGFuZ2UgdG8gJ210
ODE2NycsIHRoaXMgcGF0Y2ggbG9va3MKPiBnb29kIHRvIG1lLiBIb3cgZG8geW91IHRoaW5rIGFi
b3V0IHRoaXMgcGF0Y2g/IE9uZSBkcm0gcGF0Y2ggWzFdCj4gZGVwZW5kIG9uIHRoaXMgcGF0Y2gs
IGlmIHlvdSBsaWtlIHRoaXMgcGF0Y2gsIGNvdWxkIHlvdSBhcHBsaWVkIHRoaXMKPiBwYXRjaCBm
aXJzdD8KPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvcGF0Y2gvMjAyMDEwMjMxMzMxMzAuMTk0MTQwLTYtZnBhcmVudEBiYXlsaWJyZS5j
b20vCj4KPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnR4dCAg
ICAgICAgICB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+
Cj4gPgo+ID4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPgo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
