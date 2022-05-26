Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3028C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bB05h3lqqZ6+KSCxsow5tnPK4GFzpLRsrLi/1kc6sE=; b=morbndpAui/uf4
	zWF8ckGiJUECeZBjHiskLolLy0bV+4lkVmLMy/T+9zwIt15WXCwZnUUp9TwUMww7+EF4Co2uQgzz6
	5HE/g2HsRLSddnSzmTV/BlzKziB9DE5yPGSVrjz1z/+n8gtSfxaeCYw3nOJqDUJBNbO9f/VoPyBlV
	UB82u0dZMonzd7adNQVqI45mpnmPqw5orjEeYMPqh5IXWuyQHNrEzAlgspkLdv91kUU6RxiOQilLa
	p5+T1PR2ifgj6ZCSJbO/uNUdZsItDGIlqLCiHofgE9ZgTtQrFZaKKN8dzd3VDv3G5mP4gc/gw4TtX
	wHtaXW2e/OTLLL0g7ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBMP-00EWS7-Oz; Thu, 26 May 2022 11:08:57 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBM2-00EWIw-AG; Thu, 26 May 2022 11:08:36 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 345161C0B8F; Thu, 26 May 2022 13:08:28 +0200 (CEST)
Date: Thu, 26 May 2022 13:08:27 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmitry.torokhov@gmail.com, matthias.bgg@gmail.com,
	mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3]  MediaTek Helio X10 MT6795 - MT6331 PMIC Keys
Message-ID: <20220526110827.GC5138@localhost>
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_040834_543106_DCD1FBE4 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series performs some cleanups in mtk-pmic-keys and adds support for
> the MT6331 PMIC's keys.
> 
> Adding support to each driver in each subsystem is done in different
> patch series as to avoid spamming uninteresting patches to maintainers.
> 
> This series depends on another two series series [1], [2] named
> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper" and
> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD integration"
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Please cc phone-devel with phone stuff...

...and thanks for all the work. I guess we still don't have an android
phone with basic phone functionality working on mainline...?

Best regards,
							Pavel
-- 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
