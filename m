Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C88C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 15:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F43E61131
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 15:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F43E61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IulkMiilvzWYcG73Cn6RkDW/rUpGZBKIq0VkkB01FE=; b=ffbdRDlwuzZ0y5
	Y7QofZoTqxkA9DyzK/1LFKB5Abyy4lZMjc/yjkU1U3nsu3ERajkyuYRoqdh7DlELyc7kNS8oZWsx0
	dLwbJYo2BhNPfvh2O4wwFUTaioRYTF+FzdBAJFN/02jW0j8Fr596dOs2cdAgsT+gbR49PMYuGHaGy
	VwtK9GYUh0iPgloBNEhGuh5IzJ+IlcBu50fa9nOQouoQ4yt19ZkT0htOa77gdcM2zyiNlPQ5xgrj8
	IM+RKGzicMPhjKtJWdY9auk+LlQQAK/CvOaVa7V6QcysHCzk/66PuRxZWvCMLn8evqnKZWjEox0/t
	Xau9FjowpOUGFmymUZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVyBt-00EyZz-7r; Thu, 30 Sep 2021 15:41:45 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVyBi-00EyWn-0a
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 15:41:35 +0000
Received: by mail-lf1-x135.google.com with SMTP id g41so26936571lfv.1
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Sep 2021 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkiMt/G7bFXAXpJDQxe1pxlr8eHxyYeyKBiifpqcCv8=;
 b=cgIhgC2Dc4NbQWA+Np0faZRjXOIfA5Q6JS57HlBiEUSQSUzjg4MSeF5mSEA9WS0CGt
 QmPmhU1bRPjJ2fFdWpZ7Za+A+gMd7/S4KXUjERWkNLNvaFZv0jFlFkYfBNtsi1PjY+Fl
 bF3Tf/931BXCeVPfJNiYweKFHD76VytKHwKHubp1EE7fznmMpsb02OvqAFfSbohtFdHv
 wUi3B6dEfrHtvwHrKrQ+U4cRGTC4qUgbVSJWcabR86XIbSo6RJchJVnXr+GrVCwDLhbH
 Quzu5MAw6J5Fct26H4B0MUfbbS9p3k/KGUMnFU+iMrX3iuhR8QykVx51mEy/vYXEuT63
 9IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkiMt/G7bFXAXpJDQxe1pxlr8eHxyYeyKBiifpqcCv8=;
 b=oaxpn+Y9QUokVEZimxzlYLngARed9E2LsbT86ERpJjw2EYF+dzZBWLY0goibX2UKsj
 0MGgvuGSKJbSCvNBHMZ6fLpGXRcyIa065/ZSbHWYrOVaWgCFVRKIm0lILH84CYqNhHQI
 jZFfvgITZhQoMtAcAqWkrn3llGWqbVA7Qhx60r/EhakPclrmNUHnZMSvgZobNd0NaQzH
 lomV1DcyjX4FDV99HNAhTVSPPkR96XBThlDc02VkYWA9WjMlpYVxd7sbnuvXEeGa1OvZ
 545ud79vWpDoiGLeJE+ZGr/OOQXcSKBfGwO8u6GmGvQ618uBJnRuaZ0liJ4CmUTJ+hDs
 yfQA==
X-Gm-Message-State: AOAM5313CGtwBYsNrmp2H7G5NCE1W0etYi0VuJ+aSVFm+ZQbfYXJqwOi
 5PsEvzxp1VkmYGmeGs1D/HwIoqQ1QsuR0f4HlLqXtg==
X-Google-Smtp-Source: ABdhPJzbQx3xPiacL41rCJErivYDM0vWUswmTjCsb5uUGMEo7NJ89zBn/DGOalij/ndQl9CH3MaHruCT6FaEoOS8rOg=
X-Received: by 2002:a2e:4e11:: with SMTP id c17mr6415015ljb.19.1633016487609; 
 Thu, 30 Sep 2021 08:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com>
 <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
In-Reply-To: <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Sep 2021 17:41:16 +0200
Message-ID: <CACRpkdbWR_kmvMuHMTOjxLDqN6rq7zhrWcZxfi2L3Atau=TLSw@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down
 description
To: Rob Herring <robh@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
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
X-CRM114-CacheID: sfid-20210930_084134_090504_C824E25A 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi Rob,

how do you want me to act with this patch set, as it is already
merged and I was pretty happy since it is a v14 and feeling
it was getting a bit over-reviewed....

Are the binding problems solvable in incremental patches
or do you think I should pull out the patch series?

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
