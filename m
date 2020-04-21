Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC68C2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 06:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCAA2076C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 06:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlCDrDFq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GpRWvTy8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCAA2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmHwBEJtEPq3Ska2GpBC06aq51fnPwe0phF+aRJxd/Q=; b=nlCDrDFqmu3gP8
	V8Lu0sbV7ohL1HQt354OL0KxKVRhRnqBc7Tg1k/tpJptwCUHN4Kq1P6F0I23x3uCkg1hot0z5dL8H
	Y5eKEYhsJLA55zXS3+7fApNVdbhKDVOlIb//HP6RGbI+K/cnC4WRz2I8t2uh5vMDrOdk6WOfpZriE
	FRSQ8ImUluBKHNjQ/5MsYtnREwfsTVA/JLxTQejzuIQ0GhE6312j73Fuu56oUWFoKYLdrCMEwd598
	JM6uqbELy0HO9rRIJGmsk8JjpVN8EsXb3Xv1k0qqQ2djORhScc8Tm+1HRx2OvTtybiVxq1lWWgguY
	OYRe3jhXQC3zIbw22VtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQm3M-00052R-1Y; Tue, 21 Apr 2020 06:06:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQm3J-0004zV-5s
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 06:06:38 +0000
X-UUID: c3ea0084326343aaa79e6bfeaf4ab10e-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yD/NRJAM1wcixHyAPN6Ipx8fiEBnqXvyN97IIJeNFK4=; 
 b=GpRWvTy8Xrf3OtNydz++O1tSxWbi88LYSOJFhhyUQQDoPQ4RPLh6s4Is88BBh134tlYpbZYfssRSBBUyh7YPMppZIEi5hObegtAFPQkSTiUHSCYrI+LJujUbDMXJxWOqSaQzBoH+Z3CxBCLEmACoKEo9qj6+zdlmO5J+RNYkAwo=;
X-UUID: c3ea0084326343aaa79e6bfeaf4ab10e-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1794731863; Mon, 20 Apr 2020 22:06:22 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 22:57:54 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 13:57:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Apr 2020 13:57:51 +0800
Message-ID: <1587448674.12853.1.camel@mtkswgap22>
Subject: Re: [PATCH 2/3] mt76: mt7615: add missing code for providing aid
 info to the mcu
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Tue, 21 Apr 2020 13:57:54 +0800
In-Reply-To: <0292e088e934199434f0ea06598274f57a24f3d9.1587445885.git.sean.wang@mediatek.com>
References: <1467d47fd111b5711fa74410833153bdc9e01b72.1587445885.git.sean.wang@mediatek.com>
 <0292e088e934199434f0ea06598274f57a24f3d9.1587445885.git.sean.wang@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_230637_230403_F6175E5F 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Lorenzo Bianconi <lorenzo@kernel.org>, Soul
 Huang <Soul.Huang@mediatek.com>, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-21 at 13:20 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Parameters in station record should be kept as up to date as BSS being
> updated.
> 
> Fixes: a90b4ba1f134 ("mt76: mt7615: provide aid info to the mcu")
> Suggested-by: YF Luo <Yf.Luo@mediatek.com>
> Suggested-by: Lucy Hsu <Lucy.Hsu@mediatek.com>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/main.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> index cdc8babca85a..e5012ad680bb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -497,9 +497,19 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
>  
>  	mutex_lock(&dev->mt76.mutex);
>  
> -	if (changed & BSS_CHANGED_ASSOC)
> +	if (changed & BSS_CHANGED_ASSOC) {
> +		struct ieee80211_sta *sta;
> +
>  		mt7615_mcu_add_bss_info(phy, vif, info->assoc);
>  
> +		rcu_read_lock();
> +		sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
> +		rcu_read_unlock();
> +
> +		if (sta)
> +			mt7615_mcu_sta_add(dev, vif, sta, info->assoc);
> +	}
> +
how about this -
https://github.com/ryderlee1110/wireless/blob/mt76/drivers/net/wireless/mediatek/mt76/mt7915/main.c#L434

>  	if (changed & BSS_CHANGED_ERP_SLOT) {
>  		int slottime = info->use_short_slot ? 9 : 20;
>  
> @@ -557,7 +567,8 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
>  	mt7615_mac_wtbl_update(dev, idx,
>  			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
>  
> -	mt7615_mcu_sta_add(dev, vif, sta, true);
> +	if (vif->type != NL80211_IFTYPE_STATION)
> +		mt7615_mcu_sta_add(dev, vif, sta, true);
>  
>  	return 0;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
