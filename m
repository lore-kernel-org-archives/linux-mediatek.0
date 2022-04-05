Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqXdpE6bOxhkTPBITHnceSdAS88WgiCwt2mUbEZRzAc=; b=HBybjBNX66xDIi
	udL9rKPQCIDbWIR5kXlUWNTRGMQOiz5u6KBvI/cKE/TSvZwltThvASQNFeeB228w15UAGclY1LEXD
	Crj62kII7F4HZSEIjXhyxhZLSHZLXmu5WCH5xsuJojUBSN1BpnAmt4RJ6EueYZzITMFPnb6S0xz2C
	9/xxW/xxr1WTtu+6BiFXoE+nk2e6L8rVslJXUTZYXXKE8wvhAQzqJTo7Hv+40TmrrRSWww0bl4Dh0
	iNRYQTYjWmTxa3spz94SEomdOsTae6QbHuSRExR35nNOVgm0NpobVLm93zp5wpBJ9VMwhQWyZwtle
	Vh8V45JxcR2XStGVK6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbfZf-000RaU-0H; Tue, 05 Apr 2022 09:34:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbfYB-000QVr-1h; Tue, 05 Apr 2022 09:32:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94DFE616D5;
 Tue,  5 Apr 2022 09:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735BBC385A3;
 Tue,  5 Apr 2022 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151154;
 bh=cg99cbuB8hB++j+fhgEa4ZdrqC7Cu38pehUZLH1w4KY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IIgjUBS99lYPqvwHgyFLa1h4B+7F7O2C9jIzDXHtBh4yXjL/VM5gyaqNRq/qVMVce
 i6tJBXscdBWey2Qx0IHyiShR+AkNqxnxyrUSfgVC/JL69cuW1Er4dd+IP/QV2TAFJB
 5N6HGtShxQqUbmLMshbvgbmhA8NnZK6O+W3oz+XRPr++uL07hQoTwk53wTXuEkQP4R
 MkssquhUvVngM0wKXwsdAx0jQmvbuojxswkDIgZhOh46AkmfHITAb6TLu8SzVA9M8v
 5/NLbwjd8FdUqQaDNY7uOhbyytzZJLBA/+DhcN7rYRzuC27tdUnGKwRlxRQ+frUPcM
 kWO7h/NlW9i4Q==
From: Mark Brown <broonie@kernel.org>
To: leilk.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 matthias.bgg@gmail.com
In-Reply-To: <20220401071616.8874-1-leilk.liu@mediatek.com>
References: <20220401071616.8874-1-leilk.liu@mediatek.com>
Subject: Re: [PATCH V7 0/3] spi: mediatek: add single/quad mode support
Message-Id: <164915115220.276894.6481675196400953567.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:32:32 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_023235_160901_46F2C63A 
X-CRM114-Status: GOOD (  13.53  )
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

On Fri, 1 Apr 2022 15:16:13 +0800, Leilk Liu wrote:
> This series of patches are based on spi for-next, and provide 3 patches to support MT7986.
> 
> V7:
> 1. add Reviewed-by: Rob Herring
> 
> V6:
>  1. remove SPI_CFG3_IPM_PIN_MODE_OFFSET.
>  2. add Reviewed-by: AngeloGioacchino Del Regno
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: mediatek: add spi memory support for ipm design
      commit: 9f763fd20da7d892ffaedac0c58d821922f8a674
[2/3] dt-bindings: spi: support hclk
      (no commit info)
[3/3] spi: mediatek: support hclk
      commit: a740f4e684c020ea57a8a198a9322d739f7ab6d5

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
