Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D528CC61DBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vuOWpSASKJg2znhHds0mJtsBVVDEX1H0ZtqkDQG8JU=; b=L9ft05RYFeA0CJQfFXkUAf2WaD
	QjpYnuf/6Pqe3u8qOeT6ChzWF6hhjNl/7GVuKzd2sCWoVweFcNWaJ8h1ffiTx2it/+LGzhrc4pXh/
	y7+//PDFc2R4qV04aVJGb6NlcXqpZWeNzHNdVFsISRQv18AwV5lDOq4SYqdCFSwsbeXXehJp1cm0q
	JC9oB2dfP3m/BahnoxKCSp2OyQQ3wcl376EeQixR6Y/JDoNaRdXeLi4RVS9fNImmDkKL1ldzE/y3U
	Ger7ItnYg/EGdTmK2MEV+6ydveEaxII9Zyo7zmqSrPqogDvhO5muh7QKhuKScACy8ZO0U08V3gcBL
	6Op9UCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz1CR-00000001hID-0Cgn;
	Wed, 26 Aug 2026 00:09:03 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz1CO-00000001hHi-1i56;
	Wed, 26 Aug 2026 00:09:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEF331C615F;
	Wed, 26 Aug 2026 02:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787702936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2vuOWpSASKJg2znhHds0mJtsBVVDEX1H0ZtqkDQG8JU=;
	b=cX3ZfBp2hPSrSU883c4qo0fTugVPROEryrT0w3yxNfhIGESOdgRV+P300IoAD4x2vGMWbe
	t7c5Puz5Og40pOwgBlj6ZS/NVE5Du+j30UZKSVXMVeCiC4C7OdgAfp7sb9UajmCHLb2c2H
	9Ay4hoB77HXWMVj+VqorKIHeyyjCSBGFZuR41GDkA+0rtprRwv5tQ+7qWmz9t0v1sw9wBr
	7ErlIq1P+6vwv9tE0cihhTTjHoGqs0ndmP7z2LNPZGs0gpCf5S18s/cSgt1/Xz6mXbJqLf
	WZdxRN82J45GoRvSyDYlWinBXm5BzNxMOftqK1HH14Onlk/Yia80paWiLGX45Q==
Message-ID: <4fa1ab31-cdcb-4488-b038-c5869966b6ec@cjdns.fr>
Date: Wed, 26 Aug 2026 02:08:50 +0200
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
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <177dc347-4cf9-48ca-97fe-b0f3cd46d8e3@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_170900_817256_E6C341C0 
X-CRM114-Status: GOOD (  27.15  )
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


On 25/08/2026 21:40, Andrew Lunn wrote:
>> Also provide support for the older EN7512 Fast Ethernet SoC PHYs found
>> in EN751221 chips with do not have the MCM switch. That is chips which
>> do not have a "G" in the name. As these PHYs bear the ID 03a2.9412
>> which collides with MTK_GPHY_ID_MT7530 gigabit PHY, do not match them
>> and instead rely on the user to override the PHY ID in the device tree
>> if they wish to use this driver.
> Is there a way to tell them apart using other registers?


The reference code differentiates this PHY from the other because this 
one does not advertise gigabit capability. I sent it like this because 
the idea of a matcher made me nervous and this felt more conservative, 
but I'm open to guidance about what is the most appropriate solution.


>
>> +static int en751221_fephy_r50(struct phy_device *phydev)
>> +{
>> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
>> +	struct compensation ctab = get_ctab(phydev);
>> +	int zcal_sz = ARRAY_SIZE(zcal_to_r50ohm);
>> +	u8 rg_zcal_ctrl = ECONET_R50_ZCAL_DEFAULT;
> Please swap these two lines.
Whoops, thanks.
>
>> +	for (;;) {
> It is unusual to do loops like this. Can it be turned into a do while
> loop? And without looking deep into it, it is not clear if this is
> endless if the hardware stops responding.


You raise a good point in that it's hard to reason out the default exit 
scenario, and I will figure out how to improve that. I'm not sure I can 
actually get rid of the infinite loop without making the code worse, 
because the default exit condition needs to assign ret and goto the 
error out label.

In any case I'll find something that's easier to reason out at a glance.


>
>> +static int en751221_fephy_tx_offset(struct phy_device *phydev)
>> +{
>> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
>> +	struct compensation ctab = get_ctab(phydev);
>> +	int initial_comp_out;
>> +	int polarity = 0;
>> +	int offset = ECONET_TXOS_DEFAULT;
>> +	u16 offset_bin;
>> +	int comp_out;
>> +	int ret = 0;
> Another reverse christmas tree issue. Please check all your functions.
Whoops, sorry for not catching this before sending.
>
>> +static int en751221_fephy_config_init(struct phy_device *phydev)
>> +{
>> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
>> +	u16 l0r26_temp;
>> +	int ret;
>> +	int i;
>> +
>> +	if (!shared->phydev_p0) {
>> +		phydev_err(phydev, "Port zero must be configured\n");
>> +		return -EOPNOTSUPP;
>> +	}
> What is the issue here? Why must port 0 be first?
It doesn't need to be configured first but it must be probed because 
these PHYs are not independent, they exist as a group and some 
configuration must be done on the first phy in the group. I will re-send 
with clarification in a comment.
>
>> +
>> +	for (i = 0; i < 5; i++) {
>> +		ret = en751221_fephy_r50(phydev);
>> +		if (!ret)
>> +			break;
>> +	}
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < 5; i++) {
>> +		ret = en751221_fephy_tx_offset(phydev);
>> +		if (!ret)
>> +			break;
>> +	}
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < 5; i++) {
>> +		ret = en751221_fephy_tx_amp(phydev);
>> +		if (!ret)
>> +			break;
>> +	}
> Why 5 ?


Following the reference implementation "keep trying until it's very 
clear that it's not going to work". But this should be a define and it 
slipped my mind to do so.


Thank you for your review!


Caleb

>
>
>      Andrew
>
> ---
> pw-bot: cr
>

