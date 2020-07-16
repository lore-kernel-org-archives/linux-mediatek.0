Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6373BC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 13:27:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316F320760
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 13:27:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGVn1WBr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iczHf7Tb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316F320760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RqcC2hQQDLvXKrY+cKEc/ZvKZnx0RZbWlGGXYAZHfDs=; b=MGVn1WBr3ce5xOx1pqmnHu9c4
	p2qzAuxBSE0zh/oysWEIhITd+dVvUzah3ESHZTPqSDTrpxwxhGVBKDFL+i63XdCrbPtMGllQ0uL65
	bEV74D2EStxW++thITP+Fpcs05fhKuySba6zXW6qIE6ar2XtO7/GBYq/r2ISRzMhTkwdHhkj55mDo
	Fd2R8ZRKMTyAQhBmXGVwGGGxY26HGp5Ley/dxKEJr+3Yu/7u9gTFAB/uN/Gv5y3hpBDnVc6xKhlPL
	VmyVJGHMZ4tswWmppn1VnjFwPqZLwzFWZZPbmRezumHwPzH33s5dk7j5h3Ag98g9xPDX6fTnjhr7R
	RN3MsCNaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3uh-00070d-Pf; Thu, 16 Jul 2020 13:27:03 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3ue-0006zl-EL
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 13:27:01 +0000
Received: by mail-lj1-x241.google.com with SMTP id j11so7125193ljo.7
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/vDuN1L2KCEbNuFEXJItw+g/c3pd50/6Ev+anSTygo=;
 b=iczHf7TbyYkMy0BWfgpzsOiVABUoxFhLHlLkbkGc1mGYacGVfxuaNeXRmfY8Tnau+z
 V6Ys4UJQjGsi5JXc/kEe3DFQJDzbxwH550fJ8UxQrLyQO49GGfXKxxwy4obQfa8wWEa6
 g+OpiQcbhTwx0zOLwtOJblk7pD5ppy9+2lXf+PYzptH3GxfZwFiqoIdYiJ1uJXR1ATc+
 NM7xGdxfXPP89AVXgXY7OGXTHN/PUEyibCJ/OdcLUauSg/BUIERlxnxfj61KO2pyt6eG
 ed+RGobQ6iFu0SSN/psr6T78MeBntG+xbb6VaWqOoejleDe3SliONb1B7Xa+fo6XC6o0
 TZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/vDuN1L2KCEbNuFEXJItw+g/c3pd50/6Ev+anSTygo=;
 b=Ydc0WNUmSCGMHrKgPd1LDq29FJam0ac518Ew9E3MkVovNHYQJsQweYIgC03gIA2qb3
 6vEQwIuW0A9cvmhagwLxgldovlp/H/zPKDXc0HoqKVoNLnXyHcF8EkYOzhuvTyrbpKns
 ffQyptcglx4Wt/eTPdRkH4jKSzPg1TBDgnfuQKWMHqzjk0dGgrZpGJOa65xL8e0K9ulr
 bbcL1LyF//RJkqXtpt3rVk2fvTWDNCTXaqdB9ngbGiB1JOOAsMBx4MAKMHpE2ug/mIDS
 HqTOLHRA3s9vqw/8STwPylJihI5D/DEXRkUYK5TDy3zxtRVuF5SbHYI1GIt5Ccb9NTxX
 9p8w==
X-Gm-Message-State: AOAM532ZkQCS/FkI0gCKsURvXM3ReSXZNJvU/qx0vYJ7IO2nqN7rds9z
 LtO5e6KpOvFHkJFardk3wiN9si+f490nd7Y0EhWGJA==
X-Google-Smtp-Source: ABdhPJzTvWzWY7xde2a3Mu6BMB59vLxHOlDAtL09MGxblo1BkRQCPu5O6Gx0M9FWfCAG68RIFcQ0zgAGPIhWb3rjt30=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1876406lji.338.1594906019044; 
 Thu, 16 Jul 2020 06:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
 <1594717479-8160-3-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1594717479-8160-3-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jul 2020 15:26:48 +0200
Message-ID: <CACRpkdZNL=mnF0dx63bQPpHVLcAHA=oSEiiHzH8vi3+X58y5Jw@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_092700_490642_D4052245 
X-CRM114-Status: UNSURE (   7.30  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 11:04 AM Hanks Chen <hanks.chen@mediatek.com> wrote:

> From: Andy Teng <andy.teng@mediatek.com>
>
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
(...)

Please make an attempt to reuse the generic schemas in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

See how other bindings reuse them, e.g.:
qcom,ipq6018-pinctrl.yaml

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
