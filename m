Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA93C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 00:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rETJ3dIuJB5oSZygRA5HDqemzFDE/6czHQjvfmQ4uuM=; b=rm5xvN7Mm279P/
	vhrB+9wFoe9fT0i139JCDOYu+Q50EorEJc9fQOTzLYJFNL3wnchheq98zJMm8xAsusGC/6uLHayJl
	hwWPw9jF5h6cYf2JKOkOQVVmXor7vTZ/CH175gImcWejl+Rd67ocT0mrE4Ka2J129dW4iC167LVHO
	xCsOTB3TwSH+RI37nV+1TFPiLVraQ38VStGBLJl52gKFikvF3PCw9361e20/TBBtLytIO09q80tlT
	c6aMcja5j0+nKUOB7XhfSe1gT31pAh4Ms3BqKmSOhgOyYGX0mMi2kwq8Mf49LK5e4p+f6THKzOTXw
	5Qvhizcx7zxIpZrEprUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDyEe-005fH9-Pk; Sun, 30 Jan 2022 00:38:28 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDyEY-005fGa-QR
 for linux-mediatek@lists.infradead.org; Sun, 30 Jan 2022 00:38:24 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id i10so29533855ybt.10
 for <linux-mediatek@lists.infradead.org>; Sat, 29 Jan 2022 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kD5EeMfWUZCSsdRFixk1so34OOReUXkCj6tRRq5J/Uc=;
 b=O4Tw7KGaXWjdqt9T970Y8/kH7N+ViE2uO4IeA3UWwfb5LWDhLAgdQ13kGqqCFktiMk
 4Vv7jQT52fSqMz5OkdAC4KjLplOciEm3LyV6cOLM6+pAEnWGc4o6mZJDCbioWpGVOUG1
 2lHSyAOBMCN5Frc3Cdsg6bg7HxZ6b231c3GvytE0674ovgf2FlDq0ID6gg9gLJDi45+I
 pa7EYF80KoI9HtvPwgzfHMaG8Zw3WLlC+MOQe/xA8bSx8j0mMvs5X1TcC/ArieNb5T2Y
 ho9dk3Xhanq8jicrHV0bc2yPvangtdehWkknv7962AdwCimsA+Te/k139zwe+cHAzd0y
 wkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kD5EeMfWUZCSsdRFixk1so34OOReUXkCj6tRRq5J/Uc=;
 b=4JNo9P31bapSwm8Xe/fh4/xN8tdhxtiAJF8VE9aBkbL2NMSXYX112WjiBvm8+WHr3E
 K/uuz3RshqGMP7d1K0i16ih4zaA7ty+EnYP8rNS6kYnPBDFS/6hkI7QUsRd9WWVmmu3Y
 oGK1t3EIVjX1b+69uOeRW7oly+9iF+oeFoDZ9ajhnfxKrVhc+OwCxEwEeLrz5NxSB+aj
 YGHiIiiXdZ42FhuGwC2gvtBdEWqWYgTigRVNBwzfTBgS6AXowejTA2RFpMV1LHiUha0P
 6qT0PpXeN26aenuf0iZXVAvawpnqEscVAeizZQzQ5BM4NKAf88yGqKHWsYxExNH4+ej5
 TPRg==
X-Gm-Message-State: AOAM532mkijvQokex+kBY4IosnEQZ6Uwm+2Bxs8clvYk5GlnKhPLosug
 gEHXMgBqCd66I/9Nkjv934fpTvsab2r9RRlu9Kpexg==
X-Google-Smtp-Source: ABdhPJxrsg7lw1QYllN4dx+IUpwLh8pIspc1kHtZgNyj3fI5O7+wptcqpiBXNZmBeah8UrGe2QSTVaJBq7sQALlEU/w=
X-Received: by 2002:a25:cfc6:: with SMTP id
 f189mr21225792ybg.322.1643503102047; 
 Sat, 29 Jan 2022 16:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20220112114724.1953-1-tinghan.shen@mediatek.com>
 <20220112114724.1953-3-tinghan.shen@mediatek.com>
 <18f7a647-6153-6d38-dff1-727b9592b01e@gmail.com>
 <102ea6303dd16fdf9ec931d0a1845a93afe92545.camel@mediatek.com>
In-Reply-To: <102ea6303dd16fdf9ec931d0a1845a93afe92545.camel@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 01:38:10 +0100
Message-ID: <CACRpkdZ194_7+mHauDPwMHG3TeGnp2ENdcSDjZnWny1X4YTT7w@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 David Matlack <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>, 
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org, 
 wenst@chromium.org, chunfeng.yun@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_163822_901465_E0D6CBA5 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, Jan 25, 2022 at 7:21 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:

> I want to send next version to update the CC list of this series, but I'm not sure
> whether this will break the conversation between you and Linus.
>
> Is it ok to send next version? or waiting the response?

Send a new version, I'll apply the v10 version!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
