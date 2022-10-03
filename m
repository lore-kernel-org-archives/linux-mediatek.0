Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F5AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLvlOmvRxpgO+TTH0ILMl7lfs1xgK9QENZ3NYOD5Ank=; b=tiemFAtMnhej/JTlIsLXRx2Bfg
	h/ms9BDxFpeMhFbn+ktHNFrcuW/1pkJj0TH5ugufRzS27GX3u9Yrorm2bHhKC6BDCsr21lKyWIRPE
	vdZayXXujNZZZiPcRltsSZPtDqW8qvRcXg2mkt9HoPzasHbfNPQoCg8ZUch7LMmOi6ZiXriZ7EN7J
	fMnwbL1g0cWgiT/VmYHHrjOzZ13x8pOUe0V5UtO9an6ijCttkiJl4P6AA1X/X2IZuxC9QRJtBfSsu
	KOY2U0Gyx0EIxk+NSzvxjZy9+nQ9klou7j5KoDInnhOo6sQqkljvMzNWW0Qoebqe9/EgvetZVjyEK
	FdZNvWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMl8-006K9D-A6; Mon, 03 Oct 2022 14:49:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMky-006K60-0l; Mon, 03 Oct 2022 14:49:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 412806601B15;
	Mon,  3 Oct 2022 15:49:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664808558;
	bh=HMJJedZ83ECC+x6hsoS3IT6zUsXmxODD6JoL9d+MOk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bKKmwqDiGUX8P7pi5iudzEBAHgo6QPgSQSaIRUA8VwQpOxYylMbvKiHLiE6HzVVLQ
	 59Aa/HOk9w5lsVMA2bNPbAnljVVMn3LkXvDqp0rsMgq31zGaoDEdyN/WEomf+mRbe8
	 ogitZ/cxP8mimOjgwPiYNamq7gBCX5eYnzIi1C858ejw9268gHs7cjMdPpzkEKq9xj
	 DqrB5q8HLxnwSvpF+VImR8Q2rysNRvGxM926j5m4rkrTCOwos5Htb5vua7WZ9953RE
	 yscljx1g+U4KCT/zWwGqBZnqOSHZovEBSznkA+BNBW+ZgCEX0bBox/Vbt7qhdjS6O+
	 yGNRGPK72oXyA==
Message-ID: <6812059d-fb1f-f594-7f9e-eb62defadd09@collabora.com>
Date: Mon, 3 Oct 2022 16:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8, 2/4] mailbox: mtk-cmdq: instead magic number with
 GCE_CTRL_BY_SW
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
 <20220930160638.7588-3-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930160638.7588-3-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_074920_216216_BD6E28DB 
X-CRM114-Status: UNSURE (   6.56  )
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

Il 30/09/22 18:06, Yongqiang Niu ha scritto:
> instead magic number with GCE_CTRL_BY_SW
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Please fix the commit title and description... an idea:

mailbox: mtk-cmdq: Use GCE_CTRL_BY_SW definition instead of number

P.S.: I agree with CK, please send this as a separate commit.

Regards,
Angelo



