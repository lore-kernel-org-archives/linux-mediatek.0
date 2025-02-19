Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA4EC021AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYk7IoDOhVTSXNZWST8oeA8vpoiIKHkfmZGy3i6g7lA=; b=dW1tYY10+t8xlVNL8TmWzE3LJn
	AKpmzRki/4/26w0BWtoTNP+4AqbLIGdhmf2IOL6PfHHowBGpzZWbTGSNv4rXmtXXpPDIekiALIycu
	dd94EHgBPJcfp+X3sgZSvvc4Dhk/bq5zalXCZ0nF4IV5fFxTkTPrSycWxFIW5cb4Fx+yM3VqLVH+R
	AInhOMNF7u2qjfLa8kbqIhPmRN1/n5qcpcU/MSqXCkagspwzeL+V+6s0weiKPDyBVr5+9HTl1HmLw
	pVZpiMg1af7zBrsjEPtzpfLl4ky64f/stTpRDKIKk1XGS8VXHS4YccM58FvpsUeD3IDWhdtMW9BN4
	lAQpvgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqZf-0000000ErDN-3CE3;
	Wed, 19 Feb 2025 20:21:39 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqZc-0000000ErCP-36PX
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Feb 2025 20:21:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JKLUfQ2070043
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 14:21:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739996490;
	bh=wYk7IoDOhVTSXNZWST8oeA8vpoiIKHkfmZGy3i6g7lA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rGzePrNrQiLPSoOjIIIhjU8M5Q6JkTiILn0p0IgMnGa8Mr28TfvC+DXchN9DSJ8tp
	 R3qKZmfEy1h6p9oCJdknIYse8jnF9mSpyBu1jwvR8g4h1BU7Ln5DlxY2p/+CEbycm8
	 ud+OrYBSWRbpC4OsE5q3CDOj9RsGWmBGOZMIEUtY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JKLU7t062178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 14:21:30 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 14:21:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 14:21:29 -0600
Received: from [128.247.83.102] (lt5cd302htfz.dhcp.ti.com [128.247.83.102] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JKLTET125776;
	Wed, 19 Feb 2025 14:21:29 -0600
Message-ID: <35b8d02f-15b6-4f8c-8179-5cf3825f3697@ti.com>
Date: Wed, 19 Feb 2025 14:21:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7925: introduce MLO capability control
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, <nbd@nbd.name>,
        <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
        <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
        <Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
        <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
        <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
        <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
        <Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>
References: <20250217081729.1840930-1-mingyen.hsieh@mediatek.com>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20250217081729.1840930-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_122136_875631_268323DD 
X-CRM114-Status: GOOD (  18.19  )
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

Hi Mingyen,

On 2/17/2025 2:17 AM, Mingyen Hsieh wrote:
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> This patch introduces MLO capability control for the MT792x Wi-Fi driver.
> It removes the unused `MT792x_CHIP_CAP_MLO_EVT_EN` flag and introduces new
> capability flags `MT792x_CHIP_CAP_MLO_EN` and `MT792x_CHIP_CAP_MLO_EML_EN`
> to enable MLO and EML features based on firmware capabilities.
>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 10 ++++++++--
>  drivers/net/wireless/mediatek/mt76/mt792x.h      |  3 ++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> index 98daf80ac131..ad47a4b153da 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -251,7 +251,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
>  		},
>  	};
>  
> -	if (!(phy->chip_cap & MT792x_CHIP_CAP_MLO_EVT_EN))
> +	if (!(phy->chip_cap & MT792x_CHIP_CAP_MLO_EN))
>  		return 0;
>  
>  	ext_capab[0].eml_capabilities = phy->eml_cap;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> index 15815ad84713..5f40c3c1ffa1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -2559,6 +2559,7 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
>  	struct ieee80211_vif *vif = link_conf->vif;
>  	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
>  	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
> +	struct mt792x_phy *phy = mvif->phy;
>  	struct bss_mld_tlv *mld;
>  	struct tlv *tlv;
>  	bool is_mld;
> @@ -2574,8 +2575,13 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
>  	mld->group_mld_id = is_mld ? mvif->bss_conf.mt76.idx : 0xff;
>  	mld->own_mld_id = mconf->mt76.idx + 32;
>  	mld->remap_idx = 0xff;
> -	mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
> -			     IEEE80211_EML_CAP_EMLSR_SUPP);
> +
> +	if (phy->chip_cap & MT792x_CHIP_CAP_MLO_EML_EN) {
> +		mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
> +				     IEEE80211_EML_CAP_EMLSR_SUPP);
> +	} else {
> +		mld->eml_enable = 0;
> +	}
>  
>  	memcpy(mld->mac_addr, vif->addr, ETH_ALEN);
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
> index 32ed01a96bf7..454c6f523cc2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
> @@ -27,8 +27,9 @@
>  
>  #define MT792x_CHIP_CAP_CLC_EVT_EN BIT(0)
>  #define MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN BIT(1)
> -#define MT792x_CHIP_CAP_MLO_EVT_EN BIT(2)
>  #define MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN BIT(3)
> +#define MT792x_CHIP_CAP_MLO_EN BIT(8)
> +#define MT792x_CHIP_CAP_MLO_EML_EN BIT(9)
>  
>  /* NOTE: used to map mt76_rates. idx may change if firmware expands table */
>  #define MT792x_BASIC_RATES_TBL	11
Reviewed-by: Sabeeh Khan <sabeeh-khan@ti.com>


