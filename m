Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF20C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 22:12:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0BD601FC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 22:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0BD601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iP0m2CARBWJqD2XGs5wAd48Q1ZESCtTIk7nr7OUShRc=; b=oxBow3LNtKzRyjLezxnfrjfXg
	uWtEDXepD+fvx9ra9hg+jCUk4chILX4RV8Knjynv/8foSxZwbQ3WCEdrYLsQO7UZHf7UKlQjmPNge
	MfW1dsEpj9snPU54wQ8a1s45CfuhqYaGtFZPEEJop7XJRgfQrVtt83AI21SKiH1N6Vd45aYxC8sSX
	QnH9Hmsgn69EQtELRuXtswhTGMsKgS7wWqj3e8OsRK+9NNX1nP8U4bUQ850AmUJ14WcOPTWIB1eC/
	m+mvmq59wBrV1HpqPiLEUzv9XTz6ikrTHmzj77/2YtJ0MUnrQK12wo5gyz2dJNuhpIvTc6Po0wI1J
	RdkaGcwsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOpGP-00FpIW-Gd; Tue, 23 Mar 2021 22:12:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOpGC-00FpH3-Jq; Tue, 23 Mar 2021 22:12:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED45B61879;
 Tue, 23 Mar 2021 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616537542;
 bh=pwSmxqNMkA747BUHnXfYuf0RrtYw2mTZVLOuLq6Q5b4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ODtRG9pEjmcKRgX6egp7zU8A5yxsvBnuhzQY5l1GDx+pC3p/ykOXEqotqzb4+Z7bR
 cA61sk9vtgdao0uFkQ+yZviKh3FbYeS+qq/YHtrJWoL+ffFSUl/pr+T6oWWL52ZlHp
 oJtj8cHLjkzf2tlVGtBYnttWMiNR3p88ZTb0K/3pfMcJA4O1zeKJyOhGbDVdkZoy8E
 YnnQVejhYymD/WKzgnRgukH6Z3gOqzov85OyiCPKnDoYFdOfnVHNXy8f7Bmz6WO3vW
 1ocYMKaejFKao4TR2o4T2h8n3lJHGtFFVlN5U0xKYWCyYgzj7OvrCp545HxSolNexh
 4SpsRL8s2s34g==
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, fparent@baylibre.com
Subject: Re: [PATCH 0/4] Add Mediatek MT8195 SPI driver support
Date: Tue, 23 Mar 2021 22:12:11 +0000
Message-Id: <161653753131.32935.1864016176434654452.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322055244.30179-1-leilk.liu@mediatek.com>
References: <20210322055244.30179-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_221224_925585_808D1FA4 
X-CRM114-Status: GOOD (  12.15  )
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

On Mon, 22 Mar 2021 13:52:40 +0800, Leilk Liu wrote:
> This series are based on spi/for-next, and provide 4 patches to add MT8195 spi support.
> 
> Leilk Liu (4):
>   spi: update spi master bindings for MT8195 SoC
>   spi: update spi slave bindings for MT8195 SoC
>   spi: mediatek: add mtk_spi_compatible support
>   spi: mediatek: add mt8195 spi slave support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: update spi master bindings for MT8195 SoC
      commit: 08b020d3e9a87fb6d94b02782c42c001a4e084f4
[2/4] spi: update spi slave bindings for MT8195 SoC
      commit: f42698a8dc589dc7cc8e36641e86e6a9b3b32f9b
[3/4] spi: mediatek: add mtk_spi_compatible support
      commit: d666a833b0b9f5b8e08ecdc002a4cf5d34932b7a
[4/4] spi: mediatek: add mt8195 spi slave support
      commit: 1527b09bc80018f02fe0b6d14e97c95f93596221

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
