Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E19C4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4501613D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4501613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=milDbL6KgIfg8wzkWwJDN1UNDboeIG/OFfbk07M4lpI=; b=dSG+thhrLzIHgO
	Dy5MD2g3nK/Fkfh9F9RlMb28VicQa8JKbnxC2rrtslra6aXeW8f7EF1SkWH3DHlGTbPv51SOGpvRJ
	5rYOan/TSyX1k99Qxgwps3a6/c4oEQQCCeOEn6o2MvNWOhEFcPwbM4eXszaWo9FGtJy4KN8VcjH7Y
	W6SIVGysRfRoN61DyVaDm7YX0Dp3hG194BvitNZcd+w+sT0eIycj4tVaUY+YU3JkcDnXdMChKRlUi
	6e/YrDdRZVofIpCXvCrRQO6IdmwfAv9N5N3pneaU6LseB9DTriHLsjF7gnONNomf7zqzWtcXpRaky
	BP4dGWSthYgxTflesccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYfu-00DoTD-KQ; Fri, 28 May 2021 09:21:02 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYfe-00DoIy-Md
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 09:20:47 +0000
Received: by mail-lj1-x232.google.com with SMTP id w7so4376981lji.6
 for <linux-mediatek@lists.infradead.org>; Fri, 28 May 2021 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NyLm4M6sno3u68FwAJ1r8D39ashG0coxPAL+2ytbo8=;
 b=m3KjY1b2H8lewGLvYfwdijyr0kT3Wu1LNZP93AXyhqs4bkCFph4GD0igddPrB5cwtJ
 SLE8Z0Hj94599O30PbmqxaWGcDKwpl8evubGvvvDUo9qnFujjaHmzdEyVbVJGsAT9g23
 06hlKbVRew3zE4IWYQxfbqY5/yf+h889FoOBQqzqS2DDJlYqqed2ErBfg1e2FRQMj1BU
 3sCl43FNTZ/cWgLdzbSnCyVGjLytnIrwWAYZDB3jOEZZF7wbL7VH5XoWnkIcWlSil00x
 WYVF1NimFto7/MwtV39GJ9iW9GCP7v/zxWwpJ900USlaLozoL38IpIVS2PdswG5uS+W8
 +q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NyLm4M6sno3u68FwAJ1r8D39ashG0coxPAL+2ytbo8=;
 b=KWsolSSpBqdeAWFuvz1CblLnxLEnDP7xfsN2eBziPHxDanOaZwYVXhoXmHgHswtWR2
 u5WzYiITDpSCO+rdriyXYhoyS+2bbr49DPEy3Az7OtbTEg6Y5j0tOcPZWm9tm+jWOgiM
 wiSWqGv9UuqyvWlG/nHWzITozhiEnKGdrtC/R7H6qxQVHR1oJbTSqMl9ocNeYWIWIsrx
 XGYxRt8X66414TRJTzeTDw+/Lbd28sgWEu64EAj/8sHF1cQhI9ny8wRWTHX/LfBMzlpZ
 G/eCWeRcqHCRgRJ09onz2N0HwDlW6E+k5dXC5OLDI/3AxP7hJgm2UPTOkpsIDfK6yDLE
 LaVA==
X-Gm-Message-State: AOAM532JlRawVXj3YX6M5FME+61udH8w4t6H4bG7E1A3aYqAVC+rF6b4
 ya3xCaFZFEVvM/7V9eHfy2N7uGDvHQxMBcmOuUaSAEXlOCE=
X-Google-Smtp-Source: ABdhPJwaCkUllAD2rNdoBS/S0G1y0aXKEWfHDRy7bbdri1JLQs5273AM4VtJgQ1pOaZbsnf9vhQWoA0ph9fTHhrOsWI=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr5831209lji.326.1622193644998; 
 Fri, 28 May 2021 02:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
 <20210519162409.3755679-2-fparent@baylibre.com>
 <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
 <CAOwMV_zin4ODuv8pA8_tfVyg3g9=Mrt2Txdk0O2wL8JqDefzog@mail.gmail.com>
In-Reply-To: <CAOwMV_zin4ODuv8pA8_tfVyg3g9=Mrt2Txdk0O2wL8JqDefzog@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 11:20:33 +0200
Message-ID: <CACRpkdZmyD-s-J50G8FJPXDyDYEJbLURSCz+DT+H7VFHJt5uLw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in
 common code
To: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_022046_758634_D1976A6E 
X-CRM114-Status: GOOD (  11.46  )
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

On Fri, May 28, 2021 at 11:11 AM Fabien Parent <fparent@baylibre.com> wrote:

> -       bit = BIT(pin & 0xf);
> +       bit = BIT(offset & pctl->devdata->mode_mask);
>
> I should not have replaced 'pin' by 'offset' here. What do you
> recommend me to do here, shall I send a V2 of this series and you will
> drop my V1 from your tree, or do you want me to make a new patch that
> fixes the error created by this patch?

I just made the small patch myself, it's faster.
Sending it out as we speak.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
