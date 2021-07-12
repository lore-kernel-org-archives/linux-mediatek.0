Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD20C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 12:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDC261003
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 12:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BDC261003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIlIcVhCQ34Knyn6XJITzYlYWifALGSAWb8ggz+rWms=; b=EFaC5DtzE8YbwI
	yAf22hbmLgadmSkBDzjk+apDEr+eSiBs2WkmholtnhQEIAf2u1VpFU2/KNGPoEiaa/HMlE7O3A3o9
	nTRsGs6aEiOg5d1eJUtQfXhp2C90GOHIac/mP456jLewdtyKrzX5A3FmL4XTA55aTU7GqKjL0lNZP
	w5Rt393vmQ3l7sBrUZ6tSxxh3kdFpcJ4FN6hpAlg/w4R9mysU55NzZCHO0k8X/7bonSpCXSU1XXd0
	4ia68zKOThCZLdYZ4+oljzWHQ1SEbAuOqbx2MWsN0yJCi99+b2d1JWMettpSFUwdk0D9wEnaeTk26
	4ogiRJQ73tIu2Z25OKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2v9u-007JBo-UD; Mon, 12 Jul 2021 12:35:38 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2v9h-007JA4-LY; Mon, 12 Jul 2021 12:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626093310;
 bh=rh5GKzFg+dsbMQIiq+xLgaQmqKKWklDHEDOZ72rZcII=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EnkYebN8XadsyTNMfvs2529pi1xhNboFu3vx1nu5/O8lTawLXTp1uFmEZ1vbw7QRY
 cJul/0DEGHchkxRkP6fBC0NmFp7nkoe0hu4objN5igLnzAnm5Jn8jXMMB53LPI8kbO
 1JgVkOXiVqFWg3eYZXA5Ki2a+IAd0UzcbQUf8Loo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.139] ([157.180.225.139]) by web-mail.gmx.net
 (3c-app-gmx-bs28.server.lan [172.19.170.80]) (via HTTP); Mon, 12 Jul 2021
 14:35:10 +0200
MIME-Version: 1.0
Message-ID: <trinity-f4eef0e6-9873-4fbe-8c17-19cab347b1ab-1626093310010@3c-app-gmx-bs28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Enric
 Balletbo Serra <eballetbo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
Date: Mon, 12 Jul 2021 14:35:10 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:zWcV0RNa/sAAcLlfgoukFcMoBNCF5QfVOFWpMafp6qWTO3YgcfbiGfQXaqFUWO/QDtRp2
 K1smD/42XjVYAqhloiUChE3t8gzOyv6W0+h+Oafk9l5ps/3feCWhholV/PVX0G7pEgdHGqkSrmFW
 xdjchm13IWeypvF1HK2gng5yonSOyfOkZK4zr51JZWSctdNXb0uWriIPzSgQPT8jZWoIDDRwjPnq
 YcWdkEZANr4v9JiKu+lTZ6XUEfu8vNC3ye6LmvZGvJQjXBmGJYwqIlnKGsrTFqqgtK47Yd7PKPXr
 OM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:pFzShrWh7KM=:R2Yx+XxHAnhSQINfaSenQw
 6i4+zufFPuqBVhvnpPJ6YszTcsHfFVP6VV4GJzdjiVfSDgqcEw5Eb0/9BTb8SyQoy2T01JiT1
 ecnjD7Ad7kuQOQCeYeJuHMe1zEIuZS12BY8fTdpKjYFKfsT7WBhheYY4SN81nuxRMIaI8zXyM
 /n24iOBND3dhCnida1iqOnY7xE3ndU17ez8LhFSTKBC+KvAkCfSs5WtnqSvu8GXupCqOQQ2TL
 Uz6lxNZTCNtHaP8qQhJSySkZ8Bqe6/JaJs5Z5NqClIPRpXKf46SgJqQkr9Nj/cOlN3AvKoXTd
 p8ZMxTY/Td9d0K/PWuUg2oGZtaPf0IcR/ZZV2x3/YakqOATMbeG/lAs7FJD23hy5eF313qu6r
 pRmzwTRHN9BE1faIE57wnZpeu7iKIL8BWg793uiwrMQ5ayKIbdnrIHkoSMM7c6RQgYBtz1FJ0
 HMJlVpaoHpb5+QhAC1oEU4fTvrTBVje26ZkD765cCY5E8ZX4f29IAQ4gOcUTHdbtMlQM1mLF7
 zmNQyiyLiMUZwgoxuVLnnQSEJfmpXasFOeQ5h097zfMLlGjnpbPOnxngd+hf1o0gYsxexj8EF
 +xUlA+tBn4wpBEC/JC9/1H9wh6O6G4Q4Ole9ktesV4RImdgW6uigx3FUJn6ZHI5BkDCUF8ImB
 mI5gQKPm10oYT96u0dfP7/Tahgq+ralQe10/F+rc2SrvqH+Y+mtVsWXsYeu0uz6NorsCeDSzL
 XURqADkdDF6i9WZVZmKj6cKVuIfgNHY0K7AeqNeM0B/wjSWRxcpWXsf6qVuQrDPlDpRGXVZNX
 U6Cz9R1F9bvaIN5HD0dJCUi54rT3AgfywRXNLy0ZM2PiAjIg8s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_053526_031673_6796BCA7 
