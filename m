Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4C4C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 02:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A3F22EBF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 02:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A3F22EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZAH1ltMwVPBmzjITuj1mWNyzE135JLniOQxWvIj4QvE=; b=htZ0ZM0hOYvfo8y8xCJZy7LuS
	WfcETGX8J88itJM9xG2OA18Tlwto77sQWwdX3yw8iQIlvIQIv37Q/T+qi21xyMlamen/YqltHtTnN
	knUSiUhUr+AeBzpjU5d1SBvnQECoilqV8ffyr/7Mh1cC3dMvJtpYWGyJHq4OzSh5B/F6T5b5zcZQ4
	UiCh6i/Dwd2CkWBUiIAfLrH6RCRhuOqMPw5mw6cH2I/2QzS8KFju17ykAnkcsPC1nroXhkGTlwicH
	dp3Eg49h7QnaNZuGFWhtxZzQvvHpgoObZDNgqtV/IzmzuksvueJN4FCkzFscNu64lfu457IpsfOBO
	1BhO7+HFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4EBw-0005MK-Rr; Tue, 26 Jan 2021 02:34:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4EBs-0005L1-NS; Tue, 26 Jan 2021 02:34:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E997922597;
 Tue, 26 Jan 2021 02:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611628488;
 bh=h/E3TukMgw6yPHxLONt2DoWslLEkA9x2ERLKq9CpXQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=usUg3mKQ9NtxwIsGY5jdjQ6eG4MhJHnnLGnNyaIHgrnLgoWVMUj7X69chvYxdtr2x
 v9vT6Z2496cmpk34OB3qeFTUAT+LDfy9FGh389gLGSOtB/lsvD8jI5aCv14fszMERI
 neVSYKPikcJkceAX1cVAfotdjxzmTbWRrnkOzz5NWbo3WWarqnqPyCQtZuHb8Ey2Cv
 5mvXm1s5jwueXNLe/g367tm8hGQe5D9zeXPCVTr+5oy4yFl4NuRTn7owpkpX5Urzv0
 P8rOSr/fCq+Fz1s8tLTuOrRWYEHeqVWluL0e9O0aRdWgGpiLyDctxE28op5HIZ6VwZ
 OQCt8ez9j4/Uw==
Date: Mon, 25 Jan 2021 18:34:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next v2 0/2] dsa: add MT7530 GPIO support
Message-ID: <20210125183446.1d6243a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210125044322.6280-1-dqfext@gmail.com>
References: <20210125044322.6280-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_213448_822128_A05DE635 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 25 Jan 2021 12:43:20 +0800 DENG Qingfang wrote:
> MT7530's LED controller can be used as GPIO controller. Add support for
> it.

I added back Rob's tag and all the missing tags which patchwork 
did not register. Damn thing is really flaky right now. Anyway..

Applied, thanks everyone!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
