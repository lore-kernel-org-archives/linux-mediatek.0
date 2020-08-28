Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5368C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 13:55:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 929FE20737
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 13:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rCw/kApX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 929FE20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hmmn3iQOamUzA+hpq8V83wASSyige3FVqzor/GXKDyY=; b=rCw/kApXipEQTlAMrrTuWnRSY
	IpzFsuxErVji5Kh0dVAf9zPldQBthS/EJ5Nx8exTo+D+0WiF7ZXc7dWk9KrF7eTw4auNMzHY5oCE2
	6c8sYQrz1S+YlPv3zcwdmuno4FkSl9rxmSkJleGBEc3/vKqASXXTc8JgGomKaRYOwHw0K3Q6Hi6Vn
	Z+ujJ6s+RU2Gpn15I85+LGw72PeVMgOrgyMEJOVyeppjUC5T1B6MRRfgIBwhmuS+KNu6ty4wX/2Gw
	rkjevV/sj8jnNyuneFpGpTMM++ELx/wdrRsheV7JTQHJcMu9YzuKA8fLAm51hexWseb9ICYbAScuJ
	H7Bg5tF3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBeqi-0003H1-HU; Fri, 28 Aug 2020 13:55:24 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBeqZ-0003CD-Bu; Fri, 28 Aug 2020 13:55:16 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 335B31283CC28;
 Fri, 28 Aug 2020 06:38:25 -0700 (PDT)
Date: Fri, 28 Aug 2020 06:55:10 -0700 (PDT)
Message-Id: <20200828.065510.243995373426508876.davem@davemloft.net>
To: landen.chao@mediatek.com
Subject: Re: [PATCH] net: dsa: mt7530: fix advertising unsupported
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200827091547.21870-1-landen.chao@mediatek.com>
References: <20200827091547.21870-1-landen.chao@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 28 Aug 2020 06:38:25 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_095515_666592_A999693A 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: andrew@lunn.ch, dqfext@gmail.com, f.fainelli@gmail.com,
 frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Landen Chao <landen.chao@mediatek.com>
Date: Thu, 27 Aug 2020 17:15:47 +0800

> 1000baseT_Half
> 
> Remove 1000baseT_Half to advertise correct hardware capability in
> phylink_validate() callback function.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>

Applied and queued up for -stablel, with Subject line spillage
fixed, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
