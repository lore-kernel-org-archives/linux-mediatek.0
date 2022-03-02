Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0A2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CffnWTwcMNbaem3pAf9LuilnXOLBWdp/gIwJY/tlR9Q=; b=fu2tU9Zfh/dnzm
	wQGQG2tOHEmZsahR9+Y06Cy/Y+W0BR/1QfvWEDuZ1nMSBG8upZyDW5iqeiQrb7Kwvttk5gdKV8fW/
	oCxjIsp44A/aUtBqPkEyd/L2MqrYlHpjbMmeHAL894NwxU84YF7KFbQVIOvmiUc3U/3zPUY7Cd1K8
	ez1LmUqzTV8SkwkLwERtwSFZsTvneCnln1wRpnrUHdpFqYB/vP4A6O2lVqQ/u8LIUhHUSB/LjCU+B
	tq3cUWNK8EEm1TuONjaITXQlv3J1XV9Qkp1ObkbmWfJuwguK13M02CVz+3g5llsMskpfnvLFNwzpF
	1g2NbX/IGgDxhXFzNwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSMB-003QmD-Nd; Wed, 02 Mar 2022 17:01:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSLp-003Qbn-KN; Wed, 02 Mar 2022 17:01:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FBE8B820F3;
 Wed,  2 Mar 2022 17:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B73C340ED;
 Wed,  2 Mar 2022 17:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240478;
 bh=Zs5wBntKidaaPOmZunJVUcvMcbvcyFX9EXzTcGS2KjQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qs9Sq6kpS4eBlNYQOTEsTVs3RXAFuEXzRTDItD8yubKcESwXJ1DtFsY95/ZiGtfDl
 qZud9M22xAtQqIJFLweN9n4o8XVolZgBfuCUYFqUv+qBL1YijITkf/Pu7IkCByHpXk
 bqYASr2IRir9XuyUus0mlMIknHTfmD5S8Kgp73QWQlB/0wKsRdkUg9V7wJJBBx5FGW
 cppc1MOJ1HVaIRbqYXY5hwRQA4IB8M+aW96re1jtcUkYbkoPnxhd3QoqayUuyw+CNX
 05uuLEVqw93qXxgWEcJbjXDXwCdAgzgRf/IZC2uW5gpX7vNoM1/cdGDNT6xgO2yIB0
 8bytwm5NW43/A==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220301212358.1887668-1-robh@kernel.org>
References: <20220301212358.1887668-1-robh@kernel.org>
Subject: Re: [PATCH] spi: dt-bindings: mediatek: Set min size for 'mediatek,
 pad-select'
Message-Id: <164624047624.1145410.7673106466966850861.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:01:16 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_090121_855036_C9910A9C 
X-CRM114-Status: GOOD (  14.87  )
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

On Tue, 1 Mar 2022 15:23:57 -0600, Rob Herring wrote:
> The minimum array length defaults to the same size as the maximum. For
> 'mediatek,pad-select', the example has a length of 2 and in-tree .dts
> files have a length of 1, but the schema says the length must be 4.
> 
> There's currently no warning in the example because the schema fixups
> are not handling this case correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: mediatek: Set min size for 'mediatek,pad-select'
      commit: d149dd2a806b9d11e570c3731eca8bda3c5f6238

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
