Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9681BC5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQKaBY79GF+RPE6e93Lg/pYFuxmQLdWNgR8P0RjYoXg=; b=soTP02KWeAQ5qCEiBx47c7sv2h
	Auz5CwriFzkiY8tromDsZzveUAGavZ9QmXRsQHDv0J2zyG64Hy5Pk60i7mchOigiWz2xeuEzdg9Lz
	BMZarmUyQ5X2GDGYU8Hr+1GvUn58SQ9Gxz1NsPGoh9bDva0gbPW4T8S2JgXOSnKtukcFKIFF4HX+z
	VA/uTElNFD/s4oAVTBcT/vu8FiakjKXW174uZv068KoBxU7IlGOMMMrIBMoS7rvk08bAlRmEJPS2J
	WmQYtOtjendTJc1EojarI2mGAnLqKl2V1orXn7WFx94DM89EClAfvgh6l3yNKgDruYGTQfKToPXBE
	k8rbVIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErNR-001FVh-Kz; Mon, 09 Jan 2023 12:35:45 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErNF-001FRl-J4; Mon, 09 Jan 2023 12:35:35 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8B6369FB;
	Mon,  9 Jan 2023 13:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673267729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQKaBY79GF+RPE6e93Lg/pYFuxmQLdWNgR8P0RjYoXg=;
	b=YNe7fL7/NvBT9L6Xe/XKhfiU4deYF+rMcnn0PVQjmP8JXnWJnnkS3k45Axw3ZrVlF835dG
	mLQILtHhuY/HO+jJTzAgjUYhpeNtQpcwWN3MfskBvly/QmSEDqqw4/g7+wlSqEgBvOWchV
	r5PnpMP2Ns6mUH0K7HHTxw2Iq3PkYc2/rWu0/FbdurUrmvBL+HOvPeVKDO6aEXB9Rr9GpL
	AqwASKCUxfm5ylURZ2inKalD18ZZ3BBDbJ2Z/NXdJFJhxakGyaQc0F0cDijDQON8ESHwMG
	bE99WMg1fhqML2j2+JM6JoPXwjLGUIbtjFqNGWVIEh3KD4iV/aJ4aYBSEOdx9A==
MIME-Version: 1.0
Date: Mon, 09 Jan 2023 13:35:29 +0100
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
In-Reply-To: <Y7SqCRkYkhQCLs8z@shell.armlinux.org.uk>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-3-ddb37710e5a7@walle.cc>
 <Y7P/45Owf2IezIpO@shell.armlinux.org.uk>
 <37247c17e5e555dddbc37c3c63a2cadb@walle.cc>
 <Y7SqCRkYkhQCLs8z@shell.armlinux.org.uk>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0584195b863b361a4f5c1e27e6c270b3@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_043533_813494_CD2915CC 
X-CRM114-Status: GOOD (  17.07  )
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

Am 2023-01-03 23:19, schrieb Russell King (Oracle):
> On Tue, Jan 03, 2023 at 11:21:08AM +0100, Michael Walle wrote:
>> Am 2023-01-03 11:13, schrieb Russell King (Oracle):
>> > On Wed, Dec 28, 2022 at 12:07:19AM +0100, Michael Walle wrote:
>> > > +	if (!bus || !bus->name)
>> > > +		return -EINVAL;
>> > > +
>> > > +	/* An access method always needs both read and write operations */
>> > > +	if ((bus->read && !bus->write) ||
>> > > +	    (!bus->read && bus->write) ||
>> > > +	    (bus->read_c45 && !bus->write_c45) ||
>> > > +	    (!bus->read_c45 && bus->write_c45))
>> >
>> > I wonder whether the following would be even more readable:
>> >
>> > 	if (!bus->read != !bus->write || !bus->read_c45 != !bus->write_c45)
>> 
>> That's what Andrew had originally. But there was a comment from Sergey 
>> [1]
>> which I agree with. I had a hard time wrapping my head around that, so 
>> I
>> just listed all the possible bad cases.
> 
> The only reason I suggested it was because when looked at your code,
> it also took several reads to work out what it was trying to do!
> 
> Would using !!bus->read != !!bus->write would help or make it worse,
> !!ptr being the more normal way to convert something to a boolean?

IMHO that makes it even harder. But I doubt we will find an expression
that will work for everyone. I'll go with your suggestion/Andrew's first
version in the next iteration.

-michael

