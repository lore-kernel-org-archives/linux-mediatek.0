Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEC9C38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6EH4rsRcVPVuOB09S5l7Lhhs2SgGrNZOrerIrDmO3M=; b=qoimDmxfs/avbiOGO2scs1DaBK
	E7U2YNX0ZIxhl8beJYhHUb9WES6lOOz0DYAq63bwjZPS4gmy88yJt7avNo2Ri1R/SZuNJEhOTtzqN
	7usvLvTLrEfEySPo3C2D7i/2x2GUQQqylXZ0WxGKV+KYpdrwRqwZWo3KCdgdLKhqjo2xvx/Fr88Uo
	SX9OxhLSz0hAE+/tC4UZ6ZR73QgPPw+OwiENV0XDcqcfp4lQy7OiqmpOSAage013ecE+ywfpIOOij
	bxPNld4Iz69ySZzVIzstSbpnT7RHaLzwRQq+qSRPri/pu4cIJvvwnu9gjzLuw2A9S3zOoJdCYnnqz
	PmznSkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQYd-009l5v-9H; Mon, 31 Oct 2022 08:54:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQYR-009l2e-Oa; Mon, 31 Oct 2022 08:54:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2BF14B8121B;
	Mon, 31 Oct 2022 08:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EDDC433C1;
	Mon, 31 Oct 2022 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667206436;
	bh=KBG7B++aAvM/ROV60xTFkW51cjuAj+rwExEPVgb18zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6wMRVTsN0UVKxDi6/IvZpWFXs2I7dDSAEy54LQcB1LwG5EItbN6oPw4erlthpzGA
	 HL/IfNRUuWLNedy+0gpKRLmFiHB3f/i34RvemANNRVgNKQ8Ksgx1nQptf6d5Kca0E3
	 1J8xOGC7b/vYy87MdhKNMUmWWVmR/81C2sz43TxCYZ7O8q+jDmpileIxYBA1pacGKx
	 XyiBncC8j7xw88C7ROMDh66ddG+6brWdVXAyRqiFepzn2LbAV9iFZ4I3Wvp3LElOKa
	 gjIPgUQRZSSQ/s4aEyer1VqCDGws8UgKjfg2NFA09WmdutA3SYzp1/ZL+Boedw0S04
	 9MTCDyOqhUgFA==
Date: Mon, 31 Oct 2022 08:53:49 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, Andrew Jeffery <andrew@aj.id.au>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y1+NHVS5ZJLFTBke@google.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_015359_955167_063F40CB 
X-CRM114-Status: GOOD (  11.51  )
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

On Tue, 25 Oct 2022, Andy Shevchenko wrote:

> On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > There are several users of LED framework that reimplement the
> > functionality of led_init_default_state_get(). In order to
> > deduplicate them move the declaration to the global header
> > (patch 2) and convert users (patche 3-11).
> 
> Dear LED maintainers, is there any news on this series? It's hanging around
> for almost 2 months now...

My offer still stands if help is required.

-- 
Lee Jones [李琼斯]

