Return-Path: <SRS0=uEYr=Z4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A2BC43603
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 09:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A6221823
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 09:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vC+Rv8RB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IT0M4fxl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A6221823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCzekPvDq6Ttumu50RKNfgdpRbuAtBLho/iyVqR6ftY=; b=vC+Rv8RBOeSeAI
	gDj/r0hH8cN3JtmBlov857Eb+hraQ1sX2EeUzukDPVJ9pzcofy/b7gDqH+yBVtHfUd1Og5/G1WtTK
	wk3O365pXcugCqdBhEB6nePQcTeHE0J84Btx1nZmY9A/b5mW1R0iwP9VTJuOvFqWWsExGmVwnrBII
	OsEQqhD2xL2zJmWnb58Rn97bYBkivDHkYxSpN04szxY6eEsEQ1m/wJ0vTlxpjgN8AepuNCF5FuZ2/
	YFLnZi+5zIM0l/r5FW930qTqcqTsv9JfEGu96C7U9CU1zJ12xIC9zMSKk7UnXzDuK1uVWVc7nxrAZ
	QEyI5zpN1aj6RNBbboJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idA1V-00019u-IP; Fri, 06 Dec 2019 09:35:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idA1T-00018u-J7; Fri, 06 Dec 2019 09:35:40 +0000
X-UUID: 53829ed671054a31b02ef0970f3a8bd5-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vR5+TmnGL8k18O3RfwhBu/Xl8JNbLQTJoi3SA28TkwA=; 
 b=IT0M4fxlf04vCZUmXKfd8p6Z8eU6EiLiGcyUDVQ6sv7ieEMEZWYZffaAQqurBHjuGJcLBxwn14KQrJrLgxSP+PGNPcr/2MEROwY97f8qMMA1huT6oSkCJkH1RlJfhQa4kDm6cPr3ey97YuPFT+Ejf+U7rMeffl/Mcgl9aq6hA2Q=;
X-UUID: 53829ed671054a31b02ef0970f3a8bd5-20191206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 143918802; Fri, 06 Dec 2019 01:35:33 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 01:36:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 17:35:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 17:34:50 +0800
Message-ID: <1575624927.1631.7.camel@mtksdccf07>
Subject: Re: [PATCH v2 7/8] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Michael Kao <michael.kao@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 6 Dec 2019 17:35:27 +0800
In-Reply-To: <CAJMQK-ivho3T1hnD9axV2EMKT3Srs_5zAXLqwts8nojY15fBGg@mail.gmail.com>
References: <1557494826-6044-1-git-send-email-michael.kao@mediatek.com>
 <1557494826-6044-8-git-send-email-michael.kao@mediatek.com>
 <CAJMQK-ivho3T1hnD9axV2EMKT3Srs_5zAXLqwts8nojY15fBGg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B074D70E04D46F7F6E1F3B63CE826B399628CA35CC3E3E458B7FA485D552647E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_013539_639495_2F6650A5 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-11-21 at 15:00 +0800, Hsin-Yi Wang wrote:
> On Fri, May 10, 2019 at 9:27 PM michael.kao <michael.kao@mediatek.com> wrote:
> 
> > -       tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> > -                                                    &mtk_thermal_ops);
> > -       if (IS_ERR(tzdev)) {
> > -               ret = PTR_ERR(tzdev);
> > -               goto err_disable_clk_peri_therm;
> > +       for (i = 0; i < mt->conf->num_sensors + 1; i++) {
> > +               tz = kmalloc(sizeof(*tz), GFP_KERNEL);
> > +               if (!tz)
> > +                       return -ENOMEM;
> > +
> > +               tz->mt = mt;
> > +               tz->id = i;
> > +
> > +               tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i,
> > +                               tz, (i == 0) ?
> > +                               &mtk_thermal_ops : &mtk_thermal_sensor_ops);
> > +
> > +               if (IS_ERR(tzdev)) {
> > +                       if (IS_ERR(tzdev) != -EACCES) {
>                                 PTR_ERR(tzdev)
> 
> > +                               ret = PTR_ERR(tzdev);
> > +                               goto err_disable_clk_peri_therm;
> > +                       }
> > +               }
> 
> This for loop adding thermal zone sensors will not work for mt8173. It
> assumes that thermal-zones in dts have subnodes (eg. cpu_thermal,
> tzts..) amount equal to num_sensors+1. Otherwise tzdev would be
> -ENODEV and thermal failed to be probed.
> In mt8183 this is fine, since each thermal zone only has one sensor,
> but in mt8173, some sensor appears in multiple thermal zones.
> 
> In order to let the change also works for 8173, I think if the error
> is -ENODEV, and the id is not 0 (0 is cpu_thermal), prompt a warning
> instead of failing. Eg.
> 
>                 if (IS_ERR(tzdev)) {
> +                       if (i > 0 && PTR_ERR(tzdev) == -ENODEV) {
> +                               dev_warn(&pdev->dev, "can't find
> thermal sensor %d\n", i);
> +                               continue;
> +                       }
>                         if (PTR_ERR(tzdev) != -EACCES) {

OK, I will update this patch.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
