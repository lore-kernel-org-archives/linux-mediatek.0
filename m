Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E419CF8862
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNiTCEQmuFuQ64vrcS+bMvu7PnQmLVKha0uuZRECls4=; b=M4Yn+RZsvY5ILJRkA1QW1Uy3YD
	ps/rsDTAGZk+HZfGIoyvzvZItVJNghovwSCYEYiqpnAOXmNO/pPfuwvpIzL9ojVz1PeQvE/d/bQ7E
	zhtB3BpU1OamZN6Ux7OaIqt2yK9aqQYE2rLpipNyBSmToTZfGfIK+LaLYINgf4gKtBUuaIUonTI/z
	eHZLWP8Ob39Sb3ku5dn0mVYLzO4gRYjA2eP2a0uKZwe8qF4RoQNWViFQuBuD58rdctyx8ZNrSMa1b
	prkG0uBQBwbN3nWty9DWtybfYgFoYSItxyTblqsLWWQJntVjtAFMv3LEECys5KquXOCWy+7v0TzQo
	OnYTeMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Z6-00000006pwW-3GYb;
	Thu, 20 Nov 2025 14:23:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Z5-00000006pw0-3AU9;
	Thu, 20 Nov 2025 14:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B45676011F;
	Thu, 20 Nov 2025 14:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C6EC4CEF1;
	Thu, 20 Nov 2025 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763648594;
	bh=8ayBKTnZFAqxHMW9VO71uZ9963EOt7fbTOtBkrFddpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uce+on+4GGXMCrcBkMAxpNJoz88CPK3mS5gmZ7ylxeP7rCc3vZ7WatTt+95cf96ph
	 j7VnOnWUDKD6uoz59DDyB1x7hICeGMbvksmspMHnezPZrvdM/qBZtPH2o8CmO5yNk5
	 DmGiUkSPX6h2dgZvFQwZy+8xEUSEtjKllBF7+GzeIDjQZX985R2gyDEa/1R/9KC+AH
	 pP+jwtd1s1QE8k1N3+VIxRZitj76I+RC2OWR6tkx/gcgQQx6m6xbluwSzmBcXJ+pnZ
	 tGuXogdGc001h2b3c2tcdEpe7Zws/EkCfKCDCTtowUQlrD/5VKnSKbTcbY1epllrxN
	 42Bs/WO0dgZiA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251118121500.605-1-vulab@iscas.ac.cn>
References: <20251118121500.605-1-vulab@iscas.ac.cn>
Subject: Re: (subset) [PATCH] mfd: mt6397-irq: Fix missing
 irq_domain_remove() in error path
Message-Id: <176364859266.728452.17611488618737515903.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 14:23:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Tue, 18 Nov 2025 20:15:00 +0800, Haotian Zhang wrote:
> If devm_request_threaded_irq() fails after irq_domain_create_linear()
> succeeds in mt6397_irq_init(), the function returns without removing
> the created IRQ domain, leading to a resource leak.
> 
> Call irq_domain_remove() in the error path after a successful
> irq_domain_create_linear() to properly release the IRQ domain.
> 
> [...]

Applied, thanks!

[1/1] mfd: mt6397-irq: Fix missing irq_domain_remove() in error path
      commit: b4b1bd1f330fdd13706382be6c90ce9f58cee3f5

--
Lee Jones [李琼斯]


