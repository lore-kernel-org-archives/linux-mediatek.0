Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD40C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 23:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D9961108
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 23:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28D9961108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6sfCnaW0fHZIhF0SbG09isLAd6zpRXE/NUDi4I3GQA=; b=ebgVP57Dusw/Lr
	XCEzN0pM/emyqrhuBijAYjtyOMEpqGh6zLk/80rmwrCnMO6jL8Xtk7wmK/LYW1RlkLfWxJPYBQ2BX
	TB6+d3hApA7Zh/oEAKDL91rL80tTD/a6fcMqfGgJZ2/BGlhdjXY9MWL5vXJ6LCYdwK+sZEyW80m0g
	TBWRuxZ67FdLz+DqiJdKvvrJSGHMXo2ggf+i2PTHUBHnZthKK+OSz9qpuGEEslq0X7mhrLz8L34P9
	SglQjGoJ2DbnEauNpCavUMjpzBwXuclM2iUbbOMGjCXH/qWYWJXLRIAZh5S73MGzntQAVzM3W1czm
	LZ7Qnf29lgWRGmVXoiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR0sM-00Cha7-A1; Thu, 16 Sep 2021 23:33:06 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR0sI-00ChYv-Vd
 for linux-mediatek@lists.infradead.org; Thu, 16 Sep 2021 23:33:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id c8so25258775lfi.3
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Sep 2021 16:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rjHqvEYv6+gMyg4Tq+Rh/G8JnWMIR7cUG1Fmcv07v/Y=;
 b=mVwI96FJbGbROeb+waDs8Fr9jg58Ppg3G2f/qwPZr8axanVXE1bqdoj0ztls5rFeZs
 7VP7jjoGJfuz3jYXmZXGUUni8EfJ0lHPi6gBIwHP/3X+JyNUfkM64ieQN7Eup9QB3k9+
 vuJiV+V11n2Sz8DjTwNiUX7vhU6ELwHZd9a1rYo3jBA8DojYTwgzZN1KmzCSV73sP+lr
 XQiXPoqQ9zuPRQKFU7kB7mBZs4lDHUt202CByLC5d9bKgKa3M18kMIbzFQ/7AvVQvp2f
 Mv4pVqPYTnLLv3IYLLOI9QoERjjqo3vdcr/qYaQ/3TiL0X0yeZOBfspENrBEt6KUVBUs
 6vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rjHqvEYv6+gMyg4Tq+Rh/G8JnWMIR7cUG1Fmcv07v/Y=;
 b=GQ+fKt1/QScd1Z5c0bBE4pqL6gkO9XOIKt1LsKyLvpvV6MAQHUCzGNJW5Ca/PtqALA
 Icdvaz/dWZaxM3t8dCj8CchplSo6x8bxAfTg4cyqNZ/A2nAAXA1Cnok7l+LHdmsxBC+v
 +ljK9SFg1O0hmfEH8M3CsrlTyFf1J/LkoajYhg3k0WX3R10L43VBlxAcLN5FBYILabSt
 hFhp8fOyrwhXuFVrz03eJ0P3uK3LXaYeSPi+VhRs4KO5gKrMvJRYKw461lTnUxnSq7JD
 HKBNNprfY/lVi8B5t6KtgmaQ8KLY25mwJp6UIXulWT57iGTNirXJJ7+RgEbCP8354S3e
 mtaw==
X-Gm-Message-State: AOAM531HAd31kKhlSE7pADjngjZGMTcA+tmnOUealKKrs6bgg/+9r8Ml
 Bx/n/fp60W8j8wb9a78xhwx0wgSyNEKNacTMUj02gQ==
X-Google-Smtp-Source: ABdhPJx3qUqm8D+MvhzJv8yo3TmSo9hTYPFYIbXvo26tL6U4gur7fI6B/LsMvGG2bOFUWelJ1aarRW0hBAjmL6Wq+v0=
X-Received: by 2002:a19:f249:: with SMTP id d9mr5952890lfk.229.1631835180984; 
 Thu, 16 Sep 2021 16:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210908013218.29702-1-wenbin.mei@mediatek.com>
 <20210908013218.29702-2-wenbin.mei@mediatek.com>
In-Reply-To: <20210908013218.29702-2-wenbin.mei@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Sep 2021 01:32:50 +0200
Message-ID: <CACRpkdYxSwr05eK1x+BAgHxgccQWGUxW-_q_xSGmfkTHEbs+5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: mtk-sd: add hs400 dly3 setting
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Avri Altman <avri.altman@wdc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Yue Hu <huyue2@yulong.com>, 
 Bean Huo <beanhuo@micron.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_163303_097663_3A438983 
X-CRM114-Status: UNSURE (   7.60  )
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

On Wed, Sep 8, 2021 at 3:32 AM Wenbin Mei <wenbin.mei@mediatek.com> wrote:

> Add hs400 dly3 setting for mtk-sd yaml
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Excellent doc!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
