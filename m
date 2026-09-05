Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D724FC624DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 20:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uebY1ihEJpxkEHBjLjETudQnyv39hQelW51+BbXUxWg=; b=4jo8zarviZWrrcCb8EsLqjtJ/h
	G4+e0gjVyVpsRaHo3hFbGqMyBBIfiNT7XxN3wCwzJBLdGew5AlCN/TPH3vB0EkIAtUl9XmtCVIlgF
	obFf9ifwDx4knHVFW9Xf3pzF5tglSZrNHfB0/hv42oNf/fkXlVLMzqPY2Q7Zhoj3YxhA+pV2F1yUb
	PJKqodeH9E/kMNT3SFekm0aCkRa+NQv4/dpva/Jw79QtdASocM/EMs/ZoICS4NyQbeevzxX30qCtN
	eGUpS0lntxLRQuBlujMwdFqpuGddSWYWj52O0zTNFftTUQX1Daca9irAcIEMfFtn87UVYJrMw9bGz
	mRFl+M9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xFl-00000004PH8-0BC6;
	Sat, 05 Sep 2026 20:44:45 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xFi-00000004PGe-2wum;
	Sat, 05 Sep 2026 20:44:44 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x2xFV-000000002Pj-2B02;
	Sat, 05 Sep 2026 20:44:29 +0000
Date: Sat, 5 Sep 2026 21:44:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "hpp.iscas" <hppiscas@163.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: mt7988-apmixed: Publish the OF module
 alias
Message-ID: <apx_Ks4KqoJZgVHd@makrotopia.org>
References: <20260905133417.64373-1-hppiscas@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905133417.64373-1-hppiscas@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_134442_742437_51F8049F 
X-CRM114-Status: GOOD (  17.73  )
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

On Sat, Sep 05, 2026 at 09:34:17PM +0800, hpp.iscas wrote:
> COMMON_CLK_MT7988 is tristate and builds apmixed as a separate object.
> The apmixed platform driver has an OF match table but exports no OF
> alias, so that table cannot be used to select the module on a device
> event.
> 
> Publish the table. Keep the existing initialization entry point.
> 
> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

Not sure if this Signed-off-by:-line is ok like that, do I understand
correctly that 163.com is a freemail provider?

Other than that

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> index 416a4b8..24f4e7b 100644
> --- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
> +++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> @@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
>  	{ .compatible = "mediatek,mt7988-apmixedsys" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
>  
>  static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
>  {
> 
> 

