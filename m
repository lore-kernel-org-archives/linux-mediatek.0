Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38982C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038AA60EBB
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 038AA60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xIznYET2LP6SX8vDTDHpQHdWVDN2zi/MgJdgptBLag=; b=kRYTD3dAhRvGHR
	+o7TRXeljnzXyPONAbhJHm2lbQkTpaH9DXFgoxI/icv49CYSx0BdU4vGYertSDnz0rgAEUEC3Nijy
	Wt6lOH5EqF1i0ZF4vTs3XH/SuJP8nyzaEvV/QyFYw+Mf0wzZZznAh0V6gpMJJ015VOIPfFxPYPqzt
	O9Aoxz14GKzsJypa7IZgfPwrEONh/ansrRhqVjszrw3vxqP1y88uAWXu9a0mu8l/bWIOeMSm14Hzl
	DQK6HBo4YefM0IczAPVq3vzek8vAIg6ly2oshxkfhA2TKMu/S49g0l2aPJvPdEUvZ7VGPhjnMW0+/
	ZLDEV8JaVl1tG1gd17/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUls-006wS3-OY; Wed, 01 Sep 2021 18:15:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUle-006wN5-Vm; Wed, 01 Sep 2021 18:15:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AEC3610CA;
 Wed,  1 Sep 2021 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520122;
 bh=hgwrdsFNp/PKcYjLFvMeJthQwTPWN5OLQPah0IlGyxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3oL5crXZty1r1iaWKhAvKkJ3zl/M6on1P4giuyK1suRYmEJGkTNVRzvYiemZxvut
 SkN43mXNKPWahB4y+pzIm15lY9bBm0qVwtBS9jQ7JGkSNrHYdA/5lS8hZpbm/6naO0
 qhgH7b6GPIWp3Q7c/LvhWeu8aXgVT6jz1lEZ5B9mdg5z1uxSr6Y/PgDVuC3OOz69Xh
 zX8rFvqZAit12h+vRQHiZIUMhb5AfhretwGzl0tnJDD8LqXNQFRquAEki4W2w/H6+l
 elp9IYrlEOVBAIrsWXbVYi2hTp85vURuTDws9b9fL3dGhTFathAngwZ0Em76hk3ahR
 OUBX5D6GclxIw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, matthias.bgg@gmail.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: mt8195: remove dependent headers in
 the example
Date: Wed,  1 Sep 2021 19:14:42 +0100
Message-Id: <163051912509.21630.10720008205041847225.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210831083956.9804-1-trevor.wu@mediatek.com>
References: <20210831083956.9804-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_111523_097611_A2F77A29 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, 31 Aug 2021 16:39:56 +0800, Trevor Wu wrote:
> Drop the use of the defines including clock and power id, so that
> we can remove the headers which are not applied in the example.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mt8195: remove dependent headers in the example
      commit: 222039a2503e0839f859e18e6f09acb9997480d1

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
