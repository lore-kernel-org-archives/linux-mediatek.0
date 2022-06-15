Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F83C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPjP9p/uVKjgescd2V0zdX2+EdmJKxQJvyV74R1o4jk=; b=Kh4szIcZW7jqDbfqAQqWh9y+/y
	l+KYpYcZ7ANSX11bZtnXu7BUJDbBsIDE1daoGNhMCnEtZqKB5AWxbXm5IUzE9+vqOpiJNZsVap7z8
	yUJfPGi1x15C/Q7oKbxJ0+CTe0bATwukTMSI1qpt85ns3mdc1puYa1jjuP0phg8lB39s0TCghfSE+
	3kwg64rZUAkrxVzrax+pNeQU9jXCrey1E29TKPCka+CXwJAs2jeVump2H+RUu9Ite3LS8GI5KwoYD
	CFjnWDkQmq4PqlJqh2PGlvg/AuuT50RXoWjWfkAdNaJoU1Wn0kvUtGjF/q8IbXmz/F0wtH2HgZIh6
	ODawSFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bRt-00GfsA-Cf; Wed, 15 Jun 2022 22:25:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bRr-00GfpP-07
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 22:25:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id h1so11546525plf.11
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZPjP9p/uVKjgescd2V0zdX2+EdmJKxQJvyV74R1o4jk=;
        b=jdoU6/kwxsiyhuP27wcopcyJgsLTdAyVDdJin0zRGKDDVlI0xRyt+YxX0js4J1BqLN
         dNj+dY7znGpUHqeMyYFyH53XWuQBGg4rgvZ8yWVJ+5FCCnBr6kcoQMCV3ogLgrYkeBzV
         xL6+27q/oYPdd11Js6mxp9nQk1KxdI0xYWNKPzLOWJEol5NahaU4l9eLRb7J9oyBL5ej
         l0h0Maj35qZdfbE40NmPvf2kkmy7SeahUU1w5bL2czOY8qESszurIrHcWXXqlHzAcf3r
         HTOatDEXJXftalCP9F4BVj7cenhGtebJLg/HFJKsz1tqC1+O4qsHSpXUdWgo9tJXxQuZ
         /8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZPjP9p/uVKjgescd2V0zdX2+EdmJKxQJvyV74R1o4jk=;
        b=gHtOAHgHj+MuTYukbCVBQOnL54hPvjvvetWqLy/ISmEKVcfU7xL73GHAQXeByMVGs5
         RQSddGMyJNfwQuU/G7MGNUSe56Yvl8Kyo3XMeFiAgoUZyvkx7pUggeTvI6WSaspFEaH8
         xD9IvJAdgXqb74jJnmnY/0z9zpAkRF28de+zOcRLM1/RYZg/azJoLx+EiT1EalBzRG8T
         0xjrj30WF7cUTOHEBfAfbg5IdGTblo9x9dOjVBDjcRWWGuSIPRVMjySTMUt8R8X0SRZg
         rCMA6xsd77cRxPuMz5AuL/SaKbElOYtM/lgvnQia+fyyGiOz7El/zTAbgkyyYdtFbDla
         JO7g==
X-Gm-Message-State: AJIora+fft6Gz0nbWrrP+xjR2dD12NZGNQkGVvabHdnjuDZSyc+V7TL2
	obagBK15lOLpLZmppBv4PHW7YA==
X-Google-Smtp-Source: AGRyM1v7iepztO3D37M5/039LZHAq3jQ9KgC7Ky8PJSj47BCCc/5TtWJHzrR6q+A/NVvbhWIdeTTNA==
X-Received: by 2002:a17:902:8f8f:b0:167:7fa1:60e2 with SMTP id z15-20020a1709028f8f00b001677fa160e2mr1434948plo.121.1655331910615;
        Wed, 15 Jun 2022 15:25:10 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id ji5-20020a170903324500b0016390e0db7asm135292plb.121.2022.06.15.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:25:10 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:25:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/7] mfd: mt6397-core: add MT6357 PMIC support
Message-ID: <YqpcRAihWIba6jmr@google.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-5-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531124959.202787-5-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_152515_078112_D3B57111 
X-CRM114-Status: UNSURE (   9.92  )
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

On Tue, 31 May 2022, Fabien Parent wrote:

> Adds support for PMIC keys, regulator, and RTC for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/mfd/mt6397-core.c            |   44 +
>  include/linux/mfd/mt6357/core.h      |  119 ++
>  include/linux/mfd/mt6357/registers.h | 1574 ++++++++++++++++++++++++++
>  3 files changed, 1737 insertions(+)
>  create mode 100644 include/linux/mfd/mt6357/core.h
>  create mode 100644 include/linux/mfd/mt6357/registers.h

Fixed the subject line for you.

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

