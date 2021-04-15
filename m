Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80BBC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 14:54:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33197613D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33197613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9oV/beUCZ+ILiGJtoZKQz5d4c6OMlktYghgtRZHjaZI=; b=iEggEG+gFY5r5AeTjUzuZ/eko
	lJ+1IV2tzJAtI72Xnrix6XLEWCsFRtURrp1aTQOrFw0rV6CONEbqlZejC7N+jg/aED9M2rjBK3hPC
	8oduFZRkRZLCGqdV8+I8s6kn7PkDZ/q3EA1LnRrntm6c7L5BxSR6FRwcMfSfm1B2tiWe0iUG5u3q2
	d/u0Mj8uybgQhO2JgLANGyPVtAAx11syYEZZkiL6USnIZXimltnvi+2THonw0OAFzoa+8WcRh1eAX
	2LIjZDfEqvJ/vy7T+wdrk1apWpqrYAxni/n7P778nnZCyeKr8KPrmH2emzoV6GIT8y42V7dsd+YGG
	0mAdfD0fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX3NO-00GVvF-AI; Thu, 15 Apr 2021 14:53:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX3NL-00GVuj-DA
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 14:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=tFMDrlf1Sjl+scSa44AQJf8sS8dNjNAuNHaqHAG2Rng=; b=NCngh4iSdMvAl+Yl12XOs+zIGp
 /Wg1PA8PR4ltlSfNDYKWfbkvwGxj6WrTfmd4NS8RDJBHhbgKXyAR0gQxzE5HXbbzFvi+dXDMph3Fk
 Ec2fr7gq3cbeSf7XiEqK/9XomOr3TYSdk2wKPxRBn3IzhfSkj1rahCxwJ87EE8o2VdC4W+0+kC7Ej
 itpvdRgJfEBBpS709ffAFADltssmXF9M+NO2ORKCLeFgb20+MvbPKK+D8YORT89oLlCCrs5h15X0k
 MAk5qQfzA3rUzrcJf6KVwdBDOf95EUzhLmlucj5uA34hFK2y+hjx3/tjQXMXJ9PuJ3Py54vhLpfll
 NqKJ+yNQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX3NI-008fgC-Fe
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 14:53:45 +0000
X-UUID: 48bd31316e214732b77b21da7fc195a0-20210415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tFMDrlf1Sjl+scSa44AQJf8sS8dNjNAuNHaqHAG2Rng=; 
 b=hAdQGbt+HR+86oJW+0p0PymCLShD0lyPjo4U+R9I1Vn1FE4WjqqxeEXEkcmJacTpT7hTjXKk66+oGtOb3kM8U2wYOPPKJWro91maijMb17TAJs0FuN4hQnEFu049GAzozXa/L/pe3F4BmVK++YsmhRb2Z5VNnhyGeU9Iz1gFRdQ=;
X-UUID: 48bd31316e214732b77b21da7fc195a0-20210415
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 814084772; Thu, 15 Apr 2021 07:53:39 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 07:53:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 22:53:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 22:53:30 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/2] mt76: mt7921: add debugfs knob for performing wifi
 reset
Date: Thu, 15 Apr 2021 22:53:29 +0800
Message-ID: <1618498409-7155-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YHhFXcgsfziGlCag@lore-desk>
References: <YHhFXcgsfziGlCag@lore-desk>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_075344_551177_D5B667F8 
X-CRM114-Status: GOOD (  11.89  )
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

From: Sean Wang <sean.wang@mediatek.com>

>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Introduce chip_reset knob in mt7921 debugfs to export a way to users
>> able to trigger wifi reset.
>>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> index 024524173115..1342a0b645e3 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> @@ -302,6 +302,16 @@ static int mt7921_config(void *data, u64 val)
>>
>>  DEFINE_DEBUGFS_ATTRIBUTE(fops_config, NULL, mt7921_config, "%lld\n");
>>
>> +static int mt7921_chip_reset(void *data, u64 val) {
>> +	struct mt7921_dev *dev = data;
>> +
>> +	mt7921_reset(&dev->mt76);
>> +
>> +	return 0;
>> +}
>> +DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7921_chip_reset,
>> +"%lld\n");
>
>can we use chip_config for this?

i think we can resue the the knob for chip_reset. i will do it in the next version.

>
>Regards,
>Lorenzo
>
>> +
>>  int mt7921_init_debugfs(struct mt7921_dev *dev)  {
>>	struct dentry *dir;
>> @@ -322,6 +332,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
>>	debugfs_create_file("idle-timeout", 0600, dir, dev,
>>			    &fops_pm_idle_timeout);
>>	debugfs_create_file("chip_config", 0600, dir, dev, &fops_config);
>> +	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
>>
>>	return 0;
>>  }
>> --
>> 2.25.1
>>
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
