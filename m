Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502CCC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE6E60C3D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE6E60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/QvNWDjs+Drvz/XP9nV3ygfwOv+EvQ3BhRQY9OZ62/Q=; b=qvZjMPmi91NHyhNZf3aDElwiT
	qaH3I4m89tcJgJqbXPPVaWl9CeGsCDnHDlmq5SW/oWY2Hudd2KZzVHOnWoNO/aGeTOGfa5YjZJt2B
	g13NGK/BbZJ+ETJpQjtg9YzBQpLmYFAeFynewcJvH4CV6qTLWUG8Z4bCUspjlo/CwfgGSUjOoNnvA
	exTr52+JT87sdzkRU2xfGN4R1HwClViCHGI1OFuzvzXtPMNuQZMro2A5EAsOJaMVXrXWXib2PwrIJ
	IPYpxpmrRMpDqX21IAP2Xj0FmI8P+ZQb5/DRRCQiiEz7rpVl1mPP7PMJVSl39ruRCl/dcHCdKCgUp
	BTRKzJbMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3lO-00AuMR-QQ; Thu, 01 Apr 2021 20:17:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jL-00At2O-OW; Thu, 01 Apr 2021 20:15:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA1C6610D1;
 Thu,  1 Apr 2021 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308150;
 bh=N+8g3oi/DtOR4IYfKa4K/TuQ5ID2Jy9j60SR79CV9e0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pSpEirbcyT/HIrg21DMCZeyzEyLgqxZAUE8xefTuDXvuKGxgCp514CCIPaeEpgWO8
 q4Oj6C+3fjzDGFpxG5M+/O1I7Qi2jReXtJzMMeqmo4aZHZLelONALYl62ViH3K0NUs
 WgGj9oznz3aQXVVPIomeaghLKPEbrgKjSkcpXHgkf5r7hg7N4iWhgr82POo0gnyVzL
 4sZmQqvTRvIguYVfjpWu/jEB8C/pLNf9Z9p5e1ETRNIj5gzyWO17SeGooFMdUBlaJG
 LXbUPAW7vLGwhLsBBlwFq7BwHU5gz08uc3s1H+uYAO0LZJZ+SUXhXdv+jfvCwuWhYz
 7X1zYVsFGl9Gg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Boris Lysov <arzamas-16@mail.ee>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: dts: mediatek: updates for v5.13
Date: Thu,  1 Apr 2021 22:15:22 +0200
Message-Id: <161730808698.655497.18205720456447891568.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <be262120-6cd9-87a7-ccc3-f5c403cff66b@gmail.com>
References: <be262120-6cd9-87a7-ccc3-f5c403cff66b@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211555_816496_916F7FF5 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 16:01:34 +0200, Matthias Brugger wrote:
> Please take the below patches into account. These are mostly cleanups to make
> the DTB checker happy. Apart from that we now have SMP support for MT6589, it's
> nice to see that someone keeps working on this old platform with which I started
> upstreaming :)
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 8028548ba16284166987d8969e0c5bec36a0228d

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
