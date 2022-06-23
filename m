Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C95C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+VqKBMvC1uArpVu7SR3eY2GSNmqTJvDfdUYpd+bUCE=; b=HBCWFbnuAAKYpCU9xYgcpPSnWU
	EJb01fFZ4PvEab16b0G1pLdHKsmyQQoJR5+l66EmOm/Cv5fIpYFRk/EXN+DYR4FpT71TZlrve3agI
	lBrFLb7XovVfBRPWTlpsI0rt9d65uINZEIXKcVeSCURxik3d3ae1b+Z9Usc32xHOejXwzyWEUe56K
	6ycNxXr87X3ZM8QzVb3geYtUm10pNiAQma62OmxFoRraMe13BGUh6ZX80KgLRWP+gcF8/1nmcPay3
	Cm6Z1rJ174btVC4epdIwRsp6YlNJ+C4uabr6g2P5gWpippfJcf3JsOtbPWec75OT4vYO48GuP7cy9
	Wvo8Kkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IVb-00EAgd-Th; Thu, 23 Jun 2022 08:48:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IVY-00EAew-N1
	for linux-mediatek@lists.infradead.org; Thu, 23 Jun 2022 08:48:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A635C6601792;
	Thu, 23 Jun 2022 09:48:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655974090;
	bh=ylgwSvzf7Fqq4ao2tBir/3+VLMJz9T1sIuh0IuI0M2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nRkCTHiYs4l1ldAealljY6GiGIFZ/IpFvUCarTw2/Qv9TKXiGRNu9GsSVacT46H7f
	 4oMSzMvTcwPqZaF3+tXV4CpBvndP3015KC1v77eipcxoJXz6rMfdJLnaSNHN19b13d
	 n3LfzvTwxkq1nXrw017eyNJ6nPdHxRWF10qjz2yzhCCvEX5+RTT8Y7zaF94f18swkz
	 N0TRldcLs5tve6ZJh7OETzpfsLlP9SwNh2nOujoi16xMbTu/uwAZfVvx+t+40rkWsd
	 F2PvOiYuzMP6PSHRl2wi8X30Lj/tE0Hi9Anopazfxmdjk+2FzIWRd9oUQ6fvOSK3Pn
	 vuFwb27qSWP+g==
Message-ID: <b2769038-798c-fe93-478b-8d5bbd97b29f@collabora.com>
Date: Thu, 23 Jun 2022 10:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] mt76: mt7921: reduce log severity levels for
 informative messages
Content-Language: en-US
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, kuabhs@google.com, druth@google.com,
 abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <753f19393f169ad4a5fc127f68e16074f1617306.1655944385.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <753f19393f169ad4a5fc127f68e16074f1617306.1655944385.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_014812_934060_6B99A420 
X-CRM114-Status: GOOD (  14.31  )
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

Il 23/06/22 02:35, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Use dev_info instead for the informative messages.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> index eb1bfb682e02..2ce3a833176e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -740,7 +740,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
>   	struct mt76_connac_pm *pm = &dev->pm;
>   	int i;
>   
> -	dev_err(dev->mt76.dev, "chip reset\n");
> +	dev_info(dev->mt76.dev, "chip reset\n");

Since this function is normally expected to be called and this message is
describing the wanted flow and/or this worker function starting, I'd say
that this is not a really important information anyway...

What about changing that one to a dev_dbg() instead?

Regards,
Angelo

>   	dev->hw_full_reset = true;
>   	ieee80211_stop_queues(hw);
>   


