Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D0C74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrRP5tTiR4rQkLHT4fF7oBzX2wegTAfABMTHn7JfsGE=; b=G6rBCvPuHg/t0f+jyAz1vMwZYr
	DMSyBYLVk2XMeHc1KefRrpklC5J8BjpQKdLBLBIdiaUpwtCZtI/NAyd6g/nm9aWtaywCDctENoJC+
	CVS0OG7q6NJ/uPwkhRCENvTtRrHTZan3p1Qvgn2N/3h0yEfkfwl3aIQnMBhY8Rvl3fsbK+9GM2F5+
	unVrQlYW5DRJEOKutIRB4sWK1llXbuVq4TORwlgWss02Jq47fo+eElL5cI0AH95zJGPSuGK3CbztT
	HWyDeLCIJxkTFyjhMNbtqXjDTI3Td7j2pJNIz+ltF1qKRM7bnXwvI5t37gxHHJKiEtoUKYwFhG5XI
	464BR2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pco0T-00Gatb-2s;
	Thu, 16 Mar 2023 13:51:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pco0Q-00Gart-0i;
	Thu, 16 Mar 2023 13:50:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB981B8219F;
	Thu, 16 Mar 2023 13:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CC7C4339E;
	Thu, 16 Mar 2023 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678974655;
	bh=lXUl7La5cJcJdgZLmoOZmsmMW91Ldc6U+hd0ZTgsng8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ig9GWJb6NXq5yRP3ueSxciQWa7tpd/uiQwIrYL/9GSs0OOkGuG04h0P2XMqVFDA24
	 A6CjmJu28EymnJXEHNrKUfP9B8CyMv0xJGsG43kRXLNR8QtZE/VdFTYfvN8ORTgCcb
	 D8GL1jtvpFsTxP6GbOCMfuHABUBRcmZo/zWqYfkXTZi/LePFnfOCedLE0cTBVB7v24
	 OZP7PQx+/7Wanoq7TCNtmV81HBzhjcajY++kGBmHtDOl3syQTZOfI4WellVgQ01cZh
	 oYvc+uPZUwnt8UzWONxW2C1zb+WH3b7hLSQ+yM6G+xAXat+gIZ6L+sDF5x053rsMiP
	 U270LzOAPLyNg==
Date: Thu, 16 Mar 2023 13:50:50 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 09/13] backlight: mt6370-backlight: Convert to platform
 remove callback returning void
Message-ID: <20230316135050.GX9667@google.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_065058_406069_CD76C443 
X-CRM114-Status: GOOD (  16.42  )
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

On Wed, 08 Mar 2023, Uwe Kleine-König wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/mt6370-backlight.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]

