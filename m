Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8101CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 21:41:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AEE64EDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 21:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AEE64EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/d+CyxgKzkOsawPAf0P+pxGY4IKzxVgJH9DRknO/1xg=; b=quK9O2CbYv9pDY2r83Qi6sZFy
	XVSxcRWHbkthPL6N9CkwERAYrICA1AETu9cVqi+RAhPyhmWE6gDHfDLuxt/OupZaqGWtDQClCzoRc
	qNQ1RSDQvQsdcF0aBKu7urzi0vrBLnaIuPsvqqmThd7tjb9mZiaVpqb7LFScj9ofwoAzXZMnld4Bc
	jkQVreJY+Xuv82SsV0SxOmH5YF7d0mBEu6cmUW6wAVua6o+ID8GF5NAtEPDabyBbk5KkcootDO1wC
	SrLN7jJqBGd5FCnOGbLXvW5WAvmCDFTNDnPFulc7+SjSpbw82V2ESOsHvNV3OxEM8bXm+2jC703o3
	EEqHTQrAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFOO9-0005XB-WD; Thu, 25 Feb 2021 21:41:38 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFOO7-0005WO-Ra
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 21:41:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id a17so8252050ljq.2
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Feb 2021 13:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMZfr/tKOoxxB+DCAYtgYdWGNraNZZUqKf4iILc1Yu0=;
 b=GDZvyIneiMg5vDxH2jD1JHrH3AsgaytvfXkjx/E7I71t+eN3GMy6C2KFiywKfz0NKz
 AQzIhyZH5OAe2QOhWbB/W60IaPoLCcaD+FKmKzNKcT2/u1AOeqt9rPbYtdh3ldiw4sFq
 WETGM1nenTR3+jU0ji2VJHloz9fHFqWjl++L4ZU39PhZ26P5JJMCoVuquyfTHsG6rvkI
 s9tEnR2uC1aVRy2DCm2m0Bpht6ctaymSo8/zwnEpZwnOpqf5Ximd2uw4o/LnLafFt8Xk
 uUVDt8+8IaALaEkLxJYQGM9pg4AAYIV2FzdZyJLbCZEaie90QBighrCdRFQ5+gteilRc
 e8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMZfr/tKOoxxB+DCAYtgYdWGNraNZZUqKf4iILc1Yu0=;
 b=S0H/SZL+ktR0euwwAW7UERM74qyBKHjbtNTwzz7kJpBGf2eUgDMNQ4IBONjN0F5D+E
 zBdY4xIO6sQVwcjYRqwPCpRsr0GgeCl7Zipl6FhJIHH3qkOXF79Ydos2LoIdQNiXD9SD
 6yOL0FHiSc6FX+apl0NRVSmXnkx9ubth7Al/MjFSkTXf47SF2TbQbgah5xpX99OtflAK
 Mb5gw4PK6lbWDZjjq/h7Qa7NJkbrzv3WihfN3M0gviCMVe0JRig+pC4IMQo02NJPVL4U
 73nu03Go+rePkAF+o4R1q6PqXKjZIkbiUrlfFdMkDUCM8Yah/jSZJPO4zSylCn7p9UnU
 99bg==
X-Gm-Message-State: AOAM531gWbOqaqB5DpLryGWCtfzK6WdA+X5YQV6IYtby0uTkC1CncPCA
 9bSIw6SwDHqDUz31UrA9iJjEDxvxKMAsVY5vM0XVug==
X-Google-Smtp-Source: ABdhPJzpaHHG/VqAnvXltFRPkFieUucDnl5K/H4IFKyZGqzVyuPtfN6Hpn7/hf1abbxGUFA9bMGI9AandXX968J7TYw=
X-Received: by 2002:a2e:b617:: with SMTP id r23mr23499ljn.116.1614289293663;
 Thu, 25 Feb 2021 13:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20210225145953.404859-1-arnd@kernel.org>
 <20210225145953.404859-2-arnd@kernel.org>
In-Reply-To: <20210225145953.404859-2-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 25 Feb 2021 13:41:23 -0800
Message-ID: <CAKwvOd=kk9XhU=jyB3ZZd7bCW+9w6nwXbE48xbtFdBjeTQoj8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mt76: mt7921: remove incorrect error handling
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_164135_980349_8D0B9E69 
X-CRM114-Status: GOOD (  18.88  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Network Development <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Soul Huang <Soul.Huang@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 25, 2021 at 7:00 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Clang points out a mistake in the error handling in
> mt7921_mcu_tx_rate_report(), which tries to dereference a pointer that
> cannot be initialized because of the error that is being handled:
>
> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variable 'stats' is uninitialized when used here [-Wuninitialized]
>                 stats->tx_rate = rate;
>                 ^~~~~
> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initialize the variable 'stats' to silence this warning
>         struct mt7921_sta_stats *stats;
>                                       ^
> Just remove the obviously incorrect line.

Yeah, looks like perhaps a small mistake from when the driver was
introduced. Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> index db125cd22b91..b5cc72e7e81c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -405,10 +405,8 @@ mt7921_mcu_tx_rate_report(struct mt7921_dev *dev, struct sk_buff *skb,
>         if (wlan_idx >= MT76_N_WCIDS)
>                 return;
>         wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
> -       if (!wcid) {
> -               stats->tx_rate = rate;
> +       if (!wcid)
>                 return;
> -       }
>
>         msta = container_of(wcid, struct mt7921_sta, wcid);
>         stats = &msta->stats;
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
