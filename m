Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9DAC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 22:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87CB20782
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 22:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C87CB20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tal68yRyO872CmpHleOEyjOpcT+eqiVJ5jCXk+41bY4=; b=xqx6/bByHvgxETvj/zV1c4OS9
	M3D9Zn2hyCSoUTM0rq3ANw8Ps5eaPy6MKg8JBoPW/NvCkmNPTfIIQHN+JEWV6LKbYlHT/T/P3Rx1R
	J6rea8Zb36glPL+8+J3Fg+v5RYhO5+2rSqm/viEF9Ui+v99Iqk47SJCxd9ZO1C4765vtwc06zM+dT
	LqgoVbukAVyUfM9aG0RqB/QwRg6qtIU/bEOfYzMVtUM3B8mB8oWDi/laCPq5Obk29xP5oFr8yaGKW
	uCY7U/vQabRGbPYtG8XB3KxjkIUG36mBrxNOs/8Mbx77oQUOWB875zUo4jfvAok9I+m1lqlW+357s
	VdG2hO95g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv6tz-0004PG-D0; Thu, 31 Dec 2020 22:58:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv6tv-0004Ou-QT
 for linux-mediatek@lists.infradead.org; Thu, 31 Dec 2020 22:58:38 +0000
X-UUID: ac7b54ef82924f0cbfb7cb15ed4bc6be-20201231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6Ps4DdYhOu7Rm6Q7LAu2gQaEfsAp8CgW8IFQSpLNOtU=; 
 b=qIUvAeJJrCqvNtaw51Ul1/H3j8WGm9mwUlJPU9hWAxiJ89SRmhHZ8/rrI0Catmo9SEWi6D6+nHwqDRqAK6MVHqug5GCCFT1kylkNic0wfsrcZCL+aLUCSTNK2z4mdRQQLLhMYgxv5GSYn/xaPOYDNd1ft/OPeP2VjJET2MfPgBo=;
X-UUID: ac7b54ef82924f0cbfb7cb15ed4bc6be-20201231
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1045526483; Thu, 31 Dec 2020 14:58:30 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Dec 2020 14:58:28 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Jan 2021 06:58:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Jan 2021 06:58:14 +0800
Message-ID: <1609455495.20208.8.camel@mtkswgap22>
Subject: Re: [PATCH -next v4 03/13] mt76: mt7921: add MAC support
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Fri, 1 Jan 2021 06:58:15 +0800
In-Reply-To: <3969b56ae9211955428fad2aeba695416362a095.1609347310.git.objelf@gmail.com>
References: <cover.1609347310.git.objelf@gmail.com>
 <3969b56ae9211955428fad2aeba695416362a095.1609347310.git.objelf@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_175836_106276_C9B036B6 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Lorenzo Bianconi <lorenzo@kernel.org>, Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-31 at 02:06 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add Rx packet description parsing, Tx packet description compositon, handle
> packet recycling and provide MAC information mt76 core needs to support
> mac80211.
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7921/Makefile    |    2 +-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1364 +++++++++++++++++

Why not put mac.h into this patch?

>  2 files changed, 1365 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mac.c

> +int mt7921_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> +			  enum mt76_txq_id qid, struct mt76_wcid *wcid,
> +			  struct ieee80211_sta *sta,
> +			  struct mt76_tx_info *tx_info)
> +{
> +	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
> +	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
> +	struct ieee80211_key_conf *key = info->control.hw_key;
> +	struct mt76_tx_cb *cb = mt76_tx_skb_cb(tx_info->skb);
> +	struct mt76_txwi_cache *t;
> +	struct mt7921_txp_common *txp;
> +	int id;
> +	u8 *txwi = (u8 *)txwi_ptr;

Moreover, hardware cannot add LLC-SNAP when skb->data_len is 0, which
causes Tx stuck. We found this case happened on mt7915 (station mode)
quality test with few packets whose skb->len = 14

So,https://github.com/nbd168/wireless/commit/6b6605e4061c94c9909ff82acc0e02bfd3a8d40e

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
