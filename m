Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68315C4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 09:01:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C9E22CF8
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 09:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C9E22CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UpwJyXP+qsk11CODMOEMIIdMcpeKCrrmJqbFi/FQzn0=; b=AboA4Y4VTf/13guRESqwALTYj
	tt7OVJJIaT55XY2q4YsosE06tpiZYIa9voUEzpV4ac8VgoDNTjX9hpsF/TfvIMAisbsNR/8TsF7N2
	0kOnLLDaJ3ktgRT92Dpz88/CVV6TuH2FuHhYUje/wDwG8Qy1kxzHUVduupTvadxKFmAyoc39ot+it
	nt2WuoA9ks+tD21Dhiyx3L8xp31EQpaAkAw/VmY80T5IsLazqnW6QJjLgEVzTLlcLhOE/wJ7doPqQ
	MPrtJ0bpoe5XnMUBsr+0zwMzBaMmBIlsNBd/oL7X/GEw9Y7nqcCt5jzaDLMbaC9Gk6Uy2fjNx2jQk
	5TxqPxfrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqub1-0008Ax-82; Sun, 20 Dec 2020 09:01:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kquaz-00089z-JO
 for linux-mediatek@lists.infradead.org; Sun, 20 Dec 2020 09:01:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id n26so9334316eju.6
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 01:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=594OU660XPtVB7gB/sqEf7A8tD1XF0YLjx8WPPPbbeQ=;
 b=ec6ch9Ehxm5jgnshYaMD/mRfLdi+6YPF/Bha3Z4GN4OaeaxcHS/xa4lx4Ynu9Be5fb
 yVRi+GgaWXCCqWf9UBliQgKom0mSZW0xTHo7+pJJ9LolqEjC3c7/ecxQQvSZn6MyLI+O
 4TxkBIL+HM0w0WaiHkzJz9Lpv+o40YdH8TccXxzqj+QpKJdyqVFek7Fkmo1UEOAk6l/w
 UkcBby2W2fUA9MfQ0YBFJCotBog5D4nvjC6mLiqmycNsxzxyOoGOp5b14JgtQrBwrxnj
 Trqz3KzTPhUIBmYFcWQtkqpj2GywRR2vn/zvkmcVXN8aOUuYtaYLIwSdXFvkg114HECG
 vMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=594OU660XPtVB7gB/sqEf7A8tD1XF0YLjx8WPPPbbeQ=;
 b=etRabEuc8po5u/4qb2YuXoSf8Zyp3uT5WKZluE2nBzD8J7bNrRonEH/U8CY6/IKZSq
 eTWfyhBJEWrOHmpbXoslC/Ps21fjoQIQK1L9s5t2ySwmHzFExywD0tixtHE1KCMz2Qth
 RxweUCCJ9eua4UAeS/D5xUkHzIsc/4Ry+C+pXcbe7Mt/4uTb828+qXtY54PF0nChpg18
 Ns66sJipKbFYKbuq8DnIQV0RPaFuj3Y+dA2rd9lqzF85kqBIaFjfF4sgwPaYT8+eLjhS
 3fJaepQbbAOkoePuGa6oO8RXV7a53smJYc7dl//fzulpEkL48X9gJJP2yAQfuStQSolF
 swPQ==
X-Gm-Message-State: AOAM530XWUlU5+k6YHUI7Rq7SGHsn7Vt274MGJoCFEG3s+qMOsHzbJbt
 zKAXin6LiLN5Gsm0elPWUGo=
X-Google-Smtp-Source: ABdhPJz17m+wJbvQORsYF6Y0OnUcR+WioOhGzo04GiO6wWUCTFOJ7S1XZSZb0KQMlvbgYfoL9bjAOg==
X-Received: by 2002:a17:906:4544:: with SMTP id
 s4mr11035691ejq.366.1608454893505; 
 Sun, 20 Dec 2020 01:01:33 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id lc18sm7619073ejb.77.2020.12.20.01.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 01:01:33 -0800 (PST)
Date: Sun, 20 Dec 2020 11:01:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
Message-ID: <20201220090131.dwqbr6z27sepnpom@skbuf>
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
 <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
 <20201219194831.5mjlmjfbcpggrh45@skbuf>
 <CALW65jYtW7EEnXuj2dGSDwYC=3sBLCP0Q9J=tMozkrP6W0gq0w@mail.gmail.com>
 <20201220074936.ic2mtta7ihg7n3or@skbuf>
 <CALW65jY29uPMGuMCXHsPgf2n5nNPivxmkLWuP_0zO82OL8rZrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jY29uPMGuMCXHsPgf2n5nNPivxmkLWuP_0zO82OL8rZrA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_040141_702228_C3BCE79C 
X-CRM114-Status: GOOD (  11.05  )
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
 Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 20, 2020 at 04:36:27PM +0800, DENG Qingfang wrote:
> On Sun, Dec 20, 2020 at 3:49 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> > But still, what is at memory address 0x1e110000, if the switch is
> > accessed over MDIO?
>
> It's "Ethernet GMAC", handled by mtk_eth_soc.

I see. You have some work to do with that device tree.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
