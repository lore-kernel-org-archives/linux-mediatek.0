Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49EAC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 21:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOGcPA3QdP6JT1Ctrgn7m17J9k80xVbhkzfpzJA/dmA=; b=e1b2SgyhrPVrZIEFG3rVZ1lKZf
	9BN32y61bfKur4N9pvUEgYisXkeHEFw8LV43ktMDoGnL2lu0ns9DTb/4ZA/2bKs/XRcVQABYsDO4v
	vPKfjlhxMRpbCcFxTeWniAy1jYtGqAELGo6iSPTd7qxbAe/P2eJQxE9o82hQjVqSpFIV0jHjSRt9d
	ntO421BVVb8Tkq3HSBi7S/6GYGTCJH+JrIH+WGZk6iYBBVMY11dvk4WeXsoT3M21u1x13nfbvfQg+
	1Hv9xvWc/uE4r2W8BuMw8gDz4uz0HUjyJVGD8Y0D/uwLAp5aNhlmynP4p9YUzfNbNaXJH+0u3T+AA
	++NXF6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDuOz-00Czwp-Cd; Tue, 19 Jul 2022 21:05:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDuOw-00Czs3-Go
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 21:05:07 +0000
X-UUID: faa3b0332c1a482e804fbe4f902c34cd-20220719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5952276d-e8dc-44a4-8163-bb5ed518a215,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:0f94e32,CLOUDID:2aa06933-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: faa3b0332c1a482e804fbe4f902c34cd-20220719
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2064267540; Tue, 19 Jul 2022 14:04:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 20 Jul 2022 04:44:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 20 Jul 2022 04:44:54 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <jemele@google.com>, <abhishekpandit@google.com>,
	<shawnku@google.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/4] mt76: mt7921e: fix race issue between reset and suspend/resume
Date: Wed, 20 Jul 2022 04:44:53 +0800
Message-ID: <1658263493-14498-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YtXZwKyAh/MZ73rf@lore-desk--annotate>
References: <YtXZwKyAh/MZ73rf@lore-desk--annotate>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_140506_589251_95FD5BF4 
X-CRM114-Status: GOOD (  11.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> It is unexpected that the reset work is running simultaneously with
>> the suspend or resume context and it is possible that reset work is

<snip>

>> @@ -363,6 +363,7 @@ static int mt7921_pci_suspend(struct device *device)
>>	int i, err;
>>
>>	pm->suspended = true;
>> +	cancel_work_sync(&dev->reset_work);
>
>should we just wait for the reset to complete here instead of cancelling? (e.g. flush_work)
>

yes, that seemed look better to me. It would wait until the queued reset request finishes.

>Regards,
>Lorenzo
>
>>	cancel_delayed_work_sync(&pm->ps_work);
>>	cancel_work_sync(&pm->wake_work);
>>
>> @@ -424,6 +425,9 @@ static int mt7921_pci_suspend(struct device
>> *device)
>>  restore_suspend:
>>	pm->suspended = false;
>>
>> +	if (err < 0)
>> +		mt7921_reset(&dev->mt76);
>> +
>>	return err;
>>  }
>>
>> @@ -437,7 +441,7 @@ static int mt7921_pci_resume(struct device
>> *device)
>>
>>	err = mt7921_mcu_drv_pmctrl(dev);
>>	if (err < 0)
>> -		return err;
>> +		goto failed;
>>
>>	mt7921_wpdma_reinit_cond(dev);
>>
>> @@ -467,11 +471,12 @@ static int mt7921_pci_resume(struct device *device)
>>		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
>>
>>	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
>> -	if (err)
>> -		return err;
>> -
>> +failed:
>>	pm->suspended = false;
>>
>> +	if (err < 0)
>> +		mt7921_reset(&dev->mt76);
>> +
>>	return err;
>>  }
>>
>> --
>> 2.25.1
>>
>
>

