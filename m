Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67323C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 07:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fc+mludGFdIwfx1jYDle6qurw3fCHrkmcks+REznfGY=; b=bvZl/9IPUnzStu
	UbC5ma1ImMl8GfPX7L7p7QENVQLxzSfGfd61CQOfj7CO/us8ywNrpKWIlgj5X5Np7KVDS77AMAh7c
	6i4zTJ18PiPz0qOfcCcVD/Q7nFZifxRuOzSpZ8A2AxRV/L87ONqJ6enDLh99os9CDd4Ce+7WGUr3n
	ka5c2O7P7iw8jYDoB3/+6CdFMrqVggleWsMjlJ8AGgxVKOn6gmqEIvwoW+ulyo7EQSeRcFUJT17Gw
	fYmULFQNfsddaQJGjMPPTDyIUzuQTJw/SvXvFwQjZeEw8ypxT4neK70BhDpntJV9rERWKEADsff57
	uTRhE7nuKtforNYpFsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXl7-00HT88-GV; Wed, 13 Apr 2022 07:49:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXkw-00HT3F-JK; Wed, 13 Apr 2022 07:49:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2EA6159E;
 Wed, 13 Apr 2022 07:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAA4C385A6;
 Wed, 13 Apr 2022 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649836177;
 bh=U5PFHPlUvPZnKkFDVh2DWWPvU8ylQUClBVWmpgIeQN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIcN8dEbQPD4AXASMcF4KWt3uc1Wf8dkf0NVKB9SbSj8GBbWjMiXP0nYBKSlWmr1t
 UMIZxQl++1jqmr/cWNew75zE2zGbuxWPjFXsgM/oP86tLlFaDhvM9I/iIToWLqhxc2
 8uM8fFrxHGe/cqM7P/0y41lPctHsEV7pB5PIMjnxHEKTIi3lG9cE1/YWF09HLQwTyx
 /e2b8jQplvbZUHXSNBO1LeXcvu29+mLBR+A22h513FNlCe3/qPxoDekFebfVEZ0DUs
 EnOAF9zEE4xHze8pbAcjj/WCry/rkyGEh9a0z6syhYNvi2IDk1g+jCjkpKoAc4AdpO
 jmuivhSio3W5Q==
Date: Wed, 13 Apr 2022 13:19:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 chunfeng.yun@mediatek.com, kishon@ti.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
Message-ID: <YlaAjXmwFB6eRNnd@matsya>
References: <20220328145217.228457-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328145217.228457-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_004938_691638_80F4518A 
X-CRM114-Status: UNSURE (   6.33  )
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

On 28-03-22, 16:52, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
