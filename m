Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33865C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 06:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOvKtImoCc+4ueMzSyfE0QUAmGLsxVWwkMiYhxnzlLg=; b=MMjkODWFTncW0nXJJ7yj+i8KDY
	xilsji8IZNIJ/PWX//+tqKgH6gOtZKGMm/NelotNiuasL5uiZXI+CR+q3QhwUoSmwGCDD0bIGcfhM
	9tOtNA3Hgo/aeT//6yRnigEPc+KIM+Y43cQSMHSg7cPIDDwvdTvm0O9mZr0uSI5Z2/bs2mq+VR6OS
	zwJNW8LrXuyYKuCLhTaDgOVqqoq56Wr2VACNtONvezqZxr5DFRJZ3qVlufYnf8u9PomfT9ZzT08aQ
	pEV0H60sqzEjC+n5t4qzNh/WS0qqJCvVbEp9YxqNt/X6VobaO5+DWOqj0DBE+TfXLghcZPgXB9M6i
	cLXybr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHwb-0039ev-Ko; Tue, 08 Nov 2022 06:18:45 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHwR-0039cm-Fg; Tue, 08 Nov 2022 06:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cOvKtImoCc+4ueMzSyfE0QUAmGLsxVWwkMiYhxnzlLg=; b=t/85Ae3ntaIkFxmdc2a54YM/rG
	QymwJJuaXe00KiA6j5IHZJGStQ70Pa0cohn1M0lNbUyOWWTErEDq5o6SsQFrBhV7l15732N3icAXq
	vRdti1b0/Cos5F2JvLwU4i7PpFYLQJ0uagnbwwYYUD4j8kZl7gE1/EjWlflR0CXlV1dA=;
Received: from p200300daa72ee1006d973cebf3767a25.dip0.t-ipconnect.de ([2003:da:a72e:e100:6d97:3ceb:f376:7a25] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1osHwH-000S7w-4W; Tue, 08 Nov 2022 07:18:25 +0100
Message-ID: <1078ae93-490b-60b5-d1ae-95ca491cfb15@nbd.name>
Date: Tue, 8 Nov 2022 07:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 01/14] net: ethernet: mtk_eth_soc: account for vlan in rx
 header length
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221107185452.90711-1-nbd@nbd.name>
 <20221107205553.cnydzeh3tmilqblx@skbuf>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20221107205553.cnydzeh3tmilqblx@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_221835_549425_ED4C1B4B 
X-CRM114-Status: GOOD (  13.54  )
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

On 07.11.22 21:55, Vladimir Oltean wrote:
> On Mon, Nov 07, 2022 at 07:54:39PM +0100, Felix Fietkau wrote:
>> This may be needed for correct MTU settings on devices using DSA
>> 
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
>> index 589f27ddc401..dcf2a0d5da33 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
>> @@ -29,7 +29,7 @@
>>  #define MTK_TX_DMA_BUF_LEN_V2	0xffff
>>  #define MTK_DMA_SIZE		512
>>  #define MTK_MAC_COUNT		2
>> -#define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
>> +#define MTK_RX_ETH_HLEN		(VLAN_ETH_HLEN + ETH_HLEN + ETH_FCS_LEN)
> 
> Commit title says account for VLAN (VLAN_HLEN, 4 bytes), code says add
> VLAN_ETH_HLEN (18) more bytes.
> 
> Also, why is DSA mentioned in the commit message? Is accounting for VLAN
> hlen not needed if DSA is not used? Why?
Will fix the code and improve the comments in v2.

- Felix


