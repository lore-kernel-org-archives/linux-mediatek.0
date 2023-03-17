Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944A6C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs+PHxO4tBm73V5Bi+L614o5NDeRVI2QDqULujI5Uds=; b=IQ6M1ntjqpW4pinL8346I1Z7D/
	x+SdLt8wCdDmKEeFf2L8pE/c2QV+wTUri434MTGFatb1P31OmQ7b8849pRJxaIFJ/wKOp6ytOvwww
	HIcDqLNn73rfsYxVmlN7gIHnqeB5W6KyX+FAy8QZ3K5eDvan8j6QGlx+4OeKcYkTQE78bx3V2F/+3
	0sDjIA6ZTXWB3Iepg9PFzt74STLGAZNDKjvVLprdkLooRR1dyvI1iRtH5p1Od6vzMUut/++F5aNqj
	DyVQKD11fgpZ7EYATsKGiCkliSpF4PVq4yO/OtPJC6KVlg6ZagH72a1yfC4vJhdgzGELHeQ3XAtKR
	Tc3tiavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd50m-001NT2-0d;
	Fri, 17 Mar 2023 08:00:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd50i-001NS7-2d;
	Fri, 17 Mar 2023 08:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A357B8247B;
	Fri, 17 Mar 2023 08:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2BBC433A4;
	Fri, 17 Mar 2023 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679040022;
	bh=vZrkEtnyCQAIhjWoclfnnOJbdRek3fDnbCw6p5vpShQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nue7L0v71HBMF+rpuwB6VEnqHymGv/UsSG4JT5y0dZJFWa/xSkJVrnBEEbk5Woc+q
	 B5gx+dLHFDkchL1DE/7HvcdtyWgEmiNjW1UUYHMHu4UnrzsEAgFoN4PRdeD8Cs1CT+
	 aaac+dfKhf6TRTa2V4VFsKkkHDlyymNLpSfDWNWia4UcT139ZMJb/JvQFhdxuVyEYy
	 j3m/05asQk5dFYFW20/B4b9TTDx04yiUJWLCXfXkpWVrERVWkTjKAVwA0v2ihWFprE
	 LErL16i7MCPslpgxdWwObtERJknfKOdR5xyLQRxdfmoy7y0jU2nSGOyv37Y/BUjYxH
	 b6q+MERRwjWWA==
Date: Fri, 17 Mar 2023 08:00:16 +0000
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: corbet@lwn.net, pavel@ucw.cz, matthias.bgg@gmail.com,
	andriy.shevchenko@linux.intel.com, jacek.anaszewski@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org,
	peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>
Subject: Re: [PATCH v18 2/3] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <20230317080016.GB9667@google.com>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
 <52480420a160e5a4c71715fbbf105e684a16e7c2.1678430444.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52480420a160e5a4c71715fbbf105e684a16e7c2.1678430444.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_010025_001259_077D80D8 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, 10 Mar 2023, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Co-developed-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> v18:
> - Unwrap each line by 100 chars limit.
> - For joint flash, add more comments above the source code.
> - Remove 'sentinel' comment in of_device_id table declaration.
> ---
>  drivers/leds/flash/Kconfig             |  13 +
>  drivers/leds/flash/Makefile            |   1 +
>  drivers/leds/flash/leds-mt6370-flash.c | 573 +++++++++++++++++++++++++++++++++
>  3 files changed, 587 insertions(+)
>  create mode 100644 drivers/leds/flash/leds-mt6370-flash.c

Applied, thanks

--
Lee Jones [李琼斯]

