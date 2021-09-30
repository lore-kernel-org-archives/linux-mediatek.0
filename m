Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81801C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 15:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D8D4613A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 15:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D8D4613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqkyQbvAOJAWnv0lZmEAt7vGTgvDz7iHdwkxUcFg1Uk=; b=Xsh5RfHlHjkLvl
	/n1NdbZ7XDochgOmNZ2pk9a2aD60IhDOTvj75CN/D5qBjIO/3J3DpRCTzLWR1pTBDfqM0C1lvSeem
	k2lLyFabZC+7V00v4fqsR2uqUFLgtZLUm+BSpuPLq4tJSDmuY3zCXSdm2sJZ4SR8VWY73yzykYYzz
	pAYl6u+ec3t2YRRxYgOVyGfE1phxURD6dQws4L48PKuWcj7Bc7v99Ut36CEqnbcMWtfrKk+35HVtX
	yFvO+ux9jHtbs3D09gma+EfceF42T7w5wj6TAHY7JQfCZfAf4QS3baIilp0pWcu9kZDJPz5/tAWqv
	bSOKXFZGp+fSNBx8HQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVy9K-00Ey5v-Nf; Thu, 30 Sep 2021 15:39:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVy9I-00Ey5D-24
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 15:39:05 +0000
Received: by mail-lf1-x132.google.com with SMTP id j5so22201272lfg.8
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Sep 2021 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=itbG1ekuBIEb0/GfpKZaQh1cYlvDFGD/ZH0SvfHSVew=;
 b=mw0aWFiS29aPcceoUVLPh3E/6s22lyYpxw41OCKkIaF2gSEeM6Gp5HPdpcz8OHou9t
 sd3WzC8QJVgq0sycSKVjhZInALiCr34KE655vDMBGDh/i2TfY07RJ1gAUyghaOnKjJ1a
 e8IdnuglciQ3jTmoOl5cL+5nniBH2EHRt75RIc6me6Vc4pfwEQJ5AxHbeVbrMKJrHPZP
 47782SaTVV3QyZdG34lW3c0BXPruHuYdDQE8xTP9feCnfx3PsPGEIjXnv1WuQR+SPUZY
 WOsWUO5fWdDeuG+zHRWw5PG+WlzZI+kzfItHXQm8LK2rPj2CF/SXGG//JtvX110pJJhT
 5pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=itbG1ekuBIEb0/GfpKZaQh1cYlvDFGD/ZH0SvfHSVew=;
 b=KgqDVlVaupNnMXI7kk+pfRiNd3ZyXNrrQ4fQD/LzwXfIiL8LT21yQJV8bFaq60rvdR
 JeCQ7evxCX1MTEKjd/dMG7nEc54X//LyBHMAOuJZXAJuF08Yatswdp7or/mSXvk30Abd
 93myg73XZMOcJKWoQ5X5I0xN0YPGdHXJjnnHg4LR78G4D7juqvvi2OpEdSD+iDiOszKN
 X2ehqek+2GkS4FNN4FtxanCui38HrpXEOJ45X96Q+XwHltOQIca/oBU7wFzBsVn/4jnk
 zhvVJ4yylIR1migdMXraNwtkk17i2LK0EotVvfUTKy/JVo+zP39HmBd4gNPOr0i2eNCY
 sjwg==
X-Gm-Message-State: AOAM530hzsdX+zV9GyrRmEqirCvo/dVXiZ5GLAyQbF8IrToR0WQDj0yk
 ybEdU0V5WtAayORLXnUUHAQWpw4mN1EsW3GU6HIQDg==
X-Google-Smtp-Source: ABdhPJxGlVSlRnqDTNPKMZ7uXq/9ATNld698ZXtbR374gYRhj4Be2kA9QICDdh6CHDCAWbJzy/h2Ti+75NGrzQaZIoY=
X-Received: by 2002:a05:6512:706:: with SMTP id
 b6mr6522994lfs.656.1633016341999; 
 Thu, 30 Sep 2021 08:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com>
 <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
 <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
In-Reply-To: <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Sep 2021 17:38:50 +0200
Message-ID: <CACRpkdYbZi90YAFGBvZ65KD9tu9RaJt312dq5UZ9VYDuLKZOMg@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down
 description
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_083904_155505_E678E58B 
X-CRM114-Status: UNSURE (   9.13  )
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

On Thu, Sep 30, 2021 at 3:54 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> > > +  mediatek,rsel_resistance_in_si_unit:
> >
> > s/_/-/
>
> Hi Rob,
>
> what do you mean?

It's a search/replace syntax used in sed (stream editor) meaning
"replace _ with -" i.e.
mediatek,rsel-resistance-in-si-unit

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
