Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A9FC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRCQSo6l4zJ++6phjTX6BnXETYs1Dv7j76EcPfueoIM=; b=KEdMFY+BAfrt7YCs/YNvonqRUc
	9J+EKr2ObnMVC8vtEnQSb8rFz8XY3pGfC3A7+HILhDOEsekyU2TOyUzq2LoDjGaiLjzByhtioT3/i
	TeCyM//4ae0U664tRuOa9XudQA7blsKMfAFkp72vZxwr69oNZ5/1ip+XLC0NtrJb/v5K9zqrIY/gM
	C9gHuFmjnY+PUJ/zNTlWDgLUNLaBmDqbsFSmzrb2FfyXjez/iFQALYQrU+AIPna76aS7l/M/gmbCp
	tmEbqralyBhJJ7dRtTi99EwPssOBZcWoHwoEqzCsCtdvtHZ/CfhWvKRyv4QOO3oztkt/Tii0D0geI
	vcDborDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQc6I-008tfw-E1; Tue, 23 Aug 2022 22:10:22 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQc67-008tcZ-Fp; Tue, 23 Aug 2022 22:10:12 +0000
Received: by mail-qv1-xf30.google.com with SMTP id m17so11598292qvv.7;
        Tue, 23 Aug 2022 15:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kRCQSo6l4zJ++6phjTX6BnXETYs1Dv7j76EcPfueoIM=;
        b=KUSvkEThpk6P/ZesUxxvBZWaLlsiCeTkILRawlUZluJmyxfTJ5cum2o48WpbLGVRaY
         R41irTzezKFB/7bTmwd/rx4AHeN/y9cn7dJy85mMEoCfiYChBrUfoVypjcbJW6FC6oxV
         ey4kBqVNSC3pfQjXCwBCDLoxgxoe8jUFKMQzXVZCr/YUrPG70/4dfMptmCoX/inzluHK
         UKiHmfQVeTJKY6ngdFLni0vrYVbuwxOojHuSH9kPU3ocndZ3wLNfxXehMbI2awI2NwBW
         AhfVzAJmtn14rDzC1sSeS9JNFr2m13YOCo5JBsTNCDmBub3pDPHOB4wpbV3ZiES3+TUQ
         cSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kRCQSo6l4zJ++6phjTX6BnXETYs1Dv7j76EcPfueoIM=;
        b=4OwiSovyk1/1kNwiEGn4pCLVt40vPFtX1FiJmPcf/NM2WjZGlAvtwlN9bY7OxjssN2
         JzjH/zsts3UxAW9Eb5KqAxv0psJww+EqRUt+WvugQZUJQ7Gr5t2PmcS4AmO8mWnVWryf
         YZ2Ky0j7On9l1oBM6C4oEFfDnoorPwE1M3tZCZA7Yc0cUM1NWDtnO5CuUoEMoPxMvEWW
         grLbMMaECoRp8xGmIt26liBsK7grv2k2iZgsynYnZXvcoqQJKAe2tj04TveNWyGao+2C
         VTh/WgO67hiBe4FcUD2VlXnA1t8szHj7CLENjZtWs+QRb7rb7gz8qJ9JXHji49A7wsHS
         lg/g==
X-Gm-Message-State: ACgBeo20IJlp0AwmADpcS8pCRFhR08OFkbOnVrjFDRKmajstmhFUG0a0
	IYaUfVkT7jFdbr/rv+jGn9Lljp9kFqKBI9IYDR8=
X-Google-Smtp-Source: AA6agR7e8DszsroSOTOrtOTMDfu6d2xbEVOQPEuU6NWJk0zIdhPqX8oKoqMIXH84sbQqkWkDAf0f/5z9V5M51lMZPZI=
X-Received: by 2002:a05:6214:c22:b0:497:10a8:3067 with SMTP id
 a2-20020a0562140c2200b0049710a83067mr1372524qvd.48.1661292609347; Tue, 23 Aug
 2022 15:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8ezribLQbq5ggv@kili>
In-Reply-To: <Yv8ezribLQbq5ggv@kili>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Aug 2022 01:09:32 +0300
Message-ID: <CAHp75Vc50W5m7G1xK_zn0z2DeH+a1vPtxiTWE5KjXyQSuknvqg@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write functions
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_151011_542394_64CA7E51 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> It looks like there are a potential out of bounds accesses in the
> read/write() functions.  Also can "len" be negative?  Let's check for
> that too.

...

> +       if (bank_idx >= ARRAY_SIZE(info->i2c))

Okay, the index of the bank comes from arbitrary data and here you
want to prevent it from overflowing.

> +               return -EINVAL;

...

> +       if (len < 0 || bank_idx >= ARRAY_SIZE(info->i2c))
> +               return -EINVAL;

Ditto here. But what I would do differently is a check for len.
Instead split the assignment and do a check beforehand.

unsigned int len;

if (count < MT6370_MAX_ADDRLEN)
  return -EINVAL;

len = count - MT6370_MAX_ADDRLEN;

-- 
With Best Regards,
Andy Shevchenko

