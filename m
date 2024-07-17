Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99507C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wI0rtArS1WgKxojlPg55t58mWPWWS/K1OO8Ak/KOhk4=; b=E61ZATwaHqgUNOAsXauEkrGwf6
	saN+EQsbpm71qFXhLUgOJWhmt7wLScC14yG+OgZwm3CxvO/mUNnyLu9cZiFrg+xo5BbkYKiHv4PMS
	hZh7zZJ/ksImYQVLA3gJIp99+xFzGtpWC4sx8v3EZIJ4iqgVgtnk/LceZ9W9PPCrLsCDYS36U5jtW
	+8bpDqhl/QQHKnIy/dTYTg5zt4ENtqCcAoelSGgFx5oC3L4c4bnYnjubQq/z0H5eHGnnFb/yH/2YH
	bEZVp6QadpsSju9FrKvIr/4BSRf0HJ43k1zTr0ezhVgHiPUx5xXJsAL3+8U1MGYaWvBbp7xLFKX7T
	w64eL28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU1zx-0000000DUm5-0E4p;
	Wed, 17 Jul 2024 10:35:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU1zZ-0000000DUjd-0K1j;
	Wed, 17 Jul 2024 10:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 895A6CE16A2;
	Wed, 17 Jul 2024 10:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608C5C32782;
	Wed, 17 Jul 2024 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721212473;
	bh=BWONjJuPYbLkbk6R0VzOxPRnfY+qcY63hLYiP/w8M6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4WyBy4Ei/gt5vJUhiOfkKUqqE6KaUmmaRt49Qiz1wJcL8fyGpY4ibC/4PHwZC+2A
	 Rr2CBUmytHY6l4x8DAET5agBFWbJDRBivxvrQFjjWZ9b+r0kjjk4UISrhiQDj8aBcP
	 N3TCNcydVxNzq0RkcrdwQqfQ986/W7YvldWa+kBtyq1cHysIl9+rIs6ahVZ4YlPgzi
	 HME9wODGrS/7yneg4GF/OkZ3uBhgAxWKqsKhcGLMwnDYgtPfmYjkwsHT//GKMoHMTl
	 vBEUiLnZESZgvVsrptXQ8NEl38LmTXalnykU37LmZk+HzymIAbeTz6ugHpbf5MMfga
	 x9Jhi37ZhhyjA==
Date: Wed, 17 Jul 2024 11:34:29 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH net] net: airoha: fix error branch in airoha_dev_xmit and
 airoha_set_gdm_ports
Message-ID: <20240717103429.GI249423@kernel.org>
References: <b628871bc8ae4861b5e2ab4db90aaf373cbb7cee.1721203880.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b628871bc8ae4861b5e2ab4db90aaf373cbb7cee.1721203880.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_033437_340212_F4AAA33D 
X-CRM114-Status: UNSURE (   8.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 17, 2024 at 10:15:46AM +0200, Lorenzo Bianconi wrote:
> Fix error case management in airoha_dev_xmit routine since we need to
> DMA unmap pending buffers starting from q->head.
> Moreover fix a typo in error case branch in airoha_set_gdm_ports
> routine.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


