Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9AC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5s129R2qt3ktQUt2qrzzcgVNiVBZknyyBBU7Qp/Z7I=; b=xl+PlYv3ouSFKONAT3o4jbkFy5
	+ocqZjxZRYjfbLFFA+mGeqppPfGCiPeljQpxKUkx6osr6BWSnU9AbkhE9v/hE2TSskZGU3dmxOoGa
	qJ3ug2zpGOrE/6bDRPeT/nQVbcYGyZvUgcuyx9YR5/g5AoQFwRaY1tndI/7X7oapgGE8BlUHBKmq4
	P0naT8SJYx2g8Cnp/s/icseK3lPQi8/6NqnfWsaR80rJfZs7cFx3kOfozjLI0vj1iZz/o/gU3Ftbf
	Jpjn5BQba7JTn9F9e5k7CPaKdAyX3i6PTp0ymEPnPJGoPe7Ffn4z3ARSyrcB7XZg/KeY8mdtdr1Wu
	lVEqFNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9NL-00EZtz-36;
	Tue, 28 Mar 2023 13:28:35 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9NG-00EZsT-2f
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 13:28:34 +0000
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 04315243E72;
	Tue, 28 Mar 2023 15:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1680010108;
	bh=N8ejcUWpQfYs16FWNBvAx22Mygy8fNuSfssyZNAHsVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2J83d/sK5H3vZbLIwLROix4mqLAb2VDHvOFSNiknrxfQKKaKJo0d6rpw9uVZs7XT
	 b9cAav6Wvck0r7qIh2fcfocaENy4y5CIQMW7evRm5h3AcJyeKWSgA0r9QLYehPaOFd
	 JfiBYLs7Zm93B87i7fzVk6yprFq0blc/151RIIB2k9zcqMMfXHKdeYS52TGw4QTu93
	 +SHgeIuCQdR9W6l/YYAR6+f0Ju48+XvZ6Med50yaCi5ImeJffSvsfITt4vNtEnA+Fm
	 exnQ4/+G2YYeQuAc5qSBwalmLudOdhQhc3KFEHWJfcZ67kRHmIEa9/xqilbXxIBXPq
	 Ul0YyTHUQVaVg==
Date: Tue, 28 Mar 2023 15:28:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chengci.Xu" <chengci.xu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/mediatek: fix a reversed test in probe
Message-ID: <ZCLreuVYNcXtkCHH@8bytes.org>
References: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_062831_094152_035F67E2 
X-CRM114-Status: GOOD (  10.06  )
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

On Sat, Mar 25, 2023 at 02:07:52PM +0300, Dan Carpenter wrote:
> The dma_set_mask() function returns negative error codes on failure but
> this code is testing for zero instead.
> 
> Fixes: f4b49c7c5e67 ("iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the fix, but I replaced above commit with v3, which I
overlooked when applying it. The v3 post has this already fixed.

Regards,

	Joerg

