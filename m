Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9023BC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:13:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A29322D50
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A29322D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oD1lppel0crsn7eJjj9q5yoNMxEo9AbSkipnhSEZMuw=; b=iDTYissDalvvCWdJTW48vPAMt
	HE43ZSQZH3LZolCuE8zI1ESYuSHjili7tQ8iWgTc7cQoYgFzB6ux/tYFjyuXdAY+Yl4t5h3W3DezY
	uCcesnhb8FLyk237TznUYjHfY9VAB34vxNkCcVBY7yaFl69IQ3nP4l/kcs6WT/PEKcM5E0NRIHYWB
	y+vEBAMiR/254G0YZi0YYS8AX7NCxmz1RiP/qTWI5Nc3BTzFHyGM60OMxN59pwSEV2ZLGlYXBF9an
	+ICP6/I4Akev5Uz76qR58llN7Pp6pnTc4a3P2fnI1xQ21KZ4RTC2C7JXB+urQvWMyvwwjYW3/5u3o
	p20V8PDfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41fm-00050k-Uu; Mon, 25 Jan 2021 13:12:51 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41fi-0004zM-9x
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 13:12:50 +0000
Received: by mail-lf1-x12f.google.com with SMTP id o10so17601730lfl.13
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 05:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GG3vahY76s4SRL3M46lNCBCKQEIbcfJITvOyi7b/xaE=;
 b=ylsAFriX37XVbpLrF13WtDMR2c5hpD1ojpoIGrNq9XuUCJ+9ZI/nVndYmxlHicPxsr
 52qifpbb0+zInjIDkQ11DvZmSyXZJ/R20DjkOXxxkHnEABVBZbOzGkXPXPB4eqbOlL1h
 LEl0q7mHUumORmwisiHLCkLGZQmH9RHokoY+QyCc/hh+c6kNDGOTw67XXhAJgqmzTrBv
 hmTR9mbudnnkvVb467jCiWzmrVLL3g/sf29ebSobv0ehWnSe9b8HMIFV0j2oH/peWx4B
 J45aJxeAsuAfpcp/uKzeX5SN7xjHAkh2fNG+HCqz4spZ6FkSfx109zCghylojY/728lH
 /CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GG3vahY76s4SRL3M46lNCBCKQEIbcfJITvOyi7b/xaE=;
 b=jKmMhr0TWPAlr2XoHTjlwFjzxqeRGmm+tuSjr0Goxi4y8qKIzj9hIiXuhSHxzDg4rL
 Exn5qfKugqB81CZ7xi6IeQCCgJJfczqB/nOhfIUIGZNcwGmQavA9+6SFBni7BbG0glVP
 F0diIwoEydjW4jJzGjZlDPN5K7E0KBfB9umDSboOm19l/XaSxAgAjbNe9tiGbR6Z3w5M
 Z5oISg1ONw00fWMOtPn8mEIPHXji3mBUSwI04j3ISahs/EipU8Nmt+oWEg9Lwkt+ku2H
 YorzYVzc+dFOrjhB/CloZB9c6gKYfLozLYMxWMMvOvV//Fd+AtXh7gmfvlYiE6a2DpqH
 4UPg==
X-Gm-Message-State: AOAM5322uKIBAemiLI+nOACwZxKA8LN53vXnXgvqkkw8O6+3OC7BhfTm
 LG728IV2QcG17xU5nn6e5nkugN6IRzdNtnczMge1Dw==
X-Google-Smtp-Source: ABdhPJxDT3XMILf8kQD/47RjOiNlQdTecGrpgSBvjuTehZg5fGASxkkq8PKsR78LBS6XWePVlhcSeupwkL3gjJrh/18=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr255455lfl.29.1611580364908;
 Mon, 25 Jan 2021 05:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20210125044322.6280-1-dqfext@gmail.com>
 <20210125044322.6280-3-dqfext@gmail.com>
In-Reply-To: <20210125044322.6280-3-dqfext@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Jan 2021 14:12:34 +0100
Message-ID: <CACRpkdZtgqABQc5qDZCLLJKXvAEugLKM2RCKia9hypS0A5GkDw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: dsa: mt7530: MT7530 optional GPIO
 support
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_081246_358289_AF872F4C 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 5:43 AM DENG Qingfang <dqfext@gmail.com> wrote:

> MT7530's LED controller can drive up to 15 LED/GPIOs.
>
> Add support for GPIO control and allow users to use its GPIOs by
> setting gpio-controller property in device tree.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
