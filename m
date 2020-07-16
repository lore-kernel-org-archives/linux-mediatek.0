Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CE1C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 13:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26B42065F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 13:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SInpkXlm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UPe+Ak5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26B42065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wE0NfkEzGnIcNY+QTD+xLmErg8WZkNsK9rz0uXNclf4=; b=SInpkXlmUSp6cI1OY/PXtbXKT
	4fwFIxQVy+YwlfSwGEp/k9+QXoTyj/3BJ625ptAcdYKSiLNNKEp6FpQGNTLcMWTOPqfliJ+k53tAK
	3plNK/4+TpoGbEEdLY1AxdseUIkvvZP+aqbQK/8hXbZJ0I0EW8kmMfgLqgRcC3BIyoA/FznVmljQ7
	qUI8il/yizCPVQ3ggzFoyVg+bBXJ7c7aQmRrhlrNJLAqUH7hQtaXiP5G7APvhetlPdFm7YxRX9O8S
	th8hjoKL0WAgESlzy4Qr1WTi8+QhEw6X2bHJV4/8J64ElyMnU7TV5fqjPV75NjEaxEJf668frwtUQ
	9tgKktzbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw4H6-0002nG-Pd; Thu, 16 Jul 2020 13:50:12 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw4H3-0002m8-EO
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 13:50:10 +0000
Received: by mail-lj1-x243.google.com with SMTP id e8so7276041ljb.0
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W0iuDU+qCWBUM7ba2OgUNPdlmGMl1pYMR/idMsHed54=;
 b=UPe+Ak5h0P6Z8onkrvDvi6QUVwIWIGpi7uVLXWjnR50zvyoG8zkGEuyKrRvZqzeaVs
 7flptBJJLbpHGwORkLYAmufCmWvGfUkoNyHT5bGmX36i/a0HegWUvz96XnbuJRHWAfmR
 vaKpbaNCPOFd9kZAqffwVWkCSOErYcQim25VAwe6+We+6xCAbwHI++HQ5iwpKnw3NA6Z
 AMU1wu9f4MKmZW6eE79d+LPAU3N+Gs/b0koGCHXt4m65RerZFlF0HvBXdiSkWQUAeFAp
 VoAuMgRT2f502rMCwgG6H9qyyTldwRfWJxb6dzlxVVget/xx4QR57S/61FyI8/bRXMjq
 g+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W0iuDU+qCWBUM7ba2OgUNPdlmGMl1pYMR/idMsHed54=;
 b=B0WGFIGk01iXW2A5scqtohg+r3CCCnTnKgT1AIbsnEBs7qlxchVL4cufr9WQ8MBWi9
 GBqwCWuhovv623x0kjiSbcPgyO+flk04L7oXVFO9C6UyQqawe+SW9adM5PXXVT+gAjpO
 Aq4m4Lpw9C0BpVxzfJhbwtQTPT1eFem0B9124c8pJG6d8jsuQiBobH361hFWG7xUCgUR
 pMQItd+y8wr+OMhiT0atrL1NNfb5XFFRrBjDAa9VhX9lDQAAdIHEJb146dGXuqxzM4ur
 7PunDEEtgn18SwnO7mBCWZ0HYmE1rPqb5svflV7ealzIGi7kpnEBjZuOzt5Qb8G/shEb
 Q1XA==
X-Gm-Message-State: AOAM530FrqNWCnoUZCDdin8ElbyhLxXap/O5NEGwpKw/CnebWBcfEua8
 rR4JQ8cnPr1U4OH/8APXuGsdH9SM5yMfEMFZdgLJOg==
X-Google-Smtp-Source: ABdhPJyuZR3go+MjRH0QD2hTjIiPi2nGSy2AbPjYJo0SRP7oWmUGCCRWXTzrLI3Eps1+wMn3Fs9p2fh605lNHa8lJsM=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr2010346ljc.104.1594907407852; 
 Thu, 16 Jul 2020 06:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jul 2020 15:49:57 +0200
Message-ID: <CACRpkdYOtp027AOMgw_spyRdO2XjGjr4BOoEVfOJN9Y2TtJ=Kw@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] pinctrl: mediatek: update pinmux definitions for
 mt6779
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_095009_524811_443C672C 
X-CRM114-Status: UNSURE (   6.51  )
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
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 11:20 AM Hanks Chen <hanks.chen@mediatek.com> wrote:

> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Sorry for responding to old patches :/

This and the rest of the pinctrl patches are now applied
to the pinctrl tree for v5.9.

The DTS and clock patches need to be applied elsewhere.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
