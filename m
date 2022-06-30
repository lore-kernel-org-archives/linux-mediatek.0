Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FC3C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V978+R8+cXhZumA7lH7s7WTBG0AYU7Rvn+Frr8bsVoc=; b=P0PQQyYlATGiMAJbWX0Orcuxo5
	nxp06yLeLemppR/jmO87k1LiRQZBIHx6Ss0GuLnh8X5mi7BMTK8zXTRguPvn2jgD+gwPjTlX84Y4o
	c+LN8fIduVKc0JlEEzm4x9wy20lxT0BN5tJm492QTPbjcHRO0g6SzkkaB2xlfdIKXlbQmLkg6gnUo
	hqOylcZ3rDynHvVfu1PfRaxqLMNN0ngC8xHa8AJA3ZEHq4SXX4e70O/BqkAN0kQAkyy+L7Ro9iwgX
	MbQc11Bd78SnFeZm2LuZU9mMrgzXGzr1RtbYfGFTwTv76H/CoHnOhscbgWqrip1O87kObpmf+GwCg
	D9Xboriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6sNX-00GqOd-FC; Thu, 30 Jun 2022 11:30:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6sNG-00GqIJ-AD; Thu, 30 Jun 2022 11:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A83EF60F49;
	Thu, 30 Jun 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71319C34115;
	Thu, 30 Jun 2022 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656588617;
	bh=gzDOHcejGu4JioM05HpcNWxB/O66gnE2CvPqcNhcsQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CimQvuX/++FtooBdfVaGQKFl2+Pb1O8v4oSpfSojUuL4n7lA57QcJAwfB/aX0vJ+7
	 531Q/lRTYXMloZ7tPASrqQ7jUfEb52YRf0uJCXSJoUsUcmnE1gqZ0gen6zjy4nkXO+
	 nWgogb8hfvONDEJXmxVhzXV5Ud8aUQ41GYWa+ozWeiOS/0C0bZBQCu4M4QCnAN315j
	 AOhGhyHOEnmZrLN2UzJMkrCc2Cb6Tu74bSAOPA54CCrX0VimfEp3dTTRZXJxM9xou/
	 qohZ92xNRQkwsRgB/cBiQ14Q93kXQKq8gPKy4dllGSCDZXIql1TDJYwu4Aczu1E4tq
	 BHhacON8Ac1Jg==
From: Mark Brown <broonie@kernel.org>
To: u0084500@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, chiaen_wu@richtek.com, cy_huang@richtek.com, matthias.bgg@gmail.com, lgirdwood@gmail.com, linux-mediatek@lists.infradead.org, alice_chen@richtek.com
In-Reply-To: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
References: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
Subject: Re: [PATCH 1/2] regulator: mt6370: Use 'fwnode_gpiod_get_index' to fix gpio parsing
Message-Id: <165658861401.321126.9625331227015919731.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 12:30:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_043018_429443_15C31C52 
X-CRM114-Status: GOOD (  14.84  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 29 Jun 2022 09:41:00 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> From the common binding, 'enable-gpio' or 'enable-gpios' are all well
> for external 'enable' gpio.
> 
> 'gpiod_get_from_of_node' only parse the 'enable' property, it need to
> add the gpio suffix. It's more convenient to use fwnode_gpiod_get_index.
> Although fwnode parsing is not preferred, but 'of_parse_cb' already can
> guarantee the callback will only be used by regulator of_node parsing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: mt6370: Use 'fwnode_gpiod_get_index' to fix gpio parsing
      commit: 4806c991bf4ff959acf921ea72f931a945a968ae
[2/2] regulator: mt6370: Use the correct header for platform_device_id
      commit: 46ae6fb58fd49c4cb2d1ca34e87d603b7c96ba97

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

