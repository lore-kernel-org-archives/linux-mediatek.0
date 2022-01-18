Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36233C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cy4g37VC5TY0kVzMaHhqc/n4q7inVGYWnRQ74kutE9M=; b=0MZkaYslJkNKymKhIzdm7klFKh
	GNCkTBPa5oHKFUHdpcFf7+DHTbfixI752d/Gf4o4ztAhZLhG97J+EMY5vW+LJoah4ua7XUul19iTm
	LWfkCC0w93Ay4EevJ4rZLiFMzqxCNIfw9WEj/WlUhJVdJF9Kt2YVOx6CQ5AGkxiX8/WQh92dJQKFf
	TYuUbizbNyf10UeXzut+eVbQ6Bq2u94/I/3a9NPeih3MDmbMkuc8872VTjQ6T0hl3yQ5sRYhBkcCc
	qZ2ahYa6T4sTb40+ZrKJlMNtqrIVnadOBBbgkUDOIULde49nDWn1MKYKzo89gHe78abvFa25kus0s
	l4fDdMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9pqt-001thv-Fo; Tue, 18 Jan 2022 14:52:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9pqr-001thE-1D
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 14:52:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8989E1F43F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642517567;
 bh=YVAyrzdy2/UTLLd2OTgx05qjJiUpLbrvTZppq+MT52I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fKyWohaW7CNB+Y15wgIzTU9h0c69XzISKBkvJncHedJMjxJTV4q1jMrOEaiaxpPZl
 v/ATxLv+X++uEODsY11CtFyaGsHDjmtPsWqmGjjEJXLWL2q68f2VjMaANhSSt0IhWv
 M0AtJ5KTBN1h28Du37BPUkfzkxRIBg9eMXknuLgsa2qXr1T5FeO0sKAcgLCm9skuES
 xyu7MHVKSjADzVpuq8xRYgzCpW9jn7BnolfO8AVYGTdD7T4BoMIS2uUDSIVf4cTbkM
 Jo9YSUFQCsPymi1SndyGqRZO0YWZfgItamQiJkuUMVCpa0tYilcDK/TNMHCXllTR4a
 WN7xeSVDEDcBg==
Subject: Re: [PATCH v2 2/4] spi: spi-mtk-nor: improve device table for adding
 more capabilities
To: guochun.mao@mediatek.com, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
 <20220118142820.2729-3-guochun.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <87dceb69-99f7-e730-490a-f8e792c807ac@collabora.com>
Date: Tue, 18 Jan 2022 15:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220118142820.2729-3-guochun.mao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_065249_293087_D158DA2A 
X-CRM114-Status: GOOD (  16.46  )
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

Il 18/01/22 15:28, guochun.mao@mediatek.com ha scritto:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Define a structure for adding more capabilities.
> Add a item extra_dummy_bit for new SoCs, due to design changed.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> ---
>   drivers/spi/spi-mtk-nor.c | 48 +++++++++++++++++++++++++++++++--------
>   1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 5c93730615f8..f5ff01f61f42 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -95,6 +95,17 @@
>   
>   #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
>   
> +struct mtk_nor_caps {
> +	u8 dma_bits;
> +
> +	/* extra_dummy_bit is adding for the IP of new SoCs.
> +	 * Some new SoCs modify the timing of fetching registers' values
> +	 * and IDs of nor flash, they need a extra_dummy_bit which can add
> +	 * more clock cycles for fetching data.
> +	 */

Thank you for this explaination. That was much appreciated.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
