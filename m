Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC51C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 00:36:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FAAA22DBF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 00:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FAAA22DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G9MluuKmMDPNaYQZkGth2irkdu5typdZkYKGl6cd0dU=; b=Q4UV83tRqDtUbAOdF7ET41NLi
	LLoqbwcwrRIn7NpLvS/eiA9ifVM4foNcBJl9cSFjSSlr84hycyj1RI/Pfzaa+nXEvKtb8QA5A4Aoy
	KsNC0Das06sUUlnlmf1uKr3IkkSk4gH8MsjYLCm+NbOXtY2c+bxgGHyEku/q/l5rDhnp4d66LUSPP
	Ees4toQ9Zwpa45FXcwl2f5Hfdvm+Clm09a+pJyykzvuLilv6Tv0kfZuaVQZPWGMVwkejECmOOKdPV
	dQZji6WhGQ7LlcO4XUJdX/iLGE5St4GP8xLalcn0ZHcxbI0e4ED+7z9Bruk8x4bR9H5/NGtdXoB2H
	8/g0ysejA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwwo6-0005Lm-6T; Wed, 06 Jan 2021 00:36:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwwo2-0005Kl-Ix
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 00:36:08 +0000
X-UUID: 7d86950d468a487ebf974c87f208c1f2-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NNagxy59LWVrpfqGGDlvpcbmrMIVKJXiIdbWKMV2ZLk=; 
 b=hkb7VAzjUJ+8LnRkuPGCmfqc3cXptvL7XnjFlWxnIIev9ud8JLF3/UkoeBMxnDipp4KFxAA9RX9niON/bcmvEzUg+pIytJdE0Irgc+QiQOnxXuS67RdTH4EJyIs0DzDxxwA4utn9cy6NZVzwm0QHiQ0bABMiiw5JTEiF2Na7Z0U=;
X-UUID: 7d86950d468a487ebf974c87f208c1f2-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1889278172; Tue, 05 Jan 2021 16:35:59 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:35:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 08:35:56 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 08:35:56 +0800
Message-ID: <1609893356.15178.1.camel@mtkswgap22>
Subject: Re: [PATCH] mt76: mt7915: force ldpc for bw larger than 20MHz in
 testmode
From: Ryder Lee <ryder.lee@mediatek.com>
To: Shayne Chen <shayne.chen@mediatek.com>
Date: Wed, 6 Jan 2021 08:35:56 +0800
In-Reply-To: <20210105054100.5905-1-shayne.chen@mediatek.com>
References: <20210105054100.5905-1-shayne.chen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_193606_818980_F9F9E572 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-05 at 13:41 +0800, Shayne Chen wrote:
> LDPC should be set when bw is larger than 20MHz to make
> testmode tx work normally.
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> index dc1f56fb823d..e8787c336a55 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -700,7 +700,7 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
>  	if (mode >= MT_PHY_TYPE_HE_SU)
>  		val |= FIELD_PREP(MT_TXD6_HELTF, td->tx_ltf);
>  
> -	if (td->tx_rate_ldpc)
> +	if (td->tx_rate_ldpc || bw > 0)

Prefer explicitly checking bw > IEEE80211_STA_RX_BW_20

>  		val |= MT_TXD6_LDPC;
>  
>  	txwi[6] |= cpu_to_le32(val);

Ryder

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
