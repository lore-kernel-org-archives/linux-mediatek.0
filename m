Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236A3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUicmmVomUQkSXsaTcz/OLEpjGhlAZbL6cmcVVrzB4c=; b=h78YNtdY9Rof6eLDle7OQjIH0i
	LscOFc/YukqKENk9NIZv0W449jas0bigQeOQOgmPyZbUQnfWhLaWRCqpyh1GohaFKEzYsGhEphFfL
	rBYKHrWyYv8ypctJY3dSZQqhTxg4TJwmmXg2RlIHhGtwGkUcCu9Xx9tmNAAwhn57nuzYf24dWnLHl
	2Dr1Xewntgb7ndDXTz0OZFdPa/kvkJk9zg1epJT1dpZOsdl7QaFjIylolwNUc61ZaEDuJ1k/0X6Gu
	/zJ1jANs3wul/EfyX+xEz4iQmTUOkGLoV0zwTfvN3ehJAqcmO2xB/QNzf3VzK1v+u6XvLSA1dPFZa
	Um88TcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPmq-007BiZ-OK; Tue, 22 Nov 2022 09:41:52 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPml-007BY3-Rm
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 09:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
	:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iUicmmVomUQkSXsaTcz/OLEpjGhlAZbL6cmcVVrzB4c=; b=nsvSo2RnnNLjLwQZBi7FGYfZuZ
	NUVxdq33+g8wTb50kyrc7Lie8nviNoXUbW9wtIa4SnhJHHIJBQi9bcu0LyJSurJIsQmH4ikhCE/pt
	+gmTqZL1F36PKHc/qAw4MA3zDMYsTO5d4XXuGq9Hx7gGkwENWo7LmUHrXmqkCu2iFmhE=;
Received: from p200300daa7225c007502151ad3a4cf6f.dip0.t-ipconnect.de ([2003:da:a722:5c00:7502:151a:d3a4:cf6f] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oxPmT-003iat-EV; Tue, 22 Nov 2022 10:41:29 +0100
Message-ID: <0193456e-0acb-75d6-8c6f-be0917990708@nbd.name>
Date: Tue, 22 Nov 2022 10:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, lorenzo.bianconi@redhat.com, sujuan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org
References: <cover.1669020847.git.lorenzo@kernel.org>
 <9c4dded2b7a35a8e44b255a74e776a703359797b.1669020847.git.lorenzo@kernel.org>
 <20221121121718.4cc2afe5@kernel.org> <Y3vrKcqlmxksq1rC@lore-desk>
 <20221121201917.080365ce@kernel.org>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next 5/5] net: ethernet: mtk_wed: add reset to
 tx_ring_setup callback
In-Reply-To: <20221121201917.080365ce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_014148_042269_F0CBF497 
X-CRM114-Status: GOOD (  13.62  )
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

On 22.11.22 05:19, Jakub Kicinski wrote:
> On Mon, 21 Nov 2022 22:18:33 +0100 Lorenzo Bianconi wrote:
>> > On Mon, 21 Nov 2022 09:59:25 +0100 Lorenzo Bianconi wrote:  
>> > > +#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs, _reset) \
>> > > +	(_dev)->ops->tx_ring_setup(_dev, _ring, _regs, _reset)  
>> > 
>> > FWIW I find the "op macros" quite painful when trying to read a driver
>> > I'm not familiar with. stmmac does this, too. Just letting you know,
>> > it is what it is.  
>> 
>> ack, fine. I maintained the approach currently used in the driver.
>> Do you prefer to run the function pointer directly?
> 
> That's a tiny bit better, yes, saves the reader one lookup.
> 
> Are the ops here serving as a HAL or a way of breaking the dependency
> between the SoC/Eth and the WiFi drivers?
The latter. For a multi-platform kernel it's important that the wifi 
driver does not depend on mtk_eth_soc directly, even when support for 
WED is enabled.

- Felix

