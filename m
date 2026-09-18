Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BC1C982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGJR71OzTgD+793duzAUbf0/RDM0BWmknQdjIdLI5eM=; b=z/ASiv0McoPuey4hJLl8X5n40V
	26HHm/XWSX3Cx5h0WSrlnXgCdvLIQ0MGkyRCfe68QC/vvELkIMI9jtgMokADwydYSWyImEal7gQ5A
	pMpunxKalPEiMhZ1tDoRz9fehTRIKGGOIJQhYNh2OIACli8Ynn3uiyjZ1oayhrHY1hz9yo3qtDhHj
	qi6vVHr0EZcAexOHmNvVml9Oa5dWfPNSp9nBbjUnY3S3eItHNs4P6kG8YdTfNl7AIUE2eHhkHD9lM
	yXC89mBiN3JP5WmnjIS/SBwAL6JWv/JYgWAWmQvOyFz0z+xzNqLB2DUUr5OwEtfplMC6TVoUFEEok
	ODpjMR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bk2-0000000F4lw-3bxy;
	Fri, 18 Sep 2026 16:47:14 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bjz-0000000F4lB-3vf1;
	Fri, 18 Sep 2026 16:47:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 749D64E2238;
	Fri, 18 Sep 2026 18:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789750028; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UGJR71OzTgD+793duzAUbf0/RDM0BWmknQdjIdLI5eM=;
	b=vr5SqXfF0KNC0ux6YFkuxs5vjPbJena3DLzmT+4x73Q2hVXk1qQ8w7dX052VRmll4vWq5s
	a/bNS9bajAf0A9iBXzvkrKwpRqVSbFukRv6IQK4Vt9/bCKTzBgFNiJoEZoFWP0MaBa0Ca4
	H+pGAW10l7scr+jBL9f6PD8w0WprFUy0lZBr/fLSRx7/TidEsvyjXLTCQh5cE3jyCgUcS3
	6e200wqSoPwsbtWfzJOcWx+Ma4tjZVmk2kTcbYetHfLQSbsohSeo+D+bU1r0KXURGMAl0z
	9/6EXSR9mxNiLCd1ITpa4ZHYaqxW71/e8vAURTik4Z7RNpK200NGwOUOj3dNGQ==
Message-ID: <accc40a4-f447-498c-ab45-96d1f2d2cc33@cjdns.fr>
Date: Fri, 18 Sep 2026 18:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next] net: phy: mediatek: do not match MT7530 PHY if
 10/100 only
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260918161156.377822-1-cjd@cjdns.fr>
 <4fe68c4b-b72e-4cbb-9a0e-2731ec68888c@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <4fe68c4b-b72e-4cbb-9a0e-2731ec68888c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_094712_176177_0FF84945 
X-CRM114-Status: GOOD (  10.88  )
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


On 18/09/2026 18:29, Andrew Lunn wrote:
> On Fri, Sep 18, 2026 at 04:11:56PM +0000, Caleb James DeLisle wrote:
>> An EcoNet SoC 10/100 PHY uses the same ID as the MT7530 PHY, but a true
>> MT7530 PHY always has gigabit support so they can be distinguished by
>> the presence of the ESTATUS_1000_TFULL flag. Add a match_phy_device
>> which refuses to match if the PHY is not gigabit.
> Don't you also need the opposite in mtk-fe-soc.c? Otherwise don't you
> rely on the load order of the PHY drivers?

The collision is in econet-fe-soc.c of 
https://lore.kernel.org/netdev/20260827065930.2618729-3-cjd@cjdns.fr/

And I notice now that I did add it in that patchset as well, but this 
implementation is better done and that patchset is probably going to 
have a v2 so I think it's better to accept it here.

Thanks,

Caleb

>
>      Andrew
>
> ---
> pw-bot: cr
>

