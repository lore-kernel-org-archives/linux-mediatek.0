Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9723FC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 18:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E05920708
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 18:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u5duKCAA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENs11Z2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E05920708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/P5y9PZ2prqSIm98mbjfax1i0WJjaFNwZ2FgNf6IPKQ=; b=u5duKCAAtWumi7
	5T4R6/AdAZb17Ik/sUobFwSYdL+Tbm3nCW3NMFnychrAPjwMxAlZNc0S6eWhfwten/Pi1smm3X97R
	BrUVJlwMV/bMjWEIBrozMOfeMYAtTHopkWeBBfeH0OF2RXMP3u4j2tqq9gHo38W5nYebGxCHqYCl9
	RVgqGkPGsBxiwhgsgKta/zgt5AxyFmQBQXy5bzGbo3HbtT9GaSs1sWmXct3lPimYgex6YZ2AWIgOR
	AoD2bwZzenduGnmfiO/dx1/FNI1qNB+WsaV/apP8VX4hmjW2u4H+R94uBmRCk7wPYmltlPPEeLC0P
	mkGuNdZA2OHuvDaQL3Wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWPFF-0008VR-Fz; Wed, 06 May 2020 18:58:13 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWPFC-0008Sd-C3
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 18:58:11 +0000
Received: by mail-lf1-x141.google.com with SMTP id h26so2273635lfg.6
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 11:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2hhU7YC1mHWJXOQCa9/YtvMX0AvTF/51BQ11Lkp2if0=;
 b=ENs11Z2E6PTphR/O7XEptV9DrkitQZwLiWGfUE3J1NThoeRLPWDK4tDps5BoTcWit1
 zxwc6iaDbar5hppPTNmyGg+DQIeMEcKomHQdFBhyU8VETMfHL8W2a1Jd5FtPT4MSFPlx
 pW5uAwDfiblCrXtvPdUyMV5XllzXhrrMlu3/oW6uuJTz36qgimok4gbXBH4xnjVurcCX
 lcUe+U7g7T87tsCxaKgUy1ztqhvZkOlPI1dRGORUz42KQ/uPPuoOll0V3+DBw/rjO1OW
 I1Q/zUwoATalGf6bzwzmulWBAfKNsUBbxb1ZM1A5ACSkMtfwmtHD9gRLESdsOugAfng+
 xmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2hhU7YC1mHWJXOQCa9/YtvMX0AvTF/51BQ11Lkp2if0=;
 b=N/A+u+X77SW55hwl8QheMrXxFwdH9edU7mrd9eFo+KNZgHxvi1G3acrEEdnW8I7kWm
 L5W3jP72uO8GMpdTYtkeA3Xj86fMqKP006tNcfx+5t7vHwpCD7aRhygXETgzwlIghgAp
 8+wek86dhChiVhXUQ55PvfhC75KAtcfMlkiyz9dJZeC3EauuaHXVI8EKQSysw3bwOJ96
 mzWuo84QqKzf7jnFULELo8Q1d5aI0pY3DSAhjb9yYetsIEAUTm5S1L/3v80YWnqWNq+K
 BGwj63378+q1ccjHNerXbrn/XgfDNHFWka1fUbcQTbjrCu+Kejk4408ifnY5qqOlQeAt
 SpYQ==
X-Gm-Message-State: AGi0PubwuEHshO8Sg1ypqXl/hDVgWpQEQIGAMkR8Abo0Mca/SVCVJX1w
 MHdzcZwq7+cPiFobO7clYg3nTGEzopIS6jgJt3Bajw==
X-Google-Smtp-Source: APiQypK2/BS9DNLQgUdve0DnZIP+ggCdF8l9P6mtknH7uy4q8+KLPietCh0cyMKc+/gJFltqkIhzsPf/UxXxP4Q5v8I=
X-Received: by 2002:a19:40d2:: with SMTP id n201mr6168784lfa.82.1588791485423; 
 Wed, 06 May 2020 11:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
In-Reply-To: <1480357509-28074-12-git-send-email-johan@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 7 May 2020 00:27:53 +0530
Message-ID: <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
To: Johan Hovold <johan@kernel.org>, linux- stable <stable@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_115810_450659_3901BF0A 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, Li Yang <leoli@freescale.com>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 John Crispin <blogic@openwrt.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, Vitaly Bordug <vbordug@ru.mvista.com>,
 nios2-dev@lists.rocketboards.org,
 Vince Bridgers <vbridger@opensource.altera.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 29 Nov 2016 at 00:00, Johan Hovold <johan@kernel.org> wrote:
>
> Make sure to deregister and free any fixed-link PHY registered using
> of_phy_register_fixed_link() on probe errors and on driver unbind.
>
> Fixes: 83895bedeee6 ("net: mvneta: add support for fixed links")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/net/ethernet/marvell/mvneta.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index 0c0a45af950f..707bc4680b9b 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -4191,6 +4191,8 @@ static int mvneta_probe(struct platform_device *pdev)
>         clk_disable_unprepare(pp->clk);
>  err_put_phy_node:
>         of_node_put(phy_node);
> +       if (of_phy_is_fixed_link(dn))
> +               of_phy_deregister_fixed_link(dn);

While building kernel Image for arm architecture on stable-rc 4.4 branch
the following build error found.

drivers/net/ethernet/marvell/mvneta.c:3442:3: error: implicit
declaration of function 'of_phy_deregister_fixed_link'; did you mean
'of_phy_register_fixed_link'? [-Werror=implicit-function-declaration]
|    of_phy_deregister_fixed_link(dn);
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    of_phy_register_fixed_link

ref:
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/541374729

- Naresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
