Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCD5C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:48:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E1861415
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E1861415
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4+yMDi26DWKoFlgO+0HDbAdlUZ6wVFlERB1mnyCCqk=; b=tXjOuggIsHsb8B
	HMhslX7KwpQsE9k5N2yZEAAq/cCYAubvQ2Nr2rBvUR73Ld2XtsRlkJjckzbezkpUmyyY1QRQAaJhO
	xX2l/ohw6muTJspmw6tQFvdvu8Uop1rpA31MQtUv/ar0euJMEU70qXYadaLV8HnbzlOisjqWBBaN6
	KJjdPbhkorgR/YUeDBTuDOiV7amIgB9tVXCiC/WeQobAonvzbciL7PnF1HI+QZCeASpG2QvM300RG
	6MU6kVsJgThOTnUUMk+egjmYJkR7Cqxgx+vQNKsx3tsoAgEkfpx9jQGYlqbntwxGS6os4YTbax26S
	Ly/fsxbtVYt4Tis31UGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJN8-002Cfm-Gu; Mon, 24 May 2021 22:48:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll3VV-000hnS-V5; Mon, 24 May 2021 05:52:12 +0000
X-UUID: 16218f24262f4b5da32cfbc2910ccb09-20210523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LoLYf3k09hMICHMVpZro5qOWWXrtd+kOMaHi5n1SgPc=; 
 b=KBEzU4Fbs6sGymUviRZ4SquZ/0bt/AlFB38yjPcEpC1Xvc5q77z0Z3Utp1lbg0VbRFaphSvS6EOex+BNl/DEIT6cft+PSTrRLrCPe3eDrTFS/H1vAVsp21yvz+1zt9cmT2TFnLg+9sCN0zioSUbMYJR0NQ10L5t78ycTA6Baoa4=;
