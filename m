Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E03FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 06:06:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438BD611C6
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 06:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 438BD611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqWMltnr4K9e9EmZQ03/fmsHebkLQ4u6kyr21ErUM8o=; b=DMov8tPEDPioC1
	FG/euvQPBxAXOncszlYvfQFyMpBxi5c9UKtNZtp0krV5AfinPzechmKWfrb0Ifsp1OsvrA0q8Pa1U
	0qlWn5oPO6qde7W47c8j3hUM/4c9M/2AfcLx85Jo1el23d5UgBhnaM1HJBG8wymaf3iZM9XAds43U
	V4r1O2oT48b16YfbG2rRZGRJHOykPq7S0Dlyx9yHhrItk5LZCCBX6PFAEC2xzektrt4OjLs3gT4sf
	sFpQp7BAaoEzkPW85ypzDW5Qcvkiw/vvZNVfiI/K1ZlLFxq6g8gu6mFlOjCqPrqFo8mrh/2PiI3Qh
	Xeo/xkjY3KbzM0DAAdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQkWy-00AOaK-S4; Thu, 16 Sep 2021 06:05:56 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQkWv-00AOYl-F8
 for linux-mediatek@lists.infradead.org; Thu, 16 Sep 2021 06:05:54 +0000
Received: by mail-io1-xd30.google.com with SMTP id y18so6617102ioc.1
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 23:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRejp9fBUz75pPpYulgRWk+QeXX34u+JOl4cIXv0kwQ=;
 b=Ak2Cz77sR13TPwLNmj+ejAQtCOz/tpJM5fKa5WU3P2XhhZ1SBjSoZpPzRyKtqaG4UW
 /Rw+8IS752mpR+6WXOLd8JORjuV/CeG9o1TMuRFFKusIO1Mhtwpt8I4vtmkaoGS0xrKz
 DSHXfqZKE/MU93UvjSuOnJtR0YqkWqkN7Qnso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRejp9fBUz75pPpYulgRWk+QeXX34u+JOl4cIXv0kwQ=;
 b=KKQbLztRVlF+H7+J7WLhIpbGEtYVt5lLd08iX1dtF4zWCf1WaoDFGr1jLMe1MLIE0V
 i/27xKFoyGRRPb4ipwAG97HHw7q0JnTKK9FNcZya8yK1reX9OJxz8mFIJLS/BmiPsKmH
 Ws7jWpyEd+uQEHvWwj4PeJ5tUxYgw6PI8/OnYFRBQ1Kkw9NsvvHHqCg4tUT5KnTxjFyQ
 4ErcsWfMn9N5tH6AG2KQezVeT46yDOWmGFxa3qmq6rBnIKX3HbgLry/wKevyvo4IFmu9
 1D5RShP+/UJ6H21hKE9XjuXEhru8UBiKABgLxik5+Num9QiOwk+QMCNLvaUj91Lk7XFS
 Hyug==
X-Gm-Message-State: AOAM530tgb4D4JN3LnUgk1t0P6HEBW6XSIcoAjfO68mOlhdCfyhFyGov
 ySx6zd6Nrsb+gJuT+oa60pvbG4HZpEKAF0KIDxPw/A==
X-Google-Smtp-Source: ABdhPJzcMvw7GIOLJbLQphTJGnIr//LRcPOzFAAYapv3DkK0vkAJ/RP30k6cM5fcM0Rc4NCdkSmCSU5OA67W1fV860w=
X-Received: by 2002:a05:6602:1493:: with SMTP id
 a19mr3013814iow.55.1631772351387; 
 Wed, 15 Sep 2021 23:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
In-Reply-To: <20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 16 Sep 2021 14:05:25 +0800
Message-ID: <CAJMQK-iyE6myo4KVBYz-0V5HHXi89Eix8fB1CdfvXFRk0fJG5g@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] soc: mediatek: mmsys: Add reset controller support
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Eizan Miyamoto <eizan@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_230553_550796_A6D79C23 
X-CRM114-Status: GOOD (  13.54  )
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

On Wed, Aug 25, 2021 at 6:26 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Among other features the mmsys driver should implement a reset
> controller to be able to reset different bits from their space.
>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>
> (no changes since v1)
>
<snip>
> +static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
> +                                 bool assert)
> +{
> +       struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
> +       unsigned long flags;
> +       u32 reg;
> +       int i;
This variable is not used.

> +
> +       spin_lock_irqsave(&mmsys->lock, flags);
> +
> +       reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> +
> +       if (assert)
> +               reg &= ~BIT(id);
> +       else
> +               reg |= BIT(id);
> +
> +       writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> +
> +       spin_unlock_irqrestore(&mmsys->lock, flags);
> +
> +       return 0;
> +}
> +
<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
