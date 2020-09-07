Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AD2C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 22:20:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039A62177B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 22:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0LtEs0II";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRePmzTV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039A62177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Ljm6qdaqWni4r8lK9OA1f/Avq8mhea8NsT1gRgMdWY=; b=0LtEs0IIbCkL6rFxkxOfhW7JH
	bQt2aQ9BCzLiO1FieVS1IPuIBKeMBBSREXUg1qvjElHTfvl3pX+iRPOPxk+FTUFebXrOrv9pre4C1
	o2m6Ep0/C8B17fQ6b6jvjalK2GxCEK/gTT5Kfa3rf76Crj3CqIoSBywrsoEviEpeTRJXRdSQlzbG/
	1ECYgeGO5pGSo6dxG7qUgMSWkY82GnmLK2kkDQZTej4Dwh+xoVQIhncjz6f03jjR9UCBTVAWvlzeg
	c4P7Mcz19XF1U+y2zs8NSJkv1E9yumTTlSZzwB7SJLePyBygQtRd+8GpMkyGOZoeehHXf6MJYq+2c
	8RetYVLwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFPUj-0001oW-P0; Mon, 07 Sep 2020 22:20:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFPUV-0001mw-Uy; Mon, 07 Sep 2020 22:20:07 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BC2221924;
 Mon,  7 Sep 2020 22:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599517198;
 bh=swIGSxMN1jDi1c8fwD9FBdsPbQw6ciSZxqdF/TkV9Hs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SRePmzTV+Gw+7ejZ5V2/+/3+ud4cxIYfIZWDTwq1yhlCIVmvNJWSzNn8fCV5oKLD3
 0Jj7TCbJ0Ks8a3mOvr8bkYSfHUL04yghaz8QZe+jI3ffk6aOuKHX7JTzYIsoD0FMo9
 yBNHWv2YVxV5VRdAggSdHLB/MFjHUIGGhRWHIk4Y=
Received: by mail-ed1-f45.google.com with SMTP id g4so14023372edk.0;
 Mon, 07 Sep 2020 15:19:58 -0700 (PDT)
X-Gm-Message-State: AOAM532SvpdcGCtdXNoqIg2VPyCQ7YRLthGXzBQegN6h0H6RDVYeK5w+
 CO3Lbz21VbR5m9F5f8ehCtlB8AcfH2zmlyvB0Q==
X-Google-Smtp-Source: ABdhPJw0U71O9xX+kGgiTo+ISsow9OgeCF69V6CdeVmbppl0sXiRcIe81jcbLFmP95q2wZ92kN3RtTuWDcmb2e/43V0=
X-Received: by 2002:aa7:dcd2:: with SMTP id w18mr24139741edu.288.1599517196951; 
 Mon, 07 Sep 2020 15:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200907125646.1946282-1-fparent@baylibre.com>
 <CAAOTY_9HYvxEygv-oz9wf+JjiSfp+Zn1u5okMftz3SncfK0G5A@mail.gmail.com>
 <CAOwMV_xEEt+m+LuL_3dF2J8rp4m4gn2T8AR5nGLi0sDoiOC=RQ@mail.gmail.com>
In-Reply-To: <CAOwMV_xEEt+m+LuL_3dF2J8rp4m4gn2T8AR5nGLi0sDoiOC=RQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Sep 2020 06:19:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9YE66Ta9Dw6AT45TwawLe1WpVMFcV2wownPYC7bG5cKg@mail.gmail.com>
Message-ID: <CAAOTY_9YE66Ta9Dw6AT45TwawLe1WpVMFcV2wownPYC7bG5cKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: add bindings for MT8167
 clocks
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_182006_026254_CFFF847C 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, masahiroy@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 macpaul.lin@mediatek.com, mtk01761 <wendell.lin@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, mars.cheng@mediatek.com,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDnmnIg45pelIOmAseS6jCDkuIrljYgxMjowNeWvq+mBk++8mgo+Cj4gSGkgQ2h1bi1LdWFu
ZywKPgo+ID4gV2h5IGRvbid0IHlvdSBhZGQgY29tcGF0aWJsZSBvZiAibWVkaWF0ZWssbXQ4MTY3
LW1tc3lzIj8KPgo+IEkgZm9yZ290IHRvIHJlbW92ZSAnbW1zeXMnIGZyb20gdGhlIGNvbW1pdCBt
ZXNzYWdlLiBJIGRlY2lkZWQgdG8gYWRkCj4gdGhlIGRvY3VtZW50YXRpb24gYXMgcGFydCBvZiB0
aGUgc2VyaWVzIHRoYXQgYWRkIHN1cHBvcnQgZm9yIE1UODE2NyB0bwo+IGRyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1tbXN5cy5jLgo+Cj4gSWYgeW91IHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0
byBkb2N1bWVudCBpdCBoZXJlIEkgY2FuIGFkZCB0aGUKPiBiaW5kaW5ncyBpbiB0aGUgVjIuCgpJ
dCdzIE9LIHRoYXQgeW91IHNlcGFyYXRlIG1tc3lzIChtYWluKSBhbmQgbW1zeXMgY2xvY2sgKHN1
YikgdG8KZGlmZmVyZW50IHNlcmllcy4KSSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIG5vdGhpbmcg
aXMgbWlzc2luZy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
