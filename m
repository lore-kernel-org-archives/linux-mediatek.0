Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPLQTQg/V2zkueJDxCkpd+DAc6kfZ8POnGgjtisohn0=; b=jUR0hllvza59MRMsSCqd1jgxi7
	EqN2NMIzu79RHRguEGwzvT/8mYT2ZFqykGFiEc1li5lesiL5BLK/O5Q3SbJPTFj01apxNxUDDR5oQ
	a8G1ruDtqTzRaRieUxZ6+arX8y66BwRpb7IyJalsymyCxykSBS4Zsix2A7d9MQpluI0SQLF/USaRE
	A9BSU9VI6I7hUfG10lzDqbRs6sBNIsmTJqv/wGoYSHPsbuY1t1KRgiznZoxClMWkRdb2jufqrKryp
	xs2BiIZvErdhd9oSj0gi1wEJZ9qBEZ4whNXp7G3dkviR3mKjZ57345xwvdJdW4IYAzLzy4FgnzdGb
	pXQqy9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o293c-006vMG-4W; Fri, 17 Jun 2022 10:18:28 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o293Z-006vL2-Aa
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 10:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DPLQTQg/V2zkueJDxCkpd+DAc6kfZ8POnGgjtisohn0=; b=VBXHyGwXDBNXbm8T0v09dAKZWU
	rWDkwjIRy+daxF0BlHaWFyGwMKhVQJpDE33iFTzRCyIdSPKcG+DOFO1wvfquOsLxMbYBLIP99d0K2
	42Bl2a9mrmBZw0VHKEg76pjkWtFwZThnSVKGqW01TPlcPSF3T/PUSMO1ff8b/NcQ1XUo=;
Received: from p200300daa71102000c7ec312ed29c590.dip0.t-ipconnect.de ([2003:da:a711:200:c7e:c312:ed29:c590] helo=nf.local)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1o293N-0008LQ-Pa; Fri, 17 Jun 2022 12:18:13 +0200
Message-ID: <092a2631-4e91-203e-9199-96fd3c689afa@nbd.name>
Date: Fri, 17 Jun 2022 12:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] mt76: mt7921u: enable HW beacon filter
Content-Language: en-US
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <27f75af42fe59ba9e3fadd173dfc777176eca555.1655341405.git.objelf@gmail.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <27f75af42fe59ba9e3fadd173dfc777176eca555.1655341405.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_031825_574259_26705144 
X-CRM114-Status: GOOD (  12.89  )
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


On 16.06.22 03:10, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> HW beacon filter and HW connection monitor can be supported on MT7921U
> as well so we enable them to be consistent with MT7921[E,S].
> 
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index acf6567368b7..d803a7dd5f83 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -677,8 +677,7 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
>   	if (changed & BSS_CHANGED_ASSOC) {
>   		mt7921_mcu_sta_update(dev, NULL, vif, true,
>   				      MT76_STA_INFO_STATE_ASSOC);
> -		if (dev->pm.enable)
> -			mt7921_mcu_set_beacon_filter(dev, vif, info->assoc);
> +		mt7921_mcu_set_beacon_filter(dev, vif, info->assoc);
To me it looks like patch description and code change don't really 
match. Could you please explain why you change it so that the beacon 
filter is enabled even if PM isn't?

- Felix

