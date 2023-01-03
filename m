Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8FBC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NIrlOvbk7vZkei/UjaLevKnqZdjT8W2kPPgWX5gcEM=; b=HZQWE+1dEM9iW39Ay+29P7d0Zt
	Uru/JLDLHwD5TFy8JgiOp4jf1o2zi4BgnclcJvHGQ3survjSbNhO+elk+iJlixJqhqQcQuMl9ZoFx
	RRMiOljQvpv5g+JCoE4xxsgKuAgKhAnL75rFR0SGjDORhabnBNhKqNOe78VJzJVFXmVW39uvPT0lU
	u/kByac6hXk9AfU8pf0NwowuTujrH9NBHLzw85peelsy/VZYBIreYRSVX66yLPL6zintgdQT6soJg
	0vFmZKIrDjVjdp43++9+y0rXunVM931um53XAeOGPpFGxVwmCZDYNkoS7x6WJhAeoLklgSOnXJW7F
	HwMbD6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCev7-000psE-Ew; Tue, 03 Jan 2023 10:53:25 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCePy-000gpm-UE; Tue, 03 Jan 2023 10:21:17 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7021D126D;
	Tue,  3 Jan 2023 11:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672741268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NIrlOvbk7vZkei/UjaLevKnqZdjT8W2kPPgWX5gcEM=;
	b=RIvoOPSAjkHkWRfLX6Q0K/aek6FQU3XreYN5YNfAte2T/48X3VC8QQcEpd8jPJCFiyZzWo
	YiNwIusJEscDbzhm+hLbf6HNICx53SmA+YBP6AkQJq43zwVjNQZv+E9+UWk/k+GVe5vHsB
	PpYh33/dKsFzSAcgjfwdUsLd5q72TbERdzSx/SCAm4zwGljRFXGGLdVqfy4IcIf2W5lAZO
	XjMLUaTiUPYAyq3PtzHwPIZ0R9tR/KsXvd4mja00tvj0OPMSluRJXfI+WgaY/465OcIWYl
	25I7JQyqJw8aSZmYLqPK7a2CXyNMEgcEPOPRNCX0T6YnECO/Wo1QlrI2Qv3cuQ==
MIME-Version: 1.0
Date: Tue, 03 Jan 2023 11:21:08 +0100
From: Michael Walle <michael@walle.cc>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang
 <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 03/12] net: mdio: mdiobus_register: update
 validation test
In-Reply-To: <Y7P/45Owf2IezIpO@shell.armlinux.org.uk>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-3-ddb37710e5a7@walle.cc>
 <Y7P/45Owf2IezIpO@shell.armlinux.org.uk>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <37247c17e5e555dddbc37c3c63a2cadb@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_022115_401758_7907393D 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Russell,

Am 2023-01-03 11:13, schrieb Russell King (Oracle):
> On Wed, Dec 28, 2022 at 12:07:19AM +0100, Michael Walle wrote:
>> +	if (!bus || !bus->name)
>> +		return -EINVAL;
>> +
>> +	/* An access method always needs both read and write operations */
>> +	if ((bus->read && !bus->write) ||
>> +	    (!bus->read && bus->write) ||
>> +	    (bus->read_c45 && !bus->write_c45) ||
>> +	    (!bus->read_c45 && bus->write_c45))
> 
> I wonder whether the following would be even more readable:
> 
> 	if (!bus->read != !bus->write || !bus->read_c45 != !bus->write_c45)

That's what Andrew had originally. But there was a comment from Sergey 
[1]
which I agree with. I had a hard time wrapping my head around that, so I
just listed all the possible bad cases.

I don't have a strong opinion, though.

> which essentially asserts that the boolean of !method for the read and
> write methods must match.

Maybe with that as a comment?

-michael

[1] 
https://lore.kernel.org/netdev/ae79823f-3697-feee-32e6-645c6f4b4e93@omp.ru/

