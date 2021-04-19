Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8CDC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 03:01:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4888B60E08
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 03:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4888B60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cihsx8T2+BF0zKLIjyI6jtCdkDn01nE4BstxT0MQaec=; b=G+cjOrhehsVsBF2jJYUTSvUXN
	Sd5lP1FqePZemIDLijpE/Iz0XXn7F7XWk2imVAasmhY49g6ukdg2hGAZbnPP6RR9N1GikZl4EgpfF
	k9WHc3NAOzfnWFcHO/+RkQCiOKl49XQSzAzt0ZFpS064Pi3lO1HO262VOWGwJl768N1O75RbGB0Cd
	kBBXZMVmmonKgpyOdcr/oqQQDDI6NU3+ISgN1a32lv13JqV1ZmFFb9PlXevlSFhNZfbwtIa03+/S3
	J2v/C1Fj116/NAhL/uFuk3ysn6jWzzG8Ms5pmQ0czfEgyCSxAEzscXf7mhW9H5PgI9wea6mJmXLrP
	CIq/+qU0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYK9W-008z0O-N8; Mon, 19 Apr 2021 03:00:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYK9U-008z06-Qs
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 03:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=0ThBpnwWoPVWvE2DF7VhPkwbAduryk3lzAPrQSOnN+g=; b=YwzoYurofo01saofApqnVR2VCE
 nKgurJLlnsNKWnrJZ42hkp4kKGWK82yNSF56KFAK+2nsWSZGN95z02b5AKpi5+H6FNgvS9CV75Lv/
 gM3K30g1kfw+0Ae0IQZR2FotKQqWeZTMT1urFLAPODE6d9NbNRpEzRGMPv5iId6zi2VCC26lN1aVv
 wMWqtWlOL/rHrIHjFM4UCXs9P3N4f8ikU9ReihkdFjTWUdmIpxg+9gLyG++0FLMmndqUYh9UQXIlK
 tPzSRwdj7XrYNbQfgEyLaDk7quA77QzPnE7i02TQeLwCy8W8PZgjVeNuaf5tihz/s0E/OCq6iJ7zb
 R0QewB/A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYK9P-00AuCj-I5
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 03:00:42 +0000
X-UUID: 5ab19c8a331542b986e0ab05e7d10c0f-20210418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0ThBpnwWoPVWvE2DF7VhPkwbAduryk3lzAPrQSOnN+g=; 
 b=reb8P9XlWTxVnd8xwc9Tfa5skyuyYGFHZ8ZAWZ4tLqgSNppVF6jGvAKI74WSdO0ylch3C1FsHsW9mtsRraIJgmLI7QXjDHjnwMWlOzZy8ttLKh5Xjflk5zoI2N7t9fFfpl+JukUu6YJ96MMTwKk0USk8X/qamrCMmBo/n6BLK50=;
X-UUID: 5ab19c8a331542b986e0ab05e7d10c0f-20210418
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 212919809; Sun, 18 Apr 2021 20:00:34 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 20:00:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 11:00:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 11:00:30 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/6] mt76: mt7921: move mt7921_dma_reset in dma.c
Date: Mon, 19 Apr 2021 11:00:29 +0800
Message-ID: <1618801229-19920-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YHxinpO6Ev8qbbuf@lore-desk--annotate>
References: <YHxinpO6Ev8qbbuf@lore-desk--annotate>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 58BC0734E34B78BD1E36A79DC5C6911FDFD905B0E3E532FC6B0169310711979B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_200041_027015_1B70D3C6 
X-CRM114-Status: GOOD (  11.31  )
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

>> From: Lorenzo Bianconi <lorenzo@kernel.org>
>>
>> Move mt7921_dma_reset routine in dma.c and make mt7921_dma_prefetch
>> static. Moreover add force parameter to mt7921_dma_reset signature.
>> This is a preliminary patch to reset dma mt7921_mcu_drv_pmctrl.
>>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> ---
>>  .../net/wireless/mediatek/mt76/mt7921/dma.c   | 71 +++++++++++++++++++
>>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 66 +----------------
>>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
>>  3 files changed, 73 insertions(+), 66 deletions(-)
>
>Hi Sean,
>
>I have just posted a preliminary series mandatory to enable deep sleep on mt7921.
>I can post my patches of this seires (the one you posted) on top of it, or if you prefer, can you please repost on top of my new series?

Thanks, I can post the series again rebased on the top of yours.

>
>Regards,
>Lorenzo
>
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> index 992faf82ad09..f8815aa247eb 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> @@ -206,6 +206,77 @@ static int mt7921_dmashdl_disabled(struct mt7921_dev *dev)
>>	return 0;
>
<snip>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
