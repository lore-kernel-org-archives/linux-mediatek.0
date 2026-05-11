Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90BCD37B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NLZsOmOBqpKCp2TTXmLY4kwNPLhR6E91EsWy8eZFtU=; b=FoZ7I153Z6mpIk2w5Y4BqQEEHR
	fe3nFZcV7E3O3vwfT+yEyZGg1lWeQ7U67J88Uw1Elhhh8A2yTguE8iod3MqjeO1AjoJRRXJ8pSaTV
	AgHesW+3r6Wg5Wq8EvD/IfUpGL+0RF8QCgGrvRVg2AQW3FvcLR30zu1xWes/Jl7yvYd0VdrPNrntP
	xSo8AA7jmofuhQi+uRwWaWevwo5uuIOLdukBCxyZyTWLDMNh/5xvyoyVP6dShD4mmfmD6O8ztoYts
	oidh8EMnfmaCucOukpSEwtorktABdad+rUzQvVEeTbATkbaeW3e2bGAcEYTJev9yZVYmXmlNegicf
	+KcGyXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMr1-0000000CtxI-1Dm9;
	Mon, 11 May 2026 09:23:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMqz-0000000Ctso-0p1b;
	Mon, 11 May 2026 09:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491385;
	bh=VA9PFNMqRLTjBC/kJnfP4N38+4lPlbQDcu/XsZekJgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h8Ht5IV2ie2MR+vUkMrb7E90m+nW7kYE91fZsWsVFITWFmRfPYGC6GGZWTZqVOpn9
	 9VP9pPQbsVACT4EBrDsCKb6bpwYoQGrrUdL5VWts7h8OzIwAYWbdDlx/0tQxoowLkd
	 GeE4aZ4Mf+lRI9piKDJf620n8OYjnLWHCkLT/UHXYXUrwJ02vMvAMH3jD4anmvlPzF
	 rSLpXL+7BtXl+b4XVw0S8VGXUhVuMkEtNUVpoL6O74qNDkSJ99iT4/mULPrQMw55K8
	 A+U1N+vQtd3z0DUeoArofefcuJ30PVEb+ljXeX8CUlYnQA+7Y6C3KpXvwT6xE2mplK
	 DsSRd0jGGt2DA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F22F417E0CA9;
	Mon, 11 May 2026 11:23:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260505211345.318647-1-l.scorcia@gmail.com>
References: <20260505211345.318647-1-l.scorcia@gmail.com>
Subject: Re: [RESEND v2] soc: mediatek: mtk-mmsys: Restore MT8167 routing
 masks lost during merge
Message-Id: <177849138493.112419.7545938404904806724.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:23:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022309_430634_B21DB17D 
X-CRM114-Status: UNSURE (   5.26  )
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

On Tue, 05 May 2026 22:13:16 +0100, Luca Leonardo Scorcia wrote:
> The original patch that was sent to the mailing lists included the values
> for the route masks, but they got lost during merge: add back the full
> register masks where missing.
> 
> 

Applied to v7.1-next/soc, thanks!

[1/1] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
      commit: 7d462de9f65b002b439b1b168bf3b5579b0de48b

Cheers,
Angelo