X-UUID: 16218f24262f4b5da32cfbc2910ccb09-20210523
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1494250670; Sun, 23 May 2021 22:51:57 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 May 2021 22:51:55 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 24 May 2021 13:51:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 May 2021 13:51:51 +0800
Message-ID: <1621835511.26501.14.camel@mhfsdcap03>
Subject: Re: [PATCH v2 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS
 supply optional"
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Thierry Reding <treding@nvidia.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Lee Jones
 <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Mon, 24 May 2021 13:51:51 +0800
In-Reply-To: <YKezl0nlWFQhLyf/@orome.fritz.box>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
 <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
 <YKezl0nlWFQhLyf/@orome.fritz.box>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09521C55F9BDC52149C658731C51578E10BA171E1C2E2D51E277A9BE9C943C162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_225209_924550_A5B7F16F 
X-CRM114-Status: GOOD (  43.97  )
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

On Fri, 2021-05-21 at 15:20 +0200, Thierry Reding wrote:
> On Wed, May 19, 2021 at 02:39:46PM +0800, Chunfeng Yun wrote:
> > Vbus is already an optional supply, if the vbus-supply is not
> > provided in DTS, will use a dummy regulator,
> 
> That statement is not entirely correct. The dummy regulator is
> substituted only if the supply is in fact not optional. The idea behind
> that is to allow DTS files that don't specify all required regulators to
> get away with it, based on the assumption that the supply is one of
> those always-on supplies that are often not described in DTS.
Yes, you are right.
But from the point of result, it indeed can help to handle the absent
regulator.
> 
> > the warning log is as below:
> > "supply vbus not found, using dummy regulator"
> 
> And the reason why we get that warning is to point out that the DTS has
> a bug and that it should be fixed (by adding a proper regulator to take
> the place of the dummy).
> 
> > This reverts commit 4ddf1ac79e5f082451cd549283d2eb7559ab6ca9.
> 
> But if you read the description of that commit, the purpose of that
> patch was in fact to make the supply completely optional in the case
> where we already have the VBUS supply specified for the USB port that
> the connector is parented to.
Could you please give an example you mentioned?

It seems prefer to provide vbus supply in connector instead of port
according to dt-binding

Thanks

> 
> So in that case the DTS doesn't have the bug because the VBUS supply is
> already specified for the USB port and therefore it doesn't have to be
> specified in the USB connector again. In fact, specifying it twice can
> lead to a situation where the USB port may not be able to switch the
> VBUS supply on or off because the setting might conflict with that of
> the USB connector.

> 
> So unless there's a real reason why this is needed, I don't think this
> should be applied.
> 
> Thierry
> 
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: remove unused variable "need_vbus"
> > ---
> >  drivers/usb/common/usb-conn-gpio.c | 30 ++++++------------------------
> >  1 file changed, 6 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
> > index dfbbc4f51ed6..65d89140cd19 100644
> > --- a/drivers/usb/common/usb-conn-gpio.c
> > +++ b/drivers/usb/common/usb-conn-gpio.c
> > @@ -91,14 +91,14 @@ static void usb_conn_detect_cable(struct work_struct *work)
> >  		return;
> >  	}
> >  
> > -	if (info->last_role == USB_ROLE_HOST && info->vbus)
> > +	if (info->last_role == USB_ROLE_HOST)
> >  		regulator_disable(info->vbus);
> >  
> >  	ret = usb_role_switch_set_role(info->role_sw, role);
> >  	if (ret)
> >  		dev_err(info->dev, "failed to set role: %d\n", ret);
> >  
> > -	if (role == USB_ROLE_HOST && info->vbus) {
> > +	if (role == USB_ROLE_HOST) {
> >  		ret = regulator_enable(info->vbus);
> >  		if (ret)
> >  			dev_err(info->dev, "enable vbus regulator failed\n");
> > @@ -106,9 +106,8 @@ static void usb_conn_detect_cable(struct work_struct *work)
> >  
> >  	info->last_role = role;
> >  
> > -	if (info->vbus)
> > -		dev_dbg(info->dev, "vbus regulator is %s\n",
> > -			regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
> > +	dev_dbg(info->dev, "vbus regulator is %s\n",
> > +		regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
> >  
> >  	power_supply_changed(info->charger);
> >  }
> > @@ -175,7 +174,6 @@ static int usb_conn_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct usb_conn_info *info;
> > -	bool need_vbus = true;
> >  	int ret = 0;
> >  
> >  	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> > @@ -205,23 +203,7 @@ static int usb_conn_probe(struct platform_device *pdev)
> >  
> >  	INIT_DELAYED_WORK(&info->dw_det, usb_conn_detect_cable);
> >  
> > -	/*
> > -	 * If the USB connector is a child of a USB port and that port already provides the VBUS
> > -	 * supply, there's no need for the USB connector to provide it again.
> > -	 */
> > -	if (dev->parent && dev->parent->of_node) {
> > -		if (of_find_property(dev->parent->of_node, "vbus-supply", NULL))
> > -			need_vbus = false;
> > -	}
> > -
> > -	if (!need_vbus) {
> > -		info->vbus = devm_regulator_get_optional(dev, "vbus");
> > -		if (PTR_ERR(info->vbus) == -ENODEV)
> > -			info->vbus = NULL;
> > -	} else {
> > -		info->vbus = devm_regulator_get(dev, "vbus");
> > -	}
> > -
> > +	info->vbus = devm_regulator_get(dev, "vbus");
> >  	if (IS_ERR(info->vbus)) {
> >  		ret = PTR_ERR(info->vbus);
> >  		return dev_err_probe(dev, ret, "failed to get vbus :%d\n", ret);
> > @@ -288,7 +270,7 @@ static int usb_conn_remove(struct platform_device *pdev)
> >  
> >  	cancel_delayed_work_sync(&info->dw_det);
> >  
> > -	if (info->last_role == USB_ROLE_HOST && info->vbus)
> > +	if (info->last_role == USB_ROLE_HOST)
> >  		regulator_disable(info->vbus);
> >  
> >  	usb_role_switch_put(info->role_sw);
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
