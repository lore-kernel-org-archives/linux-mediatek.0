Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39386C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 20:59:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F88E246AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 20:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhWO+5qg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGNVT6Pb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F88E246AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I4Ltq5JzcpedFb66QUE8Buwn4Ae9DhoDA8VubWoSt7Q=; b=WhWO+5qgD03XBcCXBU5f+xIxS
	kv7afGlgBuI4xZQnEveP0KkRdsWW5mhvXE45ble+y0TdSskkryHYtvy7GiY90dsFAGT4DtCWKQsLK
	IyoUJEIEfIRVJ1ltgVTdgCxHngw8USbEDvyGjI5bPOPK36n4p+SczlsnQVCNw4hs6Fv96e/1xsQW6
	7ymFeym5n9VmDtHg9Nc11MmX7pi3tjlct23WuDTp3jMJWjoTQseQ4ahFCbyecv5PJqc+jgSFAUG7p
	hUaMTTE9MpY8AqDSfnalf8HPXa+WBqmofIjqAOXqo8uUBz+vaE85In5OTArS/rrZxqZ9sa8Nq3bub
	WjBwqqodg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfUYL-0007qS-CS; Wed, 18 Nov 2020 20:59:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfUYE-0007nC-Ch; Wed, 18 Nov 2020 20:59:39 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60F61246CA;
 Wed, 18 Nov 2020 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605733176;
 bh=a7U2C6v9GVw424t93GzLhDnAmyo5rTt0U8ggDVQHPNc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VGNVT6PbRD5ZSvhWK+DD132RQ8L6fi0PAchfARO199l2reE5tjWIt/dnVBWKk7DOf
 t6onpdmbau6n1JopMwyLRO/ZLRv3WPhx0oUInSCbY8Qrqegdu6Gsm+/MffFvZBUeQ4
 nyDuGE4bRylQuz3C07pwPv8qYi6bw7IZgwCvt1c0=
Date: Wed, 18 Nov 2020 20:59:15 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 tzungbi@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: mt8192: revert "add audio afe
 document"
Message-Id: <160573314459.46437.12225896346683178113.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_155938_541775_8E4A0EC7 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 16:05:20 +0800, Jiaxin Yu wrote:
> This reverts commit 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt8192: revert "add audio afe document"
      commit: 7d94ca3c8acd0117200f34523536ee01615e7dc3

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
