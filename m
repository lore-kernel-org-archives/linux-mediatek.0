Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD53C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 16:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FAC611CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 16:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FAC611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DP2tVO4Zb+8va6pykw7ize68CvnVZyrqSz/GIGWaqRQ=; b=dGm1amFgXYMuF2
	Q3Y7gkPZpgC/HbFGjDBedRlWo5uHenlQnLhKQz+se4i05ufgshHBj1OCWW/H7ssCxmtUHx+Mv0etW
	/8qu0MMYNT3uM1fqSVQFLy+axJRdfeVvJ2cUrX+n7yt/+rSsdOgz9WFz8H2wEaoqbsUn53dcPCA4h
	h7TdAP8jg0BigCUYIel1hWj+juJrA6GHMtsD8+H/qYKOZaIrRCGZhAn/XGW+gzmzGJ0KBhkqbZu5k
	KsVyVmQFXngAaa36SeXQWLMzurDFywgXtIN51yajfyyXW80ko8n6AtYCmRuoS34oWmCVHUwtZqU56
	XUiygCXfY0Zo/MocHPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw5Ru-00BCkW-Cr; Wed, 23 Jun 2021 16:09:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw5RT-00BCeD-S3; Wed, 23 Jun 2021 16:09:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 062F6611C9;
 Wed, 23 Jun 2021 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464571;
 bh=T2HXfNyzx3AS/mZLCTF/VYpLDzx4pOUOAoKS+LJ5qdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWJZknoaZIRW6MAgdOre9B/EVXthhXWtEZu9QzQjo+OxsDYbJQKqQD7mowC1sebEJ
 F4O36J72t0Uvn1e0PhPOpsmQSXUtwUU0EckbKU+Hhq1CV3571kyGZlHYNVIDAjkwZw
 pRnfJvwava/E56U+iCBWe35LFpTHWgoFTJX59B2e8LWWEpJM4dmwP65Jx7VWgj6gRa
 Fqm6ZOUrZYfV8hD6iji6Qt8qP48cYMp1KM3szmsZTZb9PSdiW8rmrFVxVkTf3nXNpR
 6byoQlkTM0HKaDERegiJV/VUvTjtROuNzw1XS4QnOHO7Lge+bX/gdYht4ZATL7dY1/
 VxQ9MIof0CmCg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, axel.lin@ingics.com,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] regulator: mt6358: Fix vdram2 .vsel_mask
Date: Wed, 23 Jun 2021 17:08:52 +0100
Message-Id: <162446430311.55481.15380134833994033517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624424169-510-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1624424169-510-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_090931_971675_ADF524FC 
X-CRM114-Status: GOOD (  10.51  )
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

On Wed, 23 Jun 2021 12:56:09 +0800, Hsin-Hsiung Wang wrote:
> The valid vsel value are 0 and 12, so the .vsel_mask should be 0xf.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6358: Fix vdram2 .vsel_mask
      commit: 50c9462edcbf900f3d5097ca3ad60171346124de

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
