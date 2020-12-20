Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9571C4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 09:08:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 556A7230FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 09:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 556A7230FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bCM+01KtZ1bWv4AgXrx+uyPk7/Tg9/tLIdB+NvqJF8w=; b=TKtLL95OJgnxopfcTdq57/lcz
	Kw9APpkjV07ZXkMKBpnlwPUVWtIs0FmPWHFEfdd9bItvxwIQJ4jL5YIiudJhMdaI0QUSvaKaOPY0i
	Z4MpSRYsm+CqHt9xaCiAiqoW+HOtxZ3Oatisg57DSjYseNSmED9+ZFDAK74lTevdaqVhRG9NAehMF
	/ngM8yakjZDUWreerKhcNLZb1wZKMBVL4lYap8hA8yluKzyQjStYGUY2GIXB9OxPZYDoWZSWHeuP5
	NwEkIN6PPt/YO+xiTXx05fY2wHYLanO7jHAGs7UJ9NGx/+Ndv2wbNdVhqJ2dVhy/3jctiCt22Bpuz
	yLREfIdPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kquh7-0008Kg-1t; Sun, 20 Dec 2020 09:08:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kquh4-0008KJ-J8
 for linux-mediatek@lists.infradead.org; Sun, 20 Dec 2020 09:07:59 +0000
Received: by mail-ej1-x634.google.com with SMTP id b9so9400063ejy.0
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 01:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/DIvBKhgnt5Ly3+S8IYKgzsTzNYNuBFOXEam0Euc3U8=;
 b=i7icMjIef/QgVSpp+8Lz6c1txrG1SuK0VYZRHwjHMtm9iyv5TjGtXaJZJHCLV8YULn
 ZWhnGFh7UpC0PG45+nm3MxpmUa31XqQlk2qRfmRrWorzufxKsMfwtis+G8/TCZprAjDL
 H84fbXJkH33QiMBaclrTgngEOncCyp85c+b0+gqA/MIFPJQbsqoatIldoIArMjZC9Zlp
 rGiO9wxJ3N6le3LF1+01NvGenoSOwV5Wi6n7pTiCpodmrkDTwWhbt5xjypydbxkv0O50
 HOhKzKf1+oHnf9a8zMuHXdSvx8DhPFP21pdAiy/31AdZh7DUlxkGakKJIOImMnrMn1Vy
 DEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/DIvBKhgnt5Ly3+S8IYKgzsTzNYNuBFOXEam0Euc3U8=;
 b=EohKshENdYKCnEjIQ9V7nZLG2eXEJIsH3XOLWbz1cMwyZ79QVrfA6wtiVmo/tgDAbB
 6puAyJjJz59FUwaPWaLXlr9fs20i56YrjfniNDQPuU0njkf2nKyNqAtzJ4Kcz8v/t31W
 ZWxZ5+gh0JRQ86X3LgKwJTlYuXaCitn5o5yxXPBEZl+qcwzHsNBSkA5CHWe1aAX9z1R5
 WN29egu2XRTJbEznhnrQNA2o9jm/sJ9MKJX38u3+2TuullC9vJtR6aDK8rhV2D6K1aS6
 e2gt/ush4ZA7u0gQ9CRxVrQnhmSUyh7+KwEj44AeOYgHn4xA/xTFJcJnTbli3yfJ8ThG
 Hntg==
X-Gm-Message-State: AOAM533bGOb+O39y2UIXYARIJ9rue5iSg1ZMJCbfn5049UB5jGzHFdQ0
 nTn73hKmihfKPBeUfCBym1Y=
X-Google-Smtp-Source: ABdhPJxibYJYYAnPASg1TTu1ArW8y5xpfLQ/rPDUAcFK3hQJlEihbU3mYcnQEMxaqzEGE0oLTsvl7Q==
X-Received: by 2002:a17:906:4d8d:: with SMTP id
 s13mr11120229eju.305.1608455277160; 
 Sun, 20 Dec 2020 01:07:57 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id hb18sm7641896ejb.86.2020.12.20.01.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 01:07:56 -0800 (PST)
Date: Sun, 20 Dec 2020 11:07:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
Message-ID: <20201220090755.2fuxts4mhsa4sbgm@skbuf>
References: <20201219162153.23126-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201219162153.23126-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_040758_747015_2FA37165 
X-CRM114-Status: GOOD (  12.22  )
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
 Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 20, 2020 at 12:21:53AM +0800, DENG Qingfang wrote:
> MT7621 is a SoC, so using "mediatek,mt7621" as its compatible is ambiguous.
> Rename it to "mediatek,mt7621-gsw".
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

I would say that you need to resolve the situation with the docs at
Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
and with the bindings at drivers/staging/mt7621-dts/mt7621.dtsi first
(or in the same series). And still then, it would be nice if you could
preserve compatibility with the existing bindings at least for a while.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
