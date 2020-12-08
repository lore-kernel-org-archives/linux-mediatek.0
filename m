Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61A6C19437
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 16:09:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECAC23B01
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 16:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECAC23B01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iu4UeBS2HdbkmFwCv/4nwtRKTbSolynDkb3Q+1FlaKo=; b=mq6vzkX9aXnrCcTO4mBuk3Z+a
	bOw73WRqKFXqTyUirrMRuDDqMYWISDZScAHus9hhazsnQw2xVHwzetAcGhb/4WRLp7Lgob7tEriAc
	MEdb23SP1nqklAqhmroc+VBwgY4LEywUnPSI935YB+UgLDa2BnHtHcYnTHlqf3IAsy7b1c1+fGU1R
	WKYFIMX4Q1VPrd5+fWoAYV/5dBcTbNpgo6aED1e6G7woPmoicMsPUrNepJkaRCUuYw2T/o3PpannO
	U0blvhEFPg7o2uX4VyqJ7+EJnOH+aZGMoX9CI9Hc/sbtQASXiLe1pewTxGRP6TTKpI+HxJVXA6GSf
	N0nyxL0lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfYE-0004Qi-Gy; Tue, 08 Dec 2020 16:09:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfXv-0004JR-6k; Tue, 08 Dec 2020 16:09:00 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.11
Date: Tue,  8 Dec 2020 17:08:42 +0100
Message-Id: <160675365634.2641537.7384101128991830443.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
References: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_110859_384554_7BCCC96E 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Neal Liu <neal.liu@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 22:22:22 +0100, Matthias Brugger wrote:
> Please find below the commit for the MediaTek SoC drivers. The most important
> changes are the inclusion of two new drivers. Devapc is an TrustZone interface
> found on the mobile phone chips to identify malicious accesses from bus
> controllers. Apart from that you can find a new power domain driver. We have the
> old scpsys driver for quite some time around, But it has some limitations, that
> we could only overcome with a brand new driver with a new binding. Right now
> these new driver supports mt8192 and mt8183 but the plan is, to move all SoCs to
> the new driver model and later on retire the old driver.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: bbecede458d042a5b71d6f10eedd471615d9ee6c

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
