Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B640C2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 17:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0612082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 17:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIJ5Rujv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uomKJQQA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0612082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/S0nUBe9JBqnCaaNqvD1ZwMNraIAFfmqQ8DP4ux/wU=; b=mIJ5RujvS/JN1t
	Z68yfW5KfEhOhq/O2FaqiELPcwidtdtKNkGS6TQslJjtp3FXEk7Mj4xnWojowd3DG2yk/4q89lOJ4
	92FrYy7OON+SfqmWN6PYxg3+O/QdC0pLSW5mmI5MTFlRV5o8u9AaziJQXCKMi3hdvoodc1nynEBP7
	MJN9pV2j52v3WGOHx/l7lMagkgZZa9xXGsa8IIcyiihVNH07N/0pKs2w/cK2D+TRywMI9iwn27uWg
	Xy/nM2s30hhs0JyBeegXngfXIuUnuscf1vPzqxWMl/AvQDLHhuu0+CVWSnWgM9Ov1Ez1oCN45xcPY
	uOhY/fNgPJ07vbdVqEeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1vXR-0002v2-Kd; Wed, 12 Feb 2020 17:11:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1vWP-0000bY-T3; Wed, 12 Feb 2020 17:09:59 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FF9820658;
 Wed, 12 Feb 2020 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581527397;
 bh=AcHXHQJXyMWIuztIi80OjgoPGl5MdYrZDvL2NW3Vq0Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uomKJQQAVHX/x+ZP+YJIqHPI6SZtSV0EtJtPWxHagEVhn4LxzPvQ3MuB3Vn3epyRS
 WIgoTl9hW/QIdFEOblMDVJ1a2F5EiB2tmg1gkhKlcnHyORpEdKytRDsfGKUAxMYF84
 DFmmDrvgSN7u/HYE4Tqz/aVPzJcBbQPYTPXRjSKI=
MIME-Version: 1.0
In-Reply-To: <20200212100830.446-7-geert+renesas@glider.be>
References: <20200212100830.446-1-geert+renesas@glider.be>
 <20200212100830.446-7-geert+renesas@glider.be>
Subject: Re: [PATCH 6/7] ARM: sunxi: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
From: Stephen Boyd <sboyd@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Lubomir Rintel <lkundrak@v3.sk>,
 Magnus Damm <magnus.damm@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 12 Feb 2020 09:09:56 -0800
Message-ID: <158152739647.121156.16877229572128607400@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_090957_979894_DF3DE42B 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Geert Uytterhoeven (2020-02-12 02:08:29)
> The Allwinner platform code is not a clock provider, and just needs to
> call of_clk_init().
> 
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
