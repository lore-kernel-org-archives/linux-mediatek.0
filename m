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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B591C5519F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 02:20:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB12241A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 02:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wGwO5dao";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6kewgR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FB12241A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CeOhX6UxNYIoSPqTS8Ee9gHVzGo9sSFV/o5t13knf00=; b=wGwO5daodLBTMeIYOGclFBvPZ
	0ZE9th513G+C+59zwkk+BNekbzT9gsu7Lce8gqgPjtDUUBFyjdySKAYRs1zZ5r1cGYi0YH1MBIyow
	LpCiVOgjGlUOutT2V8yOaW0zb8rbtIZNSMrVhX1fGP9Y5mlAR1C3TRkfNw4NGMi986NdU+2VcNbbx
	x+EpgtnMdpiP95kAerS/H4Y8LrBAavQn2LMpGeUj8j+AO8lKS/Yn2tLKPdgYJ7kCZAabX01cmJR9R
	tUX5pOj6+PguLoKdnFdF1Kmd8UdpVOCgeXXInU4SAq+w538G1i3D4KxVYM9cec4nUQPSRcD4PuLD2
	WbRoQBitg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfZYe-0004gW-9l; Thu, 19 Nov 2020 02:20:24 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfZYZ-0004fv-Lb; Thu, 19 Nov 2020 02:20:20 +0000
Received: by mail-oi1-x243.google.com with SMTP id v202so1504642oia.9;
 Wed, 18 Nov 2020 18:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XjBMwrDZzoeC8VosEzb1gr+r3X/1K8TK9pR44LwP/2E=;
 b=H6kewgR2F5mSUim/w79oE5EZ5DUjQGIR1DL/OmwQK9EfEZ19ySwWBzLGIOpJW6E1F/
 c2wAhjT0H0Gafrp6CrHPIw1d5EDiu4YZpJY8W4Rs3iy7ggWvQYT+TR75rnNoW1En7ltO
 Viz8Wu0hubCYizW31+h7r97d4qaT07uW/lG74oN06r+kJhenK3uFepHkkyXuXGOrVSES
 LHtrCy5g4Gj9bPCSRxWOZEixdaW4j6mlQRTdNiooOxCjNA+kdizdIHdIG9d7f3Psvsrb
 YRZJZNqspocK77Lm055CMXGb15Ow3+kMcLPDbOtKd3e+w2toi8IodjwTlAOaXkU35ms5
 d3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XjBMwrDZzoeC8VosEzb1gr+r3X/1K8TK9pR44LwP/2E=;
 b=fAIILmwBfrV1FkbcOAAAqJLUgqwerAIyYGyqKXyTw3zb6ru7iwNczdyk72qNqgHgXt
 D+QCNiveq0ou6zTmbxYvMaanGioIMMkMAG4EfVvvA/JkkPSApbV9H5QLtGJu2b8CzRZ3
 BSwZIl/C7AAbLd0wv5uddoqsrLFqhZDDTfBM765cIktNanq3joTn3HyTgoGrSwsFAER6
 aoLc6kf+Dqgp6Gw1prjuRI3UG7Xj3CSCVH9r3oWMzmBFwHq/xcxaN77DMG20OgDE6AXB
 WxVabzx+y+ip7zAKHmyvt83YkNhnAV4Hua5+DZOeVz7iGUGx8odYwRCRcjLDLg3j5biY
 L18Q==
X-Gm-Message-State: AOAM532zY9VwgpRO0DgBcQqmUDFnDPDi0EY5WMkUN5Gsxe71cGVikkha
 Pb6NkmkGfyjP0LhRsBF7YfQX4aNc1oekW4faJw4=
X-Google-Smtp-Source: ABdhPJyzrAG22iqVzKYFTPE8VWe8HwfhcZ9N+mEhbSWm0JtgZ1x17Pi8KRNgmf9ES+kWyCvLyghbUcWeTNlooGIBx8c=
X-Received: by 2002:aca:ac96:: with SMTP id v144mr1378226oie.51.1605752414058; 
 Wed, 18 Nov 2020 18:20:14 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
In-Reply-To: <20201118213712.GA22371@amd>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 19 Nov 2020 10:20:02 +0800
Message-ID: <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_212019_787486_0D869F16 
X-CRM114-Status: GOOD (  17.94  )
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
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IOaWvCAyMDIw5bm0MTHmnIgxOeaXpSDpgLHlm5sg
5LiK5Y2INTozN+Wvq+mBk++8mgo+Cj4gSGkhCj4KPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9j
aGVuQHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFkZCBMRURfQ09MT1JfSURfTU9PTkxJR0hUIGRlZmlu
aXRpb25zCj4KPiBXaHkgaXMgbW9vbmxpZ2h0IGEgY29sb3I/IENhbWVyYSBmbGFzaGVzIGFyZSB1
c3VhbGx5IHdoaXRlLCBubz8KPgo+IEF0IGxlYXN0IGl0IG5lZWRzIGEgY29tbWVudC4uLgo+Cj4g
QmVzdCByZWdhcmRzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQYXZlbAo+CgpNb29ubGlnaHQgaGFzIG1vcmUgY3VycmVu
dCBsZXZlbCgxNTBtQSkgZnJvbSBnZW5lcmFsIFJHQiBMRUQgKDI0bUEpLgpJdCBjYW4gYmUgdXNl
ZCBhcyBuaWdodC1saWdodCBhbmQgdXN1YWxseSB1c2UgY29sb3IgQU1CRVIuCkNhbWVyYSBmbGFz
aGVzIGFyZSB1c3VhbGx5IHVzZSB0d28gZmxhc2ggTEVELiBPbmUgaXMgWUVMTE9XLCBhbmQgb25l
IGlzIFdISVRFLgoKPgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkBy
aWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24u
aCB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2xlZHMvY29tbW9u
LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmgKPiA+IGluZGV4IDUyYjYxOWQu
LjE0MDllOWEgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2xlZHMvY29tbW9u
LmgKPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaAo+ID4gQEAgLTMz
LDcgKzMzLDggQEAKPiA+ICAjZGVmaW5lIExFRF9DT0xPUl9JRF9NVUxUSSAgIDggICAgICAgLyog
Rm9yIG11bHRpY29sb3IgTEVEcyAqLwo+ID4gICNkZWZpbmUgTEVEX0NPTE9SX0lEX1JHQiAgICAg
OSAgICAgICAvKiBGb3IgbXVsdGljb2xvciBMRURzIHRoYXQgY2FuIGRvIGFyYml0cmFyeSBjb2xv
ciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc28gdGhpcyB3
b3VsZCBpbmNsdWRlIFJHQlcgYW5kIHNpbWlsYXIgKi8KPiA+IC0jZGVmaW5lIExFRF9DT0xPUl9J
RF9NQVggICAgIDEwCj4gPiArI2RlZmluZSBMRURfQ09MT1JfSURfTU9PTkxJR0hUICAgICAgIDEw
Cj4gPiArI2RlZmluZSBMRURfQ09MT1JfSURfTUFYICAgICAxMQo+ID4KPiA+ICAvKiBTdGFuZGFy
ZCBMRUQgZnVuY3Rpb25zICovCj4gPiAgLyogS2V5Ym9hcmQgTEVEcywgdXN1YWxseSBpdCB3b3Vs
ZCBiZSBpbnB1dDQ6OmNhcHNsb2NrIGV0Yy4gKi8KPgo+IC0tCj4gaHR0cDovL3d3dy5saXZlam91
cm5hbC5jb20vfnBhdmVsbWFjaGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
