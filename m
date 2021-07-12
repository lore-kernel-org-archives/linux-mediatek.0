Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDFCC07E9A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72D761151
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72D761151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Foeja2PwZtBqWm8F1kH5GfnNsPcMhpwFvaR9Ob/odCQ=; b=CqB12JN2qqbZqm
	MrvwqUNyY91JIL6px/gk4ONzoOOZBNfjTsUEGes0NhwHNNxJNYKI7rkEZQm1rtXCLqARkfAHt5Sm0
	RD5jeMogbQJ6QogKnhRT0T2qeobaWahxrVWSrV9kDKEFt9bIvGQgnz1SVRtL8lap5C2eEn/xm2F50
	bqLvTMDEaL8rNgdDLVp8D357ZR51ULoYlmYy0FU/h1CwrK+Ph5caeh6W+m93eR+Mee6A9cxdpQn92
	usl4G9zIEWzBkjQ1HkZoEwI8mXSwkdr/1ZvW4QGA03Cwb3UGERdPoc4aMPMvwsuDBsAhZ26lOMI8V
	0ujR4NQy1qHxbwRPZpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2tU2-0071jj-Lh; Mon, 12 Jul 2021 10:48:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2tTD-0071G1-IW
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 10:47:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6E9C61151;
 Mon, 12 Jul 2021 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086847;
 bh=7/UmWKH1Ozyu7TpzG2ClSbp/MKl50ujt2+/1olErqcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ms19c+MabGKab61s1CkGBCCzfDqITq5vzb3pRKlzwj5Agt00ZFD0wKskd59QAEg3R
 xY7h5E2hYxkrxZTY3Yg5Pss0vAzNyQKLy3Y67EezV//4UYpdbvZQ/EDKQA34w4MrbI
 H8N5oI2PH8n1MjbpoHN+cVrSZ7sUrNrMzqJb+aWuieMs2pwS3zuRmqcY1j9jO1B8de
 B4jcLl0ZzA/K2WwSXQq3HYmvpes4mR5jvBJoNQ9MV3dmvlyK6TF7cs/5JBuGiGw/EP
 jUK3rKKG7jUOyf2ROmpZXUPBdOZumsR6coLV+YSKQBSXsDidzHdZI8bVbbCu3kVG5g
 tuwc9NhBAXbQQ==
From: Mark Brown <broonie@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mark Brown <broonie@kernel.org>, Henry Chen <henryc.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org,
 Wen Su <wen.su@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 1/3] regulator: mt6358: Remove shift fields from struct
 mt6358_regulator_info
Date: Mon, 12 Jul 2021 11:45:52 +0100
Message-Id: <162608654078.4419.67036586786666358.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210629130503.2183574-1-axel.lin@ingics.com>
References: <20210629130503.2183574-1-axel.lin@ingics.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_034727_694321_4E02319C 
X-CRM114-Status: GOOD (  11.76  )
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

On Tue, 29 Jun 2021 21:05:01 +0800, Axel Lin wrote:
> The shift setting can be calculated via the corresponding mask field,
> so remove these shift fields.
> 
> The usage of da_vsel_mask is different from other mask defines because
> current code does shift regval before mask with the da_vsel_mask.
> Do proper shit to da_vsel_mask setting so we can calculate the shift.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: mt6358: Remove shift fields from struct mt6358_regulator_info
      commit: b99b7b79a7c57d5f1550b9a507521c791c5f92ed
[2/3] regulator: mt6359: Remove shift fields from struct mt6359_regulator_info
      commit: d6208ba87066c981589ca41f07d29a5803807ead
[3/3] regulator: mt6397: Remove modeset_shift from struct mt6397_regulator_info
      commit: 12401a1cef787167aff52ef2dd28286e61054c38

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
