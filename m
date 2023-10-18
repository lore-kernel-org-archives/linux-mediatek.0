Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A3CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BiiFcmmCiNj3LecX6OCrxhnQVAh1Ic9WQCeBx3SSIM=; b=Naj3E2MWJlRTbHCd3inAhNdbK6
	NDYJUYegdSAtffCXf3oZ/x7ydPz3yDXSsY6RvkvxrB4lU076tN38mLweX4zSBna3uz8GVwOype0aU
	elOjneslOPVFZRZIxaGO6awxKf7Z6RWtibU+dp/wozQBTf70HypArDvwfvPmBSkbmCYWh8tevTpk+
	bQp2IUnBSFEJe4P6V2h/i7CwfocAUjjLzBCzrogbN9QW6uYZoU/MZ8tJLSwR5RFAfp9xi/8qmV9gV
	YWT01wdxsLdQQu3GgCrvr/RyepRQkZxdldVEiyJcRlss134Xt3E3DjmLxhbijHQXpguF01aT0VXRC
	U57zuZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3Ix-00EKTt-0X;
	Wed, 18 Oct 2023 09:57:31 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3Is-00EKS8-35
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Oct 2023 09:57:29 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1e10507a4d6so4614211fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Oct 2023 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697623044; x=1698227844; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BiiFcmmCiNj3LecX6OCrxhnQVAh1Ic9WQCeBx3SSIM=;
        b=srnQp0ozhqnGp54C1dqx7VfCu5BhtQKi1RSNn3A0WOWQHVybTTqCvIzEAEprRrmTb4
         +ndI5n8AmcMdOifByeU8jenkIXcENsYWrlLPe3at+lGO136Km4YYMh8VIDcurHYsusJk
         KsU04HIVU+GQ+BpRW8+BoYnic1FYy3td9Lz6liyxIfWH79B8Z5MHlc6gYT0Ajj3DRwLV
         0yFjoCOVtU8e5qtWgv6RuhTF4e1xYxdyM0vPYeJDhD4B8qYBivxpzUe3S3SvS6PRhcnc
         4F74hnkjsG3t9WYoO4drpDIIntdcBbMiOe4bxya2j3ZJTNfoxkPOrEeGYAUKiv9Eo6i/
         Nb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697623044; x=1698227844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BiiFcmmCiNj3LecX6OCrxhnQVAh1Ic9WQCeBx3SSIM=;
        b=Ib59WpAohMKFjnsorPPrgz9DVFMMEcPh++HNsZhz3h0wl8WQH21HzT6fbUbldXHBlS
         3Y9HbraoHWLbYt1nrnV0wLThzmvbRyPkv9ofDZblBeavpw2y25IKIZCDaVLe1ISW+nMC
         ZkBhPcjFNdm4bGaUHOarc7BrkH7Jj096jXgahdA8c2eCCT94JyZh6KfMFoFxS8GVzL2y
         p4h9YXW8TAHisIrdW/2+syq6TOeqKabcYt6BJno36/d+kjxJBo4eGkIXSJwZWBaUItp4
         KTpVlU8oBIkkT8/tmj993HYdOo3mtVxT++YGh499z6prixvj5QUF2TZhRF3DD8gHW1W0
         PGHw==
X-Gm-Message-State: AOJu0Yy5oWcauw0iCW8VJDybv7fEK/MaYx8d3AKaxZ65ER8VffuRQrDR
	tLzL5Umxk1zWEN9wf8W5/wP+UI3rOPaXrdQHtCr2yg==
X-Google-Smtp-Source: AGHT+IGgvTbYU5kAQ82x1eFJVsu/1pPvWmCD2rUCbOzwMrNjpSgu4ojXK1qUS7A/ozCqhTWYWn/CkMe98pIFz+h8TFQ=
X-Received: by 2002:a05:6870:179a:b0:1d5:8d8b:dcc with SMTP id
 r26-20020a056870179a00b001d58d8b0dccmr4682983oae.18.1697623043809; Wed, 18
 Oct 2023 02:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231017190545.157282-1-bero@baylibre.com> <CAGXv+5FwkBU3wfyZWWaiOgzLACfMVs4Bnu2KM4oSCUa28SzXVw@mail.gmail.com>
In-Reply-To: <CAGXv+5FwkBU3wfyZWWaiOgzLACfMVs4Bnu2KM4oSCUa28SzXVw@mail.gmail.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Wed, 18 Oct 2023 11:57:12 +0200
Message-ID: <CAP2ifjN-z9R=HS06RYPnTrMYondrtobkoPOJDR6js=r8astKJQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add LVTS support for mt8192
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	dunlap@infradead.org, e.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, ames.lo@mediatek.com, rex-bc.chen@mediatek.com, 
	nfraprado@collabora.com, abailon@baylibre.com, amergnat@baylibre.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_025726_990726_0A180291 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 18 Oct 2023 at 02:07, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> I see two series in my inbox and on the mailing list. Which one is the
> correct one?

They're identical except I accidentally sent them out using my private
email (that happens to be on a mail server hosted on my DSL line, so a
number of MLs drop it because of dialup blacklists) first. I resent it
using my work email when the error messages about that started
flooding my inbox. Sorry about the confusion - but code wise it
doesn't matter, v5 is v5.

ttyl
bero

