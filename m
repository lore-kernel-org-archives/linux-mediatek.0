Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D11C4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 09:21:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DFA2389F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 09:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kNSVaDVd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCAMQcfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DFA2389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P1qYDY64bbNApswqrRWB8AkPq4Z45YbBg1SWyRkoaBw=; b=kNSVaDVdH4YszvKKwq34qu2fy
	SmTzP1RuIsNoxnHyQY45T6StppLsspDM4GsOTFFB6dGBuuiPAizq4kHZw/ZiUPrwtpX6bOQOgQoRY
	RTLKMtN3ZykcARrBcMAJuAdZxNwM1iFSJ3zGgT0Xt+hRQerkQS9CCNAOuB4vJbN4sRKv9M77j1/vw
	3Y43RaKKOJYF0HxuOMUI5rPP7fa27y9XnqDXfQ/UPHd3Pj9AYfYsal1h8WIR/sUxPAu8b8hc/uinP
	NzP/Nyms8b92TyJnuSiMla46qM0uIqIi4Y6kPt4u97sAaUPLa5EGlvg0E+BUWln4BeB/tH5Etn9oe
	AeIGhsomw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMSrq-0004Qu-Ub; Sun, 27 Sep 2020 09:21:15 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMSrn-0004Q0-Ga
 for linux-mediatek@lists.infradead.org; Sun, 27 Sep 2020 09:21:13 +0000
Received: by mail-lj1-x242.google.com with SMTP id v23so5909217ljd.1
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2020 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o7lRMwheEwMVDoZh1+98Zj6EI+Y2FXPbKq6Vx/JPPmg=;
 b=nCAMQcfO1adjOnVSOrDKmFpM0l1QZmc4Gk4gzdgH5NCxKbVN7fIsZnb1++bdbbHuGK
 0gO+FJihvUKpd+joia7EV4Y/nhDc5SkY1CghBYz8FI1tFntyf4tspPVYKMlDpxEVCOyn
 ZdjIv/d3/vg6gRQ5hV0yiN1LUo6RkI2F1SbMeOne/ds+3Zifnb6ihpoLZ8kBdeRR28i8
 Eo1tjpVlBqUimhkh3lEZZWkByJlb368sDd+SsSM6wdS5L1uBCP6zwdCEc5s4jyQLQ5zO
 TLFYNchXVtFGjAM0Vj9UgX3gB+GBpxeK2xX1wMeAxOGwa7im2wn+T2PMmm9u09HD6Rhe
 QQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o7lRMwheEwMVDoZh1+98Zj6EI+Y2FXPbKq6Vx/JPPmg=;
 b=QXsrSV0cKZQiXoiQH6XJnb9IA1HoAzCguL5b4I2qNTZ9MxMjBsCwN39m6xCH0LFgvb
 feBeQtTJRZ1PyAUYWS+uFZ5csy5Xs15Mdwv46zvQr6p2DfNT6/2u+b23v7rkuKAOBZpp
 ns4LeUCSadi/8C748NFECN6WRft1PnKBFpfdFmHPaJWIEOpodxNacJMgz4HpTfcEd/vB
 ubi7hi1pxsG4xS4oW9G3BPVJ40TSNrNBkAwb/aaUMExzWGFPafwQAouyQOyqwGzxSlgV
 x9V9WdtsQwLm3lZnNEiiIglOfOLxOOm9nUKBxMJYXgo2MEdsQHsTRHsLU6vNQqkW1Uo8
 Kd8A==
X-Gm-Message-State: AOAM530PV9B9dgyH6VyfIN2jFNwmJlgZzDiDaYGMgrNzbX8iM4sndDaU
 EHhr201zd3VXp7zB9ScUyK4WNEpKn1CIYL1D7InAlA==
X-Google-Smtp-Source: ABdhPJy6MVk1x45l3SzYVBvvCdEvD+7U4T8hhSI5A1uyFMODZMWC5/YlREL/K/c2cdE/Px3GbHJYxQ+SeOMZ3QRW/wI=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr3403136ljl.104.1601198468123; 
 Sun, 27 Sep 2020 02:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200907110221.1691168-1-fparent@baylibre.com>
In-Reply-To: <20200907110221.1691168-1-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 27 Sep 2020 11:20:57 +0200
Message-ID: <CACRpkdZ8hqVok8ejVACo7pxMuc8EpKt1Z+hSKnpGq6Waj9-5Pw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mt65xx: add OF bindings for MT8167
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_052111_614604_3BB600EA 
X-CRM114-Status: UNSURE (   8.31  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 7, 2020 at 1:02 PM Fabien Parent <fparent@baylibre.com> wrote:

> Add binding documentation of pinctrl-mt65xx for MT8167 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
