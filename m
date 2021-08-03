Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97973C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B1B6105A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48B1B6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8RBCp0sOwuXPx7aYhu4X3VfXUaSCgZKBHa2pLL0UXI=; b=wqxUAGCxBGT6Rm
	GYRKFu+fMK2SpO78Gvpmtbn0csSCdXftNSQyyHGQNkW56DjodSKa9AilT7uFIXhTXWyqo+w1TaX4p
	zHO3uSKq8COSHxb+qxvocpscWDrNo85ea7MBxKs748e6jLr91sXX1VR8NFtDb8FqpZmHf38zJ6d7a
	9iv+IphkEsd6YAF6nytqjJSJ5vAQ4kXNnNPOvfH0Q2u7I/s81iikPu+wbXmMqcQTrWtZ96+igkAfY
	7VMg8OyTQ7P1Lgcs+iAYp0TNkzkJQSJnslGoI26CebsH/TaCWRtmJuMujqn9RCfEfHJ/u+0m3PAwM
	SqB26hFLzFKvC3sjhV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB318-004M5s-5L; Tue, 03 Aug 2021 22:36:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB30v-004M2z-8o; Tue, 03 Aug 2021 22:35:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E241601FD;
 Tue,  3 Aug 2021 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628030156;
 bh=JG9m2MSBIzYBZolTfpn9n8Dn4NcI+G/B3R/BgSHZWF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=En27IaiQYBwRJ9qUvaNiy2pMitswO/5cjIzYjb681mGQjm2nR7zhcU0m3Afn5xJwh
 gYwiGdIqpW4HNcLt4X+a30U9azmT6z2QvynD0cyiMJ0h1q4s8V1kIM/NCToNRNbW8Q
 bIq+hibTxV+x7EslKTsuy562Ei+jT6Au7FrHBdTgdDPtIMvZZaQfwBw8oh8Nhh5Y68
 lO+n1ksi2+q44NiKOe6MdE0wcqextHamDfBRSj9JaX0lRhKmcz3G7pqzxklUo8eg4m
 5E1yIQiG8Lxl+V9eKhNGIYZlmaQY4Tj/L1HmYD4vSGsY+xhXTLf2kcIJui+NUt3AjG
 NAMrLjh7kgN+A==
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Peter Hess <peter.hess@ph-home.de>,
 Hsin-Yi Wang <hsinyi@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH] spi: mediatek: Fix fifo transfer
Date: Tue,  3 Aug 2021 23:35:29 +0100
Message-Id: <162803013702.42391.66595124838577926.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802030023.1748777-1-linux@roeck-us.net>
References: <20210802030023.1748777-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_153557_374254_3D8B94D9 
X-CRM114-Status: GOOD (  13.83  )
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

On Sun, 1 Aug 2021 20:00:23 -0700, Guenter Roeck wrote:
> Commit 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode") claims that
> fifo RX mode was never handled, and adds the presumably missing code
> to the FIFO transfer function. However, the claim that receive data
> was not handled is incorrect. It was handled as part of interrupt
> handling after the transfer was complete. The code added with the above
> mentioned commit reads data from the receive FIFO before the transfer
> is started, which is wrong. This results in an actual transfer error
> on a Hayato Chromebook.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: Fix fifo transfer
      commit: 0d5c3954b35eddff0da0436c31e8d721eceb7dc2

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
