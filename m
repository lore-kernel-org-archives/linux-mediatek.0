Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BE3C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0198960F11
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0198960F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpl9j6L+UPH/a2vxUbVMjbIclg8d2kuoe2CY1Bc+XBQ=; b=v1L7fDdiADy6O7
	kB6c4iUK5W1h3K1P2Ads3Qym/00BVoVpCH6BgFZFDEyE4+JLXCvJwdzybJaiRKQriWh5Z+Mr60b3S
	7/AU6KotZC999KEpppObBSx5sqFEXA4t99iDifuIbOk/Dib+kn9vbAmiw1LRG1JC9ssbVp/+qkrpQ
	Th+04p6pzpVXNd8cahF5W3cAKfkxgR7bxbgJEn5YJe+7kVykzpy273N/rn6SIBrsxk3jCiGSEOAM2
	4QPEU7aCdmGMwUr4cZy4hV4A8WUycQ0FTRZHE4Nmmm1iD2OpXBR6AEF8MENCFkcWAVIeZx+0eAl/K
	ofRPsJVED8WOJzrd9+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkEa-006Cbj-Ff; Wed, 11 Aug 2021 09:09:12 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjv6-0066gV-W0
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 08:49:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id h9so3325932ljq.8
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JDzCwx530Uv8LE9Hg8k3gK4gX2isyfl8rKYS+HUnkVk=;
 b=sFPNyBA3VF6paJeXHKJGiJN+Sh1GjSKbCHnngcFcrnT6aiT7iW9rGuN4Xsb21ft9Ma
 T9/jSYq2dJBnAcpGVMVLvcjhtxLe6R5AQttb9yzE64d2XIUvUwUHb0MvTYfeldRrJu4j
 aRrdXj3HskgcDrSEFBjyV7LBoctEoNNhSHEUCbwE8Xz6lUfoCKic4cYmh0BMOMb5ow8v
 Vszgor5Hf8sUoNHIa3FgvoL/d94zBWOeYkpxKAkN2lItJBfUiwSu9LMs9cAFkfI1qWST
 p2iHlEVXpW6omG2OORWBoQ/Ug3vBXorseCLE3nxaDI1BB9L/V1UWVy1loGcKl5t1Dmlm
 fHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JDzCwx530Uv8LE9Hg8k3gK4gX2isyfl8rKYS+HUnkVk=;
 b=oHvr1s/URkP82ffIdY4XKrpBTmzge1cgz4K4LIQCmEApRUDwDcpUxT6Ac5F3i9pN4B
 2DhRfWZTtC+GLpiSGRYu7+/LEaYMLAfr9FGjfZYT1NUaF/D0X7GoTQPXsgIW8LudrpAy
 ov93RxaU8dTK0Wn41DIBDg8H9Rn88fBNuH7dVMtOqO+DYaULkasYuJpQ+dk5a21FWldE
 ir7nCZPZaNcXNYBrWa772Ry9LsvOpYbJ6gauNdBY5ljesx2eBAXXIch7i3PehxdJpayV
 BGgtJ+OwF1NNvwcrLdFOrcdrvfCxlWyY+rqgYZyU/S7HFYtaJPMos/w1j0RijIZ7lnRW
 KSpw==
X-Gm-Message-State: AOAM530r7qcaOGaVmxmj3+1vHoS4cLfhBxG4HNfwSi2QB76hpJcKa+if
 XiPR2bDtbKS+WL11bgVOp14DhsOS6NX+shQ9yjK4dg==
X-Google-Smtp-Source: ABdhPJwCxS4RyJPQYMtZ37IXjlOSjy5gDhIzOTNQJe7kYmuLW56om7abo3l/tT9UNYV9boQQa6wawGYkS0DjsBv4nS8=
X-Received: by 2002:a05:651c:327:: with SMTP id
 b7mr22987076ljp.74.1628671742768; 
 Wed, 11 Aug 2021 01:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210804044033.3047296-1-hsinyi@chromium.org>
 <d48087c2-ddff-0c58-c7e6-a0ba526a393f@gmail.com>
In-Reply-To: <d48087c2-ddff-0c58-c7e6-a0ba526a393f@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Aug 2021 10:48:51 +0200
Message-ID: <CACRpkdb39r+AraKaAocB2qX+eLDdRvx3zFyvf0nqvEwFg_QdXg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo Serra <eballetbo@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Andy Teng <andy.teng@mediatek.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_014905_093165_C062F442 
X-CRM114-Status: GOOD (  16.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 5, 2021 at 11:02 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:

> Hi Linus,
>
> On 04/08/2021 06:40, Hsin-Yi Wang wrote:
> > Move mt8135-pinfunc.h into include/dt-bindings/pinctrl so that we can
> > include it in yaml examples.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  arch/arm/boot/dts/mt8135.dtsi                                   | 2 +-
> >  .../boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h   | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename {arch/arm/boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)
> >
>
> If that's fine with you, I'll take patch 1+2 through my tree. IMHO the best for
> patch 3 would be to go through your tree.
>
> Sounds good?

It can't be done that way. Patch 3 depends on patch 1+2 to get the
include file into the right place for patch 3/3 to compile. (YAML
check.)

I will apply all three and then provide an immutable branch that you
can pull in to your tree as well. This is usually what we do with
cross-tree dependencies.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
