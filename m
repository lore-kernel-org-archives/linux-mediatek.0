Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E574C4708A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 15:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098976135F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 15:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098976135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jr0D7ghwzJvFgON0SkNiQWTheiSCE26emgM138fVAWA=; b=UyY1IsxDtuyOfT
	43WLo9i9LcLP9g5ti/0yUyCZu/lLFVLZS7QQrGJC6ZgbZActBDWqrnhVa0Tgr8JICOGisXs37Rb4z
	EmkJOlibug7FHphMYqml8HvG/qXEOIhrVFzcI4a2M153dT0b5Aipqzum227G5U50H26BdL9pcu8Eh
	SvcYy4knibYsDkn+zIMunKoE0kdN/D+Uiq8ipCeBgXfKRLZOn1FU/pnoS27rrbJCHWgur9ijtPvlD
	smdX/Do3VkZhzABgZivZHSBcJJuVdKefa/sguPN6jASi0Xsn376koHj6Vm2g1Bi1T+6xXF8z93MXU
	X5Ck0q0MozFxdk2GSs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHvI-007DBU-DA; Thu, 27 May 2021 15:27:48 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmHLo-006vis-7o
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 14:51:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id s25so1152956ljo.11
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Hkj7D3yisXHo7avHeTOXBAYwyPzjzn8/NsopImKZfU=;
 b=jxfzSqvqsQppNCC4jriMe8suBFF2JkG5tHxUjUoqonH4hmcrdA01RxNV6aKuZ89Hgq
 bJmXogYdZREKvDr6O9UNpsp4AkzZN3K0QDS+YGDhKrZ2mBNaVZZjBGmyWptxJXeit7AQ
 UUGofWA+VCOQ+0ex0fILBUTwweWCfktrzwnjNLOIwGcIdIn9HVga2ejEXJBSokmvukI4
 EK+LdBxHtFYWhzP1kW+D90tBrVhIwskd14/U7r0WolkbzO4IpPP9DW59J5o/patgcxOa
 JBY+LYuiEqG0/XUEW2dUa7HPAcm/v3ppUPYjqy1aNrQQ0z52TNTy7t0wEllvrNMZ9iVc
 udDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Hkj7D3yisXHo7avHeTOXBAYwyPzjzn8/NsopImKZfU=;
 b=Oh8nBiGMYISVI9ig/4ISSNsUhG3T+rX9r5EX5JT8jMaCox1H1c04kXk4T+pwxmn1fM
 dJtEwsxJUc8Bk8Le9ATThjadbzHdT4cYWbjFrJ818Oc9CsG9KIA8F9ZP9QvcBKBD1oQt
 UiBk2B9zAPcc+8clp1p/qc5TKDGGD3WWfC3+9dfjkJpHmYgMkMfgi8v4Oe9ZcyYZoKdq
 eNJ4Nq83QEGSxtATRwrSI+HkHpZpsgBmppHRDSbXAxHNb+LwC/ntCU29iy8FROFqI0Bp
 oGujyx0cEKHr9/r3arECrfQmhpMn+ZejWpcxmzsD+zZ2wQINBwRj11CGjgGysWQBwZiF
 nyNg==
X-Gm-Message-State: AOAM530WAFbIM4H74XL+ScqUD9dQ9fVRmjYvY5l5Ve8Sat+W+pHDj+v0
 XZoD94LhpNVdazy9HKdryWFeOh14iXf7jByMlxqavA==
X-Google-Smtp-Source: ABdhPJwg78Xrvy83qD7WYkCalpJ/UWyN75gkVXd8WT1+Jgj8iwMYrZV8WIGBYYf04VEaW3pUAkDAhCQ2oPpRuXGX0gU=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr2901127lji.438.1622127065895; 
 Thu, 27 May 2021 07:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
In-Reply-To: <20210519162409.3755679-1-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 May 2021 16:50:54 +0200
Message-ID: <CACRpkdbXE7LEGzXbp-58OomaqLKXeUEWzkMiG8sppOQY6s0k0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mt65xx: add mt8365 SoC binding
To: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, mkorpershoek@baylibre.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_075108_389229_921A60D0 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 19, 2021 at 6:24 PM Fabien Parent <fparent@baylibre.com> wrote:

 Add binding documentation for MT8365 Pin controller.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
