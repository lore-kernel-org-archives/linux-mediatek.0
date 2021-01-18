Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EACAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 14:43:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D986022B40
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 14:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D986022B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dvob6aZaxkoDUWYsdtLKo+VUdA4ukLwAzDw9EA1ZKII=; b=piOut60jOTpMh8b0r69LjCIGa
	FYdeGTBVOSWyhiCzoFviGu8holA/lt8q0cWsoB0IUGT1lAyeV2SxQ9sxZAXIz3VYuknn8B/W8oMFg
	kt4u/Iw3DyUXOzNfGfp/a3gyT+14IPo26ZelZuZajXj7UH0cEEw/K4NW287uFUY1b33T+85LRqH0X
	5OYUrC+pI3cuEhDI4FgwJcYHx1dnpJDK1sEok0AiDmgpWb54eZKieKhsP7gbEwevugEvBtpoa+hGh
	6vVeLLLqV0BIf9NGpDNhEXQQQj4uizHx22YPK2WzkLMFMOGyhuCZ0ljMtNq2qLqhu7mfv+Cm6RgW6
	l1wRmS+0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Vko-00080L-Jb; Mon, 18 Jan 2021 14:43:38 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Vkk-0007zS-N1
 for linux-mediatek@lists.infradead.org; Mon, 18 Jan 2021 14:43:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id w26so18468225ljo.4
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Jan 2021 06:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=runo5vK1iqFTp6/RwnDUEbOVNz8ibclO8u1aZro9VKc=;
 b=twoDGBDgrvw/4Z2eIupJoAhRxuYzGgcaExa9KOHpEypH1Vk9381GnGErvyDNSjo8f6
 lW6pf9vgJurz+efm6dJ4OURkT1cE1oVfxeXOOn5+gKc7iC+AIW/nbee7s2JjHZOSpKOm
 r+UDYxdvmLOiKQRfR1AFBtSbWY3X/F9rkgam6a2/uhrIYc9WvZuTiyBAW3Zloz1SJGz9
 dQW/peQUHGiUVkjXQJ3TVBOYM+zTMmf2nSeawPhThpJH+WT5xmQGEpKUBUI3zIO0ecxJ
 hQJD1nMNUfnHh/V1xWVhUBRyf2AY+atyGgy4uyiwYQw5vF3qvBwN0jdAk0+W8h1yJFJD
 ppnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=runo5vK1iqFTp6/RwnDUEbOVNz8ibclO8u1aZro9VKc=;
 b=D6vzm+ZSfUn3GNzWDRAqAQwcfOA1EkqTVTRJRZWiT4klD/7Cen4PyoO+s6/14pxRil
 oP9qIeog7ilH/TqqRPY1FrynQjCIDwZ2xbkofbm7x9euHGgrW+iOQPwVKz4KRJTHXifr
 OllAjs0aTEEF4eS+/cT+mIn4JU27cs3PotjDMjf8Z6ioyQxbMGNrNBZYVDY1DX4dj/tk
 ZbsIP0C74mMebgmmp7eq42nyN2CJeVQzU4jiv94vqrMNzOXndhl9Fxb6tfDTm10kbDlX
 CJ3Y4V8yeyefT2K86+rtJD10AOuR4PztcIG19PBCoVWZfv4vYtT4wH21INHwNvSX9EYO
 GsHg==
X-Gm-Message-State: AOAM532vLy2R6u7gsDKoHYzBDcahrh/1lu8xknF7+g373WtcThSbyL1S
 v4QL1OkFYAArAQwM14LGMWpumTDg9TIgxgME67H31g==
X-Google-Smtp-Source: ABdhPJy2OOVKezjRgxxe5iT3gY3n3WlV9ouw3Rb0zCDWbrU5ySb671mcJXZMhaBCBrs5KgGrosV27j0P0GOQijbiL3o=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr30858ljz.74.1610981012277;
 Mon, 18 Jan 2021 06:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-2-dqfext@gmail.com>
In-Reply-To: <20210111054428.3273-2-dqfext@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jan 2021 15:43:21 +0100
Message-ID: <CACRpkdY8K8N84iAZhDrxPT6+W6Df85h5O+zE5NqW3z4AWvePmw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_094335_020230_A74FFAAA 
X-CRM114-Status: UNSURE (   7.88  )
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
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 6:46 AM DENG Qingfang <dqfext@gmail.com> wrote:

> Add device tree binding to support MT7530 GPIO controller.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

This is a good way to turn it into a GPIO controller.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
