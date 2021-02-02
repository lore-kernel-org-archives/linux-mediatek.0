Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E165FC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 21:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55F860295
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 21:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55F860295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4r+pd0oSfGWfb5Y0QocZo894H6rlVuIX51kPQn/ZCjY=; b=fJki+qHAKkKFfoQcxJ8ltUtn3
	hEtupycxCfqkIkeKBA7mTQxonbXTQSag9g0xrts/jGwiHazsAtLKvjzxHSdW2Omh3CpDU1L3lFQUD
	Mto2q/Hw20s8LSPE3TJM0PPt9zkVjJdi1JboHHQ0+uVkmHeuJSyk+DmKS62z0RRgal2Dslg1m6t4r
	o6n+nAxiPVWakCLi8HPhud4gGniMBZkCa8i7ZSUZv+1CfostY6Hm8yO9gT7ns8IXBe9wuLlN5MLY/
	Gkq13UTHsDoEMm54UDxwclqt0y8axU+1G69RnwP316hCnwjIjF/aKxFNybLerPM08AisPJu+EBwOM
	QEkLiRSSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73dZ-0005wh-TI; Tue, 02 Feb 2021 21:55:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73dV-0005v1-9R; Tue, 02 Feb 2021 21:55:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 629CF60295;
 Tue,  2 Feb 2021 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612302900;
 bh=gGEvHficg0Vy/ZBHTv3itrJdnUnN7ePz6T29hli7iGA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IsmuU8AaEPLw8GjRKsUwuvNuV5AAipUnRCEfAkidyHRvVZTXK5W9L0fPvLh49lTUe
 piU6HicQZ3vy/98/edmoQKN1CvyMZaCKI9ujise4o3pDhuSLyph9L0/Vckg9W3gN2Y
 AciLX4wf5CF7SPGm8iCpoc2UrPrMrDMafmd7Pfc/JW8jSAFhggZ48/8yApt0mDr3UB
 aSVk1x10Opgt4m6MmoOdfTYw9QBBWwQUI/ZPi8yTGgjAknUOw/Y8lpp6bIHgY8+RiN
 CuMS/VKGrw8bPEm66UDklPxNnUq8nke0iIpn3U5JCGbjXnVAhWEX3Gfb3mAaHbyfhz
 lhcwjSnnMaiNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 22:54:56 +0100
Message-Id: <161230288968.1906562.2884320159496470329.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5faa52c2-0ddb-b809-7444-ce6f6ff6d8ad@gmail.com>
References: <5faa52c2-0ddb-b809-7444-ce6f6ff6d8ad@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_165501_678330_A21D988C 
X-CRM114-Status: UNSURE (   7.75  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 10:53:59 +0100, Matthias Brugger wrote:
> Please find below the updates for the mediatek SoC drivers. The most outstanding
> thing is, that we now support also the MT8167 power domains.
> 
> Regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: d6d58c350f73f20ac426c410e82833e174b88399

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
