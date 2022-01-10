Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F88C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMctt7IjBEpa94CsNyczVhWzZ7Hl3dXHJN4/TEHqNUQ=; b=4+A8f28MyYxlIoHPp+i2gAYGQP
	e76Yqc4u12KeQgZ7nW7p8vmHINSS/MkWdfSYhFlsTrUG2F/VzYA1NNTx+ixD51TzzBa7fWBg8SqL2
	L/7AsnwNSYNgWSdrOIVYpC27/iqrbpITfgPkktKTacutlkHboeNtB80+Sf4POC0DIBqEKpY8YcBEC
	N/C5nw+/G9NZ9PWke0dwndrmujla2Ko/5EhHC4OLwBjaR1yvXviRNrkZfeBtgcr+VD8LOHFCADfMN
	ktyCHroZJfvB5y2dDkLZIjHqdlvqn6X5k7RN5ZOUCfu6AccfOAvuHxnPTZzBbV+FNlSKJMlRUIThj
	6bW7yuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t7H-00BBD6-P8; Mon, 10 Jan 2022 11:45:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t6K-00BAWu-CQ; Mon, 10 Jan 2022 11:44:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9DDD61F436F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641815075;
 bh=bFgbf+SKJkohaV9z0g5mte5KBBwjvSAxwUBFmODWAhw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=A36shmdnUkCoT+7gAJ2/CGJwPNCabWozqEZZ9fjIIuYwqcVPk/UMBvFRy2be4+kif
 S5I0K/Iwz86gHF8Jgf723v59h823VxwMt7ma+AaJY51gSC9x26au8pPG6FljzkjG3v
 dwuyNHdZJSBxuBW2lzEmTKIlGpsPwZs7qDd24ryylKt0dxtApNGE5kxriJngIilpOz
 aYQFNR6wXZ1X3F5+/9Q4xIj2RaSMJA7ZM9cT9L403tggtJS4BsdvreAtjhW6NDQFWq
 Znx+L7JLG9xCyjCLMxN5vByA+LB15SehaRO0wVwr2Smxl5oSP8kU5aDyL7tjaGkO4t
 TiiGHl+BI6daA==
Subject: Re: [PATCH v2 5/5] iommu/mediatek: Always tlb_flush_all when each PM
 resume
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 linux-media@vger.kernel.org, sebastian.reichel@collabora.com
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
 <20211208120744.2415-6-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <02719a0f-9725-abc5-f5c4-acbb4bfac08d@collabora.com>
Date: Mon, 10 Jan 2022 12:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208120744.2415-6-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034436_615475_CF04FC6C 
X-CRM114-Status: GOOD (  16.79  )
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

Il 08/12/21 13:07, Dafna Hirschfeld ha scritto:
> From: Yong Wu <yong.wu@mediatek.com>
> 
> Prepare for 2 HWs that sharing pgtable in different power-domains.
> 
> When there are 2 M4U HWs, it may has problem in the flush_range in which
> we get the pm_status via the m4u dev, BUT that function don't reflect the
> real power-domain status of the HW since there may be other HW also use
> that power-domain.
> 
> DAM allocation is often done while the allocating device is runtime
> suspended. In such a case the iommu will also be suspended and partial
> flushing of the tlb will not be executed.
> Therefore, we add a tlb_flush_all in the pm_runtime_resume to make
> sure the tlb is always clean.
> 
> In other case, the iommu's power should be active via device
> link with smi.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [move the call to mtk_iommu_tlb_flush_all to the bottom of resume cb, improve doc/log]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
