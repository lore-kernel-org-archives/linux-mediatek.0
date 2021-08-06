Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6317C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62AEF60F14
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62AEF60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVIAzYw+d9lCz61HWR++Ce60C6W8OX+cbByIIlgzLTc=; b=s1DkW3rsvZBCqw
	8WL9ggGFPYs/t1smj9q6MQbwqvneP98dvgvT0jK7tEkfvDKbYeJvEFvsFzRsFB1i8tizvfCbPjI6+
	0esH8TCFllkf+M6pI5nzu5p0cKxGHkMuQLklOHosxAgiZ4V4p4MogOa00kwggOs0RiFW34jdpaEtD
	fI/RMDR6Ixx0uw9BVxWA+qe6ymyE7/gOvbMnqLg4TEHgCNT+XR1xZVGVBfSUZKUFiZUtuYQhuQjKa
	9vxK/Z7B0VU+xmqpc7kuoOgmkdlZpOGbq0WCzYgn8718e+6p3z8JdBPOv6rYII845cFNVYd+sJ6Mc
	CQjP8K9CRMLsKgXfghpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBo36-00BAmn-Nu; Fri, 06 Aug 2021 00:49:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBo24-00BANQ-RP; Fri, 06 Aug 2021 00:48:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04BB061185;
 Fri,  6 Aug 2021 00:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210896;
 bh=S2s6F4nF3F05P33Fwnz3xX4cS4OViBsUU3KUHdqNp6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LjuHTTB5Ia4FUH3yKh0gr1tW0VrVdrruGdZ1q5XIebYsAKMsoCf/Lnzlg/cPfJOfo
 vkvxE9CMKho0GYSigJnkMXCmCRDo70yiqftk+CU1VgoaBizrkb2XYiCpR28+PJLPCC
 WOy4f/RSluyRetcHDslOfjEHHgksW10F9n6fndcq9eiS7LL8CS2Di4+XvV/qaf2V2s
 Uy9oQDP4hJUn8B+lWxSkB0FY6u+iwcKmEZeC5oM6I5F83jlsUr5k5BE+5HdLu3PmF3
 ZgMKciFmtsao1681t6i69zeqryYZxZzyuB+fyjehDWZFgxLJNAU/OI0zSL6Foxur6R
 LHpCe3n4I6Bzw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Mason Zhang <Mason.Zhang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] spi: modify set_cs_timing parameter
Date: Fri,  6 Aug 2021 01:47:46 +0100
Message-Id: <162821082763.19049.17106859300843537737.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804133746.6742-1-Mason.Zhang@mediatek.com>
References: <20210804133746.6742-1-Mason.Zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_174816_940749_7BE36CD7 
X-CRM114-Status: GOOD (  12.94  )
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

On Wed, 4 Aug 2021 21:37:47 +0800, Mason Zhang wrote:
> This patch modified set_cs_timing parameter, no need pass in spi_delay
> to set_cs_timing callback.
> By the way, we modified the mediatek and tegra114 spi driver to fix build err.
> In mediatek spi driver, We have support set absolute time not clk_count,
> and call this function in prepare_message not user's API.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: modify set_cs_timing parameter
      commit: 04e6bb0d6bb127bac929fb35edd2dd01613c9520

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
