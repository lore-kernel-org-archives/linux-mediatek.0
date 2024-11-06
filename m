Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7ECD59F5A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BSemyVMGpWRmaclhSQib1OHQ2qqrpJSSSRuHRaY9Tg=; b=bLfwN+D4kNr1AR1z5InR+oPUW8
	jujn+KRWDxiTK2AYl9e9WwQ5CTd9Eo3fw7c40ybi7+sF7dTmxZud+MdRaK/Na81GhHXsHVI5I1yh+
	B0Cxdre7RAkLVI3d3J8pSbgCIWFKMcah0qWxuOofZp19zn3av2V8G0R0ehLgCBNVC7TaPxlww9bYA
	DCE1tsQrnbRl5429iFWGriQ1JOpMNHVU29hjeJ19mxO9RyBW0Ma+GQ6WXrMbPAUaTWIwZwWp6lEzd
	VaL/R5uMET0i1pKFE4ZbarJLQQZ2ZCo+GiASu71HRi8PQue3XhLlRmEDNfxH37Fv7btzz9jnZbFZf
	5Sryfq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kRZ-00000004Hkg-0PsH;
	Wed, 06 Nov 2024 18:07:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kOX-00000004HHN-3MWc;
	Wed, 06 Nov 2024 18:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/BSemyVMGpWRmaclhSQib1OHQ2qqrpJSSSRuHRaY9Tg=; b=fUOWUF6dHNWVDwLgJ6CgXfzzJR
	JAYPsmgTh+NvEfMz1y+4ppmx2ACqt6TcZ6GPSWhCvf70puDXwCCU9Axfm4yzh+04egG3piG88he7y
	y4PhVZRtbugVm3Fz9YQhf98tK0vIcwiHiqDwbE/f/gAhEB96OfnV1YeF3hdJ0YDHMF9I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t8kOH-00CMh5-A8; Wed, 06 Nov 2024 19:04:25 +0100
Date: Wed, 6 Nov 2024 19:04:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] [net-next] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to
 5000
Message-ID: <d2f54fde-1d98-4925-866a-1d755956bbce@lunn.ch>
References: <20241106104005.337968-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106104005.337968-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_100441_863256_EBDF1DA9 
X-CRM114-Status: GOOD (  11.00  )
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

On Wed, Nov 06, 2024 at 06:40:05PM +0800, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of t7XX,
> change auto suspend time to 5000.
> 
> The Tests uses a script to loop through the power_state
> of t7XX.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> * If Auto suspend is 20 seconds,
>   test script show power_state have 0~5% of the time was in D3 state
>   when host don't have data packet transmission.
> 
> * Changed auto suspend time to 5 seconds,
>   test script show power_state have 50%~80% of the time was in D3 state
>   when host don't have data packet transmission.

Please add the justification for changing this globally, that you
tested a number of different machines using the t7xx and they all
benefited from this.

    Andrew

---
pw-bot: cr

