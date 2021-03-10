Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C69C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 23:10:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0A464FAE
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 23:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A0A464FAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PfXRIcBwp9QjTJsQMGapAjb5R0LwoX8t1M4m48ANYo0=; b=BhC7XhGTbPL1MuqvRdvPZcGfP
	DAGU2f3Xa8qx8TKhha+Zp4r63Gx/XV+4uc5oH28z68TZxPrjH3Zcw1qvUkmAIaeDSGHB7wxPvAV46
	9+HYFSRM0jNOYCbPphq25lpzzP3zcXQXBaeIef+uBg364ls586Snv/fG/yXfRBt5hrjl6vGuQfNiI
	Epghybjb6Veau5kz12GAsOXAyrplQSeWrVBlNWeGB6pNLfm1o31+Ov3Fa17nzDLZ+YRdYFZXJPqif
	Xi3zqEG+PVTLXmeBbo1JuFGqX/JKpeIqe6nXUQfY3iT6sWGmQNPZtiDhSJaIfwHJze25yOAOkuchI
	V1e39hLPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK7yR-007xkb-Uu; Wed, 10 Mar 2021 23:10:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK7yH-007xjq-8u; Wed, 10 Mar 2021 23:10:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id c10so42125672ejx.9;
 Wed, 10 Mar 2021 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+Y9MjRts8tJjHgCUb2Iq9KHOIcaGo0V2pW4Fp5XYQq0=;
 b=t5WCXHDCAqWoOY8vvWjS/p98fmmrH0F+h6H5pURHoN8BEnzWfMl2aouEntq+FPFgI9
 GDAzlnWeW+3+Ghn6KfC1qbH0xHIAJVanWaGJPS+mfIhc9LA0KDmrNf0JmmS6JkAIXfTn
 /t+WKh1rgyDH/B0i4ehnaSTcLCxwlMf5TJNzPTY1W9s6J8jKgqKnU1CO3EwrJCdAJ4Vz
 49HDZntyJHHxlg4EH4m3n64MwXfiEkj09hIU+Bc0shA3TiMMVeIqzid6HY0euxrBoNh/
 5AcPlr1Ind4FFNh18T3wydqCHQcGlNoQWz5jwUYVMeWaY0xm6cjGMNJVoEf3n0ZNwu9C
 fyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Y9MjRts8tJjHgCUb2Iq9KHOIcaGo0V2pW4Fp5XYQq0=;
 b=qRYfykMjXTxlrZ3SLYHmObLPq4GPlyPbTMquBTIJv6RVcH0E9BYtjZCgxdLMvL/g5k
 uiR4pUU8NdOEFtOdxUelKIdkkfTOvqLaTCsjAagK9zR/t3w9Yy/WTNeqJPtJi/6FLAGm
 cs+HRzLQOpokn1TwEHml8I9fzOBTUfnbCPhOYiqYShz8n7F5FqjSmpqxfrRGPzkXHAbS
 Ra5U4EYRQlyNumd2tmgyIqf0UKRzyRzT4Q8vSUBLFQPYy8Uj7cvAs5vwFt3mTQdKdQQS
 94GGr6fSDdsEO+ZQ26PDptyh1cQYxjdRv+w8Q9GW6HadnoA1xZR2YVXal1Tb34wD24XL
 kAwA==
X-Gm-Message-State: AOAM532tzlRofHcvlAAzvamvf060pKlFYY5zcW5QHl7IOhpGR1fXCH77
 wT0YsCynYOoDNNHalegvUBM=
X-Google-Smtp-Source: ABdhPJzpCw/su5dc23eER+GYr7msTlNS7+5Mn+Zm9/S1spB5ac9PVKV85UZGOsHF3uMOZxcT9C+f7A==
X-Received: by 2002:a17:906:95d1:: with SMTP id
 n17mr242829ejy.394.1615417828283; 
 Wed, 10 Mar 2021 15:10:28 -0800 (PST)
Received: from skbuf ([188.25.219.167])
 by smtp.gmail.com with ESMTPSA id gq25sm387319ejb.85.2021.03.10.15.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 15:10:27 -0800 (PST)
Date: Thu, 11 Mar 2021 01:10:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] net: dsa: mt7530: setup core clock even in TRGMII mode
Message-ID: <20210310231026.lhxakeldngkr7prm@skbuf>
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
 <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_231029_351751_F0C1D176 
X-CRM114-Status: GOOD (  15.35  )
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

Hello Ilya,

On Wed, Mar 10, 2021 at 01:14:20PM -0800, Ilya Lipnitskiy wrote:
> 3f9ef7785a9c ("MIPS: ralink: manage low reset lines") made it so mt7530
> actually resets the switch on platforms such as mt7621 (where bit 2 is
> the reset line for the switch). That exposed an issue where the switch
> would not function properly in TRGMII mode after a reset.
>
> Reconfigure core clock in TRGMII mode to fix the issue.
>
> Also, disable both core and TRGMII Tx clocks prior to reconfiguring.
> Previously, only the core clock was disabled, but not TRGMII Tx clock.
>
> Tested on Ubiquity ER-X (MT7621) with TRGMII mode enabled.
>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---

For the networking subsystem there are two git trees, "net" for bugfixes
and "net-next" for new features, and we specify the target tree using
git send-email --subject-prefix="PATCH net-next".

I assume you would like the v5.12 kernel to actually be functional on
the Ubiquiti ER-X switch, so I would recommend keeping this patch
minimal and splitting it out from the current series, and targeting it
towards the "net" tree, which will eventually get merged into one of the
v5.12 rc's and then into the final version. The other patches won't go
into v5.12 but into v5.13, hence the "next" name.

Also add these lines in your .gitconfig:

[core]
	abbrev = 12
[pretty]
	fixes = Fixes: %h (\"%s\")

and run:

git show 3f9ef7785a9c --pretty=fixes
Fixes: 3f9ef7785a9c ("MIPS: ralink: manage low reset lines")

and paste that "Fixes:" line in the commit message, right above your
Signed-off-by: tag.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
