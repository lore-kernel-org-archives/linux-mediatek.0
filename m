Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9BAC2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 10:26:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE61F2073C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 10:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nMRsixmI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wr7MI23L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE61F2073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IF5ff5ssTm6Wzh+8HHmEY9XSFpHAAefzE9F0GRb9Asg=; b=nMR
	sixmI1TeZJJf9p6ZmudU90mjAPDwnj6YPeMIkuPrY9UnrOKUMkbkpIBw6o7kgVonaLNgvGRgPaLjg
	Je76peXyDCZCI9T7Qva1f9jMLxlPMuRcx1KHsKTVp5uw7spD1F6SnRsGLM0QYrLlGJxk4WMWbSDgf
	3mS2GG8A6vEUh2F1iW2MiU5Jj0i8QC6u0/05RxupwmY+beGUxoF6OVmQmbHOOXK3HmMgRQ5pFNUiU
	gaxkOYZ73OIHVajvFIjo5ror8bCUw77cGcsRhy/3Ss1E37+IZAFikC95zin0nZot66UXkr/pZsWFS
	xWVko0RG/F25StKojoniV8yXo3avz5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1pDb-00083o-Cg; Wed, 12 Feb 2020 10:26:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1pDB-0007ZR-CJ
 for linux-mediatek@bombadil.infradead.org; Wed, 12 Feb 2020 10:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=suyB3h9ymK6CP8F2Bu89jnW4Krg9WTnc1zFYUunw61Y=; b=Wr7MI23L3A8w20FvrZ0zjoE+H5
 Y9QRh8JNADfgMJg6MuGXWtZPM2lrZMNUDGxIkUI/1NtNCdVTfStTcU4lmG6rausFL+E7eMCwYFqFB
 7awC18zy+9Qsz7KwgYLT2CBYLx0g0kRRBVUfVL2ZSuncbjmy58AMe6bexzzEVoFSNBdDmme0XZNfz
 E8Gpl3WP6Z+U+GCe1c6g64WW4ljCBWYtOWKi7tlzkG7Q9Dzb+us7eK7u48CUpInrmyLNK/j69TriP
 vNIg7gzBbQbiTKLvYRc1pAUKdCjMpc8SsvDHVj9DRVhm/Sz02jMSONslGMbP/aYZh4uulzePAWOck
 GqFHnRMg==;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1ox2-0004Zn-TV
 for linux-mediatek@lists.infradead.org; Wed, 12 Feb 2020 10:09:04 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 48Hb2M5D0jzMrDSh
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Feb 2020 11:08:43 +0100 (CET)
Received: from ramsan ([84.195.182.253])
 by baptiste.telenet-ops.be with bizsmtp
 id 1m8Y2200H5USYZQ01m8YUq; Wed, 12 Feb 2020 11:08:39 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1owa-0001EO-IO; Wed, 12 Feb 2020 11:08:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1owa-0000LV-FB; Wed, 12 Feb 2020 11:08:32 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Heiko Stuebner <heiko@sntech.de>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/7] ARM: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date: Wed, 12 Feb 2020 11:08:23 +0100
Message-Id: <20200212100830.446-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_100901_101849_0FB3AE69 
X-CRM114-Status: GOOD (  17.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

	Hi all,

The OF clock helpers were moved to <linux/of_clk.h> a while ago.
Hence code that is not a clock provider, but just needs to call
of_clk_init(), can (and should) include <linux/of_clk.h> instead of
<linux/clk-provider.h>.

All these patches are independent of each others, and thus can be
applied by the corresponding subsystem maintainers.

Thanks!

Geert Uytterhoeven (7):
  ARM/time: Replace <linux/clk-provider.h> by <linux/of_clk.h>
  ARM: mediatek: Replace <linux/clk-provider.h> by <linux/of_clk.h>
  ARM: mmp: Replace <linux/clk-provider.h> by <linux/of_clk.h>
  ARM: rockchip: Replace <linux/clk-provider.h> by <linux/of_clk.h>
  ARM: shmobile: Replace <linux/clk-provider.h> by <linux/of_clk.h>
  ARM: sunxi: Replace <linux/clk-provider.h> by <linux/of_clk.h>
  ARM: zynq: Replace <linux/clk-provider.h> by <linux/of_clk.h>

 arch/arm/kernel/time.c                   | 2 +-
 arch/arm/mach-mediatek/mediatek.c        | 2 +-
 arch/arm/mach-mmp/mmp-dt.c               | 2 +-
 arch/arm/mach-mmp/mmp2-dt.c              | 2 +-
 arch/arm/mach-rockchip/rockchip.c        | 2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 2 +-
 arch/arm/mach-sunxi/sunxi.c              | 2 +-
 arch/arm/mach-zynq/common.c              | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
