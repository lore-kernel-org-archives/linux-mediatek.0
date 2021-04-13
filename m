Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023F0C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 21:40:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8122561353
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 21:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8122561353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5rL6gVmx/NIMHdlqVbnQuGMy2uqpp5xX/nlnsa56QV0=; b=N6EILXVETsI39DudcC0mcQl6O
	UlSncPkcVxtd8+ir+73KHkyhlPWn1M+1fjcfa8yvEXghH8L1t1kdP6Xvt3cq6QKQ2AAmuFn4p63OM
	VjMjtB52wvV/IQGMgJ+xziR5xahtpZ1APuPJyWbOunZhM35s2we88v6Bp5vd+y/TiM6s5ODmEN5Ih
	Qet3PCSvJHFLlyQgUJ3h6dhJCpSYd+mO9zzOGVKQDw8P8E9SBCLn2xQZyWukuQeeMbhu9xwKlv+sB
	nJhT4Vwtk+7lQQonM2TisI1xgUTMwyt8S4sa2P0LiQVzm0wFcPdbtZ121vJz1sfFcFtL8raTP+hpo
	jGFMJVRqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWQlm-00AaVG-Ds; Tue, 13 Apr 2021 21:40:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQlc-00AaSe-Co; Tue, 13 Apr 2021 21:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=qrVIu0oKGFjZfX76jm4kOQap86K+5kzFHfpQuMVRW4s=; b=qK0RnVc8jnLCDqBGVIRgYKf3Ke
 drC0WTty/vQujruLbevqPZUeHhGeSecmR1r4ldrhRmMDmzASRsH8o0PSrWoFyeO3LV4V86EV+/aX7
 X4kHjL8us93wDzBeANW+opTqKCwDMmH9dxtiquYeeBpv1eRQ3KaV5x29j8NUhtA+RgKuMSGnRvB14
 etHucIPvu1h+J7XQzq+3TNUAZZiMqrnsuEMl5v+0vpb64Dzm0f3iSQnhcCRGpISUSc1OwK6PEf45v
 LWIJwdUkStqsOHR7tjEQZlk1MZt8TyNZkFjjjSCpGMgz2P1+U3W8h+crM9EMoM6m09qqX9Ov/cF+X
 gIexhxzg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQlZ-007L4R-Pl; Tue, 13 Apr 2021 21:40:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id B533E613C0;
 Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618350012;
 bh=toVub+slEHyxpan1zl2EKjAs+n9L+DqJjmVyXdpSda8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pRV3XRV88aPlnwLClx5LDM21mdefxIbRGFcsOMAWKDGAPSf1o7HWMcUJArQ3XXTo2
 omQ7Z2UBYmJ/4VEgdmDWMtz3nLyeoWfPZMbM/epzVuNn/dfLkNcaqGX/sQ3OpMjUBS
 bAKgZugFWBnTeaINp8LqtfjdEpx90+cwvi+asWJoSAi80GbrFagrnhafBEMs9d/q64
 V1GuK22jWWyeImHuDUYrsXisI7HOHaVrq3GZpA1n6OF84dCG4EQ57enrHgZGDRNpgk
 +wx2yJOLG9rxC5gEKrr9mBBot2pLRQqzLRJSzYPRKCwgwQuIOp0m7AJtIXo8z3kOIr
 TcOoK6hf+PaXg==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 0/2] of: net: support non-platform devices in
 of_get_mac_address()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161835001262.18297.4500601910911096840.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 21:40:12 +0000
References: <20210412174718.17382-1-michael@walle.cc>
In-Reply-To: <20210412174718.17382-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-oxnas@groups.io, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, andreas@gaisler.com,
 davem@davemloft.net, kuba@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@siol.net, joyce.ooi@intel.com, chris.snook@gmail.com,
 rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
 f.fainelli@gmail.com, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com, sgoutham@marvell.com, fugang.duan@nxp.com,
 madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com,
 leoyang.li@nxp.com, yisen.zhuang@huawei.com, salil.mehta@huawei.com,
 hauke@hauke-m.de, thomas.petazzoni@bootlin.com, vkochan@marvell.com,
 tchornyi@marvell.com, mlindner@marvell.com, stephen@networkplumber.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
 bryan.whitehead@microchip.com, vz@mleia.com, sergei.shtylyov@gmail.com,
 bh74.an@samsung.com, hayashi.kunihiko@socionext.com, peppe.cavallaro@st.com,
 alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vkoul@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, grygorii.strashko@ti.com, w-kwok2@ti.com,
 m-karicheri2@ti.com, michal.simek@xilinx.com, radhey.shyam.pandey@xilinx.com, 
 kvalo@codeaurora.org, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 stf_xl@wp.pl, helmut.schaa@googlemail.com, hkallweit1@gmail.com,
 robh+dt@kernel.org, frowand.list@gmail.com, gregkh@linuxfoundation.org,
 jerome.pouiller@silabs.com, vivien.didelot@gmail.com, olteanv@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_144013_891453_791F1BA6 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 12 Apr 2021 19:47:16 +0200 you wrote:
> of_get_mac_address() is commonly used to fetch the MAC address
> from the device tree. It also supports reading it from a NVMEM
> provider. But the latter is only possible for platform devices,
> because only platform devices are searched for a matching device
> node.
> 
> Add a second method to fetch the NVMEM cell by a device tree node
> instead of a "struct device".
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] of: net: pass the dst buffer to of_get_mac_address()
    https://git.kernel.org/netdev/net-next/c/83216e3988cd
  - [net-next,v4,2/2] of: net: fix of_get_mac_addr_nvmem() for non-platform devices
    https://git.kernel.org/netdev/net-next/c/f10843e04a07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
