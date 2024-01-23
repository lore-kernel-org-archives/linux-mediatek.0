Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A768CC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVN/hwbtf/XSGCcS1uBpoGLAubvNB0j0yEvQDfE9360=; b=kHKOJlqjKVKszJEsRhqmgEMlH+
	0XanGL/lwAijWeko9MT4iYexj3mTm+3odcMZMaIK4v6KV7NEmGchq4IgVxbBsA695a+NTjVRh8+5U
	u3EFp6OW5zNuquPfrTy/zaMvKTpLIRjv+eeW6BR4AQQtRwKNI2CUfa6/aWi+Cb5+TOrFYhB1Ql4/h
	JRMXBpgNjp1/g8EIhXijBqcspx5SVjEPZVzGsY0Z70im7BeVlIRnKvg/39B97oHgtRyJzyh6rhn+Z
	OYC2A5ydiVS420EJjHJ9Kzpdu3qsOGCtIYKmimfVbdNcClVgTml/15bLv46kM4X7KaNlu2Y9EwjTK
	asYxiiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSElZ-00G6eD-1D;
	Tue, 23 Jan 2024 11:16:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSElW-00G6d1-1R
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 11:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C260FCE2E1C;
	Tue, 23 Jan 2024 11:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA8DC433C7;
	Tue, 23 Jan 2024 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706008576;
	bh=N0PTVL4fzc2fc/gANIXJx4GzQxydfHxxGy/6qDhdsGQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Mms7Mx/xwoGkELZcascvJnqmwS2Euw+S50aiglr9vVeFDJVoHZkkKJt7WbBiBtlwh
	 /P8tIdk9hiSaOZmCS+c7cHcVnV7YMvpblJecAU1zz98c8gbRWq70e5GV02jCZKojVR
	 mmV6LgYG60CxqorR5eHRMwMZhdv91j5LWqhBlfCMVxbzLVawEpyuP3yHk1DbswrTur
	 hT/vXKYKhWpKXFRIBsDNaJ9ONPFKAXHpwoTrvWXWq+s3X18Yj0orHAPNXOxNG2DHlS
	 yUIx5kdXG7nWWa83F/fdo6sqtJHoNTIFcml6/3j8lbMyXrAC1fw8XZz42sFAQ4ZjuR
	 fb/9S13Cf2O8w==
From: Kalle Valo <kvalo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless
 <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Evelyn Tsai
 <evelyn.tsai@mediatek.com>,  Bo Jiao <Bo.Jiao@mediatek.com>,
  linux-mediatek <linux-mediatek@lists.infradead.org>,  Benjamin Lin
 <benjamin-jw.lin@mediatek.com>
Subject: Re: [PATCH 04/12] wifi: mt76: mt7996: fix incorrect interpretation
 of EHT MCS caps
References: <20240119085708.23592-1-shayne.chen@mediatek.com>
	<20240119085708.23592-4-shayne.chen@mediatek.com>
Date: Tue, 23 Jan 2024 13:16:12 +0200
In-Reply-To: <20240119085708.23592-4-shayne.chen@mediatek.com> (Shayne Chen's
	message of "Fri, 19 Jan 2024 16:57:00 +0800")
Message-ID: <87v87kcnb7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_031626_652070_CE1F629C 
X-CRM114-Status: GOOD (  14.95  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> From: Benjamin Lin <benjamin-jw.lin@mediatek.com>
>
> The EHT MCS map subfield of 20 MHz-Only is not present in the EHT
> capability of AP, so STA does not need to parse the subfield.
> Moreover, AP should parse the subfield only if STA is 20 MHz-Only, which
> can be confirmed by checking supported channel width in HE capability.
>
> Fixes: 92aa2da9fa49 ("wifi: mt76: mt7996: enable EHT support in firmware")
> Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> index 3c729b563edc..02d858fdc9fe 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -1240,6 +1240,9 @@ mt7996_mcu_sta_he_6g_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
>  static void
>  mt7996_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
>  {
> +	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
> +	struct ieee80211_vif *vif = container_of((void *)msta->vif,
> +						 struct ieee80211_vif, drv_priv);

The void pointer cast looks to be unnecessary. This is nitpicking but I
really hate casts.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

