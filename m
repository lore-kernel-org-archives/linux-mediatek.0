Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DABDC54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUWQ4N8aQ4jL2fjYy2Ba7XeBW0vWjhzL38iFdr/etLQ=; b=0po6QdcveJIpRhmo7UVPUWvrM8
	8c2OrTZzW4EAflb+l1UQmcoO4HU9nGGDrepQsBhAq21C3GM1/0EV0uADj2+s4JKg0TGu9i1+uKLcF
	5uTtgmLnmTjXujuKSJqvNBb6CbKE6QBVgan1RDbUAd4HqoMqwUNDmx2wBIezPGmNt8mBjS4gMqJoj
	W68Zs+GOm4gLhtk+VmDAiZtej7KVkf7akhOAAG5J2IzPyf6a1GOsVWZnAbondQQGaYrQTx4XodJoR
	byy0Dmb4WjPJqdl3jtdG3L7AaAzQbIGL3wWJkq3oTNnmNQ+J1ydVBCSSwIhgfS8ZbgeWmexd3Z0qc
	4YgfHMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rokF3-0000000HWDb-0dR2;
	Mon, 25 Mar 2024 13:19:57 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rokE5-0000000HVgH-1CZT
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Mar 2024 13:19:15 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so3545181276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Mar 2024 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711372734; x=1711977534; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUWQ4N8aQ4jL2fjYy2Ba7XeBW0vWjhzL38iFdr/etLQ=;
        b=G+ZqEYEedOBYEOp+jmlkVn9x/0ECQORneBuhW7kedg+gYBIpz9wF/aN9lHu3cIvJTu
         Bwni2zbT6jSbJ26lCkQs4SAV3hgx9eHIWIOn8HN1ci6q24NoTQ81TSghpf6wajKezTMU
         q0TXPsGmvoktBLVg/uoqbaUfMS2sxEvrFgaNj9eT1bOVgxL42koNJPKcSpPkt8LkfoCa
         89pUcsvN951P38B3DRB9r6ZjUgayb3Z7CunvmWvGRn47q1VVRJ6I5stN1p9KaYY9ZLZ3
         gzbZWdWqNIskm0U6mrtTvD++HFieXLGk3LMquOdx/OXIItf9L4VDxk+mJzhd15y/naiA
         o7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372734; x=1711977534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUWQ4N8aQ4jL2fjYy2Ba7XeBW0vWjhzL38iFdr/etLQ=;
        b=ZspYcQlKWi/vLMg43PyAP38IGDu1bMcPazE54kL+/0RvU6oHy6u9KLOHK218Ao/sKM
         0XMjEQ7ftzfMw0hHaZE8Dmn7FO64jk+CBoACT7C/ka/Jel80D05/oqlC0q8r0Lb+kg4Z
         qp/uSH+jn/nlXkzzO5VmicrmNhBkHNRwUUwj+xV6ktWZ7sWAAmywttKhJTCNWb2c7MOG
         M8BLcrqnkHkGD0DjhlNTeLPs/A36Aoz9IFwX9FAsbNfzwHGoVN4iua6jolUVCrndnvp8
         Lx+W8hjzu1KCrMrExbP7zDYAOXJYM2eLhU6lOz+Qhdg5iMFSTT66xSuExFbo4068bzfs
         s5+w==
X-Forwarded-Encrypted: i=1; AJvYcCUp2RJhOSPrhuC3Emlhjk6p0vxlEy51zS3f6cTqckDJhx3MSn2P8BEbu4eyIdrEPdhEEAkVnfRxFKjw3fc0wjQA6HndvNPgrZaxZ5/YFGTVzTw3
X-Gm-Message-State: AOJu0YxVR/SdJGiw67BvphXnIqIxkWe/MX4vput0mtRugFwJVR82oENX
	2W76rYZVtC3yz6hUHYcRgpcyFD7PMEXIb7H2eXtwFmeop+mCE3XTPUNJ7shH7yHvWAxah97AdEY
	V6O6LSwxe0xQThle8lSsEEZjAbV59TxxS8xnAeQ==
X-Google-Smtp-Source: AGHT+IHzTD+eD804dUyrAtAijJPdYapsf0OCnAi6GJ6Hmffr3CDyQqbURkpBgSiWK8ZFwu+EzGqtOUIM1EiwoY+Ah6Q=
X-Received: by 2002:a25:3618:0:b0:dcd:6c0:da64 with SMTP id
 d24-20020a253618000000b00dcd06c0da64mr5239723yba.58.1711372734085; Mon, 25
 Mar 2024 06:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 25 Mar 2024 14:18:18 +0100
Message-ID: <CAPDyKFr7hQzOzVXK7Nck9jn=PSyJF652rJfVPVayO0mzGP14nQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mmc: mtk-sd: Remove unused of_gpio.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Axe Yang <axe.yang@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_061859_334178_682985A8 
X-CRM114-Status: GOOD (  13.91  )
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

On Thu, 7 Mar 2024 at 12:43, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 1634b1f5d201..a94835b8ab93 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -13,7 +13,6 @@
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> --
> 2.43.0.rc1.1.gbec44491f096
>

