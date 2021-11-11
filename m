Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AD96135E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67AD96135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soQXsHBYpJQ2tz7QvghEfBgYuzyUPqggaapaBs+MGDE=; b=mbfEKKlqZpHJJ+Mjx16/hDLfnq
	DFxKTSFH2zqPznuQbFsBXkciGAqVdZo4TZxbmD7t8Vk9+pkG4ebqrzhRVisWvT9wuflHjWZbEZjkx
	yUUfkKZYezf0mXqLJCztjq4ZARxWKFO5cllM6zUNAp65SS1ZmUW9HLRBUB8C1CMqHi2s4dMXth3EC
	WhY1DdtDWGbzIrq3KQJ/W76DFT1mc0ul7ysySjxMc1HxxyKpWeOaBqsrmG5bhJTbcOmkLXqdERLKl
	UK4JcJIZY5vxML7/aVAgMMlSrWcsHBZ7kKZH0xjVvQqahDA3Svr0LfpqVhwCU3PLdCVuJsNqvg1hh
	cm1DNs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlAZB-0085Ej-4m; Thu, 11 Nov 2021 13:56:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlAYy-0085Ca-6D; Thu, 11 Nov 2021 13:56:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8FEFE1F45C72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636638982; bh=KL910SP64J7G4Wb7kjnHDqpyVus2MRcEbakn+kqdIos=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U8XhgZf2aG7UA6FkTnLmxTDwrgfC2Tz/rnIRee255WLCLeL3/pCWUYD8a6clcyhhc
 0JfDUkVdl3PrpypTjoPk+wJxJO+FHvb9iOY16HBynUhzC7HUspx4IzAAK/097BcW7F
 ZssPgbrv6V5XNf1IfE3z8FI9FvBb91mFb1YI7wFFHy0qBfPTskRALq1uUHmo+C0zkt
 +fLKPWj0QIK3SuARD1n4+W+joLWjGLBDjxnhFZxtncAkcqp/qm88NF6AEthYZtGykR
 f4EJxAve32QAjlXtMwCNqrzgN2+oHml+wDlgpvC/jf9qXNzx31FLnjnkX1AqH5jwzK
 W2ybNjaMFjeMA==
Subject: Re: [RFC PATCH] soc: mediatek: Add support always on flag
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <20211102072058.4107-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e6ebf764-b94a-7b77-df17-1cb8e4b14635@collabora.com>
Date: Thu, 11 Nov 2021 14:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102072058.4107-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_055624_399792_E1A44197 
X-CRM114-Status: GOOD (  19.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/11/21 08:20, Chunfeng Yun ha scritto:
> There is a t-phy shared by PCIe and USB3 on mt8195, if the t-phy is
> used by PCIe, when power off its mtcmos, need software reset it
> (workaround way, usually hardware do it, but has an issue on mt8195),
> but it has side effect to USB2 phy(works with USB3 phy to support
> USB3.2 Gen1), so add support GENPD_FLAG_ALWAYS_ON flag, and make its
> power always on;
> Another reason is that USB3.2 Gen1/2 need keep power always on when
> support runtime-pm due to hardware limitation until now;
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
>   drivers/soc/mediatek/mtk-pm-domains.c    | 2 ++
>   drivers/soc/mediatek/mtk-pm-domains.h    | 1 +
>   3 files changed, 4 insertions(+), 1 deletion(-)
> 

Hello Chunfeng,
what are are the side effects on the USB2 PHY? Can you please expand?

Also, wouldn't it be possible to also reset the USB2 PHY when resetting the t-phy
in order to get it back up and running?

Moreover, as for the USB3.2 hardware limitation... I would say that this is more
like something that has to be accounted for in the USB driver, instead of the PM
domains driver... unless there's some reason that stops you from doing that?

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
