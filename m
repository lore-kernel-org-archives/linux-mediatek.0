Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D584C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftc8zv/F1u3GpPGPqM2LBrhmNa+N/zujDQIVRPRumw8=; b=p+Ay2rthHINL+Dy/chydPX2UoG
	A6HjAC9EK7JTVSBAt0J3thGorTDxxCWUYXy9PJh4ojIlUp7eH+AcWlMINvFhggK0aY+mBP+RTu0MU
	MK4r90/ynkYkt82eYmJeZqYz8fG4VhEDEKY9RrGT8vOZRNVZmlw0RW96zUIcwC8plk+8t7Gr4oHh4
	P1NAXHmZ2tpMvGtfBt8Wz3Kd7cjUJWTilxa9tISH+dF/eOTnQxpzvSp5MVf1JhSgmCdMfkKJd4vQx
	V+8HCacK4LADS56grwGN94AyguUeREsLQu/GV1HMkXtVCfdAL0+u6u1DTk323iUBzSS3thelX2l9z
	sH0C6l2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4P4i-00Fk2w-4Q; Thu, 23 Jun 2022 15:48:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4P4X-00Fk0X-Ku; Thu, 23 Jun 2022 15:48:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 265FE61ED9;
	Thu, 23 Jun 2022 15:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2336C3411B;
	Thu, 23 Jun 2022 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655999324;
	bh=E2ZHa4TN+5+ejRiD5sM6vTPpHUBc/nI7dHASx3liJUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZJ7KRe+PPhkrhtcpZO7Hpv5xz8T2QQ0uKQ+mbtqyV/uPJUvcM/wCNVtbvASGCh0eW
	 LxZLqFi0ZfwEHAwM10jCnx3B3MseWbmmw9MVCn2HrOUFl7TnUEXOr8ttdsjm/NTeX3
	 H4vgCmDBDOJhcrSDODTfKXdf/e8XLiN5eeJIbv5xdDChY1Kl4oo9dCjj7heOWbo9fX
	 YaqDd1k9B270LN3IkVdsdngFaUxxwC/KmVcf1sflT3ARY8nkNqRSiLi+QBvylzNvMu
	 6wA51T9zaS0me1goaaGsShDd0lMpo0iF0bbAQBHI+ijzQrdrgyVKKmiasvUYLZTvyd
	 Nl8WurlOZk4lA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux@roeck-us.net, pavel@ucw.cz, jic23@kernel.org, sre@kernel.org, robh+dt@kernel.org, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, lars@metafoo.de, krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, deller@gmx.de, matthias.bgg@gmail.com, peterwu.pub@gmail.com
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, szunichen@gmail.com, linux-mediatek@lists.infradead.org, linux-fbdev@vger.kernel.org, alice_chen@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, chiaen_wu@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
Subject: Re: (subset) [PATCH v3 00/14] Add Mediatek MT6370 PMIC support
Message-Id: <165599931844.321775.8085559092337130067.b4-ty@kernel.org>
Date: Thu, 23 Jun 2022 16:48:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_084845_760450_D0A44CF6 
X-CRM114-Status: GOOD (  14.68  )
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

On Thu, 23 Jun 2022 19:56:17 +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> This patch series add Mediatek MT6370 PMIC support. The MT6370 is a
> highly-integrated smart power management IC, which includes a single
> cell Li-Ion/Li-Polymer switching battery charger, a USB
> Type-C & Power Delivery (PD) controller, dual Flash LED current sources,
> a RGB LED driver, a backlight WLED driver, a display bias driver and a
> general LDO for portable devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[09/14] regulator: mt6370: Add mt6370 DisplayBias and VibLDO support
        commit: 8171c93bac1bf9e98269b2efb19ef4e6c4e55ed7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

