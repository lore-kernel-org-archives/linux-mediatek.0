Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F91C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:28:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDDF120781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YTE+hReK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kKZUrXyN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XU2DRv/M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDDF120781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WfiKK9VKLHlrBYja72Zbs96FhCxpiW7c7jfuGoQWtQI=; b=YTE+hReKDGuWwhs8jBBaEdkWf
	d340XYhff/A+DM1fGO0+TLIP9yRJHj1py304toDI4wkBqWeRZyoi3QQ7a3qxhxxCE2k67tewtpWLw
	jNVTFRvsBdLsd2oAnrqjS48loXUUDeq0JCO3s4d7X9FXXL2IBKcTYVCuTSIH+3y6XmXjl56OarUSD
	t5FVeu3vR42a1vyVY0QHgtRe+5CVMmkTnr/1OosjgVq/SGwo98yL7aJ2Cma5KZc+ljl8B9FMD0ScQ
	oi9fbFVMc+TXinQRgtrtGrzmetJdyPrs3BsQXJNYDCVDwgS8XUmHEiWbC/ERoMrVy3WN0+nPnrkwB
	vJRPU75Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69Wa-0002oC-1V; Thu, 13 Aug 2020 09:27:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69WY-0002nt-R9; Thu, 13 Aug 2020 09:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QQgcAqFsQMdctRYRQQkFM4/FaAdJSbAly6eNGHWh7JY=; b=kKZUrXyNEmu9QvbwdnJbjej/Dp
 9aYRwGfNwegCTq/MKijPfqNF6Kym47/1YFjoIved043v2Vhw1ZVl8a/sLYpYUJVhleGIbShW/Qkmn
 r/TJvAzm34UE9QiPlNiw3GlU4szcDV+5IJpfBj2emMkAKmm0dC1gEdCe55aMg/KmAyN5qlrzLlIh/
 YXtaCbUNXxFWRO60bwykLYJ0FkQgO2mwDNjUZ6ddMxn3YBkhCsLv70f56v3uT5tkCwSEMnsskcu9j
 PciKH6JRTysvSOLfktDYLYAt9zaxx0AtqjLeWfR2ZA8DrCKDzB3anNVOAdQpawQD6B4Ny3Y+hpKz5
 XTB5gjLA==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69WU-00032r-RM; Thu, 13 Aug 2020 09:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597310848;
 bh=QQgcAqFsQMdctRYRQQkFM4/FaAdJSbAly6eNGHWh7JY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XU2DRv/M7Qr/SvQ4xb30m4g28JCoCIPLm6mmgWJQR0UE8+iK6wvgOkE9T31svAh8K
 RCM9gAi7SG7BudQpY4+Hx3Ya6rgtF4G/3PewRpJ3m/6UDmlrxu1hWkgpRfK0RXpV+Q
 Qg73xMfvZy9980EHBipZMpFjdr6MaV+TdayPqbMk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.75.75.198] ([185.75.75.198]) by web-mail.gmx.net
 (3c-app-gmx-bap04.server.lan [172.19.172.74]) (via HTTP); Thu, 13 Aug 2020
 11:27:28 +0200
MIME-Version: 1.0
Message-ID: <trinity-ba9f3a8a-4588-48d3-8131-ce2a7ab5403e-1597310848667@3c-app-gmx-bap04>
From: Frank Wunderlich <frank-w@public-files.de>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Aw: [v4, 0/3] mmc: mediatek: add optional reset property mmc:
 mediatek: add optional module reset property arm64: dts: mt7622: add reset
 node for mmc device Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 arch/arm64/boot/dts/mediatek/mt7622.d
Date: Thu, 13 Aug 2020 11:27:28 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200813090618.28009-1-wenbin.mei@mediatek.com>
References: <20200813090618.28009-1-wenbin.mei@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:mXGJHHF88bG10JaMCy6eru/9VAgIE4rI2I0CB2gNmVZ1v9dYAOF3QLGE1FofnG1OstrvN
 KvylGzK5GMDiyOno6TRQVoetCMIsdujumuFaURvjxwPLw8J7eEtyRWW3TZU9CuRo/nCSWvDCvfnQ
 sXHdssRZ8ti/DhpGRn4ubmTmP/ocOwo5VUKfORmwt0Qt1Em77zg2+Q2YV39v0nL5niPDaUFYr4Lz
 K54oLCH6eOWM5iwr+NTcggvyefPblhKiFYN7HZRzUbTXTbgax995RoUe60r5+xPg/qFizEKdpO5Q
 iQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vw33wiRjJGk=:p++MCWCwlhii3JRTH6pCA8
 8WIzt/TEIBJ4unZ8aragxwA2U3wg1XZGiKYnR3e8b5VPNV9nl9lmhde0bBDjMUj4DTYCU5bs6
 qXoBZzlmOem/1Vf3EGxPlO7vxCPlomiH6fbc7U1XmRHSB/NQvCSXqRfcjIqW5AVPBxmX1hqie
 x0zo8kAjNmj8AbHm/kxvLTCfrn4/YaaHl70652fQ10Me84Bmn5sCjB5c8zFrALc+xInNN4JN2
 su1uyZTasOqQKH3/VZWJVOBuiOpM7Kqo1WXaxZXWfcDUWiCKf1sGDd9IdG0GRFWT0BOF78dPZ
 Y8qE3JrkBuPgwccKNEIki/hgqALwb/ecmyONQ3HRRbv7PHexLQBrtX1CsgjHYFw3OSsdNIMOw
 fdSDZw0b3vaJlJ66fe82fQKsbp4TI29F1JphoESRDJXL5uLQllHTpu7OowVRxirjcFgi1Tk4C
 wOrOdyDkLjxLGuAMm4t5bYmg7sJjlMq2MMb4siJDaExN+tcQckr3daXZY27FJ1OaiBseKY0A/
 laQy6hITzbHX/QgdJvIrTXRp/CR7MqPiuH5sm45RmDycUtJGWhK2mDfaaPH3yfp2fUspmKwPj
 3gYuoFUdOKkI4+QxUpdzrMK1fKMHYpsNTN154qKFFAIfmnvTeUj8seEb/qeEUylk0h+KEX7ov
 XTaLna95HIosfil7jXgStJ0WRVqvgX3II4ftvv0azxnR9cI+U37ORAN+MQxiJoi3MGVg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_102747_319000_C1EA1032 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

it looks like you still miss a blank line between subject and your text in cover-letter

regards Frank

> Betreff: [v4, 0/3] mmc: mediatek: add optional reset property mmc: mediatek: add optional module reset property arm64: dts: mt7622: add reset node for mmc device Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++ arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++ drivers/mmc/host/mtk-sd.c | 13 +++++++++++++ 3 files changed, 17 insertions(+)
>
> --
> 2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
