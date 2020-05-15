Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94433C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 17:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652C32073E
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 17:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPMpq4Ki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652C32073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mH4zVBaXxLcl4xUQCwpjgobjMwFf+BMAbYRI9LcmdI=; b=iPMpq4Kiamhk04
	/R7ddRmnCTqDXfpBlCrN2I7JzFtU4VcjxAamunmuz66bc7APnuK9mNKQTE/IhML90yjk0KM8O2v/r
	OnYaKfcMxWUy7yQMazLC0DQmbYUy202XTtk5OJUtDmH/L3DxjH2lTxxrt4pYSDVc5e/bbYsf7NjNS
	H+gouwfBuYgenI33gk95rfn/IQmLbXik7BjI1eLtXtZfDl7tT4tfoGT+4zDQEJ+LfiY/ICzs9dXyq
	vb5wrzLdMWks2FUC29qkjADvc6reyWIhBB4+dLLub6floNoJAE4cI39yqq/MFHUcUbn0UPlTyynjs
	SwoqI2Zelk64GbWcZqsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZeC0-0004RL-Tn; Fri, 15 May 2020 17:32:16 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZeBx-0004QT-L8
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 17:32:14 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EB94D14DA8B64;
 Fri, 15 May 2020 10:32:08 -0700 (PDT)
Date: Fri, 15 May 2020 10:32:08 -0700 (PDT)
Message-Id: <20200515.103208.906689697591119838.davem@davemloft.net>
To: dqfext@gmail.com
Subject: Re: [PATCH net-next] net: dsa: mt7530: fix VLAN setup
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200515152555.6572-1-dqfext@gmail.com>
References: <20200515152555.6572-1-dqfext@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 15 May 2020 10:32:09 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_103213_697935_1A5AE3B5 
X-CRM114-Status: UNSURE (   4.62  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, fercerpav@gmail.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux@armlinux.org.uk,
 riddlariddla@hotmail.com, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, foss@volatilesystems.org,
 szab.hu@gmail.com, matthias.bgg@gmail.com, vivien.didelot@gmail.com,
 tj17@me.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 15 May 2020 23:25:55 +0800

> Allow DSA to add VLAN entries even if VLAN filtering is disabled, so
> enabling it will not block the traffic of existent ports in the bridge
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
