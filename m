Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FC7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 19:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+ZFPhHG12S8cKEHbWPtdua6DATfXebYlmGeSdHeVjE=; b=2BZ67LJesjDer3
	VBiQpE6VGn5dNqnktMAfHkPF6eUBNX257qk3rvkWtvRdD/+3lghKEoTOjZiq/h1cckFlHaTiQWQd8
	D16HLGDrvM8za4Hc6iaibDkP0cMZAj9fBUvj15b2kwJiyAGykHmVUGlgFMqMrzWy9rCfK3IQ9gt0n
	dMXKNTAOLdhODxGx0/IjyEaQbLEeSXlnfeOWJE0M2UB7AcWqalnadmgPUPFVPa98ByXQ6kMo7MdGR
	GTpeSBYczOHIMXz1lDlU3cWW2Vvz4OFcxv4mxsZ6CrsGelKXNbfj6ySp1y7TmfjGM60lS5rfeB64m
	77wnGTo+is3vLy9lAdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHVlD-00FKjY-BU; Tue, 08 Feb 2022 19:02:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHVj2-00FJbY-LK; Tue, 08 Feb 2022 19:00:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34D5F614E5;
 Tue,  8 Feb 2022 19:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB42C004E1;
 Tue,  8 Feb 2022 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644346828;
 bh=IEWyJRIAgqOmLk5O/Hy+y+7lLdSHvgPjohDMouOy7Lo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Po6NiauVK+KqdBgDxAOWFHuthyvLZltYbBs8zrkXk8Lm1oNPzmBBr8kJN20CCzleA
 TW+Z4PbFeOPorUdE/zXlrY4V89W2wYHUf4/6jRlrJ2icq3qzgsj8O9aKF37236DWKm
 di/l4sZy+n9DUf0OE2HpJ4l7FB4foOlhpTPbaL4+4zjD94H2FCB6RWcDxLGW9oWEB7
 QTNkdIKpBnDtID+qF/5+QhOMCzTBG1s5oqD5e1itrMla1UD3OlEUKlt6GcluUYF37j
 2v2/VX/erSOa+cDRIXWqrLRZ8XRfh+NYhS8MJdIEDLwKO/g7dFVs9yGy1BsV6/ceff
 Fet+DiSUbfVYQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20220125012330.13449-1-leilk.liu@mediatek.com>
References: <20220125012330.13449-1-leilk.liu@mediatek.com>
Subject: Re: [PATCH V4 0/3] Add compatible for Mediatek MT8186
Message-Id: <164434682616.1135514.9519927762573253322.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 19:00:26 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_110028_778705_6F046DC8 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, 25 Jan 2022 09:23:27 +0800, Leilk Liu wrote:
> Subject: [PATCH V4 0/3] Add compatible for Mediatek MT8186
> 
> V4:
> 1. add "dt-bindings: spi: Convert spi-slave-mt27xx to json-schema" to
> this series again.
> 
> v3:
> 1. Fix Rob review comment in v2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: Convert spi-slave-mt27xx to json-schema
      commit: 60edd652005fe2931565f658f23f86d094f4c1f0
[2/3] dt-bindings: spi: Convert spi-mt65xx to json-schema
      commit: 08727dd751234bc878be64e60ea6f0d8ea0d54c0
[3/3] dt-bindings: spi: Add compatible for Mediatek MT8186
      commit: ccbc5d0a92c5f1d42d1a1635b53f1987821e9cdd

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
