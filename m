Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADDEC636D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpEUS/vI6UC3HBFGhG36LzbViRV53Vh9XedAd7fhGXs=; b=AU4wSqPde95cqOAEVe2Qiyto8Y
	F/hgH3Z2mlSc4FLXpk64+etRyeIEu07/qn9FjEUKozkiVB6KsRPu/3xV4D7BsDfclpblFIG4lhZo4
	sT2TvgO4OyxkNvyiXoPw4UzdqDGrmFP1xA+2Mp7KAtp0W2kBBZLJ9QQadYyJpojWLCbq4LmzEBOJq
	TUDuiIHyccuuWZR5dkpWVpblQvugdizYb/Fs1aPvlzm1S+6BSQqaerIjKDkkGhy6yabXlUvlWCyjR
	ZD61cjsBX07MW0kQhdayD0UhAQrxXmJ2yrSbjXLOdiyjKjfdJm3dCrLA79jlQPG/3/iajbmIg44U9
	Pbhd/JQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnND-00GGR1-Pa; Wed, 08 Feb 2023 16:32:43 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnNB-00GGQP-8H
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 16:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HpEUS/vI6UC3HBFGhG36LzbViRV53Vh9XedAd7fhGXs=; b=uMoK+rrb1mp63J9kTJUOLVVWTp
	A/kXAND0biwrJB+tplDEc6ytOfwlAj8D+7GuWFMUB6XW6gNznEIoHNTYoGUpikJR/5uwRlmYmOZ54
	3nNnIGhE/Xq/ieRWD7EialORu2SwxOtcDykr6gwx/DUKyYoh3HjEt+VJBjrRzi/xVL/g=;
Received: from p200300daa717ad04a56d64ef60554cdc.dip0.t-ipconnect.de ([2003:da:a717:ad04:a56d:64ef:6055:4cdc] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pPnN2-0065qs-QK; Wed, 08 Feb 2023 17:32:32 +0100
Message-ID: <80317d6f-47d9-d824-1a58-7ffbfd46d716@nbd.name>
Date: Wed, 8 Feb 2023 17:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] linux-firmware: update firmware for MT7916
Content-Language: en-US
To: shayne.chen@mediatek.com, "jwboyer@kernel.org" <jwboyer@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>, Ryder Lee
 <Ryder.Lee@mediatek.com>, =?UTF-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
 <Evelyn.Tsai@mediatek.com>
References: <20221123110743.22005-1-shayne.chen@mediatek.com>
 <20221123110743.22005-2-shayne.chen@mediatek.com>
 <d6244fd6-62bd-ba07-fe18-dee559594ece@nbd.name>
 <c82307e02e6d2c29d2e30209c76fe8bb7c86616f.camel@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <c82307e02e6d2c29d2e30209c76fe8bb7c86616f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_083241_405032_11F8B4C2 
X-CRM114-Status: GOOD (  12.70  )
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

On 08.02.23 17:13, shayne.chen@mediatek.com wrote:
> On Wed, 2023-02-01 at 17:07 +0100, Felix Fietkau wrote:
>> On 23.11.22 12:07, Shayne Chen wrote:
>> > This patch updates firmware files v211120221031 for MT7916 WiFi
>> > NIC.
>> > 
>> > Signed-off-by: Shayne Chen<shayne.chen@mediatek.com>
>> 
>> More and more users are complaining that this firmware update
>> introduces 
>> a regression of not being able to support 5 GHz and 6 GHz together 
>> anymore. Apparently the EEPROM data needs to be patched to limit
>> support 
>> to one of the two bands, otherwise both don't work.
>> Switching at runtime apparently doesn't work without a firmware
>> restart.
>> 
>> Is there any chance we could get a firmware that fixes this bug?
>> 
> Hi Felix,
> 
> We've released new firmware which enables 5+6 GHz on mt7916 band1 to
> mt76 community, and are collecting feedbacks from users.
> I'll send the updated firmware after getting positive feedbacks.
That sounds great.

Thanks a lot,

- Felix


