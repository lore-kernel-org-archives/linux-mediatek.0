Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58369CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv9u8YotLszSFdyvgiXdimSDdGUq7SdjN5a2urUm+Ic=; b=JLmZWAyI9I6IqiEMNisUjDKkeE
	5murBPdR8RRPwnj+9PV2aLugNpUnv+VRHxgX7VJnQ58X41jKfk/WM7S/mbhRo0Me/EcH4bWkZlsl5
	4h7Zd2Nd/R7HEx4m52m0UiUNqVpbZK0DIlqn3g6r/9fbWx3d8X5B/xui9huXIRDLOvm4gXF3qFiXx
	tnDNFW9MFSvEzxmPLpmhc8wtVWSYi8fIpc4g3T6Z9YE8HPdzUwsV3NV/+3yJ4BposCU5iW3cIGm6/
	I3hRbgbPyc2fTd0xkblveHfXmqiOmmbV5oluL1YVCJUxJo7J26VZXlnp+MPpgalnSUdJXfjYqTfLL
	yjO32w2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUPP-00000004MjK-4BEH;
	Thu, 30 Oct 2025 15:17:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUPL-00000004Mhq-3Yb6;
	Thu, 30 Oct 2025 15:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761837464;
	bh=OkBtFod+Tw0J/EkbQDgJVycQMKZFAL/9AmKvf27eyg8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0rzQevxahouYSbAnsFKcmY9qMDD2v5jiXTeXGJ9pY6DtjXeGV6itkx3RqHhVlxVT
	 mHL5WLF18etfuWzQnk8fyECy6Gz/7zynkfXUDq1xY6DjcA6JhA/EyRGshK1GHDYmTO
	 kxfnv/ETUwEqeJupWm9EUNdivZbM7Mc+FkpdzN+lmkyHrb+kWlrXGfjdrVXhH1lzEV
	 MjIVEQZOVmhtMTosdJcGF/r406zB0kjN/mtxY5nzsDRR+CF2x4O/SXulXMXkP0K5Lp
	 Ku4LKQw9oPXQ5AjMk9b2H/oQ6ypkM3U3TchHzVv9s/Rq6PFxNDy2fQuLMXWCJCM/x0
	 ppNY+VrAHiVcg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA7A217E1315;
	Thu, 30 Oct 2025 16:17:43 +0100 (CET)
Message-ID: <480e1177-1be1-44ab-b20f-a6840b6fb564@collabora.com>
Date: Thu, 30 Oct 2025 16:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: mtk-mfg: select MAILBOX in Kconfig
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
References: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_081748_057927_1FC6BF55 
X-CRM114-Status: GOOD (  18.05  )
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

Il 30/10/25 14:17, Nicolas Frattaroli ha scritto:
> The mtk-mfg pmdomain driver calls common mailbox framework functions. If
> the common mailbox framework is not selected in the kernel's
> configuration, the build runs into a linker error, as the symbols are
> absent.
> 
> The hardware mailbox Kconfig system, MAILBOX, has no dependencies of its
> own. It's therefore safe to "select" it rather than use "depend on".
> 
> Declare this "select" dependency in the Kconfig for the driver.
> 
> Fixes: 1ff1f0db6aec ("pmdomain: mediatek: Add support for MFlexGraphics")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510301311.TcOCnZ1s-lkp@intel.com/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> I assume this can be squashed into the mtk-mfg driver addition commit of
> the maintainer that merged it.
> ---
>   drivers/pmdomain/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
> index b06aaa9690f0..8923e6516441 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -32,6 +32,7 @@ config MTK_MFG_PM_DOMAIN
>   	depends on PM
>   	depends on OF
>   	depends on COMMON_CLK
> +	select MAILBOX
>   	select PM_GENERIC_DOMAINS
>   	imply MTK_GPUEB_MBOX
>   	help
> 
> ---
> base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
> change-id: 20251030-mfg-mailbox-dep-ec32ef510e6a
> 
> Best regards,


