Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 16:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6C061213
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 16:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E6C061213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hLMRpUQiBo70hg47rWgd3N2LP+Lf+qC342Eb0ZPzjU=; b=ZoQB32GNtQb41w
	0vT7j1BQSZ1TYUiqPXDcN5d0kxC/tllkVDbP8ZtHWAX3Un9cC5ddAO8T/xahr/J9u5LV9jxl8pew8
	fvhGc5jKOovaHF1Ob/z4ULjivamyZ3UJEURBfX41kTvcUq1Gfo7b8Yp0vPMjoYiMr8rrBCUBZvNTs
	7vHCNBH97C1QIdB2IJb/O6bGUcrDn+tL01Nml0OMEhnwetJozZRs8spaDqeLAqm400QfHcAt/dZJ5
	wutqe3KW0D7Jv/BE/ciih9tl3tUid3F+2Pqoi9E2i9Y6dqE4pP/4o/nRW05zyYjG2koiUXlEmqBLw
	iszijFEVb8E6cI7Orexg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVFty-0083FT-Hv; Tue, 28 Sep 2021 16:24:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVFtl-0083DC-SO; Tue, 28 Sep 2021 16:24:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D83E460462;
 Tue, 28 Sep 2021 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632846245;
 bh=0O6L4H/cextfv26B46FKY+zqtsTMb2PqJijiEx87F6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EDO+sk4Wwji7L2scdsEF3f+WFkOFCFOl1U7q9vzm9NWJ8IcF8oRBCXgOfpUb55lr+
 mmGBEPM07EZ0ys049J7VAom4eUh/Zz9ioqlLiv6aOdW0O7N0qvmUZD18ASME+sDy4p
 sn52BtG5hwI30SIi4FNxviuCW/+7thKPUh1+nGjKq7osK7FCV0L56S5G95/bwa3YUv
 XQgty2j9FjApH/4+SYIfcTcn6A79FGhjvfKfTxYzIxvIw8yuikUUxXOciRA/nwe1WY
 psNywYARIBft7yYaavzV9HHO3u5yFSq+AIbmfbxI2lKCoSqWyJDcioUBwXsD0NmpOy
 ZyHsP2zkDFoyA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 cuibixuan@huawei.com
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add missing of_node_put in probe
Date: Tue, 28 Sep 2021 17:23:02 +0100
Message-Id: <163284573552.17390.11297095158911786787.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210928063520.23927-1-trevor.wu@mediatek.com>
References: <20210928063520.23927-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_092405_956396_957367C2 
X-CRM114-Status: GOOD (  11.00  )
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

On Tue, 28 Sep 2021 14:35:20 +0800, Trevor Wu wrote:
> dp node and hdmi node are retrieved from of_parse_phandle(), so using
> of_node_put() on them before return.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: add missing of_node_put in probe
      commit: b05cfb1215223a750cff5367b625f0ed285a36cf

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
