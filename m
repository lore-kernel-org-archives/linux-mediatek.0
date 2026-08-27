Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8612C61DB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHAy/NzVPXyzEamEkl/c/g9e4oxVYuroBuj/BO0tMnc=; b=t/GX4hL0RGJEOA4eKuZhxRCHRZ
	FEYwlvLMhPDpH++Uh7CFcoQPgmbjZ4cqoGgYR7nxD2C1v6NEjclPXnj7M1zrSt/29MkWcDW0U0yp0
	/8N7uIo53Rvs6o2TmXm5tFIzuOuHjphTNr6iCbdjySN/RxL3elGtt94Gvoi0MuN/aoZXCeKe8peFL
	Go8Qeh/5iA6WAYdE9cetkOcLr35AiZBCNxhvZPqnwHoh4AiHT+IUqGJQJ5Gu7k+kLCUcZRyXQ8RX0
	ZB4D4zr0gVTJuLIF9+Spnx3ulrqw01uTYyG0JIsFOSZliNAFu5TNJUbg9a5sG9MUcF8ZASWwzLTR6
	Co9fUTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUIg-00000003X3w-38C0;
	Thu, 27 Aug 2026 07:13:26 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUId-00000003X2Q-2XOI;
	Thu, 27 Aug 2026 07:13:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D6781F1760;
	Thu, 27 Aug 2026 09:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787814799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JHAy/NzVPXyzEamEkl/c/g9e4oxVYuroBuj/BO0tMnc=;
	b=YpHj/4BjOQMitBuAToYnJ+MFb3Ng59HM2s9QjtcM9ZInIgzLvITdP0v13kzTBgjyL4+4xQ
	EV/CS6xOf3CCn9NgaNGHd9lpsNR6RzuCwhXCTVLcgMj4Ld6Us72XpdRH6FMkdnWX66/nbG
	OS5jp0cC8ZLexVNMiTq+FHcF2G7HxzgXMW8+Tv2kxUntMXsSyTjXiAIp0O35iNjq7vQxkC
	5bErW8ML9GWHmFSCJziOqnFYJ7c6ytZbcxmviSWjR7vGW8vpWaJ1T6YqIWavB4YgdornY4
	S7XBQUaRozyKiNY0VUc7Iw+hp0tS/vU8im/kqUjgQGdyi6FYYWDqNd+bWVywTw==
Message-ID: <d305329a-f8c8-41a6-a265-8a1eeaeca19c@cjdns.fr>
Date: Thu, 27 Aug 2026 09:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast
 Ethernet SoC PHYs
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
 naseefkm@gmail.com, joey@tinyisr.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260825180421.1804729-1-cjd@cjdns.fr>
 <177dc347-4cf9-48ca-97fe-b0f3cd46d8e3@lunn.ch>
 <4fa1ab31-cdcb-4488-b038-c5869966b6ec@cjdns.fr>
 <e37d97cf-f4aa-499e-b372-21701f2e3782@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <e37d97cf-f4aa-499e-b372-21701f2e3782@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_001324_015349_4A58528B 
X-CRM114-Status: GOOD (  31.08  )
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


On 26/08/2026 04:08, Andrew Lunn wrote:
> On Wed, Aug 26, 2026 at 02:08:50AM +0200, Caleb James DeLisle wrote:
>> On 25/08/2026 21:40, Andrew Lunn wrote:
>>>> Also provide support for the older EN7512 Fast Ethernet SoC PHYs found
>>>> in EN751221 chips with do not have the MCM switch. That is chips which
>>>> do not have a "G" in the name. As these PHYs bear the ID 03a2.9412
>>>> which collides with MTK_GPHY_ID_MT7530 gigabit PHY, do not match them
>>>> and instead rely on the user to override the PHY ID in the device tree
>>>> if they wish to use this driver.
>>> Is there a way to tell them apart using other registers?
>>
>> The reference code differentiates this PHY from the other because this one
>> does not advertise gigabit capability. I sent it like this because the idea
>> of a matcher made me nervous and this felt more conservative, but I'm open
>> to guidance about what is the most appropriate solution.
> If it is as simple as that, i suggest you detect it at runtime.
>
> In the driver structure, you provide a match_phy_device()
> function. This get called independent of what ID value you have in the
> structure. So you first need to check if the ID matches. Then check
> the 1G capability.
>
> Ideally you want the code in the same driver, because module loading
> happens based on the ID. I'm not sure user space will load two drivers
> if they both indicate the same ID. Something you can experiment with.
Tested and it worked, re-sent.
>
>>>> +	for (;;) {
>>> It is unusual to do loops like this. Can it be turned into a do while
>>> loop? And without looking deep into it, it is not clear if this is
>>> endless if the hardware stops responding.
>>
>> You raise a good point in that it's hard to reason out the default exit
>> scenario, and I will figure out how to improve that. I'm not sure I can
>> actually get rid of the infinite loop without making the code worse, because
>> the default exit condition needs to assign ret and goto the error out label.
> Consider adding comments as well. Also consider replacing the infinite
> loop with a bounded loop, and return -EIO if the it goes around the
> loop too many times. What you are trying to avoid is on hardware error
> a CPU constantly spinning until power off.
Changed loop for readability, return -EIO, and added a comment as well.
>
>>>> +static int en751221_fephy_config_init(struct phy_device *phydev)
>>>> +{
>>>> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
>>>> +	u16 l0r26_temp;
>>>> +	int ret;
>>>> +	int i;
>>>> +
>>>> +	if (!shared->phydev_p0) {
>>>> +		phydev_err(phydev, "Port zero must be configured\n");
>>>> +		return -EOPNOTSUPP;
>>>> +	}
>>> What is the issue here? Why must port 0 be first?
>> It doesn't need to be configured first but it must be probed because these
>> PHYs are not independent, they exist as a group and some configuration must
>> be done on the first phy in the group. I will re-send with clarification in
>> a comment.
> Consider using phy_package_init_once() to configure the shared things
> by the first PHY to probe, independent of what address it is.

That doesn't solve the problem, but I re-sent with much more effort put 
into explaining what the problem is. In short, these PHYs are not 
independent - they exist in a group, and there is a "master" PHY of the 
group which has extra registers that are used by all PHYs of the group. 
If the master is not configured, then calibration cannot proceed for any 
PHY of the group.


Thank you for your review and advice.

Caleb

>
> 	Andrew
>

