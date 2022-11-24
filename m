Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08901C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPt+u+ePDhXj1F32w0SaqtkUHxjZailEayuXOr+ElQ4=; b=1M0O7IWRplWybbZiwxTJm0AQn+
	hqQt07kmF5ERe9Aox7vJohnQRLoK0oct3CaHHPGn3qnytGfOxdRT3vg45AGtjaaGz45otp8AxR4H9
	o2rYtLC+vPdYaK6DwkMcWPM5erKqWVoYt3w3sswz3YETOmi9H/2DQldgNvYgjEyvU5CLo7sfFyDpW
	Ct5FmgHPrjKA21oUpzcHNzqCVUeDa0CqcboTlXriR77PPvbaLoX49bb5kv7q8o+1DB1PmF//KWe7J
	aZaYY5nJI7R8U3U5YaIbDjg4yHhvEm/kFFF2frSODmyILXdBY8x4pQ5qMnmxCDtt3BqKAsXt+L2eF
	E8UwdJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGCC-00AXXQ-G2; Thu, 24 Nov 2022 17:39:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGC0-00AXRm-75; Thu, 24 Nov 2022 17:39:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6B80B82898;
	Thu, 24 Nov 2022 17:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E806C433D6;
	Thu, 24 Nov 2022 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669311557;
	bh=tyzmNAgwRMboqPDBUM9cWs8DieS+1c/Ts/cUfeW/wlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuhKSYQIHJWfV+VTYQmilf/wk4qAFbnygigDtZyDzcFUeTFcZpnmSkwABw4PN4moQ
	 o6asFh7VVVAisaw7o1n4+G4wdnrvLQUsk7BK9llkHePNn8zoWQ/NFfh0LxRL0l1EMY
	 /mM5UVWCCA3IkUJrNFCPfb85PbSebLNaF8f2SjTX4ikcNjnjkbH/sAMtCfKrukooHF
	 Vedz4ShSw/V+S7+Y10p0fnqkleBdF9+GcgEmxazUbf4p+GSqIerWN06PbvLg85whdf
	 YvlhaJNup91qkxIVZB5lo/pR+j7+2GyHxZJEtZIqoZPC754v6V1zWYIcd1DpHSbqYP
	 9FqUuOsArzeMQ==
Date: Thu, 24 Nov 2022 23:09:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Eddie Hung <eddie.hung@mediatek.com>,
	Tianping Fang <tianping.fang@mediatek.com>
Subject: Re: [PATCH v4 2/3] phy: core: add debugfs root
Message-ID: <Y3+sQewHEpCU0xu9@matsya>
References: <20221110132716.12294-1-chunfeng.yun@mediatek.com>
 <20221110132716.12294-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110132716.12294-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_093920_434501_2377B470 
X-CRM114-Status: GOOD (  18.06  )
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

On 10-11-22, 21:27, Chunfeng Yun wrote:
> Add a debugfs root for phy class, then phy drivers can add debugfs files
> under this folder.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v4: no changes
> ---
>  drivers/phy/phy-core.c  | 6 ++++++
>  include/linux/phy/phy.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index d93ddf1262c5..2f9f69190519 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -11,6 +11,7 @@
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/err.h>
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> @@ -1204,6 +1205,9 @@ void devm_of_phy_provider_unregister(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_provider_unregister);
>  
> +struct dentry *phy_debug_root;
> +EXPORT_SYMBOL_GPL(phy_debug_root);

Why expose this to whole world? Alternate approach would be to add this
in struct phy

> +
>  /**
>   * phy_release() - release the phy
>   * @dev: the dev member within phy
> @@ -1233,6 +1237,8 @@ static int __init phy_core_init(void)
>  
>  	phy_class->dev_release = phy_release;
>  
> +	phy_debug_root = debugfs_create_dir("phy", NULL);
> +
>  	return 0;
>  }
>  device_initcall(phy_core_init);
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index b1413757fcc3..c398749d49b9 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -205,6 +205,8 @@ struct phy_lookup {
>  #define devm_of_phy_provider_register_full(dev, children, xlate) \
>  	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
>  
> +extern struct dentry *phy_debug_root;
> +
>  static inline void phy_set_drvdata(struct phy *phy, void *data)
>  {
>  	dev_set_drvdata(&phy->dev, data);
> -- 
> 2.18.0

-- 
~Vinod

