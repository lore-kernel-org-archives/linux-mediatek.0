Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BD3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:57:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C97255A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:57:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZfyiHOIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fv7aRCqC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90C97255A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A/GkM+Gld9+2eubRbz4APnOHo98nZ6149cJEMm9qFXU=; b=ZfyiHOIhckXHjX8bNKe4xZEzm
	4FKI3JbVlkYj4PwVsF8QRXjlBtHvMcWObojBpI+ZMgpkh4ioLntCX1ADCik9GIUeWgjD/EH+oPXl/
	F6zFOUfiWv4/0PAXV17PwMqK4tppXih2wZCLL6tBYcVBMzGTKN5VaBb+8M4r6avkFKgzsYnw4cEFZ
	4hkWySX3XXXIjNWESa8RftlOMloK2yU8VoqTXlG19m+i+Tr35WYUG8JoPnvSqoxWgucgxBdVRWmBg
	D5Y+thcXE8aUdrLTHVyj5rrUnbo1RSzWPZyZX/yp3dLgVQGGhkRiiw8Twl84n0cinEebIFV6+Km3R
	t01LHGVDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpx64-0007vx-B8; Mon, 29 Jun 2020 16:57:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpx62-0007vl-Hw; Mon, 29 Jun 2020 16:57:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id 17so16765907wmo.1;
 Mon, 29 Jun 2020 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3obcgdSNJ950EKSMUHcl2JGdbtcQqgCIBNGkW8RhMSo=;
 b=fv7aRCqCGXOKYruNDHJqiZ3Y0d/rBS5koxd/2S/q9TNDUy5El4Px3n27rId0ZeYuO/
 eK9wvTAHTmocgawJdsMzG6VQQgRFqO5aiVRAcbPGfYRllVKg7BrR0UxDm0CpFfUDV22m
 J3QJ/sdOwdfKZfkLpeRRSX1fYIgCpVTUD0eV8ROx6Q2wdDjMhQeRxF+qhMImmTGBOZz8
 RE66N5JFiDq+5v7S4S714LzndpGglVhOwfGk4kCyZ1xxyq9QVCrVlggU3aCBCc0YXMhh
 VwQUqnReTgiNdQKzT4nz2JPE+HgLY1g5BtRZHZmkESQhR8uCHiMd2bBM4FHcKrl/1Ymq
 25Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3obcgdSNJ950EKSMUHcl2JGdbtcQqgCIBNGkW8RhMSo=;
 b=hNokjX/NgzG6epmB43CCx/R2HpcldEBjjwT2MXULCHszkm9F6N/hOa9nJ2uCahp28F
 tJxhBAfjlPk+b6BaKMY+CFZYmn5mQm8HN8LeI0rNAuM5GDXIZqfuENOUTI+gkNrUclmb
 w13sCOlX/jXfxyfVa40mlCTevZXbvAQiMNwoVWQ2q/+AY0PGFKRscuzbahBW2DRCppRx
 7WgY8kue3kJXaLmpkP2xCJ2H2mIBHNZ61XtxxKmGDfa/BvGzTqRtUFTfxsFQiOe+MEfh
 R9054xi/gwYebaXnx+yZ7G8J3ls4lP/KFsodniKLpJIx43PbFawc6WUh1kUYIjDk8tYc
 5cOw==
X-Gm-Message-State: AOAM531zXZVKFu1nr+LaW5I5U03bWbtiN4RCbluuyKy/NjpHNTSbzzat
 cz3lEoNB05upuRnPFc8LDaM=
X-Google-Smtp-Source: ABdhPJyWcHGoq56ob7aInZfnE9bycxIPoA/yOToZHS7KefRXyZmz6cGV8GPTRBK/aIqAGXteb4DbUg==
X-Received: by 2002:a1c:7e52:: with SMTP id z79mr18277828wmc.104.1593449849236; 
 Mon, 29 Jun 2020 09:57:29 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id f13sm390904wmb.33.2020.06.29.09.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 09:57:28 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] Documentation: devres: add missing mdio helper
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-5-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3cd5bb70-ef56-c0e4-9c1a-6663434d8b30@gmail.com>
Date: Mon, 29 Jun 2020 09:57:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-5-brgl@bgdev.pl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/29/2020 5:03 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We have a devres variant of mdiobus_register() but it's not listed in
> devres.rst. Add it under other mdio devm functions.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
