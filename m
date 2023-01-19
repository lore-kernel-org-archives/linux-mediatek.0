Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA61C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCpAl90W827N8CpD/RGvFok8HJmi1E+2gm0/TKEaZeg=; b=NSq2BYUDwBZ1vS5/Cp8VH2Wi1g
	I0b0TqGNmyMO8HVH3103BQ6ar7Bb0QlfYru00QGq86IU1AjP/NJ5XO6FHm0hqMNBTLwbeQw59RUNw
	MSmwGgxVKGtuRkty76mS1ZS2zdy+B3CKxNaX8yFXb/WPsdG8pGzSHG9lEfFnDr8Uk98ML911Q4o6F
	3i5M7BAq0N3owmCo6sIloMlosh01FHOjzlzSXQwzOyQ1OfIs0uBNs8xOmJki/KS98ygxHTmbBYQ6V
	O/lndoQtP4P3aqfghadE5PKRgJPzCXRHvM4pir4D2c4DSn8upnYS/VS2jEpiZqyCTa0+BpcGOt6jy
	JO/a1MIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXgD-005vww-F1; Thu, 19 Jan 2023 16:22:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXft-005vs4-QW; Thu, 19 Jan 2023 16:22:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F0FA61CB6;
	Thu, 19 Jan 2023 16:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44106C433EF;
	Thu, 19 Jan 2023 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145320;
	bh=lYW4XXPu/4M0mVDoNevIYpipR/KmVNL/JlKftb1SEaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSLIvmR/6lbKxtNEGDKqFJHpYJrHXPVXBb5eKJEaxAKzlWVtnlNO5VR0D/m4BNqh4
	 VQNjcq/k8Wwitf12CSgVQwAU6sxWHvQJaFtDM+W1lZk3QCZarlHP6ZoTuNtHIRusGg
	 9nvqPV7lBz0XgTHOIm/Oe8tSJG9/r9uagCEmixAJRa6G111CMCYn0+vNUC3PsD7OUu
	 OmHlL7rq24an7huWcZcyMrk5M//6ecRx3bJTgXeRRJeuRgSaXS05NNXHIQhnaVdpeU
	 WEXs1WWcgjuha62levsHsaBs9VszzQiiP3PrcbSEKJwGz7XqIKWy+7lXGSeYuwfZ4a
	 JxUGk1vGQazzA==
Date: Thu, 19 Jan 2023 16:21:52 +0000
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
Subject: Re: [PATCH v4 06/11] leds: mt6323: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8luIOy4bbBu5OGr@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-7-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082201_954027_2AC955CA 
X-CRM114-Status: GOOD (  11.80  )
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/leds/leds-mt6323.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

