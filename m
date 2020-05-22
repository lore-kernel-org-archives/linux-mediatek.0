Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CBDC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 15:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E7020823
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 15:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTetX0m8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FsB9N5UH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E7020823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW+LtoWon7KAHKR9W0v3g8sN1dUvladgstC2bpaXxn4=; b=sTetX0m8E4Fnk/
	ixHekkNMGZEUn2eFa3NA16Ivvblzx9XKdr2cTyYBBCrZ7+muMKorDbYsgj6ijxv9ueCLjzu7w5X1v
	PwjcwTf1uYChagmViWjevMcTBkznEFLYhXeYGW2OWeCWbX4Vgj9C5FY4/cAr3ZvqnSl1drVWrrMWP
	BlJJZBCUPrFXgp8Kjl5B/n1sf4MqnNUqXP+N8Lznz2g1iyeD0rjJZwTTLvbLKyzO5p1Mwk4MtpPT/
	jxF5jcTfeImhfl7idZRfnL2Iwnk/ANbJPPWee3mF17WlQQmEci1YA5w5a9JAeIhUokJ/d0Csay87v
	5CGiFTrnWM8ZiiCggngw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc9jA-0006mO-2L; Fri, 22 May 2020 15:36:52 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc9iR-0006Be-Cv
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 15:36:09 +0000
Received: by mail-qv1-xf44.google.com with SMTP id v15so4900479qvr.8
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=61+HQokeJZQ8qkHJ2OEdKbbtcdPY4X5ntDI2ko215XA=;
 b=FsB9N5UHSBWaHC/PI7gccIUfEYQI9QY2OJ2DpQw6NYmUIu/yS181SpbIsrMxh4tBq2
 251MX3ARNKmg1PIdHLrIfedovaTFRuT7fr6qAJ0OzP4eZ9kHh5QC9Uqu8z6t+H3RAa5L
 F060Wo09d4reWusv3yHvuVJT+swTL3Pz0DXKljhhGyA3kFwjN4C8iZYyafihOn7/z3Qg
 0IuxiDtjd4U1Id+/0zAMVIS4TwL0Ptw3vYEV4ApNhTbJ9HL4cLaRC/CpSTAqYS2lFN8k
 vztqA+6NvLDs6svcdY+jVjLfyDAKQ9YtsTkPHdPtxR9XEgWCjKhKy8Zuuz0XJ0fQto/0
 lmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=61+HQokeJZQ8qkHJ2OEdKbbtcdPY4X5ntDI2ko215XA=;
 b=Kvcjsl9jXnkVsCF5Ie2kXxHbMc5nwZ9rbP3/b5iYDGRXMZE5rSFsZhKIkWSgCBlcNS
 PEb0cnvGkc2CBfAPEvEA5pp/cClxD3OK+K4j3JTkhhwCHdjlPh8q9L7xQIFXqNDU8SLw
 XItHpu/Hdr0Z4YxeFKgR0IN669wLtulu99UHDI7v1CVylv8bszAZ25i8wi/DEiDG+DP2
 9hTetNWqN2sq94YQf5GUYQyP1CsraF/oFiCfLXRxlQCpVS/H1BfweDP6IJVeGXz+hT5C
 CoRN6IYhQpYJ0YHMGjR7BjzMZEtRCK+1QFNrciGrDyhkKsvTGGab9/GQnA21VIY2PoEO
 DuTw==
X-Gm-Message-State: AOAM533n8koz4O+oP/4NirXijaQbTt74ymgBRlzF+iSP059L/bjl+kP3
 ckk0zkCtfOe8j9u2Svv7Lxk7UZAchGtaFWgttVOtTg==
X-Google-Smtp-Source: ABdhPJxlFh9zM8Njqgrp9/xR4Z1brfdmQPtm73E6Mi4XIQKqvXjo8/lYWwCLTLOHbqsxApeDG9Che+ylwvNrK03MWBo=
X-Received: by 2002:a0c:be88:: with SMTP id n8mr4247699qvi.134.1590161766309; 
 Fri, 22 May 2020 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200522120700.838-1-brgl@bgdev.pl>
 <20200522120700.838-7-brgl@bgdev.pl>
 <5627e304-3463-9229-fa86-d7d31cad7a61@gmail.com>
In-Reply-To: <5627e304-3463-9229-fa86-d7d31cad7a61@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 22 May 2020 17:35:55 +0200
Message-ID: <CAMpxmJVg3VPt7Xu0U9Qnt4wYRmT75iryMDu1qaYdoGib1bhdiQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] net: ethernet: mtk-star-emac: new driver
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_083607_517983_D66EC391 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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
Cc: Edwin Peer <edwin.peer@broadcom.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, netdev <netdev@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sean Wang <sean.wang@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cHQuLCAyMiBtYWogMjAyMCBvIDE3OjA2IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb20+IG5hcGlzYcWCKGEpOgo+Cj4KPgo+IE9uIDIyLzA1LzIwMjAgMTQ6MDYsIEJhcnRv
c3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4KPiA+IFRoaXMgYWRkcyB0aGUgZHJpdmVyIGZvciB0
aGUgTWVkaWFUZWsgU1RBUiBFdGhlcm5ldCBNQUMgY3VycmVudGx5IHVzZWQKPiA+IG9uIHRoZSBN
VDgqIFNvQyBmYW1pbHkuIEZvciBub3cgd2Ugb25seSBzdXBwb3J0IGZ1bGwtZHVwbGV4Lgo+Cj4g
TVQ4NSoqIFNvQyBmYW1pbHksIEFGQUlVIGl0J3Mgbm90IHVzZWQgb24gTVQ4MSoqIGRldmljZXMu
IENvcnJlY3Q/Cj4KCkl0J3MgdXNlZCBvbiBNVDgxKiosIE1UODMqKiBhbmQgTVQ4NSoqLiBXaGF0
J3Mgd3Jvbmcgd2l0aCB0aGUKZGVzY3JpcHRpb24gYW55d2F5PwoKQmFydAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
