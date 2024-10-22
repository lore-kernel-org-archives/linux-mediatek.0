Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08CFD2C554
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC9ouSOrTg2bSNVUD8GkLfHziRerJBFjvfJeszfjZbo=; b=b+c9GKA5oKuf8Lc5xM1UFT+MOp
	q2vU8APj69HxsIOmA+H/C09hLgOXpbGxlTOrLgpPPWF82AFtJ4ZhkuliRJ7MvqrUWm5xgnYeN4+Np
	etupt9EHUtCfZHKdnePxDKFWzcQ1vZhY/inkQCp69ExQAEjEfLpZ3wryClMypDjcX8GkN0sPX5bcE
	Gk3haRoIiW8ms1YAP7/h3mNFzmZk1UPOj0dYAdMJ/LntwrZkGEvaPAvNpcdDel49E7XAnKvV8A+L/
	kdug2BJ1iolaCWIKU/2A7cYqII0sSKudut3Rw76mUfLglwqUb2R5F/uMqWbCY/Ep8Lkud26QPD8cW
	blgSsYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FBA-0000000AzkN-2h1H;
	Tue, 22 Oct 2024 13:44:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3F9S-0000000AzbG-1KWt;
	Tue, 22 Oct 2024 13:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bC9ouSOrTg2bSNVUD8GkLfHziRerJBFjvfJeszfjZbo=; b=HB0hdF6lnW2UfolSwb2Wvwuubf
	rHo0Iw6CpyLeXIp/uFvLLW/KWJdfPevDc7bmgIf6f1EANpsNrSvVmR+e/tatTL/W5HTS60dqb9Zek
	kjt1c2GkM03jZP/0vrasz+2Zws0Fq1d5IE6hAzPfz2DSPqueApf4POVdOy8LsZbdTb4g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3F93-00AqXg-BD; Tue, 22 Oct 2024 15:41:57 +0200
Date: Tue, 22 Oct 2024 15:41:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] [net,v2] net: wwan: t7xx: add
 PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Message-ID: <3b34817c-ea4f-484a-abb5-1e6619c6d0ca@lunn.ch>
References: <20240930031624.2116592-1-wojackbb@gmail.com>
 <e2f390c7-4d58-47fb-ba86-b1e5ccd6e546@lunn.ch>
 <CAAQ7Y6Z2xkgxv36=WOxbUArCw3eBeY0nx_7nAH36+Wicjs_fPg@mail.gmail.com>
 <562c8ee8-7ce3-4343-9d93-b01be1235954@lunn.ch>
 <CAAQ7Y6aqLJoScfVD3NMyw_0r42qYS2BCCWa5iRDaM8h1EKwwkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAQ7Y6aqLJoScfVD3NMyw_0r42qYS2BCCWa5iRDaM8h1EKwwkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_064222_379662_5765FA15 
X-CRM114-Status: GOOD (  13.34  )
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

> Hi Andrew,
> 
> The chip of Fibocom FM350 is MTK T7XX,
> It is the same chip as our device.
> 
> We tested the Fibocom FM350 and It had the same issue as our device.
> The following tests use the same environment and steps:
> a. Make data call to connect Internet
> b. No data is transferred to the Internet and wait one minute.
> c. use test script to capture and count power_state until one minute.
> 
> Result:
> 1. When autosuspend_delay_ms is 20000,
> Our device's d3_cold time is 0%
> Fibocom FM350's d3_cold time 0%
> 
> 2. When autosuspend_delay_ms is 5000,
> Our device's d3_cold time is 80%
> Fibocom FM350's d3_cold time 60%
> 
> So this problem is a common problem.
> Should I remove PM_AUTOSUSPEND_MS_BY_DW5933E,
> and modify PM_AUTOSUSPEND_MS to 5000 at my patch?

A sample of two is not great, but does suggest there is nothing
special about the DW5933E, and all users can benefit from this change.

Please do change PM_AUTOSUSPEND_MS.

       Andrew

