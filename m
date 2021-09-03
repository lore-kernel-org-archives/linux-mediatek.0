Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EADC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 18:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983DB60724
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 18:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 983DB60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Nc2VHeOUEwBfMzHWyqmh2XF0JRp4Za9bcOmsREdgvA=; b=ZAuI6lHLV5464z
	an3amoAIefM9fr+NjHSd4Imhm0x/rQ+Rw7urjBB24Vz8zTHNtyw09+FrMZJtFCP1n+8L9MzwKqOXY
	efHw611x4/9esOdfbD/jj3jYzOJgz5MBbIw/tjzzbWA1bZh/fKXI/teOCDerrQJN7RlNCKiA09Msj
	IXrVgdwqekbqlbFSoj2fBA1DTS6jIuQfr2xUXFLqSX9O2zQGwVaz3ENVEcws2BTi2mY5POwjmIaLk
	gijaxO4eMkDNS2SYICsPu1dWKj0Hmd/czuvLHbiCPSCLInXz1xSSMj1HYZ8rCBV1fsKPY0x/DKRZ/
	rznxYUBXeZtE5xSnXYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mME0P-00CbPG-K9; Fri, 03 Sep 2021 18:33:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMDzw-00Cb9k-3b; Fri, 03 Sep 2021 18:33:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E4A360724;
 Fri,  3 Sep 2021 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630693987;
 bh=2VCYYGoCk3mGK2hcQYFybjDX6U8y+rSBiFZLP7nqLg8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=a4Xt67Y0n6gKE1kYqCavYl7wc35dUxpuNoeFNgPgtd3IMP9QPJISVc2S7mgwhwJjR
 gKgxm47GFISKNcF/7RSNuzdlJGeoHbxIoF2Op61HgdaT562h4KiRKWnWrOGfhpwcrS
 Gf4AGXtWet1IOmS4lUfSg2Sfe51Jml3F55ha00v/5l0MDQ/GdEp422a5BWrlBtu7+t
 sMAoq8J3fuCyK6BH3rCcChrWisaFL5r7+U4BkjIVVPe+opoz4tPBQa+4MP3a4pwmv9
 7BkEt/ynF+Wq7ByzeqADwTjOyJxRG9nrMP+WTR+eDgaopX9b12zQN4BERwL72EURic
 Iee9BJ/rfZejQ==
MIME-Version: 1.0
In-Reply-To: <20210902080211.7922-1-miles.chen@mediatek.com>
References: <20210902080211.7922-1-miles.chen@mediatek.com>
Subject: Re: [PATCH] clk: imx: use module_platform_driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Fri, 03 Sep 2021 11:33:06 -0700
Message-ID: <163069398650.405991.6861280615873228198@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_113308_220223_C42E1CBF 
X-CRM114-Status: UNSURE (   6.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Miles Chen (2021-09-02 01:02:11)
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because that CONFIG_CLK_IMX8QXP can be set to =m (kernel module).
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Should it have a fixes tag?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
