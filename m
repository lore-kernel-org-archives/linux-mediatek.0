Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDC1C27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ERdtmmVJKLN6lGpGm8liMOGqN9kpCH5fgOFFes8FEo=; b=d202YgknnyQ4ZnnTo4BMZcwJnL
	1/aoOOqUsy+k/LV62vbYblbURi6R1pxt3IWlhna2i6LvjecBTtX1kize7YrjNzU8yeXew8C/6h6L+
	cywG0oytnLDXIty+k9/Lr/5QtYBjFGBjT5d0o7QfvI/StBWC3mKyDcINGGWq59L8UpvzuU8cpJHgg
	psG312T6Rv/Mj42DLWpBBWCPLrYvgzRI5coj2YH/ghqFJD19xB64a2Qlwlx/oODsqVciPrWNw0Sa+
	KTsAu9dkF29ocF49XvF/JAIAMTuBWL4vYmOKQb0o44FgrUh/o3WOGG+8/sCGmWHc+w6JKfa9oKm5V
	oDleokTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8HT-00000009wa4-2TS9;
	Mon, 17 Jun 2024 09:04:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8HP-00000009wYJ-41Ko;
	Mon, 17 Jun 2024 09:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E1B7CE1053;
	Mon, 17 Jun 2024 09:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82926C2BD10;
	Mon, 17 Jun 2024 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718615036;
	bh=THa1cIbc5tm8begwrxwa5OJJ+G0okx8FqtWT7e7BWZU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tBua7iJDkc8Y2cmXCtRKuJMl9ctDCr7nY0rG4J98jFn/eV49vtr8e9uORP/aGFGGK
	 0jiqol8vvv18U/pB3BBqL5CCIDjWhN/oB17eKeoAjlfyLMCxomP8RMTdN7jluyCG6i
	 H9oFOrB0tiz4eHlZuJX7Uvdc0wlPwAfg3cSrceUGT3ZORNQntkwuwb5JNA7z79W28e
	 bmvpZMul7+vOjz9jOv+JXucDCYS7EwFKvx0N1Ym7uHj1MELLeQLKtLPuCqY/5mcbwv
	 X0u0MPrzEj6niTGf6wDm8S7bjuVri1tBD0jzzJ7cAEr4urDeqqioMeF+gy8g5U6QBd
	 WFj1dpewcfjTw==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-wireless@vger.kernel.org,  Felix Fietkau <nbd@nbd.name>,  Lorenzo
 Bianconi <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,
  Shayne Chen <shayne.chen@mediatek.com>,  Sean Wang
 <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  netdev@vger.kernel.org,  horms@kernel.org,  kees@kernel.org,
  kuba@kernel.org,  Bo Jiao <Bo.Jiao@mediatek.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Alexander Couzens <lynxis@fe80.eu>,  Deren Wu
 <deren.wu@mediatek.com>,  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
  Leon Yen <leon.yen@mediatek.com>,  Quan Zhou <quan.zhou@mediatek.com>,
  Ingo Rohloff <lundril@gmx.de>,  Sujuan Chen <sujuan.chen@mediatek.com>,
  StanleyYP Wang <StanleyYP.Wang@mediatek.com>,  Benjamin Lin
 <benjamin-jw.lin@mediatek.com>,  Peter Chiu <chui-hao.chiu@mediatek.com>,
  linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
  linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
 support),  linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
 SoC support)
Subject: Re: [PATCH] wifi: mt76: un-embedd netdev from mt76_dev
References: <20240614115317.657700-1-leitao@debian.org>
Date: Mon, 17 Jun 2024 12:03:49 +0300
In-Reply-To: <20240614115317.657700-1-leitao@debian.org> (Breno Leitao's
	message of "Fri, 14 Jun 2024 04:52:42 -0700")
Message-ID: <87cyogkkju.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_020400_225656_133DC66F 
X-CRM114-Status: GOOD (  11.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Breno Leitao <leitao@debian.org> writes:

> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
>
> Un-embed the net_devices from struct mt76_dev by converting them
> into pointers, and allocating them dynamically. Use the leverage
> alloc_netdev_dummy() to allocate the net_device object at
> mt76_dma_init().
>
> The free of the device occurs at mt76_dma_cleanup().
>
> Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>
> PS: Due to the lack of hardware, this patch was not tested on a real
> hardware, unfortunately.
>
> PS2: this is the last driver that is still using embedded netdevices.

Is this patch a dependency to other patches? I'm asking because it will
be _slow_ to get this patch to net-next via wireless trees. If there's
urgency then it's much better to take it directly to net-next (of course
with acks from Felix and Lorenzo).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

