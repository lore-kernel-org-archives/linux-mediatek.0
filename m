Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8484FC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 08:18:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F952610CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 08:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F952610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+MOEFOV8aChhUHz2YJ5MD7T9Cv/boge0F8AdQtTTUhw=; b=eXCsraUf8mDZoaAWW2fBQrwFM
	CeW1Lp7pE93BKFJMyiHM8qz9AMvLoK+MPO5O6qvB6A1tjehAwAX8D7iDpUB31lSM2K59RhGd2PlWY
	0btNQQ7s3uVM/FYxqGqLtW0aha6bln4KIYtkNLn4H0dkZfqEbejWWi7VX/XsJ2RkFuLdqA2+dMzkF
	aba7wIxahORfO1KXDFzghsLtlKr2Y2R/NvY9Bhd0n8G0OAs5/Pw2ujZ1YVZNyJYS57pompwMYXbwT
	dpfubALTySTIV66zNWsnnJDpZw/F7Mad88OoGz++xirCU6CG6ac132N215RQl5fR4ZbqrMlsb4W8n
	8uhxFYifg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJfo-001J9N-0g; Fri, 16 Apr 2021 08:17:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXJGX-001FOn-6q; Fri, 16 Apr 2021 07:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=4GwvUVkQCAs0X/UNyX5pEqeUO1WdFhB1WSpRysQPPC8=; b=qAWEaiH370uz3cdbkSgUN17XzP
 CPU3bVaH/jnFmZeIZpySdP3s/gWV1JWvRelDqzwk0U7PqxfioVfx9wyAcqx0hVmGzV0xiqGSRHMXm
 y7rsPox551yqvPx9CNzQdhJj9cySWKzmni0B6fyLu/2WODMkZV86+Nzrk2VCMYfqmn6T88GCjc7s4
 GJp9j861AE9Ufy+StYTySi73CibbvojjRSEH/C5z94+J6vlYSFT12nW57ybzTpHFZjQDDGYrFgzJB
 TZbvBrDMMv+siOZhxIxjtN1HX8aZeNG3oGp15eBDmFn0mAgsUBEniE0Iaj0PRBuCReBolKPWQOLm3
 jefTxXtw==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXJGU-009AJr-Jl; Fri, 16 Apr 2021 07:51:47 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so19891477otf.12; 
 Fri, 16 Apr 2021 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4GwvUVkQCAs0X/UNyX5pEqeUO1WdFhB1WSpRysQPPC8=;
 b=ljbOw4dWBTZwCsHaMq0PZ/dctFokBT9dSEg2Wl9dz4QOE/hP5GrAF7ZL0ZQ4nIWc8p
 GVNXrKAVueX8JdkY0wN5dOt/vg+Pwddybkab8HfeqAP261sEeE2sAmenIg40VaJTjcig
 oSle/efFKv/StjK8RCTDswW3fIE/7aevPjOyy3SRIyZHSCfGfa48bUZeDSsPho0+yf/C
 KJffQXuM2WgS4rHZjFHx/PuevLB1Uh5GtieZBbhwtml2KBFZfjR+UFEvz7NvlGj2e9L6
 5wgZj4WxOYKw+IGwDwX7RkHD5EKlqbUBkIEgXLzvpqUK4LJ2ABhx0TwshlSdPyId4UUz
 W7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4GwvUVkQCAs0X/UNyX5pEqeUO1WdFhB1WSpRysQPPC8=;
 b=Dsg7gRME5hxJtN+9iwmgchAVEli8VSTzBn8/bilFOdkCA7S89Jeur6bfl54HYPOBY+
 roLwgELScrTsWzxjtr9rPIcnswIA1MoWZ3zzhK4ce68/lBgAjgN69GeIn+qRs6f2rsDv
 3iByiB5BwXCqBhTXcSD6T5LDFENVEPsfVk3O3oMFzGWVgmSzjdYID1XFrFlfBEQyqgH+
 jrj/KjAcGWfGpySQL9AUoEEpcynHnxq8fbzEdJHFd4dSol6B5+8SEemMQ0nsfN8TuKta
 5CXQkwImaBTzvZY7UGsjtMd+CcJ3t5LYjPm7FTOHKa/xbZlHPintGyvDM04Ol24scasq
 6OQQ==
X-Gm-Message-State: AOAM533H9WUx5resJ18AJ+EYboKPCESeFKW0QsXXww1JpzJrVXd4aBXe
 pCYXP8Zk23dBYxjjrsQTJs+GK7fFONWLD5rjnmc=
X-Google-Smtp-Source: ABdhPJx2zqCjdlBGHxyj00xydr3ubb35ShJaQk8s7sLVXgo86SVvtyMsx4K2PWJIMxLsD/RDwg4wOFQmAlPFoFPd/hE=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr2808423otq.281.1618559505373; 
 Fri, 16 Apr 2021 00:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618236288-1617-3-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 09:51:36 +0200
Message-ID: <CAFqH_50kRmQLukyRERwtRGErETuKP8jry9+oG1CSX+=-Ckz7gw@mail.gmail.com>
Subject: Re: [PATCH v5, 2/4] soc: mediatek: mmsys: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_005146_669436_7BFF125B 
X-CRM114-Status: GOOD (  14.07  )
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

SGkgWW9uZ3FpYW5nLAoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgoKTWlzc2F0Z2UgZGUgWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IGRlbCBkaWEgZGwuLCAxMgpk
4oCZYWJyLiAyMDIxIGEgbGVzIDE2OjA1Ogo+Cj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IFBP
U1RNQVNLCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1l
ZGlhdGVrLmNvbT4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5i
YWxsZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggYi9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IGluZGV4IGY2YjU4ZjkuLjc3
MThjZDYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IEBAIC0z
MSw2ICszMSw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsKPiAgICAgICAgIEREUF9DT01QT05F
TlRfT1ZMXzJMMSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMiwKPiAgICAgICAgIERE
UF9DT01QT05FTlRfT1ZMMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfUE9TVE1BU0swLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9QV00wLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+
ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00yLAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
