Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5349CC4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 15:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18333613B6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 15:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18333613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRA6u3i8xHxtogGExke/hHeusLiyHG98nqJCn/qVc3A=; b=fSBH3Z60x6vAID
	+w+820TG6TaR9R74pHACqPoCOHOCVAdQb3jhR7y5DWUrOcpfNhlYeHka5JO7IBMMEKK/v08svNrU/
	ixWizULiL87D7AOJ0VC9hYgCFX5zKWhaLEpNRfSiyPVnSUzv2c1FbGRF5nEGAHECB6dcHwmFsS2bq
	saLT0iENR6O89DzmjJA5APLw6FCcuR1t884HuvJYU6OWqtThu7Ec2gne9ju8S8ELo6SRhYvCd/sSZ
	a4aHxCXebFykhBcl87ASsq4nR3AYsUEJ0RNyU4gmEtsRDqNNX3LVv19Vu92DgMSLRW7ZsRUYHcbAB
	6svfMK2lqx7/Ptj0jvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHyw-007EeU-IN; Thu, 27 May 2021 15:31:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmHMk-006w3e-8G
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 14:52:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id r5so512837lfr.5
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jqOWEVHuZGkfA6MD8Z68F0r2FOE/7+7mfKMuVI/ccg=;
 b=cJoEDb4CQ/mHG5hJsPhdH+w76PE7kgmJxWhbPuRqPqvqTaEib07YsiwAXxRgaLuM0+
 /bKteq6nUzAEouzLWj9/mJJCmYoGxyisr2QDmn5KYOcDs0m4/dwPxdSsczE7qsZsc8K0
 U3oAGI1C8St8Aalf/NABCefTVRYf6G3kYRaUeWDu8G5pLRxzT0Hv4U9yWMI8kOE8vZd5
 VGU7U9oSdwVl8I2Qv6PmTHaVqzWJm7tjB3YYFJkOqzD3Nrz6poXMtRbx+ICPPy+9zPsA
 TjotsHzY9phpNO1B2bvHVe22wACZlNtJBsBnufuS3agHuoZ3BDjmLeQSH5JT0ryyChOF
 MpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jqOWEVHuZGkfA6MD8Z68F0r2FOE/7+7mfKMuVI/ccg=;
 b=aw1dCGlMlt9sr9CgpuKlsD5Trh3xmQoD/0bBmHhE7c9COzQX4ik4uI8gCXtzfwdMdy
 ApL2ytDqV0q143xQQ+LVgZRCmeY50hIF7rP0K3Hynw63DjtMzAetny0KN3qFel/sDEh/
 kdJQ7Ndu+G4PgAo9unH430ZZcn6PBhj7BF3GOuRi9h+Of13oVT6uJEaeU+gJHq1EOPw5
 mrwRxFDIzTg4NkEwuXd5VY1Y26ImXaQuY7xHZguF1e4y8PTlRCQ+74jzBlqYxgjOGUu1
 IASGum1Y9Xxmi+OVyt7sb1GYlcZAM6+vKvBAdfZlQvoXuefzlG8ICktGCwWF4yCpWJUf
 RaKA==
X-Gm-Message-State: AOAM531FJCqY6eNyXFpuU4loB8FVpl9uihJj7S/N33+g1KXdoug+Qwh3
 p35liMXgfAcm9ijxZl8SE9d4I8VfhwWF8BBHzh8rHA==
X-Google-Smtp-Source: ABdhPJwOz7U2P9wcNokB7S5LqfRAKa5kO1E7gucgX+G5ePQajC2FmgoKGqJaaeDH5utID4W/FYcBSXnMCsWi5qkepiY=
X-Received: by 2002:a05:6512:1185:: with SMTP id
 g5mr2652587lfr.586.1622127121750; 
 Thu, 27 May 2021 07:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
 <20210519162409.3755679-2-fparent@baylibre.com>
In-Reply-To: <20210519162409.3755679-2-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 May 2021 16:51:50 +0200
Message-ID: <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in
 common code
To: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_075206_327981_830FC21D 
X-CRM114-Status: GOOD (  11.07  )
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

> MT8365 encode the pins mode differently than other
> MTK pinctrl drivers that use the PINCTRL_MTK common code.
>
> Add 3 new fields in mtk_pinctrl_devdata in order to store how
> pin modes are encoded into the register. At the
> same time update all the pinctrl driver that depends on
> CONFIG_PINCTRL_MTK.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
