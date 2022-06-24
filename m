Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCF0C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4PHPt1IcgWCQRvnvVIsjMfheEkUwTe1uNXkO3p1cg0=; b=H37EpinRbIw+KAqAtNcyHmspMJ
	Sd7+7VcvSbYAsmdyQeRl22w/n6PjrhHHBYSLa65OdR5WLbEUK60+qCe1xNlePWkaPMePQec06WRbk
	/1qhVbFKrJUgUEpnKoJdZyQYlfqUjuPJ3F3Vo9OiEHIpHFMTCB6meGK9NTNaiuAzT1WuGftMte/Rn
	3cazdnaKycKxrwsJaZkhK8jxQxVk43sp+cxQkGfw5gLaoU2gWdOelWe8YvMGUC5lwKM5XVJudX4H6
	6redQ4kJ8TzOVITUywhNa4WOs/dA5y7U2TZNSxWFgUkAzCokm7ZGdDtpRPwDeHICrSl1De/PYDpjD
	YgE/QXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hkV-001zPB-Px; Fri, 24 Jun 2022 11:45:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hk7-001zBX-DB; Fri, 24 Jun 2022 11:44:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7054D6222C;
	Fri, 24 Jun 2022 11:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47759C34114;
	Fri, 24 Jun 2022 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656071093;
	bh=SXL5zN2nwEilLgVy+817nWe3mGqIkwJPf3KT5KtK610=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqleerCUtjShMpTKt40R3Xw5bJcBgWctuyJJpVXDDC8yUC+px+coDFuFGOhsDclBm
	 dg838WtwC4BaQ3bpEalZRbi71buK3vIaBJx8ZVhWnGCY1l7wOcJedOmOBaxgTuvbE9
	 l08jW1kWCHcm0hwgtV4GmlCbpSkA1mpGB+nGFXvo=
Date: Fri, 24 Jun 2022 13:33:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	jic23@kernel.org, lars@metafoo.de, lgirdwood@gmail.com,
	broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v3 08/14] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
Message-ID: <YrWhIMGjUeRkpHkB@kroah.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-9-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-9-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_044455_530432_E827BCBB 
X-CRM114-Status: UNSURE (   8.88  )
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

On Thu, Jun 23, 2022 at 07:56:25PM +0800, ChiaEn Wu wrote:
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0+

Are you sure you mean "+" here?

I have to ask, sorry.

And no copyright line?  Your company is ok with that, nice!  :)

thanks,

greg k-h

