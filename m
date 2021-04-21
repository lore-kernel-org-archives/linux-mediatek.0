Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC66C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:32:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC596144A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC596144A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=avUvTQmu31DDbkcygRTlSV1hWi+Ph49ljA9+CpmrwrE=; b=l3AEODKCQStX0cvO5d3FdaW3i
	PwprAYH8ddeYXgVfg/EnmKT3qY1IYredFcQTPm5v6EePDZ+8PlwX2xa4wYHkf++G80W9ShN95a4GJ
	+FxMtNYoOKYjyhueOZd/EcGytyztqatfhJhAjfz85kx0EYEq17jPT/Vd5XxgNmNtIuBU2qE14xUK4
	Baig5zFpgjCbt97wyyN5/nDbeSaQT9KN5CGzURwL0A6c61LwBy8ysiBGYTH1YeLq0HCRuUXkjfMRe
	uYdscwSBEppmNJZ0Kh/RzFO07C2I/Pgxk5O77z/3QOEF3TPXXbh2RGDLX0jUGDTrnQ1T3Z901dYLV
	BhA/E9Wiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZA9j-00EEVp-Fr; Wed, 21 Apr 2021 10:32:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZA9h-00EEVb-77
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 10:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=mapYpz4d6B2un+rQqE+/GsrGdYsL1RzUyIJiwD8K17I=; b=Tjhbq7AvL3QBtku+wDDutP+5SK
 clTLPnHFC/NU51A8EbvchjH2awyia8W1uf7CnRppwRPqZAs1li123pBA5fQotkZoL0/8DTVfEd/RE
 TjKYHBpYN27UtwMcmJ4h43lzhvuSmRHT5VVxJYW5oCz/6yheG7ojd2pSyrL/sCZzHj/UJW1nIwhM5
 TaX1dZt4Ox10jzKSj4FVmRq1j2VN5iJcsKvrK8rzp5B73tOdVgnffDNLQ8s/yFidr/5cCL+79Iwj6
 w5ekvbcFe3EkCS4P1eFzUmBK1ES3dojDW0HR0ph+DFJBsoJoTS1hqbw79XzzDWS5+oMumx3WZxZvl
 lsIebICg==;
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZA9a-00CoGu-Ry
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 10:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mapYpz4d6B2un+rQqE+/GsrGdYsL1RzUyIJiwD8K17I=; b=Qis7ukCntEWog18vRSVMyepPzN
 aaxMyq1XSdkt6P0FPGyVkk0lYaZvgmOJOnTaFCD3tiH5BuungameU89mMzPsdAB2HADCLm4OTjcOq
 3PfCyjAVIL0VpD6JDcms+nn+gqrM+vIp9B9M7ReqgacxQH19F9QUzoqwy9bnJPDkQtpk=;
Received: from p4ff13bc6.dip0.t-ipconnect.de ([79.241.59.198] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lZA9U-0002VE-AG; Wed, 21 Apr 2021 12:32:12 +0200
Subject: Re: [PATCH 2/2] mt76: mt7615: add thermal sensor device support
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <b51d79d257e150a09d51029e3465e2ce925d6cfe.1618691395.git.ryder.lee@mediatek.com>
 <d9d9214cbd4444b861cdc8b88f17e8580b1025f6.1618691395.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <57888c9e-f66c-3922-9979-9d24e3e7d07f@nbd.name>
Date: Wed, 21 Apr 2021 12:32:11 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d9d9214cbd4444b861cdc8b88f17e8580b1025f6.1618691395.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_033219_137784_85B4D42C 
X-CRM114-Status: GOOD (  17.13  )
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


On 2021-04-17 22:42, Ryder Lee wrote:
> Similar to mt7915, switching to use standard hwmon sysfs.
> For reading temperature, cat /sys/class/ieee80211/phy*/hwmon*/temp1_input
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7615/debugfs.c   | 20 --------
>  .../net/wireless/mediatek/mt76/mt7615/init.c  | 50 +++++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  6 +--
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  3 +-
>  .../wireless/mediatek/mt76/mt7615/pci_init.c  |  4 ++
>  5 files changed, 58 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> index d84662fb0304..22ccad43a13e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> @@ -8,11 +8,61 @@
>   */
>  
>  #include <linux/etherdevice.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
>  #include "mt7615.h"
>  #include "mac.h"
>  #include "mcu.h"
>  #include "eeprom.h"
>  
> +static ssize_t mt7615_thermal_show_temp(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct mt7615_dev *mdev = dev_get_drvdata(dev);
> +	int temperature;
> +
> +	if (!mt7615_wait_for_mcu_init(mdev))
> +		return 0;
> +
> +	mt7615_mutex_acquire(mdev);
> +	temperature = mt7615_mcu_get_temperature(mdev);
> +	mt7615_mutex_release(mdev);
> +
> +	if (temperature < 0)
> +		return temperature;
> +
> +	/* display in millidegree celcius */
> +	return sprintf(buf, "%u\n", temperature * 1000);
> +}
> +
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, mt7615_thermal_show_temp,
> +			  NULL, 0);
> +
> +static struct attribute *mt7615_hwmon_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(mt7615_hwmon);
> +
> +int mt7615_thermal_init(struct mt7615_dev *dev)
> +{
> +	struct wiphy *wiphy = mt76_hw(dev)->wiphy;
> +	struct device *hwmon;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return 0;
> +
> +	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
> +						       wiphy_name(wiphy), phy,
This does not compile (wrong variable name).

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
