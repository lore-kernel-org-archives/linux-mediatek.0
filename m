Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270BAC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74782087C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iK3fe7ed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74782087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GVwBrYPie8NQjzT8JeuLVII/UYpAn6zSfMnEma2c/Sw=; b=iK3fe7edJEL8YXF8KM/q+bz+X
	3ji9YRGAP/ivOg+kUfXffR9h+vszg7JC0yttdTcO6FFn74lmpOzf7R9AZHy9cc3UbkTBEKsGkY0JK
	ox+8XW+7ybvlDLSDSo8ll16OE66ILBcUffwSJLHtaDZlZhDdB3CG1FJwsQdrBpGsNvdU9Eg03PmBt
	TJ99VEtXpemQ9BrVj2TM8dKb+8iQGho+U8yAEBrwt9LsUk7NmIOoFkMwoOmEzi+94edOGdm6LkI6M
	I5VLhDZXEeQvuS2HmX9r3vytu4ityRno9vM/Ue+1w16vW6BsYPubb/QZagrQsD9qnFMmnpOqfEJBB
	SQ1eHn+PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGRIM-00038I-SE; Thu, 10 Sep 2020 18:27:42 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGRIH-00036B-1l; Thu, 10 Sep 2020 18:27:38 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E7F5AC24;
 Thu, 10 Sep 2020 18:27:49 +0000 (UTC)
Subject: Re: [PATCH 07/12] soc: mediatek: pm-domains: Add extra sram control
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-8-enric.balletbo@collabora.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <277b1656-4a64-4fdd-865d-88cf253b7b0e@suse.com>
Date: Thu, 10 Sep 2020 20:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910172826.3074357-8-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_142737_208398_49F613AC 
X-CRM114-Status: GOOD (  21.72  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/09/2020 19:28, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> For some power domains like vpu_core on MT8183 whose sram need to do clock
> and internal isolation while power on/off sram. We add a cap
> "MTK_SCPD_SRAM_ISO" to judge if we need to do the extra sram isolation
> control or not.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>   drivers/soc/mediatek/mtk-pm-domains.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 3aa430a60602..0802eccc3a0b 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -21,6 +21,7 @@
>   
>   #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
>   #define MTK_SCPD_FWAIT_SRAM		BIT(1)
> +#define MTK_SCPD_SRAM_ISO		BIT(2)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210
> @@ -42,6 +43,8 @@
>   #define PWR_ON_BIT			BIT(2)
>   #define PWR_ON_2ND_BIT			BIT(3)
>   #define PWR_CLK_DIS_BIT			BIT(4)
> +#define PWR_SRAM_CLKISO_BIT		BIT(5)
> +#define PWR_SRAM_ISOINT_B_BIT		BIT(6)
>   
>   #define PWR_STATUS_DISP			BIT(3)
>   #define PWR_STATUS_MFG			BIT(4)
> @@ -162,6 +165,14 @@ static int scpsys_sram_enable(struct scpsys_domain *pd, void __iomem *ctl_addr)
>   	if (ret < 0)
>   		return ret;
>   
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO))	{
> +		val = readl(ctl_addr) | PWR_SRAM_ISOINT_B_BIT;
> +		writel(val, ctl_addr);
> +		udelay(1);
> +		val &= ~PWR_SRAM_CLKISO_BIT;
> +		writel(val, ctl_addr);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -171,8 +182,15 @@ static int scpsys_sram_disable(struct scpsys_domain *pd, void __iomem *ctl_addr)
>   	u32 val;
>   	int tmp;
>   
> -	val = readl(ctl_addr);
> -	val |= pd->data->sram_pdn_bits;
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO))	{
> +		val = readl(ctl_addr) | PWR_SRAM_CLKISO_BIT;
> +		writel(val, ctl_addr);
> +		val &= ~PWR_SRAM_ISOINT_B_BIT;
> +		writel(val, ctl_addr);
> +		udelay(1);
> +	}
> +
> +	val = readl(ctl_addr) | pd->data->sram_pdn_bits;

Nit, I'd prefer:
val = readl(ctl_addr);
val |= pd->data->sram_pdn_bits;


>   	writel(val, ctl_addr);
>   
>   	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