X-CRM114-Status: GOOD (  26.68  )
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

> Gesendet: Montag, 12. Juli 2021 um 13:50 Uhr
> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>
> An: "Frank Wunderlich" <linux@fw-web.de>, linux-mediatek@lists.infradead.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Matthias Brugger" <matthias.bgg@gmail.com>, "CK Hu" <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Enric Balletbo Serra" <eballetbo@gmail.com>, "David Airlie" <airlied@linux.ie>, dri-devel@lists.freedesktop.org, "Daniel Vetter" <daniel@ffwll.ch>
> Betreff: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on mt7623/bananapi-r2
>
> Hi
>
> On 10.07.21 15:24, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > HDMI output was broken on mt7623/BPI-R2 in 5.13 because function for
> > special output selection (mtk_mmsys_ddp_sout_sel) was dropped.
> > This function wrote 3 registers at one time and so it is not compatible
> > with the array-approach.
> >
> > I re-added the old function and call this after the default routing table
> > was applied. This default routing table can still be used as the only
> > connection handled by mmsys on BPI-R2 is OVL0->RDMA0 and this is already
> > present in the default routing table
> >
> > Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index 080660ef11bf..f91b7fdd417a 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -57,6 +57,25 @@ struct mtk_mmsys {
> >   	const struct mtk_mmsys_driver_data *data;
> >   };
> >
> > +static void mtk_mmsys_ddp_sout_sel(struct device *dev,
> > +				   enum mtk_ddp_comp_id cur,
> > +				   enum mtk_ddp_comp_id next)
> > +{
> > +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > +
> > +	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > +		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> > +			       mmsys->regs + DISP_REG_CONFIG_OUT_SEL);
> > +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > +		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> > +			       mmsys->regs + DISP_REG_CONFIG_OUT_SEL);
> > +		writel_relaxed(DSI_SEL_IN_RDMA,
> > +			       mmsys->regs + DISP_REG_CONFIG_DSI_SEL);
> > +		writel_relaxed(DPI_SEL_IN_BLS,
> > +			       mmsys->regs + DISP_REG_CONFIG_DPI_SEL);
>
> you can still use the array approach for this like that:
>
>          {
>                  DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
>                  DISP_REG_CONFIG_OUT_SEL, BLS_TO_DSI_RDMA1_TO_DPI1
>          }, {
>          {
>                  DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
>                  DISP_REG_CONFIG_OUT_SEL, BLS_TO_DPI_RDMA1_TO_DSI
>          }, {
>          {
>                  DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
>                  DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_RDMA
>          }, {
>          {
>                  DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
>                  DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_BLS
>          }, {
>
>
> Thanks,
> Dafna

these 4 blocks are already there (except your additional brackets) and it does not work with them (not added in 5.14)

 91 static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
 92     {
 93         DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
 94         DISP_REG_CONFIG_OUT_SEL, BLS_TO_DSI_RDMA1_TO_DPI1 //(1)
 95     }, {
 96         DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
 97         DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_BLS
 98     }, {
 99         DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
100         DISP_REG_CONFIG_OUT_SEL, BLS_TO_DPI_RDMA1_TO_DSI //(2)
101     }, {
102         DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
103         DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_RDMA //(3)
104     }, {
105         DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
106         DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_BLS //(4)
107     }, {

and code should apply all matching parts (2-4 for BLS=>dpi), but it does not work...maybe because new code reads and OR the new value instead of writing it (old code overwrites current register value with the new value without reading)

 69     for (i = 0; i < mmsys->data->num_routes; i++)
 70         if (cur == routes[i].from_comp && next == routes[i].to_comp) {
 71             reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val; //<<<<<<<<<<<
 72             writel_relaxed(reg, mmsys->regs + routes[i].addr);
 73         }


regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
