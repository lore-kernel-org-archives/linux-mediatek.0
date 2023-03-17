Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0534FC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ9KX/PCzFZhbw0PzsuQE02nyn5hDgXI2fnvdbb1Idw=; b=Q/Ns93mszsQgeJOtYjmNsBKzLn
	q1Sb/RukTq4ekebtFB89oCCnyVhG2YAeq8VXjygyhmgGfbGqh9H1T6AYUsfWPmAWO3nTQZjiMxAo/
	t0BePCYOO3k/dfHFO1B3B44PrhxVhcjt2AEKSPzi0NADoPxHSWvsxixGKdWob96ktx4lH9FrmSHMd
	HzcHkZxVW5d5k8iXADF336bDfrl4L+pK5xJl8aRGpdDBsDdmomwy1pRyhu+jlgCBO5IH2luTSZR/U
	SdxbHmcDfrk1wYLgMidPdYzy9zWAikg7ad0x+NrLQ5Za5T6aji/USGwIfbWf2Y8YjB1iF4zBvQ4p+
	AHPEggmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4X1-001IGz-2z;
	Fri, 17 Mar 2023 07:29:43 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4Wy-001IGH-1M;
	Fri, 17 Mar 2023 07:29:42 +0000
Received: from maxwell ([109.42.112.148]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1MJn8J-1pxDxV14DR-00K6xA; Fri, 17 Mar 2023 08:28:28 +0100
References: <20230316095306.721255-1-jh@henneberg-systemdesign.com>
 <20230316131503.738933-1-jh@henneberg-systemdesign.com>
 <ZBOhy02DFBlnIQR1@shell.armlinux.org.uk>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wong Vee Khee
 <veekhee@apple.com>, Kurt Kanzenbach <kurt@linutronix.de>, Revanth Kumar
 Uppala <ruppala@nvidia.com>, Andrey Konovalov
 <andrey.konovalov@linaro.org>, Tan Tee Min <tee.min.tan@linux.intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Mohammad Athari Bin Ismail
 <mohammad.athari.ismail@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net V2] net: stmmac: Fix for mismatched host/device DMA
 address width
Date: Fri, 17 Mar 2023 08:22:57 +0100
In-reply-to: <ZBOhy02DFBlnIQR1@shell.armlinux.org.uk>
Message-ID: <87edpng7l9.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:5QIZD/zEoIlUl4J9g1YiRKLAvKnLDmfGku0rnPpP1GG1pOn9VFa
 gZ65HdQ0A+BnO6uOKrPi9+upVoPI97O/Vt5RPMeh+n9Yp7gDzxgJXLzIgNfbJoN0W+UT0+V
 g5vHPFtmWyMvG1ZqxHCzKb496+Q1ZfunoHrMGb8GRQla4ubIUed752mK8Q1uWvwhX6HNpJE
 Oo6tRW5cs3XaDQHjb2gzw==
UI-OutboundReport: notjunk:1;M01:P0:7PiMw8IYENA=;k4c5pIjPJUsV5oRScIM0B9sC78P
 HjQyFk/eU/EPi0rAE0h+h6T1NUTPYSytJoYuLnow2QN9Bai97/Wpw5ZAxEiA8C8uCKrn30pcD
 O4q36cWjc7Tw4QMS4IoQyiEpNnJ1bYaUNgkjEk5YwE63pyvhF3ZO00N72zC1wlYI1GTV2+g9z
 Cgqui2M39MKGpH5YqXKxkj6p4o12zcN4cLG6/AEA0UdeZJXQd1EaRnSK+k1J7qq+FBfVc3GHM
 mBNDOYIk/046k5x2HgPRJlp9vRvl2ExAhLbYG2M10xR9TJd7Rrrg/C5TUNOHbbQhJIYLdLuV5
 7ssRvmZ3jjywLS66YPNvUHDVRMsXjAN34Z7Ia3EYEscnw8ew8fb0gexYfG4pc+Z4HC06K/EOp
 efyVVnjCbqQYkO0ahy7lWEEPfrfeYfk80mgPqKXiOAsqJ2/BMvgi9nmI+SVy5dLV0V22JcAF+
 +Paj4fxH3fvgqLZwcGv4B4btmESueFsBFoeY0ivu6gBw4hJSRWyrI/ISQGqu5dLUkSNr3cGS1
 Rl+K/n6hayQi8cDWYf/uCyGHJ3+lQbMGJHAofBZsAclRclNJmJIDMEtlDu+UWldoRV4n4UMqH
 NEVLn0rwTFsa6hJJlLL8+fmg6ZsLtO7JYLgWk4MTdf/Nw1y6gGg8gcsC8zNSAwFJGcnXlVghQ
 dEiUuZVi4zRt8zK/f6LdNNG+F3VK1wz332jRWT9eMA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_002940_747455_4A627DDF 
X-CRM114-Status: GOOD (  21.27  )
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


"Russell King (Oracle)" <linux@armlinux.org.uk> writes:

> On Thu, Mar 16, 2023 at 02:15:03PM +0100, Jochen Henneberg wrote:
>> Currently DMA address width is either read from a RO device register
>> or force set from the platform data. This breaks DMA when the host DMA
>> address width is <=32it but the device is >32bit.
>> 
>> Right now the driver may decide to use a 2nd DMA descriptor for
>> another buffer (happens in case of TSO xmit) assuming that 32bit
>> addressing is used due to platform configuration but the device will
>> still use both descriptor addresses as one address.
>> 
>> This can be observed with the Intel EHL platform driver that sets
>> 32bit for addr64 but the MAC reports 40bit. The TX queue gets stuck in
>> case of TCP with iptables NAT configuration on TSO packets.
>> 
>> The logic should be like this: Whatever we do on the host side (memory
>> allocation GFP flags) should happen with the host DMA width, whenever
>> we decide how to set addresses on the device registers we must use the
>> device DMA address width.
>> 
>> This patch renames the platform address width field from addr64 (term
>> used in device datasheet) to host_addr and uses this value exclusively
>> for host side operations while all chip operations consider the device
>> DMA width as read from the device register.
>> 
>> Fixes: 7cfc4486e7ea ("stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE to 32 bits DMA addressing")
>> Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
>> ---
>> V2: Fixes from checkpatch.pl for commit message
>> 
>>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |  2 +-
>>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
>>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++---------
>>  include/linux/stmmac.h                        |  2 +-
>>  6 files changed, 22 insertions(+), 19 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
>> index 6b5d96bced47..55a728b1b708 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
>> @@ -418,6 +418,7 @@ struct dma_features {
>>  	unsigned int frpbs;
>>  	unsigned int frpes;
>>  	unsigned int addr64;
>> +	unsigned int host_addr;
>
> Obvious question: is host_addr an address? From the above description it
> sounds like this is more of a host address width indicator.
>
> Maybe call these "dev_addr_width" and "host_addr_width" so it's clear
> what each of these are?

You are right. I chose the name because the original field was called
addr64 which follows the naming from the chip specification. I will
switch to host_dma_width which makes it more clear that it's a DMA
address width. For both the platform field as well as the driver's
private data.

