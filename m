Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3123C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iMU3ZMrRnVoG+jqY2qe+4QJYSIAalUIXDIWPq+IdUQ=; b=gQxWqxdBNLBl/Q
	4EmXZaZnAN3JW9zYw/2hLr2ZV6vH5Mm7QsgqxFuPG6LDjU+7Vms7FdzfbyNTeGiiF8wC/BnqKXlMo
	sIffAyylDk5G1GOKA1079Q44yUApU/WwGFLIEMQAIq7tw9uGpzEEakDQiyX8C9JYSrmY5gJ1K9lMM
	b1INgsQy7IsWqJYa5Bbq1rcgaRXwjHimOpB3+xTiNHjsMAIYmYqeau7ZOaD0FkaDPoSDs7cRs0hD3
	Pv9Dh9taiANIoqbI96ilOzLi8YITPFKgFhu1SWLAKpG6xq3xOtyAEu3EIlhosUMy0wzxUBFVzEaHC
	3FH67Q2zvXHFjq75s1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqEwE-007gBx-6L; Thu, 25 Nov 2021 13:37:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqEvt-007g8O-Gx; Thu, 25 Nov 2021 13:37:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B206861074;
 Thu, 25 Nov 2021 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847421;
 bh=amtopp9RHl/TvQxvYXr20cIuv/ZoExLoTxclzPSkcBA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lry3K083Ck3VPN/+LLXeWeHs2U+6WlSBURFxscS5dAQiy0xcwcFsvBKrxoSAAtTsf
 TIDPXhj8KZ5TzwwoSXHyolDqZY8H62XgSCGyuWLhkmNgYY/c1UMbC/CJUww31ZdpWP
 s0drXYg0jUIqsHk74MHC3f9i2xehyXP+PSDLsfTwq65PfUSfVF2tQS2i+44OZE4G2b
 xueUahted9G0xy3dYpCqa5Y5skyWfO/0LVuNx7mCuMhu1iX419TL7CODcj7ZlA20n8
 Wn1Piw8/UjguGL+ngDkhz9Ed2ec/tGKjLxkKoq/ug0ndWRoX04XEFDLN8ySdqhEhnb
 NQeboRWUHoHcA==
From: Mark Brown <broonie@kernel.org>
To: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
Cc: yc.hung@mediatek.com, daniel.baluta@nxp.com
In-Reply-To: <20211125071608.3056715-1-yangyingliang@huawei.com>
References: <20211125071608.3056715-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: SOF: mediatek: Add missing of_node_put() in
 platform_parse_resource()
Message-Id: <163784741946.3101847.9704540045126980062.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:36:59 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_053701_612812_C7E70306 
X-CRM114-Status: GOOD (  10.09  )
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

On Thu, 25 Nov 2021 15:16:08 +0800, Yang Yingliang wrote:
> The node pointer is returned by of_parse_phandle() with
> refcount incremented in platform_parse_resource(). Calling
> of_node_put() to aovid the refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Add missing of_node_put() in platform_parse_resource()
      commit: fc6c62cf1cbf24c81ccb1d248120311336d5f3cc

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
