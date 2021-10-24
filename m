Return-Path: <SRS0=8pCq=PM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27331C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Oct 2021 21:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B479361039
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Oct 2021 21:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B479361039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEURaELDcA8s1SkgZA6Id+DIC3uT1Jz8aE7jBC/xlFE=; b=1Ki10YhJTlhhbn
	b5Hrcap87sq8/j53nOye3TKqLioboDzr7dJK4/Z2C6hFfpLgBtFEbOMKpgvNp2ZfCwRYsYYhvF6HF
	4siNVwnhv7uvWiQD/fv08KNhWJ6iGua1r5180FsiLejjGyXCcc9jrKMejzj1aiZ0eO7HR/35j+VYw
	CkLKKU22yPXNBqt6v651dMCHVl/Oj8eRviah12GsqUqu88BSxTAkx4cKwra0xpu4rZBRo3Bjf8Eke
	oqw6PmfpzEs9FUDKEAXBQRn8/y7+Gv6ubn6tmbyLjCWFvuNPdusCnAVKDk9VHLpB0sywI5wtCf4Fr
	yrnIVG5gPmIKTm1nJgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mekj0-00EcBF-5p; Sun, 24 Oct 2021 21:08:14 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mekix-00EcA6-TS
 for linux-mediatek@lists.infradead.org; Sun, 24 Oct 2021 21:08:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id g36so7284979lfv.3
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Oct 2021 14:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LMYhbLkgTSqPSv9vA6KWgK1dElOofvGFtWwEO+48qZ0=;
 b=CCBwZTOnWvYExKQ/vwM/BrgQ+/2VXEta4i/lTffNfw3ohsCrs5RF8Di2tkXD7R8Y7Z
 9ImYAeELkS9dIztoT86WgcADOmObC7RVpSFYpgz+/50LupX31VuzTNej6sUzePQuroY5
 r4gbHDF/oxnmeyx638YZb/RUOGb+ZDJRlKK6zjRIKV6O9pOvVSMwqo4B1ZDJI2E7YiQa
 BdQfBeiHzL+uRB5vyFdJhTXJW5CWDfqTTDIvKJX3frysFvikSP0rBDRSynt8SiCB4HjA
 Tymjj8+wz1PdvZyiVTQU+A4frz7K2AGDAhuCNaHznPdjZwP0S60w1qdbtF2nSki37b7q
 thMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LMYhbLkgTSqPSv9vA6KWgK1dElOofvGFtWwEO+48qZ0=;
 b=cD3dg5hL8sj/R4ZNB4k9+b79fpJ6InqD5wQ6nQm2kGcFUqEpYRlRmM5wCdqNDtww95
 FWIaS5BC5v/WZFnjIdLLWHT0LtqcBnP4PnqTnlIJUy8YL5aNHhIf2QTUGn1s0dE4R7B2
 uFxKPneMecO/VrANDD7/Kr51XTPxhWqIRUqpMvtt+B603Uh6hDfzqZF8L391taURvycw
 CFzz/ZDMOFekbhJ8NAQhCiZXD/Czj7fm+I+3xnAw/k1z2CG/T+UV/z9ZmZZbyZ+jNXCj
 Ik6wD4OF96sLtUyCZQoDck0bXLS8Fj3Yl8/gqDCPAmbI51rj6t8gpBNpLTbTD8vKNoND
 6M+A==
X-Gm-Message-State: AOAM531M8fnPjEc4fskkBMataehH3eQcMth0/xf4pHWlb+PHeBIcZ8dw
 bVimIWizGHJ37fbIpYK3a3+bAGM61eUhlGsX245Zew==
X-Google-Smtp-Source: ABdhPJwAZbQpExa3fIcxuElrdBQpPSxEtV7dAaKscoaT6LDhlGxWjuDzvnxdv0SLWc6JCN8hPKHAEbgB51S3lCZGu1s=
X-Received: by 2002:a05:6512:1316:: with SMTP id
 x22mr13096950lfu.291.1635109687054; 
 Sun, 24 Oct 2021 14:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211022124036.5291-1-sam.shih@mediatek.com>
In-Reply-To: <20211022124036.5291-1-sam.shih@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 24 Oct 2021 23:07:56 +0200
Message-ID: <CACRpkdagzzWtN6Gp-ZMZkAqq7JwL0nf63J7NC8jpF=ZfRJG4JQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] Mediatek MT7986 pinctrl support
To: Sam Shih <sam.shih@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>, 
 Ryder Lee <Ryder.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_140811_974030_949FC706 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi Sam,

On Fri, Oct 22, 2021 at 2:40 PM Sam Shih <sam.shih@mediatek.com> wrote:

> This patch series add pinctrl support for mediatek mt7986 SoC series.
> It is based on patch series "Add basic SoC support for mediatek mt7986"
> https://lore.kernel.org/all/20211018114009.13350-1-sam.shih@mediatek.com/
> ---
> v9: added Acked-by and Reviewed-by tag

I have applied patches 1 & 2 applied to the pin control tree!
Thanks for your good work.

Please submit patches 3 & 4 to the Mediatek SoC tree.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for these.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
