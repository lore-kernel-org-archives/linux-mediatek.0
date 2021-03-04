Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7764C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 15:06:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BD764DD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 15:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79BD764DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LLSgKETGhUftDdR2xCWPom2blnfClThbceqZ8HAZ4LI=; b=U4BU/SldDkERFd01rV3Uzbahn
	LeAi4ZSjrUtT428qFIvX03Sw/4zWvP/fvZWr/A+8b+54ed9T3Frh0btZvXQYVEueUF1ekxjEH2t9s
	3OYQL3kzyPCtUeQnEYRDjZGUgqOQ321+IESJ1PceDbfZjUQPPfyIjrF1ugYk88YrA/+m0FImslDTd
	RTwAJDOUuSTkgEsySgNgRRCT11KCOJhiHsYjEITS4LCsI7WOX+cUwt7DirBLSnPX/nxVL7k+Qc4Sl
	wg7HYm7NTee0D3oWR78S50mS6sPxrQR8cEfwfAHQyCnVGPS9R23Qtp8QN5s3bLuJoFlO94eUHDXLP
	wpmLj+afw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHpYg-008zYA-UR; Thu, 04 Mar 2021 15:06:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHpYO-008zVb-71; Thu, 04 Mar 2021 15:06:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65E6564F68;
 Thu,  4 Mar 2021 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614870374;
 bh=UZEqoiIUd+AChmFNV4x9e+9lJhJgHFmgQLoyhWdFl+8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=M8mUWvn25dVXmw1Gguk6F4UX1CUKaaOOj29FZ0I/22b2Q/qMTN2QUOg+nLrY8NKOL
 Y4Ji+3kM3bZXaWIE7fyJQBRq397Z9iRH1G7EbqHYJx2zGYIGr9Kjr9Sti0KTJovesN
 mq4bbW6Gca7PE5kEB2RVLRMiZUOTNjY0IE1GkGQsI1aUDZLgE02BpDaEY7IEj6roFa
 ajELaKTVTginww9uzcN6OUmRr1QvWvDMv29GBSzRO2CqtHJlRCr4rRMGYnlKPVGx8W
 YiIoG55Pe9i0GJm7f69gaXPwEiC0DfYlRXhIviYLNxGnup+rSWR/aSYyJcbNOIJOqq
 NvAE1xyCm6hcw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mason Zhang <Mason.Zhang@mediatek.com>
Cc: hanks.chen@mediateka.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>
In-Reply-To: <20210226110109.30500-1-Mason.Zhang@mediatek.com>
References: <20210226110109.30500-1-Mason.Zhang@mediatek.com>
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
Message-Id: <161487030159.30767.11054945560843841398.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 15:05:01 +0000
MIME-Version: 1.0
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

On Fri, 26 Feb 2021 19:01:10 +0800, Mason Zhang wrote:
> this patch update spi document for MT6779 SOC.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] dt-binding: mediatek: mt6779: update spi document
      commit: 483a27f372345a1d1a2cd0fd95da987e30ad0e01

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
