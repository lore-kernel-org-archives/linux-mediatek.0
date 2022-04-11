Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D037EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Udt40OZib7xvO3BEC0uIO/RQ/1BAzLBfG2pGE05vGSw=; b=YxQLHLKGRYJmBO
	hInkISOO8SIQd4U6jWz9LGsLcoIiNnqT1A7h5dTM3ynFUrDPx/h+YHT4W7fMWdEX4LHG9axb3PtSC
	/Ao4muFx9M6zKShNRjyJh4E++NE6gNXvqeqOZupOsvz6zHvUDzXw+T5Vp9ZjM4Lb3P75mx+2/Lckr
	MsALJC79+YUrCX3qDJv/n3kbtbuGwCSI1cqCqjZAWiONjWW/GxacsKiPQwaX8p35p+vmyLLD0Z9OC
	IfzmORvEA3XoCjf/8LN6oMpdY4i86cZFCQ2s1XiwQGlEYuKo2yTPurFgYv3wBHomavRRZUF8Te1cI
	KCxp3jqB7ayjGhOKcdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nduvT-009NGp-9C; Mon, 11 Apr 2022 14:21:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduvQ-009NFd-E8
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 14:21:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31D95B8160C;
 Mon, 11 Apr 2022 14:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44694C385A3;
 Mon, 11 Apr 2022 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649686907;
 bh=5esbzlQiSDQRKPncRRwaNhS8LMOot6WStrLKqQ9+byM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBRquvBIOR3gmLU/y5WIc4CcbKG4ivIyMKal0leKy8AlRKCD49oYo3GPnBZxYsOKe
 YavDvK6UoPKRfinFReKI22vwfEvZb4xOL+6EQykB5c4Z/dn3vKkxflTFiW/0T7GsIC
 vr7pB3flmIDrnmbaxu9bMmRlFW2gXIDVordhRLZdSXyMWihHnhPMroI1CDzWTPAoEJ
 oEyNM++Bo0XSGlT9KQ79p2OgtLwIlu05WeC7A5r9n6vSD5FvwENaMyDc45h2r6U/kf
 qpi/6l0nsfbDlMynayqDJGrbTqg0WpWTVPNv9yfHL4hsmeWEkqflxDHGEPdJzr10RS
 vyeR4IgLo1XIA==
Date: Mon, 11 Apr 2022 19:51:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH -next v2] dmaengine: mediatek:Fix PM usage reference leak
 of mtk_uart_apdma_alloc_chan_resources
Message-ID: <YlQ5eNbPCV8KCaRz@matsya>
References: <20220319022142.142709-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319022142.142709-1-zhangqilong3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_072152_657538_FD5607BF 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

On 19-03-22, 10:21, Zhang Qilong wrote:
> From: zhangqilong <zhangqilong3@huawei.com>
> 
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> We fix it:
> 1) Replacing it with pm_runtime_resume_and_get to keep usage counter
>    balanced.
> 2) Add putting operation before returning error.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
