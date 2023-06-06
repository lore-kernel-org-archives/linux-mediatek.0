Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2773C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX4ptdgi7WcIwg7E7dKEJI5FRwfdwSqHkWPJDXodDMc=; b=ljH5hpREtxtr7iStyedqxTAZf1
	H5ETMKqHDropOE3ll6m0m0Vd+3H2nb2jfX5krx0hQQkRHNeRY4OKCtWFNKM+KhfdAQYBrftTbu9TZ
	6IhTc84gFaA97pjOhARO1KQOVnB8osN7Tvoo59r8SWIEMXkXGiUMLmsF1uMM+DXAZOLTw0NJElNLf
	QF/HYcz2yUxJDVJEHqhOVPRlRO9t+whf+iL4eJ7V/OCZoUVgYUeZh3ol+wqGfhrNvHS7eQiU9I1o2
	150tzOv8Qe8LTX62W8nBy2hFa6WWBopu0TxOpAcW+tRHvkVNmEypcxNx1modIpzxkvBzcrA8SA+e0
	5cFjswiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6WJC-001lO7-1L;
	Tue, 06 Jun 2023 13:01:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6WJ6-001lLZ-01;
	Tue, 06 Jun 2023 13:01:08 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 836906606EBB;
	Tue,  6 Jun 2023 14:00:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686056460;
	bh=5X1vYezIwDbqeMCS78Q98whyEA5uh7OHIVeHGqM+EtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bfbe3+nAwOOs1sT8xUYl78AUiOqTLNLqOgHUc/MMsJpbI2TDRkVIX6ZshuNRESg9i
	 CdTefngagGRRzKM4hy1+okSH2ATYC5alLYo+nqBMbCr8XQZc/FeMDRo77evveNN2f4
	 BnDSjSwiV0mwF3IkIGbs6zsl/GjEX0rb/SG6NDtMJwajllD3EQWPXu3P9CNUY6WYb5
	 +tJAmdnnTF1NlgPxo4erKN7XTd90KoNPywzu47sO77C/9mlBtrAD+e7XMK71xaQtHl
	 Vs1bC8qAw/u7GPyFqqkgOHqkpWqAtBQ7NDwl8W9btme5JJ+7PWhae+nF4+OHx+w1sQ
	 e9LrCwjcVgdJg==
Date: Tue, 6 Jun 2023 09:00:54 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
Message-ID: <0e9667dc-8f91-49a0-903e-6725204e11ad@notapiano>
References: <20230602183515.3778780-1-nfraprado@collabora.com>
 <01c88a42-274c-f8cf-73a6-29741579d9db@collabora.com>
 <4b2fdd36-0871-ecc7-5d64-e088d7f51987@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b2fdd36-0871-ecc7-5d64-e088d7f51987@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_060104_190470_AD5FD2AA 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 06, 2023 at 08:38:42AM +0200, Matthias Brugger wrote:
> 
> 
> On 05/06/2023 10:21, AngeloGioacchino Del Regno wrote:
> > Il 02/06/23 20:35, Nícolas F. R. A. Prado ha scritto:
> > > The capacity-dmips-mhz parameter was miscalculated: this SoC runs
> > > the first (Cortex-A55) cluster at a maximum of 2000MHz and the
> > > second (Cortex-A76) cluster at a maximum of 2200MHz.
> > > 
> > > In order to calculate the right capacity-dmips-mhz, the following
> > > test was performed:
> > > 1. CPUFREQ governor was set to 'performance' on both clusters
> > > 2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
> > > 3. Calculated the mean result for each cluster
> > > 4. Calculated DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
> > > 5. Scaled results to 1024:
> > >     result_c0 = dmips_mhz_c0 / dmips_mhz_c1 * 1024
> > > 
> > > The mean results for this SoC are:
> > > Cluster 0 (LITTLE): 12016411 Dhry/s
> > > Cluster 1 (BIG): 31702034 Dhry/s
> > > 
> > > The calculated scaled results are:
> > > Cluster 0: 426.953226899238 (rounded to 427)
> > > Cluster 1: 1024
> > > 
> > > Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and
> > > evaluation board dts and Makefile")
> > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > 
> > 
> 
> Applied, thanks

Hi Matthias,

this patch doesn't show in your v6.4-next/dts64 branch, while the other patch
you just applied does, so I just wanted to double check it was really applied.

Thanks,
Nícolas

