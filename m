Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57316C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNXor2OPzj51Xe78yHm5ogT+hwC//CAhB/numNF9i3s=; b=Zh6phAIKuNB2JC
	AxETb2PceTMGlZPMiP5wQoNrW3wPDGPqiHqgG0asAUIf6KaO8aP2qCYubBNTW+X5y9d4jqnoKkRB/
	NmQUVZQyE+d35WDJXezfzEZs+2xhG4cRuKGBdTmFzecit6ldZ84xYGLhxZzwj8ce4VqI4IjGWNQ+s
	tpGE7RFJsiq1sr18earpdHZMpDKWYBv6amBVx16zAAuT7OoquCwsV1TnJag32P/X4UbiRx0op9lIG
	bIREkIkWMd8npkpbnNhnA9E87GehPgm0iQuh3Bg+/ZnbhH1nH9D1pAzEZPGbeumrQGnwaiyl9vr/R
	tLkZQicjtPsrOpbSpdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7EcR-00FpKf-1I; Tue, 11 Jan 2022 10:43:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7EcM-00FpJE-6e
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 10:43:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0660461580;
 Tue, 11 Jan 2022 10:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3771C36AE3;
 Tue, 11 Jan 2022 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641897784;
 bh=Mb5XHIWGr7b558GEOOb2r5FHJPWDDXvblM+79XB2y0U=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=bOk5x51y25LRYYj3sNqKQwXDYQ1cNp0H68MAnoQIBOypNHn3Uhndxgf8RshrSdWHj
 wx7g3J3IwnlhiPKvIcEY1IBRS7qlMXLUAE3U7kpmdPn/MGerWVCK/qI/kp9uaOBk8b
 PDoXDKZM40ALOhBOn04MGQ3FyGUzgN0NKYlYw2BD8VmvOcqUuWzea8viG7D66aoTLV
 xebsVr46m6GkgCS8B32a5XN8T5uonHkLEZolWchTRVePUxohJkzv2NMaZ9NZ5D0vkM
 fQO7TgYW8xcHKp8WHifVkSVluBfIF0+65bNTJpYh8l/cqFd1MSSeQKeObFbePIiYkY
 TOYJzQVn5zRWw==
From: Kalle Valo <kvalo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 "Evelyn Tsai" <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4/5] mt76: mt7915: add Kconfig entry for MT7986
References: <351271a274dc236f027c58487df6b21c7dbf9fd0.1641886298.git.Bo.Jiao@mediatek.com>
 <d63ae1dfe22f90e0a9fa4ccc01152e82287ea0da.1641886298.git.Bo.Jiao@mediatek.com>
Date: Tue, 11 Jan 2022 12:43:01 +0200
In-Reply-To: <d63ae1dfe22f90e0a9fa4ccc01152e82287ea0da.1641886298.git.Bo.Jiao@mediatek.com>
 (Bo Jiao's message of "Tue, 11 Jan 2022 15:51:07 +0800")
Message-ID: <87r19ek0y2.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_024306_328556_E74A47E9 
X-CRM114-Status: GOOD (  16.70  )
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

Bo Jiao <bo.jiao@mediatek.com> writes:

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>
> This enables building support for the MT7986 SoC built-in WLAN chip.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> index b8b98cb..8db1ddc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> @@ -11,3 +11,14 @@ config MT7915E
>  	  OFDMA, spatial reuse and dual carrier modulation.
>  
>  	  To compile this driver as a module, choose M here.
> +
> +config MT7986_WMAC
> +	bool "MT7986 (SoC) WMAC support"
> +	depends on MT7915E
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select REGMAP
> +	default y
> +	help
> +	  This adds support for the built-in WMAC on MT7986 SoC devices
> +	  which has the same feature set as a MT7915, but enables 6E
> +	  support.

Why 'default y'?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
