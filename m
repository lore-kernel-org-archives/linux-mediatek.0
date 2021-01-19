Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3AEC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 07:44:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDED623131
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 07:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDED623131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uDUHq20EuDb54v5wH8afdotIOZxECbd015DdslL071w=; b=m878cw+tt5DZgWfuyFMHH5cYc
	PNssl3JVkkbWs5X3AnEPWcZrqrsrP+OTh3R7p3Ir40cbhCeyrZ/kwoMotb+7HPoLh87LTxkKOIxn/
	CoYhYxAo8DubyMcjQ2fLysf8WOtMOPBGneVOAfBOGsVTm2jVdjx3VUjvV47Mq7Fg9xANNz+fJ+//v
	SkeF6FCxMezz79wYW5AtndOsYuGyv9UjsjkVP9Bl75NQpzlJKzqrFCX166ialPUnsh5KzdYNiFfcp
	E8tA3di/Pu4P58L7b1ck7qL+HZ3Qb9j8sFL2FqjfWgmQCYz67VYFBY3yilBMU6P6nQt77wMxA4dwC
	JLTJbgcrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1lg0-00055V-V9; Tue, 19 Jan 2021 07:43:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1lfy-000544-MP; Tue, 19 Jan 2021 07:43:43 +0000
X-UUID: 4b7356199eba4a46adac2a06017c9a65-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ozSZxzeJfhdjy2ScWm8VmcjVBqWPRVRu2nraPSlGiUk=; 
 b=GdHdxpLGzdPF8aKZs7EAtd6Fa6nHk3A47YIa1kxpdgXJ8v+3PGwyh4OALpNZ1qjEQFENEZIJ8TAVbnT68B25gXJlwIiJI+zpMFj5D8naYdU3yKqLR/EAYAnIMYqGJ6AVFsW13ZwkIuVF+p+Yl7v5zmcZv4uSrkkubPtMcp6oHNk=;
X-UUID: 4b7356199eba4a46adac2a06017c9a65-20210118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 130330222; Mon, 18 Jan 2021 23:43:40 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 23:33:37 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 15:33:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 15:33:32 +0800
Message-ID: <1611041612.12761.9.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 19 Jan 2021 15:33:32 +0800
In-Reply-To: <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 583FC9A2C187E83C1BC85024308FDD8A9E0CF797AFAB7AE22F1756187A572C6B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_024342_920228_80A60C0B 
X-CRM114-Status: GOOD (  29.06  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, cy_huang <u0084500@gmail.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2021-01-17 at 09:43 -0800, Guenter Roeck wrote:
> On 1/15/21 6:13 AM, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > MT6360 not support for TCPC command to control source and sink.
> 
> does not
> 
> > Uses external 5V vbus regulator as the vbus source control.
> > 
> Use
> 
> > Also adds the capability to report vsafe0v.
> > 
> add
> 
> So far this driver works without regulator. Unless I am missing something,
> this patch makes regulator support mandatory, meaning existing code will fail.
If don't provide vbus-supply in DTS, regulator framework will provide a
dummy regulator, so the code will not fail.
> I am not sure if that is appropriate/acceptable. Can we be sure that this will
> work for existing users of this driver ?

> 
> Thanks,
> Guenter
> 
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci_mt6360.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> > index f1bd9e0..0edf4b6 100644
> > --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> > +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/usb/tcpm.h>
> >  
> >  #include "tcpci.h"
> > @@ -36,6 +37,7 @@ struct mt6360_tcpc_info {
> >  	struct tcpci_data tdata;
> >  	struct tcpci *tcpci;
> >  	struct device *dev;
> > +	struct regulator *vbus;
> >  	int irq;
> >  };
> >  
> > @@ -51,6 +53,27 @@ static inline int mt6360_tcpc_write16(struct regmap *regmap,
> >  	return regmap_raw_write(regmap, reg, &val, sizeof(u16));
> >  }
> >  
> > +static int mt6360_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data, bool src, bool snk)
> > +{
> > +	struct mt6360_tcpc_info *mti = container_of(data, struct mt6360_tcpc_info, tdata);
> > +	int ret;
> > +
> > +	/* To correctly handle the already enabled vbus and disable its supply first */
> > +	if (regulator_is_enabled(mti->vbus)) {
> > +		ret = regulator_disable(mti->vbus);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> Is it really a good idea to disable vbus if it happens to be already enabled
> and there is (another ?) request to enable it ?
> 
> > +
> > +	if (src) {
> > +		ret = regulator_enable(mti->vbus);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
> >  {
> >  	struct regmap *regmap = tdata->regmap;
> > @@ -138,7 +161,13 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
> >  	if (mti->irq < 0)
> >  		return mti->irq;
> >  
> > +	mti->vbus = devm_regulator_get(&pdev->dev, "vbus");
> > +	if (IS_ERR(mti->vbus))
> > +		return PTR_ERR(mti->vbus);
> > +
> >  	mti->tdata.init = mt6360_tcpc_init;
> > +	mti->tdata.set_vbus = mt6360_tcpc_set_vbus;
> > +	mti->tdata.vbus_vsafe0v = 1;
> >  	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
> >  	if (IS_ERR(mti->tcpci)) {
> >  		dev_err(&pdev->dev, "Failed to register tcpci port\n");
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
