Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA1C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc/NSY6GWrtTUUJGjuAd068DMG1X94L7zxp+NzLjvw4=; b=2M2HHMrPGTfNxltxRmH5ShF29v
	e2erSOP6V4nYlqc/mncpMa680kfgqJC7FS6uoyn77pQolAyQqIdSKC8bFbgVqllMjr21z8we+FRCC
	IHpX4h8BYGc7tZX6oJm99jQJregdhmIrW1tUXo9oewCwqHU8hv3vRfqIQ8uVU+IPPvYPBVv4r8F8H
	xGYWzinMlEB012sM7dI7ALQVG/XRrkjvr7L6aTZM3Jh+K8pFBXTBcpU+02fnc8TfZm0oIwZgZCEaa
	0RnG4FvMDZdwfmHQ/oMZqtuu1fvt6dlu2TYQGroWpYUQbLrd1wKFNcXPqJiSCBDNXeO6kx0hnIp0e
	CS+4PJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXgq-005wCT-7w; Thu, 19 Jan 2023 16:23:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXgX-005w4t-CG; Thu, 19 Jan 2023 16:22:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E909161C7B;
	Thu, 19 Jan 2023 16:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C258EC433EF;
	Thu, 19 Jan 2023 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145360;
	bh=mMNU0hX5604g+0qs6K1wrlzdb2Auk61vShun7veApWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQMhvA8xwnA/qZrYWMsM9GhMhIrpN8+y9l4tdbYFWzGo/LPsOuxuOkqEq+BtoLj+K
	 FyqkYUDtCkFsxQOFO3C+AFPb7bQoYr10AlYAxhCe+AwygoIK6GaM3pkKnhFN2rxZMV
	 I3lY3SWaS3mNdWgwkFI7HiGkHc0EEB3mNCeugfVTnSLLx75YNneJFwG0QhkOOm6rf8
	 gcxTCWlh/I6gIE1uDPFq4YOZrq+vFrx0DWEd7PFfNR12vKGw97mj2swcTXmK9pW5hi
	 On3GIyT2IMVqLGDVHERAawvGtiKMyfS4zShzh11K0cpOPQ0SC42PE/1g/+JRwfoS9P
	 ay9RKCzs7erDA==
Date: Thu, 19 Jan 2023 16:22:32 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 07/11] leds: mt6360: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8luSMOOSPj266sC@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-8-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082241_552600_CBF5DC14 
X-CRM114-Status: GOOD (  11.95  )
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

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/leds/flash/leds-mt6360.c | 38 +++++---------------------------
>  1 file changed, 6 insertions(+), 32 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

