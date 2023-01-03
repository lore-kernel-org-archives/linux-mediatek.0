Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96246C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHFL2PgwhVhLIbc4WDQ0VxcndRKF+zLEggh6iiwpmQY=; b=m9SzpgitvbJLJTzYWmIEqP5rxM
	a19eQ3C6n6efKcPIYr0IWJ0UqCxW+6PV+6nbGC9znwqV450z7UzCTyqSokTeDsvzg+TrABfeEMsIb
	cAYGjlYSEmYQXaiSaqnUK+xpV2cAKsdv5Tv362s9HDHQpq2LukccycVxW1LM2lA3wBKtNim5I77OB
	4b/wzUXbfXk/+MwngVTw15CBVLUyyoZrAqiSunCTCSd+JTnh/YoO0RPfK0K93E3UFniB0UeQQEfnq
	0B7FN/PA6Apbo8bhDzR+RGLVCOzXvDWRRRM0VwL7dBnta5SGbYaU+jjX3s9ZChWfLI/fFy+oirfJF
	BM5oZykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkNy-0032dz-71; Tue, 03 Jan 2023 16:43:34 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pChKS-001XFz-HA; Tue, 03 Jan 2023 13:28:03 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7D8CC75;
	Tue,  3 Jan 2023 14:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672752457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHFL2PgwhVhLIbc4WDQ0VxcndRKF+zLEggh6iiwpmQY=;
	b=JhiJnwoTDE7pFhG+6yV7Aq3RJmVT4t44k3691eIxRvPtUQuqII3Y4xs+bhozbQ7LmK5Av2
	XnALDQ/hF232xKSTXjfFhkMjHwMd/c5QRHY59HMdmYmiYrZAhxpuQ+9SD/TG0R+v9srIsp
	6sFt2FSn0JXtJs+8pd5Ykp5vlR40Ln5+jh28Zd9+qn7D70QWQBIB3bWHOtVxvHSSNM+QO9
	7Zn/Y7jwx1JKLDaslcRR/167IzifxZuNeCxzrblRR12xpOzbwFhEVaZafELh3c+/0a6vnJ
	sLt1tEtpRFKLBERSnf4b4UhQ79A3Sryb4YEu40MVBNv3nXhH+7zLGc/1riMTvQ==
MIME-Version: 1.0
Date: Tue, 03 Jan 2023 14:27:37 +0100
From: Michael Walle <michael@walle.cc>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 06/12] net: mdio: mdio-bitbang: Separate
 C22 and C45 transactions
In-Reply-To: <20230103131555.5i4tj7sk72gmed5d@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-6-ddb37710e5a7@walle.cc>
 <20230103131555.5i4tj7sk72gmed5d@skbuf>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <300bdff73f38b4e480d533c04126854d@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_052746_221486_F5B6267C 
X-CRM114-Status: GOOD (  14.67  )
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

Am 2023-01-03 14:15, schrieb Vladimir Oltean:
> On Wed, Dec 28, 2022 at 12:07:22AM +0100, Michael Walle wrote:
>> From: Andrew Lunn <andrew@lunn.ch>
>> 
>> The bitbbanging bus driver can perform both C22 and C45 transfers.
>> Create separate functions for each and register the C45 versions using
>> the new driver API calls.
>> 
>> The SH Ethernet driver places wrappers around these functions. In
>> order to not break boards which might be using C45, add similar
>> wrappers for C45 operations.
>> 
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
> 
> Incomplete conversion, this breaks the build. Need to update all users
> of the bitbang driver (also davinci_mdio). Something like the diff 
> below
> fixes that, but it leaves the davinci_mdio driver in a partially
> converted state (if data->manual_mode is true, new API is used,
> otherwise old API is used). So another patch to convert the other case
> will likely be needed.

The intel build bot already notified me about this. Unfortunately, only
privately as I just noticed.

And yes, these are just the first 12 patches of a larger series.

-michael

