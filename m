Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97871C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kz3YFtntmYvDsAJ7EeX7LX7Ic0oc8HInvGDysjmiLAg=; b=vgGGP1ScqoN7ZS
	N3I6KiXgw4Y3nC0zRTU24l6st9J14mje5m0d5PEoIvUoVwOYb2r09h6axiRIaKWQQO4zbKTNFJkzp
	gEmXV0W7NqhueubWWjfnkh6hb9EJI5RDB2IxI/lVcsL4Qsbtd7+0783s3AP1fUjPFy5iwoQlwJ/KZ
	D54ls3AzUwhSP4C2lha5wG+XYoMzJ4BIBDqryqzon4+wKNGdagHf7dewHjpj/gfk+N02UHC9HSQ67
	WEHw3WVacxvRev0pXbHurVdOa6U7xvooLrA51rnhmSdSn9MZVBXS94ewXQa2Kw2EicyVRdTi5UJma
	LP797puCbDe7hF/zBaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoF5-00H4tV-59; Fri, 22 Apr 2022 08:02:15 +0000
Received: from m1541.mail.126.com ([220.181.15.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoBs-00H3BH-BF; Fri, 22 Apr 2022 07:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=KOOwj
 Ngxtpj+BOV9RiocwkEJ5gaHVgyNXKB2q9i864s=; b=I2bcLGGMBZdE8yJCQe73E
 ublKXrfowHicATx4CEeGLTb6eCcoRMxL5WoQOTv2+7QZxwlqAzF4e/JPdbJi3Hv0
 A8AVgXuuhLURpEiqwFDsWBb4y1DE5YvfB6w7f1mKr1sC1ZbZ4TWP3y/hEY3dxCYf
 tslRTLpgh+V2PhvjmdSg5c=
Received: from zhaojunkui2008$126.com ( [58.213.83.157] ) by
 ajax-webmail-wmsvr41 (Coremail) ; Fri, 22 Apr 2022 15:58:26 +0800 (CST)
X-Originating-IP: [58.213.83.157]
Date: Fri, 22 Apr 2022 15:58:26 +0800 (CST)
From: z  <zhaojunkui2008@126.com>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: "Jakub Kicinski" <kubakici@wp.pl>, "David S. Miller" <davem@davemloft.net>,
 "Paolo Abeni" <pabeni@redhat.com>, 
 "Matthias Brugger" <matthias.bgg@gmail.com>, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bernard@vivo.com
Subject: Re:Re: [PATCH] mediatek/mt7601u: add debugfs exit function
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <87k0bhmuh6.fsf@kernel.org>
References: <20220422070325.465918-1-zhaojunkui2008@126.com>
 <87k0bhmuh6.fsf@kernel.org>
MIME-Version: 1.0
Message-ID: <6fd91edd.4c2b.1805047850c.Coremail.zhaojunkui2008@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: KcqowADn9t4jYGJiD_oRAA--.42888W
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiuQPqqlpD8lH33AAAsr
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_005856_789180_BD1B883B 
X-CRM114-Status: GOOD (  13.02  )
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

HI Kalle Valo:

At 2022-04-22 15:45:57, "Kalle Valo" <kvalo@kernel.org> wrote:
>Bernard Zhao <zhaojunkui2008@126.com> writes:
>
>> When mt7601u loaded, there are two cases:
>> First when mt7601u is loaded, in function mt7601u_probe, if
>> function mt7601u_probe run into error lable err_hw,
>> mt7601u_cleanup didn`t cleanup the debugfs node.
>> Second when the module disconnect, in function mt7601u_disconnect,
>> mt7601u_cleanup didn`t cleanup the debugfs node.
>> This patch add debugfs exit function and try to cleanup debugfs
>> node when mt7601u loaded fail or unloaded.
>>
>> Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
>> ---
>>  .../net/wireless/mediatek/mt7601u/debugfs.c   | 25 +++++++++++--------
>>  drivers/net/wireless/mediatek/mt7601u/init.c  |  5 ++++
>>  .../net/wireless/mediatek/mt7601u/mt7601u.h   |  4 +++
>>  3 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
>> index 20669eacb66e..1ae3d75d3c9b 100644
>> --- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
>> +++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
>> @@ -124,17 +124,22 @@ DEFINE_SHOW_ATTRIBUTE(mt7601u_eeprom_param);
>>  
>>  void mt7601u_init_debugfs(struct mt7601u_dev *dev)
>>  {
>> -	struct dentry *dir;
>> -
>> -	dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
>> -	if (!dir)
>> +	dev->root_dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
>> +	if (!dev->root_dir)
>>  		return;
>>  
>> -	debugfs_create_u8("temperature", 0400, dir, &dev->raw_temp);
>> -	debugfs_create_u32("temp_mode", 0400, dir, &dev->temp_mode);
>> +	debugfs_create_u8("temperature", 0400, dev->root_dir, &dev->raw_temp);
>> +	debugfs_create_u32("temp_mode", 0400, dev->root_dir, &dev->temp_mode);
>> +
>> +	debugfs_create_u32("regidx", 0600, dev->root_dir, &dev->debugfs_reg);
>> +	debugfs_create_file("regval", 0600, dev->root_dir, dev, &fops_regval);
>> +	debugfs_create_file("ampdu_stat", 0400, dev->root_dir, dev, &mt7601u_ampdu_stat_fops);
>> +	debugfs_create_file("eeprom_param", 0400, dev->root_dir, dev, &mt7601u_eeprom_param_fops);
>> +}
>>  
>> -	debugfs_create_u32("regidx", 0600, dir, &dev->debugfs_reg);
>> -	debugfs_create_file("regval", 0600, dir, dev, &fops_regval);
>> -	debugfs_create_file("ampdu_stat", 0400, dir, dev, &mt7601u_ampdu_stat_fops);
>> -	debugfs_create_file("eeprom_param", 0400, dir, dev, &mt7601u_eeprom_param_fops);
>> +void mt7601u_exit_debugfs(struct mt7601u_dev *dev)
>> +{
>> +	if (!dev->root_dir)
>> +		return;
>> +	debugfs_remove(dev->root_dir);
>
>debugfs_remove() has IS_ERR_OR_NULL() check, so no need to check for
>null here.
Got it, thanks!

>>  }
>> diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c b/drivers/net/wireless/mediatek/mt7601u/init.c
>> index 5d9e952b2966..1e905ef2ed19 100644
>> --- a/drivers/net/wireless/mediatek/mt7601u/init.c
>> +++ b/drivers/net/wireless/mediatek/mt7601u/init.c
>> @@ -427,6 +427,9 @@ void mt7601u_cleanup(struct mt7601u_dev *dev)
>>  	mt7601u_stop_hardware(dev);
>>  	mt7601u_dma_cleanup(dev);
>>  	mt7601u_mcu_cmd_deinit(dev);
>> +#ifdef CONFIG_DEBUG_FS
>> +	mt7601u_exit_debugfs(dev);
>> +#endif
>>  }
>>  
>>  struct mt7601u_dev *mt7601u_alloc_device(struct device *pdev)
>> @@ -625,7 +628,9 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
>>  	if (ret)
>>  		return ret;
>>  
>> +#ifdef CONFIG_DEBUG_FS
>>  	mt7601u_init_debugfs(dev);
>> +#endif
>
>Are these two ifdefs really needed? debugfs functions are empty
>functions when CONFIG_DEBUG_FS is disabled.
Ifdef doesn't seem to make much sense, thanks for your advice!

>> --- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
>> +++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
>> @@ -242,6 +242,9 @@ struct mt7601u_dev {
>>  	u32 rf_pa_mode[2];
>>  
>>  	struct mac_stats stats;
>> +#ifdef CONFIG_DEBUG_FS
>> +	struct dentry *root_dir;
>> +#endif
>
>I would remove this ifdef, it's just saving one pointer size. Less
>ifdefs we have the better.
I would modify the code and resubmit a patch, thank you very much!

BR//Bernard
>-- 
>https://patchwork.kernel.org/project/linux-wireless/list/
>
>https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
