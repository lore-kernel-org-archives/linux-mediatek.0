Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F54CC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 11:11:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BEE21655
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 11:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kcYQc57n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XGqPV0Xk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1BEE21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qsAGnhlqRBZevnf2YMNXO/8c/ETItQNwa2w23uJ8PHA=; b=kcYQc57nc69lECOANpXfSDf3H
	2773Zfk5leqbOBKtV1f6N5JnLwCRhQZmMsBtvTB9zud7GfZFzry/a66bOAJ3zzcTgYrJ/m3isMBRR
	1LG3lhu6beWJ1EX7LmJe68kvlGJtyFRJGKpKK681A3FV70bsZLUAxWpSey0ELxqkw7p3C56CyGTxz
	gO36zxn02NseB8CBfanq9z/LgHKrv+qPa5tD5FSMWMFi1WiqkzYLkVxq9JcNhEzi3/4h/lLeJwCbs
	JpBvhHveMrv7vSV2fleQcStRni4fs0yscQhDXaP6kALC2TDBN6eSA7tqnmIF1p1e6btDVE33GSTq0
	vnC3oICJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMt4-0007a0-6V; Tue, 27 Oct 2020 11:11:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMt2-0007Z0-3l; Tue, 27 Oct 2020 11:11:33 +0000
X-UUID: cc54e152edda4deab71121c7870e2983-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=020CNiTHl98xYZMrYZF/KvDTIxGluBAqBjzqknM+bd4=; 
 b=XGqPV0XkKJ0utFm3fxlg/ylE8nL7XnJB6nTBGgMTJyJuv1g79IBfpMCzXFubDdzX+dYwxG8MnIqwskL2eKqYx0rXvRnsdMEosWOBeEvxZZmhGfSI6GAOWaDRONA+9x0jeFF8rz1akA0sovY5hnT35qrRB8ZJfygfgV28/VGSPpo=;
X-UUID: cc54e152edda4deab71121c7870e2983-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 324083323; Tue, 27 Oct 2020 03:11:23 -0800
Received: from MTKMBS09N1.mediatek.inc (172.21.101.35) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 04:07:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 19:07:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 19:07:48 +0800
Message-ID: <1603796869.16422.2.camel@mtksdaap41>
Subject: Re: [PATCH v3 04/16] soc: mediatek: pm-domains: Add bus protection
 protocol
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue, 27 Oct 2020 19:07:49 +0800
In-Reply-To: <20201026175526.2915399-5-enric.balletbo@collabora.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-5-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_071132_298581_63B6EC7E 
X-CRM114-Status: GOOD (  22.26  )
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-26 at 18:55 +0100, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Bus protection will need to update more then one register
> in infracfg. Add support for several operations.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/soc/mediatek/mt8173-pm-domains.h |  4 +--
>  drivers/soc/mediatek/mtk-pm-domains.c    | 36 +++++++++++++++++-------
>  drivers/soc/mediatek/mtk-pm-domains.h    |  4 ++-
>  3 files changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index a2a624bbd8b8..341cc287c8ce 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -34,7 +34,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  		.ctl_offs = SPM_DIS_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(12, 12),
> -		.bp_infracfg = {
> +		.bp_infracfg[0] = {
>  			.bus_prot_reg_update = true,
>  			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
>  				MT8173_TOP_AXI_PROT_EN_MM_M1,
> @@ -76,7 +76,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  		.ctl_offs = SPM_MFG_PWR_CON,
>  		.sram_pdn_bits = GENMASK(13, 8),
>  		.sram_pdn_ack_bits = GENMASK(21, 16),
> -		.bp_infracfg = {
> +		.bp_infracfg[0] = {
>  			.bus_prot_reg_update = true,
>  			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MFG_S |
>  				MT8173_TOP_AXI_PROT_EN_MFG_M0 |
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 16503d6db6a8..2121e05cb9a4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -89,24 +89,40 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
>  
>  static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>  {
> -	const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
> +	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
> +	int i, ret;
>  
> -	if (!bp_data->bus_prot_mask)
> -		return 0;
> +	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> +		if (!bpd[i].bus_prot_mask)
> +			break;
>  
> -	return mtk_infracfg_set_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
> -					       bp_data->bus_prot_reg_update);
> +		ret = mtk_infracfg_set_bus_protection(pd->infracfg,
> +						      bpd[i].bus_prot_mask,
> +						      bpd[i].bus_prot_reg_update);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
>  {
> -	const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
> +	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
> +	int i, ret;
>  
> -	if (!bp_data->bus_prot_mask)
> -		return 0;
> +	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {

I thought it should be

for (i = SPM_MAX_BUS_PROT_DATA - 1; i > 0; i--) {
	if (!bpd[i].bus_prot_mask)
		continue;

...

> +		if (!bpd[i].bus_prot_mask)
> +			return 0;
>  
> -	return mtk_infracfg_clear_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
> -						 bp_data->bus_prot_reg_update);
> +		ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
> +							bpd[i].bus_prot_mask,
> +							bpd[i].bus_prot_reg_update);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 7c8efcb3cef2..e428fe23a7e3 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -32,6 +32,8 @@
>  #define PWR_STATUS_AUDIO		BIT(24)
>  #define PWR_STATUS_USB			BIT(25)
>  
> +#define SPM_MAX_BUS_PROT_DATA		3
> +

#define SPM_MAX_BUS_PROT_DATA		5

to be compatible with MT8192

>  struct scpsys_bus_prot_data {
>  	u32 bus_prot_mask;
>  	bool bus_prot_reg_update;
> @@ -52,7 +54,7 @@ struct scpsys_domain_data {
>  	u32 sram_pdn_bits;
>  	u32 sram_pdn_ack_bits;
>  	u8 caps;
> -	const struct scpsys_bus_prot_data bp_infracfg;
> +	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
>  };
>  
>  struct scpsys_soc_data {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
