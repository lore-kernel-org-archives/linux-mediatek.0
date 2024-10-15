Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995BFD216A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 13:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XP5y9z+Zc+jzgswAxP/FFf9hvKLL+uAJ4Hn3GaWj2A=; b=OX8woRbjkQo3q+SCmWTnccl8uz
	rtKz6cS2o5IUDvs+K69XRV2R6r3oprV6egQHOg8IPA/b9H12OeLH2EPniIh7oUjbuq0yruBYJH63v
	e2jUFnHbvErI6kvrUjNB4J1nLkI7sEGYYfCfl2lOpR3DjOjOoUstzXE7vmm20o6J9HMFSXiEXbSjh
	NZrO4g5FyfavLLahjjWe8K4Y46uJRtPDgrDlBtw2YOrWsNfvTu/UB9kIvmYaPMHhYlW/hATa75WVB
	gNL2DT3uzYhcppO4LfJ3lOu9A+mQ+pikE7/sIxYBwI9wLc+Qw5YxqodusPzgcduXXyHwisv4AefrR
	zdwx8g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hOh-00000008IyU-0MgM;
	Tue, 15 Oct 2024 13:15:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gMR-0000000874D-1vjL;
	Tue, 15 Oct 2024 12:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=2XP5y9z+Zc+jzgswAxP/FFf9hvKLL+uAJ4Hn3GaWj2A=; b=oq
	7WihviQrPVKXcxGTit4/qgULQrRYwGRWyF+PyYkezLoWslXj2GzuLJb7AP6IidoDfsv+nPv6BqRHm
	d07M4irZbYJtD3hYhXZaLatHHzX63e4BQtnBq1qem8SdbjqntHFBI92EyS8Td7UlzFcDLCL4Ejo25
	Dl+FXtB+qDaY+7c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t0gM3-00A1eh-EX; Tue, 15 Oct 2024 14:08:47 +0200
Date: Tue, 15 Oct 2024 14:08:47 +0200
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
Message-ID: <562c8ee8-7ce3-4343-9d93-b01be1235954@lunn.ch>
References: <20240930031624.2116592-1-wojackbb@gmail.com>
 <e2f390c7-4d58-47fb-ba86-b1e5ccd6e546@lunn.ch>
 <CAAQ7Y6Z2xkgxv36=WOxbUArCw3eBeY0nx_7nAH36+Wicjs_fPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAQ7Y6Z2xkgxv36=WOxbUArCw3eBeY0nx_7nAH36+Wicjs_fPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_050911_520900_0D636213 
X-CRM114-Status: GOOD (  13.31  )
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

On Tue, Oct 15, 2024 at 10:48:15AM +0800, 吳逼逼 wrote:
> Hi Andrew,
> 
> We have a power test that uses a small script to loop through the power_state
> of Dell DW5933e.(/sys/bus/pci/devices/..../power_state)
> 
> We expect that PCIE can enter the D3 state when Host don;t have data packet
> transmission,
> but the experimental result of the small script test is that it is only in the
> D3 state about 5% of the time.
> 
> We analyze logs to found that Dell DW5933e occasionally sends signal change
> notifications, and ModemManager occasionally captures Modem status.
> Although these situations are not very frequent,
> However, since the default auto suspend time is 20 seconds, the chance of PCIE
> being able to enter the D3 state is very small.
> 
> After we changed auto suspend to 5 seconds, PCIE have 50% of the time was in D3
> state, which met Dell's requirements.

So you answered some of my questions. But missed:

What makes this machine special?

It is maybe because this machine occasionally sends signal change
notifications? There are modem status changes?

Have you compared this to other machines with the same hardware? Do
they do the same? Or is this Dell special? If it is special, why is it
special?

	Andrew

