Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F2C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 18:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D40C220899
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 18:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GG1xp+0C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D40C220899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cox1Ue0OWLW3INACPsXzS3XsQK0G3lgUtKqhfrM/GU8=; b=GG1xp+0Cwc/XXK
	LdXEeDP+66KYGmPr3GyaIe6vX75KANCbGNcAl/Nj6Zm4Zrz3V8wtG/F5G57Q97GpGF+UV/ArNcSgH
	EtASPHhct+O1sUOco/+4vnrUXbm9a38mhYE5DEWt3HwXzE/m68qQqoLbOp4DpMnlHzytRWC23fmnH
	pjzT1Z43hyN31ZIrQdC6DnlInat+jtirWsYtuqwFZU8i2S++EXPsFot3piD7+dNJhf6YHJLnV62iL
	LLB1BqsSrUznkb3Wvu1Zmu0AqdoJmjweVTPHim8Sp+NDBLktprlOIjJNzrCmGw90rjDTyPUnY8/TX
	zMBCjSyUMRyR6VJAkeQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je0rc-00076a-NR; Wed, 27 May 2020 18:33:16 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je0rS-0006yH-Mp; Wed, 27 May 2020 18:33:07 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CD85F128B2F5F;
 Wed, 27 May 2020 11:33:05 -0700 (PDT)
Date: Wed, 27 May 2020 11:33:04 -0700 (PDT)
Message-Id: <20200527.113304.2239513103439192680.davem@davemloft.net>
To: arnd@arndb.de
Subject: Re: [PATCH] [net-next] mtk-star-emac: mark PM functions as
 __maybe_unused
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200527133513.579367-1-arnd@arndb.de>
References: <20200527133513.579367-1-arnd@arndb.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 27 May 2020 11:33:06 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_113306_745484_9814D237 
X-CRM114-Status: UNSURE (   5.25  )
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
Cc: nbd@openwrt.org, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 kuba@kernel.org, Mark-MC.Lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 15:34:45 +0200

> Without CONFIG_PM, the compiler warns about two unused functions:
> 
> drivers/net/ethernet/mediatek/mtk_star_emac.c:1472:12: error: unused function 'mtk_star_suspend' [-Werror,-Wunused-function]
> drivers/net/ethernet/mediatek/mtk_star_emac.c:1488:12: error: unused function 'mtk_star_resume' [-Werror,-Wunused-function]
> 
> Mark these as __maybe_unused.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
