Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB33C5DF60
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 16:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEEB121A4A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 16:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ETgh0Obt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDUDBCjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEEB121A4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVdP+IPfqhMDB6HNdV9fDnXiJgjXy/8sE/bNLTcybEk=; b=ETgh0ObtPprOI6
	3SJi60fNda2nM9hNjjIM/iW/mNLTxgTvedJ/7rZ/nSLncFzdsgSRaFWBx5ULI5eDeLAO1EV41W5/u
	4PDIixuKBCtwdWcgVH37H1Lx8anSB+sx4Jb+l6oIhepCslNey+TX9FHdRXXwigG2G70YpVHEP2MZs
	xcTYJ4Dhwa8fOtvaHYBhFYchY+nvkpFdZ4L6LtftRQquGtOhRb+vJwCGO6K5eLcDKvVJVqRlpOkwE
	5shwthH2LxKCbF5mMzXVYw0u68hKfcBhWiBAe6xquSv07D8j/GHLwFCsG4oZoPYevQRHHm5YOSUu6
	5MSn2Hexbzol2J1hytOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS2Az-0005mv-9B; Tue, 05 Nov 2019 16:59:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS2Ao-0005dd-Lb; Tue, 05 Nov 2019 16:59:19 +0000
Received: from localhost (unknown [106.51.111.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D34021A4A;
 Tue,  5 Nov 2019 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572973158;
 bh=itwzwaA2ErwVFDiuv4xl5wSZcNBirWKCcH6Avyv9N4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YDUDBCjsItEUpV5Gqb29mUUO5bG1m8ZfXTJp3VzatnORLr8ABr+EiIKbBSckn5Cxn
 5rgrW0vvyGqbV92OeJVZ05R70IMP46UAC5KV2Cm6goJyMcIO9ZZNYoNkxsnvjPWa8f
 ew+q4NkTJylfxWZ5JOcDcM+0py0xE3dqA3YBTueE=
Date: Tue, 5 Nov 2019 22:29:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Satendra Singh Thakur <sst2005@gmail.com>
Subject: Re: [PATCH] dma/mediatek-hs/probe: Fixed a memory leak when
 devm_request_irq fails
Message-ID: <20191105165914.GD952516@vkoul-mobl>
References: <20191024044320.1097-1-sst2005@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024044320.1097-1-sst2005@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_085918_725320_82333A73 
X-CRM114-Status: GOOD (  14.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24-10-19, 10:13, Satendra Singh Thakur wrote:
> When devm_request_irq fails, currently, the function
> dma_async_device_unregister gets called. This doesn't free
> the resources allocated by of_dma_controller_register.
> Therefore, we have called of_dma_controller_free for this purpose.

Please revise this one as well!

> 
> Signed-off-by: Satendra Singh Thakur <sst2005@gmail.com>
> ---
>  drivers/dma/mediatek/mtk-hsdma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
> index 1a2028e1c29e..4c58da742143 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -997,7 +997,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"request_irq failed with err %d\n", err);
> -		goto err_unregister;
> +		goto err_free;
>  	}
>  
>  	platform_set_drvdata(pdev, hsdma);
> @@ -1006,6 +1006,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_free:
> +	of_dma_controller_free(pdev->dev.of_node);
>  err_unregister:
>  	dma_async_device_unregister(dd);
>  
> -- 
> 2.17.1

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
