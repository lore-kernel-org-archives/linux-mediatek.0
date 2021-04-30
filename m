Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9CFC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 00:08:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52D86141E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 00:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B52D86141E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:Cc:
	To:Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YtuNSyUSf5trx0r/7Msqlk0v+OsOWRt79J7RT7/9fMQ=; b=VSxMTjykaK7DIDUBq4dO9TAs4
	paET2Q24cJo8uRYBFB0PMKTf8jfa6/qunCVQAxQoW7al2YFCNoMetRKPrsJtHL6rkfrCafIkzl7At
	SAKLokZ2jAkyfvTd0Ah7GdpBKgCzk//8zRIBB4UrUYc+Hl62K+ursG8WgjKWxmwpnLLUlOQhiWo6h
	jPtr3FBRfPUUXxtW+tqT+nHi6XL8shDH2iDzOB61USTKYxS0wPWlgD7O7mLwa+45UR62Dep0zVmvq
	xskU+qnKldtj1FGhmh8PoUROPB0ma3LGFBaCygPrL117x6VjLt2ighQF98T1qImcNaC97swgicOWD
	68F8lpvLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcGhs-006lWM-CB; Fri, 30 Apr 2021 00:08:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcGhq-006lW2-6O
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 00:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
 Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=et5FondnGoToufhqF2xpZyUH4rzj4b5d204+R1Y+L/s=; b=JUdhISHdQUQvQ3RlSZcj+mTBcq
 H9jLOV/pQRtY0UXYdKcmS7p+Cjam9v9/Bv2560u5l7I1A3eaopUTvrGpcGT2TVQO6jx6lSiRJumuf
 ZLyxkxnRyABiIssYSFO3Y0M7UrfNoTugleiUr9xCrCiXNqaXLOxINStJLYxCXSM4J0shiYWiJ1RWA
 g98pzXCRhejtvNk+t5FLjSu4MjaXyl5sjoM9hrmPmHot8L+BQ5oJEwbP94k+2uQfmcZ5CbTc4CbPE
 I9gyKj/JuEB7Ho8LiSG1lUznK3WdN3tjIptgp9TOMXhFifK/OZkhOqs5o2shYvTmCQSP2a6+KevpM
 V9B6PqAA==;
Received: from shards.monkeyblade.net ([23.128.96.9] helo=mail.monkeyblade.net)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcGhm-0012aT-7L
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 00:08:27 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id C84A44F4130CC;
 Thu, 29 Apr 2021 17:08:19 -0700 (PDT)
Date: Thu, 29 Apr 2021 17:08:15 -0700 (PDT)
Message-Id: <20210429.170815.956010543291313915.davem@davemloft.net>
To: dqfext@gmail.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
 kuba@kernel.org, Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, sean.wang@mediatek.com, vivien.didelot@gmail.com,
 olteanv@gmail.com, robh+dt@kernel.org, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org, sergio.paracuellos@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, weijie.gao@mediatek.com, gch981213@gmail.com,
 opensource@vdorst.com, frank-w@public-files.de, tglx@linutronix.de,
 maz@kernel.org
Subject: Re: [PATCH net-next 0/4] MT7530 interrupt support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210429062130.29403-1-dqfext@gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Thu, 29 Apr 2021 17:08:20 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_170826_278208_7825FB45 
X-CRM114-Status: UNSURE (   2.93  )
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


Please fix this:

error: the following would cause module name conflict:
  drivers/net/phy/mediatek.ko
  drivers/usb/musb/mediatek.ko


Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
