Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80180C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41590610C8
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41590610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReoB8NyBIgR9Fyv0o+IajNUAi8PEjG4w6QSvgFZCbO4=; b=0Ly0E1koM29Sfz
	WP+uS33b3VgUM3usOEiTMHxkRPCZs5SJ51YqVcVf8vWD6lEcQZO3j4ZDQ89TRmWDvrt1iN0Xu8Beh
	OJohWrV7MT1gPEjoj7sp9QEowfLufe9wiwQYRnEGGfkc4fL+vM27LRA3YXf8LNydAsnKLYJ3Y/Daf
	+EGbHOPKPss9LOK/5Ekfby2sKar1bpc1Go32+Pf8mPF7AYtg8kB4bZyFm65vTbyd1QMIjNgliIb4W
	5I1xSaQPhAqfJ55SdZF1/CIKnnmIuOweOF711oVOSwwZsJVsfF0sWmRUi6OvevQFnzrlzdBKgb9xz
	JV/+tpkVo8z3q/GclA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUde-006vGo-16; Wed, 01 Sep 2021 18:07:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUdY-006vG4-NJ
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 18:07:04 +0000
X-UUID: 9957b91662a544cdb1841ed198b68e18-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JGJFdApMcubNDWvC7wCYe/neX6g9lSnZlMWbSWb6VQQ=; 
 b=Ur35WI6b93Vt0goLnNy7P0aVSgLl0QfsFqUtu7BacGCPDxLtH7Y59rbFUpO89t7mbny9cnSvQHTruxnUQiFFASq2huV8s72n8JQPcu4/UTUKWPnVQho14Sg9wYo+85NcuroaXsgq+aF9b6aNFY42ygXXAmxELBWgLk6x+r/TEfg=;
X-UUID: 9957b91662a544cdb1841ed198b68e18-20210901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1130805644; Wed, 01 Sep 2021 11:06:58 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 11:06:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 02:06:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 02:06:49 +0800
Message-ID: <32b9ac1244f38d20f89548b14aa8d2afb0fa779b.camel@mediatek.com>
Subject: Re: [PATCH v5 1/2] mt76: mt7915: fix hwmon temp sensor mem
 use-after-free
From: Ryder Lee <ryder.lee@mediatek.com>
To: Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 2 Sep 2021 02:06:49 +0800
In-Reply-To: <efe0cd18-b89a-0385-a271-d6c57fea08ca@candelatech.com>
References: <d72e872e7fdb5c04e890b978575f4d86bc61ad36.1630515789.git.ryder.lee@mediatek.com>
 <efe0cd18-b89a-0385-a271-d6c57fea08ca@candelatech.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_110700_813047_1981FE3A 
X-CRM114-Status: GOOD (  27.58  )
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

On Wed, 2021-09-01 at 10:55 -0700, Ben Greear wrote:
> On 9/1/21 10:49 AM, Ryder Lee wrote:
> > From: Ben Greear <greearb@candelatech.com>
> > 
> > Without this change, garbage is seen in the hwmon name and sensors
> > output
> > for mt7915 is garbled. It appears that the hwmon logic does not
> > make a
> > copy of the incoming string, but instead just copies a char* and
> > expects
> > it to never go away.
> > 
> > Fixes: d6938251bb5b ("mt76: mt7915: add thermal sensor device
> > support")
> > Signed-off-by: Ben Greear <greearb@candelatech.com>
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> > v5:  Use devm_kstrdup on the wiphy name as suggested.
> 
> I don't care a great deal either way, but phyname can change (which
> was original
> way to reproduce this corruption bug), so with this v5 change, then
> the hwmon 'id' could confusingly
> be 'phy0' while user has renamed the phy0 to wiphy0 or whatever.
> 
> It won't break my usage either way, so if you are happy with this,
> then good
> enough for me.

I thought of this ... Considering the hwmon can't never know the
phyname once it got changed. We can only specifiy a static "mt7915-xxx" 
to name it, or just use an initial phyname. Anyhow it's not the real
phyname you change actually.

> But, see below, there is spurious change...
> 
> 
> > v4:  Simplify flow.
> > v3:  Add 'fixes' tag to aid backports.
> > ---
> >   drivers/net/wireless/mediatek/mt76/mt7915/init.c | 8 ++++----
> >   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 2 +-
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > index acc83e9f409b..78b9abbe63f3 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > @@ -160,9 +160,10 @@ static int mt7915_thermal_init(struct
> > mt7915_phy *phy)
> >   	struct wiphy *wiphy = phy->mt76->hw->wiphy;
> >   	struct thermal_cooling_device *cdev;
> >   	struct device *hwmon;
> > +	const char *name;
> >   
> > -	cdev = thermal_cooling_device_register(wiphy_name(wiphy), phy,
> > -					       &mt7915_thermal_ops);
> > +	name = devm_kstrdup(&wiphy->dev, wiphy_name(wiphy),
> > GFP_KERNEL);
> > +	cdev = thermal_cooling_device_register(name, phy,
> > &mt7915_thermal_ops);
> >   	if (!IS_ERR(cdev)) {
> >   		if (sysfs_create_link(&wiphy->dev.kobj, &cdev-
> > >device.kobj,
> >   				      "cooling_device") < 0)
> > @@ -174,8 +175,7 @@ static int mt7915_thermal_init(struct
> > mt7915_phy *phy)
> >   	if (!IS_REACHABLE(CONFIG_HWMON))
> >   		return 0;
> >   
> > -	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
> > -						       wiphy_name(wiphy
> > ), phy,
> > +	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
> > name, phy,
> >   						       mt7915_hwmon_gro
> > ups);
> >   	if (IS_ERR(hwmon))
> >   		return PTR_ERR(hwmon);
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > index 932cf5a629db..219bb353b56d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > @@ -1962,7 +1962,7 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev
> > *dev, struct sk_buff *skb,
> >   	else
> >   		return;
> >   
> > -	bf->bf_cap = BIT(!ebf && dev->ibf);
> > +	bf->bf_cap = ebf ? ebf : dev->ibf << 1;
> 
> And this should not be in this patch.
> 

Oops. I messed patch up while merging to other series. Will fix.

Ryder
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
