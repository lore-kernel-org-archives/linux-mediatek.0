Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D786C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJKKGitzQjOBu49arzAcK+YXZj4C9/ZxBW3MU6J9eIQ=; b=nm6bP301rK/LWU
	KG3j8WJ1Lm8/yBkeoGAsABLwH8M55YDaCKwNyoSIlN79IiIfNKCskt0o/7UZbgAAlPkD6sUFb/KrE
	kVMRZAMCY4rIem/oClaDRd+3No6mAMUQXDLTwQlz+tD2XUecz7z/DKPa2zArgV5BWeNqSEUZQ4VQ8
	TlJQj15QWdXHtYGu073MdzyWeUsn6pTqffA7ynx3fhOZMnwNOh4j/Oqo/P7WuJOZu1/mCS+RpocVx
	fCdH4gT7u4mRUmM04rKo4zJvZuFHvc6ASqacfhASCEj8zmuoMk0635BCcVHuCPC/Ce8oqNS6XYhWz
	GcOq/beO5cXruem6ED8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nho3G-00GzBT-GO; Fri, 22 Apr 2022 07:50:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhnzR-00GxAy-GW; Fri, 22 Apr 2022 07:46:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B22ACB829DD;
 Fri, 22 Apr 2022 07:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E2BC385A0;
 Fri, 22 Apr 2022 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650613562;
 bh=d7DdfLVHBzoMwY9s9afOMHivuS5z7UO53y+qRExaI4g=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=g2Ix2CmD+h6XYXS+ZxSj7/TtWfmzDMgqg280d2chhORi0tqBDGCr+AcUsnJT4qRBb
 sRRUcsC04Us16r9ELqy1MpknoMXvx/MQwBJ/Lj8FA9QDa+iWTjowciFQbg0tJC60lH
 NHyR5m3HH5jKcsl/CpJ4cIMq5MOMudSJlSeYUXjMIXXzHdXi+SJcZZLPsfS2QQcD94
 qV9oD7mYtKr1cGETBv0p3SuxvN9KxbHSixLkV5FaQ/UYL3YpoPzwpHBcjD2NCd18TV
 2SMpZmgormeA4vc4aG4ohUEpEhor7wrPAiUYdKPnsH0zhqZXrm17dGVECoJSaWtrMy
 9kP2dbAoyV7xg==
From: Kalle Valo <kvalo@kernel.org>
To: Bernard Zhao <zhaojunkui2008@126.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, "David S. Miller" <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, bernard@vivo.com
Subject: Re: [PATCH] mediatek/mt7601u: add debugfs exit function
References: <20220422070325.465918-1-zhaojunkui2008@126.com>
Date: Fri, 22 Apr 2022 10:45:57 +0300
In-Reply-To: <20220422070325.465918-1-zhaojunkui2008@126.com> (Bernard Zhao's
 message of "Fri, 22 Apr 2022 00:03:25 -0700")
Message-ID: <87k0bhmuh6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_004605_890943_6BEBB4F1 
X-CRM114-Status: GOOD (  22.99  )
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

Bernard Zhao <zhaojunkui2008@126.com> writes:

> When mt7601u loaded, there are two cases:
> First when mt7601u is loaded, in function mt7601u_probe, if
> function mt7601u_probe run into error lable err_hw,
> mt7601u_cleanup didn`t cleanup the debugfs node.
> Second when the module disconnect, in function mt7601u_disconnect,
> mt7601u_cleanup didn`t cleanup the debugfs node.
> This patch add debugfs exit function and try to cleanup debugfs
> node when mt7601u loaded fail or unloaded.
>
> Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
> ---
>  .../net/wireless/mediatek/mt7601u/debugfs.c   | 25 +++++++++++--------
>  drivers/net/wireless/mediatek/mt7601u/init.c  |  5 ++++
>  .../net/wireless/mediatek/mt7601u/mt7601u.h   |  4 +++
>  3 files changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> index 20669eacb66e..1ae3d75d3c9b 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> @@ -124,17 +124,22 @@ DEFINE_SHOW_ATTRIBUTE(mt7601u_eeprom_param);
>  
>  void mt7601u_init_debugfs(struct mt7601u_dev *dev)
>  {
> -	struct dentry *dir;
> -
> -	dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
> -	if (!dir)
> +	dev->root_dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
> +	if (!dev->root_dir)
>  		return;
>  
> -	debugfs_create_u8("temperature", 0400, dir, &dev->raw_temp);
> -	debugfs_create_u32("temp_mode", 0400, dir, &dev->temp_mode);
> +	debugfs_create_u8("temperature", 0400, dev->root_dir, &dev->raw_temp);
> +	debugfs_create_u32("temp_mode", 0400, dev->root_dir, &dev->temp_mode);
> +
> +	debugfs_create_u32("regidx", 0600, dev->root_dir, &dev->debugfs_reg);
> +	debugfs_create_file("regval", 0600, dev->root_dir, dev, &fops_regval);
> +	debugfs_create_file("ampdu_stat", 0400, dev->root_dir, dev, &mt7601u_ampdu_stat_fops);
> +	debugfs_create_file("eeprom_param", 0400, dev->root_dir, dev, &mt7601u_eeprom_param_fops);
> +}
>  
> -	debugfs_create_u32("regidx", 0600, dir, &dev->debugfs_reg);
> -	debugfs_create_file("regval", 0600, dir, dev, &fops_regval);
> -	debugfs_create_file("ampdu_stat", 0400, dir, dev, &mt7601u_ampdu_stat_fops);
> -	debugfs_create_file("eeprom_param", 0400, dir, dev, &mt7601u_eeprom_param_fops);
> +void mt7601u_exit_debugfs(struct mt7601u_dev *dev)
> +{
> +	if (!dev->root_dir)
> +		return;
> +	debugfs_remove(dev->root_dir);

debugfs_remove() has IS_ERR_OR_NULL() check, so no need to check for
null here.

>  }
> diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c b/drivers/net/wireless/mediatek/mt7601u/init.c
> index 5d9e952b2966..1e905ef2ed19 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/init.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/init.c
> @@ -427,6 +427,9 @@ void mt7601u_cleanup(struct mt7601u_dev *dev)
>  	mt7601u_stop_hardware(dev);
>  	mt7601u_dma_cleanup(dev);
>  	mt7601u_mcu_cmd_deinit(dev);
> +#ifdef CONFIG_DEBUG_FS
> +	mt7601u_exit_debugfs(dev);
> +#endif
>  }
>  
>  struct mt7601u_dev *mt7601u_alloc_device(struct device *pdev)
> @@ -625,7 +628,9 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_DEBUG_FS
>  	mt7601u_init_debugfs(dev);
> +#endif

Are these two ifdefs really needed? debugfs functions are empty
functions when CONFIG_DEBUG_FS is disabled.

> --- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
> +++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
> @@ -242,6 +242,9 @@ struct mt7601u_dev {
>  	u32 rf_pa_mode[2];
>  
>  	struct mac_stats stats;
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry *root_dir;
> +#endif

I would remove this ifdef, it's just saving one pointer size. Less
ifdefs we have the better.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
