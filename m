Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6818FC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 17:53:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396A461CC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 17:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 396A461CC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIQknhfnu0w1WiHJKtkpu3EmpoyQeYMofXRn45X+Goc=; b=JikoXDPl3GG1z6
	ch46MaqkpkIW8Gz1BeYpKxQCe5WmPd3Ggo/YZiCpVw3+PtD3/CUptxwBKgUpcATC++rPAFx3Rvjfr
	jRwcl5/keVbPy3iqQlapEiLwE+1hL3vLynw0hDzEUCQ6MxOTkPAdogWHOrUro51cLUzjsVu0yPFrN
	y4G4+P2oZGfrzTQJPNYt4H2AvwgBXvCBbqbt7PYlMI6znjW+ZeEO1uAmkvqXpfHJx2YQwWu5BwnCa
	tXmQrlp48WIOmNQYGXaJa/FP0+LBWKX5N/DODn1fM5l8azjXXXjU0IssEtEkgeq12hOzdsC9Vl/oc
	3RB4WqeU0g6TVgoRjiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1BjV-00FQrD-UN; Wed, 07 Jul 2021 17:53:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1BjS-00FQq9-T0
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 17:53:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EC9461CC1;
 Wed,  7 Jul 2021 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625680390;
 bh=4QIY8b1Mxzaig/m/1fus9m0xcXRpDY8JJoStIDqVbhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CasGi0DZBuZ8p2LPBFLNOPi7syiS56fJXu+BK7AULDJKZ0HXzrWd80uQy8Gsh/eAy
 c7qnJcOl01WhiIwC2dj/tzHJBgd3qbmL9f4DO4DS4z/Xj+XOJAAh8l4IimEDFfVmpm
 2q182yP9nvUqm8K+e3zRoypDJZuWPJSM0KkDwicyDoIOPS5QmrUA2yqlWMwziP1NRx
 q3NSQJW7qt1gJ/Z6igjc0Sfv/hvh7Kwmnx+G60W9VotsNVfBlDlVvo9enMVCnRZ1n+
 QoYduqAzyr/t//tSxoSiRlS7PYspChrVECpwDkRaJ2o19zON46HmyuLY6l0sxEkMBp
 D7hneoM6ZGemA==
From: Mark Brown <broonie@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH RFT] regulator: mtk-dvfsrc: Fix wrong dev pointer for
 devm_regulator_register
Date: Wed,  7 Jul 2021 18:52:33 +0100
Message-Id: <162567917758.18771.9497444375435982346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702142140.2678130-1-axel.lin@ingics.com>
References: <20210702142140.2678130-1-axel.lin@ingics.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_105311_001390_9BD8E5CE 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, 2 Jul 2021 22:21:40 +0800, Axel Lin wrote:
> If use dev->parent, the regulator_unregister will not be called when this
> driver is unloaded. Fix it by using dev instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mtk-dvfsrc: Fix wrong dev pointer for devm_regulator_register
      commit: ea986908ccfcc53204a03bb0841227e1b26578c4

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
