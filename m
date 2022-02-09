Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdswQjw2wcv1Td/COTVCjVGQt1EnvAdy0j7hcj5g398=; b=nmKg9rW8K244Zb
	RheFj/4GQDL1+x0slvgpSueNYrLORjQR92dlDN4OTF08A3EBxOd+NxMNWodzgBnNx/DPgKfQ/xveZ
	cOTlB7DZhy5A13HukmxYkgG5iA3UTE7kcnkSXM4h9fm4JL7c5Ix4ow7VBHHC4KM414Tp1Ntg0aNn1
	4qhrLC4ZTG6/GWOAeUqWmYZWqXvfk55hpv8a0ACaSQmlebtiwYuxOKy6cm2eSxxqJ0R9jStiGiCuX
	C1aLx6YuAamRlXaxDTHxGuHHlS50C+SCbaOnq+auTHu12Cb3E1xfjbiwKboeWQtzGEhMqjYinbWh4
	bxCEwoD2ZknDaMnEA11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHvBx-001oNk-6z; Wed, 09 Feb 2022 22:12:01 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHvBl-001oLR-9k; Wed, 09 Feb 2022 22:11:50 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JvDcc45vzz9sQq;
 Wed,  9 Feb 2022 23:11:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1644444702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWD3hlhZOdYnBOvsmD40qoO3MXZ/D9lG7XrV59Xi8M0=;
 b=h/WVcaCi9/b9Muo4p+HpswPv2dMJqcmTjdbMNngx/TlViOyH+PSKSFlT9sLJ2CQ162RUkE
 fSi2EiEU+3VQItviu2KC1fq0r9yMJXT6F7riJGHS6S2hUN/CDSPTjM7X3QDdEnPCH439G4
 cgCPYrJ1Hzjl62XBONFHx4jU1y7rwtJ0l18mGno4MNWuTZ4e4Qmml6j+SNtSzQd1vz7Bnx
 XIhOIVD55Ie2hD5sA4udCCg3UlkXAGRKTNrjzwglPIPr6YFgMFdwfPfDw7Y1Z1RToPHH9j
 FRmstvJWZQL+DKFhfmXjeKyxZP2nJx6ScgL47vXPWXFPDuKW8FkXMVyyy6frzQ==
Message-ID: <788ac214-7fd9-33b8-38da-54690a24bdef@hauke-m.de>
Date: Wed, 9 Feb 2022 23:11:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net] net: phy: mediatek: remove PHY mode check on MT7531
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
References: <20220209143948.445823-1-dqfext@gmail.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <20220209143948.445823-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_141149_573153_DFA7BF03 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/9/22 15:39, DENG Qingfang wrote:
> The function mt7531_phy_mode_supported in the DSA driver set supported
> mode to PHY_INTERFACE_MODE_GMII instead of PHY_INTERFACE_MODE_INTERNAL
> for the internal PHY, so this check breaks the PHY initialization:
> 
> mt7530 mdio-bus:00 wan (uninitialized): failed to connect to PHY: -EINVAL
> 
> Remove the check to make it work again.
> 
> Reported-by: Hauke Mehrtens <hauke@hauke-m.de>
> Fixes: e40d2cca0189 ("net: phy: add MediaTek Gigabit Ethernet PHY driver")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Tested-by: Hauke Mehrtens <hauke@hauke-m.de>

> ---
>   drivers/net/phy/mediatek-ge.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek-ge.c
> index b7a5ae20edd5..68ee434f9dea 100644
> --- a/drivers/net/phy/mediatek-ge.c
> +++ b/drivers/net/phy/mediatek-ge.c
> @@ -55,9 +55,6 @@ static int mt7530_phy_config_init(struct phy_device *phydev)
>   
>   static int mt7531_phy_config_init(struct phy_device *phydev)
>   {
> -	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
> -		return -EINVAL;
> -
>   	mtk_gephy_config_init(phydev);
>   
>   	/* PHY link down power saving enable */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
