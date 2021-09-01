Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F76AC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 17:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B9F60F23
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 17:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47B9F60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrYoMnBaYjN3q46O4ezOxV3dxoDk7HTH5o4cjYO2Toc=; b=xXvxl1iyYpyNbaP5x+sOrOx2Lu
	lY+QU/guIJ8ydoXFsj18kJPV+6tZFwbnS3/9ateB3/0iL6BOdX/QL3q4N8UOzuPd1Kz10+CqbeuT8
	LCEB6LRlEWvG0DNlhFP8OPYI2yk4ZGPxCCx49NXwYr6Mpmtss859ObjTfZEDhkB3gxzQtwrI3uUBS
	DCwDN9bOXsVUhvEQ+ZB3X1qvJq9YQaDgHcAjpwozUa/KqcUDZgKjoeRMxgisqHPGcOzrJ8PS1H+MR
	avEP2BHuDQaVdW6PivW8CTTBUw0KGi+MnJZR/2XnwC/+zUEBhzVf2Sj6rJssWF0AdIRwpSgBx8qDr
	iJwLPsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUSn-006ses-Q5; Wed, 01 Sep 2021 17:55:53 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUSW-006sZO-SU
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 17:55:40 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.67.121])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 5BD4B20080; 
 Wed,  1 Sep 2021 17:55:33 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 BB77C4C0073; Wed,  1 Sep 2021 17:55:32 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 427A913C2B1;
 Wed,  1 Sep 2021 10:55:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 427A913C2B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1630518932;
 bh=rXtzppk88Wnm3uo/M6L8zsOdWGLsxQnIw4Z+wmXUGuM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hgGa7w7ZeY6odpEu2V7C/wYhx7Gx5N7KuApR2/uM/YPSwjaFXp/WjKHu0AAQvhxwQ
 wEKAff23ex3i6w7H1jsd4VVtiUC8Zk6Sg+gXTnzZhOGmEKBpym/EUYJA/KzTWJQcW0
 0B/At/dX6rkshUlLBjh8SDrEpQzZIUkRXrbJz60A=
Subject: Re: [PATCH v5 1/2] mt76: mt7915: fix hwmon temp sensor mem
 use-after-free
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <d72e872e7fdb5c04e890b978575f4d86bc61ad36.1630515789.git.ryder.lee@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <efe0cd18-b89a-0385-a271-d6c57fea08ca@candelatech.com>
Date: Wed, 1 Sep 2021 10:55:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d72e872e7fdb5c04e890b978575f4d86bc61ad36.1630515789.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-MDID: 1630518933-01oFyndXDFRY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_105537_033028_1A541A3D 
X-CRM114-Status: GOOD (  23.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/1/21 10:49 AM, Ryder Lee wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Without this change, garbage is seen in the hwmon name and sensors output
> for mt7915 is garbled. It appears that the hwmon logic does not make a
> copy of the incoming string, but instead just copies a char* and expects
> it to never go away.
> 
> Fixes: d6938251bb5b ("mt76: mt7915: add thermal sensor device support")
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> v5:  Use devm_kstrdup on the wiphy name as suggested.

I don't care a great deal either way, but phyname can change (which was original
way to reproduce this corruption bug), so with this v5 change, then the hwmon 'id' could confusingly
be 'phy0' while user has renamed the phy0 to wiphy0 or whatever.

It won't break my usage either way, so if you are happy with this, then good
enough for me.

But, see below, there is spurious change...


> v4:  Simplify flow.
> v3:  Add 'fixes' tag to aid backports.
> ---
>   drivers/net/wireless/mediatek/mt76/mt7915/init.c | 8 ++++----
>   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index acc83e9f409b..78b9abbe63f3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -160,9 +160,10 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
>   	struct wiphy *wiphy = phy->mt76->hw->wiphy;
>   	struct thermal_cooling_device *cdev;
>   	struct device *hwmon;
> +	const char *name;
>   
> -	cdev = thermal_cooling_device_register(wiphy_name(wiphy), phy,
> -					       &mt7915_thermal_ops);
> +	name = devm_kstrdup(&wiphy->dev, wiphy_name(wiphy), GFP_KERNEL);
> +	cdev = thermal_cooling_device_register(name, phy, &mt7915_thermal_ops);
>   	if (!IS_ERR(cdev)) {
>   		if (sysfs_create_link(&wiphy->dev.kobj, &cdev->device.kobj,
>   				      "cooling_device") < 0)
> @@ -174,8 +175,7 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
>   	if (!IS_REACHABLE(CONFIG_HWMON))
>   		return 0;
>   
> -	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
> -						       wiphy_name(wiphy), phy,
> +	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
>   						       mt7915_hwmon_groups);
>   	if (IS_ERR(hwmon))
>   		return PTR_ERR(hwmon);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index 932cf5a629db..219bb353b56d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -1962,7 +1962,7 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
>   	else
>   		return;
>   
> -	bf->bf_cap = BIT(!ebf && dev->ibf);
> +	bf->bf_cap = ebf ? ebf : dev->ibf << 1;

And this should not be in this patch.

Thanks,
Ben

>   	bf->bw = sta->bandwidth;
>   	bf->ibf_dbw = sta->bandwidth;
>   	bf->ibf_nrow = tx_ant;
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
