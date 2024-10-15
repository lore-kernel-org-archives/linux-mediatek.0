Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE21CFC27C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRX6r5xYRXgboqStl2B9PLAY7QMuBPCcEaoMbKKhPX8=; b=evuZAHhHAQ9yHGgQZjdIMeXvoS
	+RLkWYZrMCGty58r2ya8UJCSDZyxcat4xBs+QFj3MG8pNLi+QpeyPpGobCdd4kmoQ3VJVbWF7OMep
	7Y01HNYqW95ikQUvL6ML4xqbk4QO//b0RTr5PK5RQfRFNmToEJSffhvGleHy9XynkJp+buvcRS8sd
	vJ2kNlVhfHjusgtKMVG7Wxef1MCXmNNhF46+XpGM7BgeubB1tSrtxUFzk423jcrnDxPHD7GhvvQvv
	UK2NliNVU6YQgS8LS3iNmmUE2s0TzkiADm5O37JdcWj99oaSK+fHScRRjvRNMfsLFneHcv9hRLxVn
	InrL4aYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jwA-00000008noX-10qE;
	Tue, 15 Oct 2024 15:58:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0juh-00000008nZr-40u4;
	Tue, 15 Oct 2024 15:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RRX6r5xYRXgboqStl2B9PLAY7QMuBPCcEaoMbKKhPX8=; b=nXn0Hjn+54jccvb2X4iDnCTjER
	5MvwIZi4dN7zxugpOtMobRLAxxl3PcV55TCn6u6kdazyu13+x50xAabDZSxJF48t0wGkoDdt12XL/
	oXza0Qw9WLehXZ6Vtg5FF3xd9HTNODtLB1C0ybfMaO5G3p53XBxJJk1YuQc8JB1h5lDM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t0juJ-00A3A8-Vo; Tue, 15 Oct 2024 17:56:23 +0200
Date: Tue, 15 Oct 2024 17:56:23 +0200
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
Subject: Re: [PATCH] [net,v3] net: wwan: t7xx: add
 PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Message-ID: <85cda68e-93d9-4f69-a59e-6c7c292f3a25@lunn.ch>
References: <20241015032820.2265382-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015032820.2265382-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_085648_073815_84ACBC01 
X-CRM114-Status: UNSURE (   9.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2024 at 11:28:20AM +0800, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of Dell DW5933e,
> Add a new auto suspend time for Dell DW5933e.
> 
> The Tests uses a small script to loop through the power_state
> of Dell DW5933e.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> * If Auto suspend is 20 seconds,
>   test script show power_state have 5% of the time was in D3 state
>   when host don't have data packet transmission.
> 
> * Changed auto suspend time to 5 seconds,
>   test script show power_state have 50% of the time was in D3 state
>   when host don't have data packet transmission.

There are still open questions on V2:

https://patchwork.kernel.org/project/netdevbpf/patch/20240930031624.2116592-1-wojackbb@gmail.com/

    Andrew

---
pw-bot: cr

