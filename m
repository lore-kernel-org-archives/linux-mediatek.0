Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E48C07E9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 15:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A3D613C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 15:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A3D613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trkvFYscqenDb0z0KRcw9p9Vh10bLPr0vkROzNE209E=; b=ilh/rfD0FSCjrA
	jPiUGTYV+jR8sIRJS9K1FNCQGkLDtbsHhGW0Onzs74om2/pcRcLMei6KergYWzIsGGLJTXMLt7vV5
	CYjUvo1PmtUXZ8QEfHMC4nicwCYslF1esA927tqf0nBxIPrDOU/Vkr9FZvI6Do5Bna7ii4ox1SA9m
	/hPi6MZoD9ELPRx0KujbHu1/uxm8L2jwFHXGOzMXka4QJwOoeJd7pUlvy2RNDx9vOw5sVqsu2n4DF
	oQ0WZSDnGcVKPAAgjfLIFd+xB5SU9qJM2CLT2VVgWXGzqvK7s/Uck3VfPvZKJuw+qbhyUVjihnvlw
	7clsjS2QehC7p4S+4TPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3hFA-00E125-9f; Wed, 14 Jul 2021 15:56:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3hEw-00E0zK-NT; Wed, 14 Jul 2021 15:56:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76DE8613CC;
 Wed, 14 Jul 2021 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626278162;
 bh=gEu+Jtcj2NEsaDHGvOg2sAtFey9JYCHOR9qWF+uXbd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j6AFgLkI6XAzOujcUunthnH4B4C3MzeetcWKP2sRJ34JV2Vwjhcx6flvENIZeP17Y
 jcUqvVNek2KNPG2CQXeJhDDmMT0xAIpUPnWB66apMJZpZrHGTc7XP5gd4dj0TDso+s
 k3JeVZG0XoyCp4khoKeGKdCJhBkG+j3mBii2AsoA7Vs0zAvQBFsS1TtzRjHCSHqDc7
 tcjEtmoxySC/YiZklCdf3PGRUXIawsg8RZqqrF7E08QJABHrHIWiDBfEuMkcLwrCgK
 c1JmGHCu1rzHD7hOIx/yel/VIsXCULAFUhncOQFw/1p0ArVt+aaE5JloG3NLpfrm+/
 V98Bd2oATMhlQ==
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, wsd_upstream@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 leilk.liu@mediatek.com, Mason Zhang <Mason.Zhang@mediatek.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: mediatek: move devm_spi_register_master position
Date: Wed, 14 Jul 2021 16:55:14 +0100
Message-Id: <162627784666.55213.16618385116168293690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713114247.1536-1-mason.zhang@mediatek.com>
References: <20210713114247.1536-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_085602_819125_BEAAE496 
X-CRM114-Status: GOOD (  10.93  )
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

On Tue, 13 Jul 2021 19:42:48 +0800, Mason Zhang wrote:
> This patch move devm_spi_register_master to the end of mtk_spi_probe.
> If slaves call spi_sync in there probe function, master should have probe done.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: mediatek: move devm_spi_register_master position
      commit: c934fec1c32840224fd975544c347823962193b2

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
