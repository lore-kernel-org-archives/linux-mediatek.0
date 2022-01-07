Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0604C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTqcTwiGKxTmkOevjVc4IeeX1kWuPSUVhC/RRg88cQ4=; b=G+4Ty9BAnm06E7
	oxWO83XY0FB8uZy8mAFTUX8hg1SVTpHSIlLLqhTjebiKtc/AzYe16kbreMENRZQxjKQ91AoEBhcdC
	lrbP5bsp1R+OcY40AfcwYEcVm/jq0r6+rVpvO4otx4X1FbauJyLQvflPA+gM72fgazeq7r0/lmHeo
	O1WPAZHV6AhVqYcWbQck4aFhZek/DFw4MeVBlgcnvdJ/ulD44l+JBp6V/HVNhY+sGBHCNPDkLu8EI
	Ue28p6UFI8kn/PXXlDlbRNWcmCNHd944ctgP9a/34tPClNmEmSxO5WuJI6vtg35ElQ83czvoW43nZ
	o36jYBdOzRTHYS6clSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5eyq-001wcu-Eh; Fri, 07 Jan 2022 02:27:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5eya-001wXT-H1; Fri, 07 Jan 2022 02:27:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D617B82352;
 Fri,  7 Jan 2022 02:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4975FC36AE3;
 Fri,  7 Jan 2022 02:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522449;
 bh=3deO5J5WF8oVmHIVSHZ6znm+WwoicJjOuwpVUj/yQWs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=j33VayXL/izvfQNPweBSsk9B9SMlsnrhS5PJuXW6bvaEeDDh25csKS2MfhzfbD9/j
 sC8ABYO2GBjUn4qkfbJ+WJTaI9G9w4Y0Yed8tdVhJlmwbKpVi26bYZwrEanobKwclW
 pcQtw/XK5S0QIrx6bBwYJGSv0oJs6muKKw8o7mZgUg41E9K84e/3AQTZMXLHO6cVhu
 h05ynRcNmoAnEXmJTdW8Ho2//UJ7xHR5dyhBF3mkQPBpoBV3RhXgL5pQYW69HMMMPl
 fmj8v7Sd/x9ssXfW/n3n869fC7wgyk8pPpwWE6VU1riKiUsiPd3l8LmzQfPN/YtPbV
 qYK5Y49byUocg==
MIME-Version: 1.0
In-Reply-To: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
References: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] clk: mediatek: clk-gate: Shrink by adding clockgating
 bit check helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 miles.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Date: Thu, 06 Jan 2022 18:27:27 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107022729.4975FC36AE3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_182732_728793_C5BDE3C6 
X-CRM114-Status: UNSURE (   7.77  )
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

Quoting AngeloGioacchino Del Regno (2022-01-03 06:37:11)
> Add a clockgating bit check helper and use it in functions
> mtk_cg_bit_is_cleared(), mtk_cg_bit_is_set() to shrink the
> file size.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
