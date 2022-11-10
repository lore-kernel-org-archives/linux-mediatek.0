Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0447C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ehegx5upTwUwKUa7i1fR2NFIOGbbZnhMXi3LaBv9R1g=; b=kiVX9WWVbnG7U9U6vGfrJG8C6r
	suv4mkL6dU+LJ5Q9zfLUQofPaLIeYf8r3IfUhd18LfRRsyjVzpvR7G4Tr4fRw3tdHyY0bqoLeVn7z
	GetOl2RBwpU3H8MKIeRrhB2+QQ7dR2/E0eGCFO1zVD0R2vlglUB7wu/twX6AN/VO8gwd802fEpRn6
	8bXqOnP+22rN50+mTXTk0IbqR/qKFTUGTXftCccxhM5uFb7UBfbflLimhfqElIBK+efjlVhyVx+/s
	2r7L+OcGQz+2awivM+2VI3HmpaltPIwHf6e0g7BIJ0taiKwNWA460u12zhKTMgb8A38fB+vLQ2ykx
	xPKeenUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3R3-004Pwy-GU; Thu, 10 Nov 2022 09:01:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3Qq-004Prb-Hg; Thu, 10 Nov 2022 09:01:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 863E7660296E;
	Thu, 10 Nov 2022 09:01:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668070866;
	bh=V3LxIHxrigauZUZ1sN9cfEsRLLqICxP6H8hCpXI+0S8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aOQPCbm9zRqrdI5uRlt2A1HHmDuFG1r7ITm3kIr2EVw1xgIwT4cMuO+czifU7qSLB
	 orFCzor+dFH2YcfclZxAXJZbiEShr6lRb0KtrXpYrcAiYSrM8QqHTLvqJTmNj+NeUz
	 ArhfcwqZeEdIOuGzv3zVtvV8vZve9PBzl9yyLvkTJ0fcGkeSwgmMsOSz1DLzQv9gb5
	 IzP/xXjdB5RNVzyuci49a3zNEqrCLTYDJoZ3t5uTGAQfevfv9F+bLToky8BgAXd5Lh
	 y0hkXM2rcTPVSR4Mwk0SxcoBsbED4XLdwRJd++VOpq/gyFNEq2sjTsTBLxAqdgrgfi
	 yRU1WE/eJHctg==
Message-ID: <0fc25cbd-6a4c-18e3-510e-a9cb1d394915@collabora.com>
Date: Thu, 10 Nov 2022 10:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] spi: mediatek: Fix DEVAPC Violation at KO Remove
Content-Language: en-US
To: Zhichao Liu <zhichao.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com
References: <20221110072839.30961-1-zhichao.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221110072839.30961-1-zhichao.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_010108_748717_6F2CAED7 
X-CRM114-Status: UNSURE (   9.20  )
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

Il 10/11/22 08:28, Zhichao Liu ha scritto:
> A DEVAPC violation occurs when removing the module
> due to accessing HW registers without base clock.
> To fix this bug, the correct method is:
> 1. Call the runtime resume function to enable the
>     clock;
> 2. Operate the registers to reset the HW;
> 3. Turn off the clocks and disable the device
>     RPM mechanism.
> 
> Signed-off-by: Zhichao Liu <zhichao.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



