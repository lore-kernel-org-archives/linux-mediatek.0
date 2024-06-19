Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05837C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCsVZ2oOpLxtMaTzMoJ+Aph94V4w28U+ppEhWXs7USA=; b=T0x41nVKXIYlIt
	SkI2YpqmGNzSGUoZF8ekbLTWzwN8K8DHz8Sg1SYEa3L8TObTJAGGvrlVZv2aD1eWZzlpantOqW56Q
	wzqMsmH2YVhdBNqxcW6Zy1nWd4KLQC0dWJgdlFupaRZc9z+kP/TWYrHFnwY+kKIY3st4T3+XvPdEa
	qHLSIWPZzybu0dt0RCTGtAWsQt3Jv4x21VPdnuiUD6JptQttwGjZPIwNkiRlC+Hn3oiXVY7uG1Mtp
	iEMg0BA0zQp+85OMAHvmO+5VLe1/g5bxh0fEvSogQ9VgfWfIlNdsbYOh9L/V0Q7776txd0GWNs0VI
	gV/k5B2nP1gpLGOdTRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsiV-00000000pEa-2lOz;
	Wed, 19 Jun 2024 10:39:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsiS-00000000pDb-1TNa;
	Wed, 19 Jun 2024 10:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718793539;
	bh=cKytdYt5vbtJnQQRa+4N+SmUx0M/mlzx2FbL2XVPyFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ocRLht3A77YH0SAmLdV1Q+YwATWPugN9m56L7mBrTX1rm9juVhrUtny2eT+wwSCEP
	 tN4xtL8tY7TIP5X4AsqTpJSv+aaa8APilFUBZoxesBw/Ao/LuvXrylbtVA+8QJ2fRt
	 60XflptarZdLEw/aJVSXODzLowSspXomCTNxxTPDMQhIbq4gn4swrHLRsEi0Vn+wGa
	 HmVMTEuLrkqLM2oQ7zs386TAxC9/dIgRfzGFCmgiLfWFqBPfoEJLUDGKFlgfEGn16c
	 ic/uZxpnPh38mWiSx6IXeyb1cp82gjtiSm69kiBUp74Bihk2bOisP/Nqqp7qrflXNT
	 h/znlx1c8yFnw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 768263780F7F;
	Wed, 19 Jun 2024 10:38:58 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240619103034.110377-1-angelogioacchino.delregno@collabora.com>
References: <20240619103034.110377-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188
 mutex table
Message-Id: <171879353840.114192.14898547206273336130.b4-ty@collabora.com>
Date: Wed, 19 Jun 2024 12:38:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_033900_557468_F15DA622 
X-CRM114-Status: UNSURE (   6.28  )
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
Cc: matthias.bgg@gmail.com, kernel@collabora.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jun 2024 12:30:34 +0200, AngeloGioacchino Del Regno wrote:
> MT8188's MDP3 is able to use MDP_TCC0, this mutex_mod bit does
> actually exist and it's the same as MT8195: add it to the table.
> 
> 

Applied to v6.10-next/soc, thanks!

[1/1] soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex table
      commit: 30db3d4b28990ad7897d66acc43b4f29e33abb35

Cheers,
Angelo



