Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98126ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxH0OAbVbF8ycLTM4t+gjA7Q9pGz9lgX7RdhQzUrskA=; b=ji0ySsPOuvR5Wvwq3IQ85up1BM
	NM9JrkDEQH90unkkT5mQFKyFWF4HUVoXvr68jFRyo+oxGcsWIGpo82/OVpngS485kcufho2V8oKp5
	jzLrM5Q13MTK2keW8gcGsT4NQbwAaqHWqNA7RRXCYQU3TUd5fuAp5xUtnPBsU9l8ap9eXsQgSW3PH
	ai6pGsT8BN0Yi3Zqd7wje03vNHWj3T7GFU29SxhKHYEuGuzeuRefF92XTG/O02qgarSSazsUshVv1
	6hME1Q9Bzytqk9zVyPZ2Mc0QYAsy9+LznECtnjM5+0jcf9AIgMO1cQgXfsl/Tjky4JP8GPASnhCXT
	GX5jp2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ8n-00Cgtm-KQ; Mon, 19 Sep 2022 15:57:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ0p-00CdkR-Tz
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 15:48:50 +0000
X-UUID: 47aaa482492a4fef90053a4310aa8950-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=oxH0OAbVbF8ycLTM4t+gjA7Q9pGz9lgX7RdhQzUrskA=;
	b=GfL1A4iEZFAGSoH7xM8W7ilaskz0rHva6FTvYCmSt6Y/Y8YhkE2UtRez3/G4ITDEeov1rR9EB9sFwCjLOq5eHeQH0F6HCR8OF02DLFFzoiAm0gMkXvoaFwViWcmDqobGAe/q36qB0DMDY3Z6zVgXOuRa5XDFqDpqSKBR4xUxIbI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:7c7ae4ec-2337-4b21-9743-b55ed4948292,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e86ceaf6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 47aaa482492a4fef90053a4310aa8950-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1798762892; Mon, 19 Sep 2022 08:48:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 22:48:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 22:47:59 +0800
Message-ID: <647e3423-94dc-f2c6-0fad-7896e709f291@mediatek.com>
Date: Mon, 19 Sep 2022 22:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] ufs: core: bypass get rpm when err handling with
 pm_op_in_progress
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220915115858.7642-1-peter.wang@mediatek.com>
 <4fadab02-5ab7-03d5-e849-55eaa26113cf@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
In-Reply-To: <4fadab02-5ab7-03d5-e849-55eaa26113cf@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_084848_017112_591BDE7D 
X-CRM114-Status: GOOD (  18.58  )
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


On 9/17/22 05:39, Bart Van Assche wrote:
> On 9/15/22 04:58, peter.wang@mediatek.com wrote:
>> -static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>> +static void ufshcd_err_handling_prepare(struct ufs_hba *hba, bool 
>> *rpm_put)
>>   {
>> -    ufshcd_rpm_get_sync(hba);
>> +    if (!hba->pm_op_in_progress) {
>> +        ufshcd_rpm_get_sync(hba);
>> +        *rpm_put = true;
>> +    }
>> +
>
> Hi Peter,
>
> I don't think that this patch is sufficient. If 
> ufshcd_err_handling_prepare() is called by the host reset handler 
> (ufshcd_eh_host_reset_handler()) then the host state will be 
> SHOST_RECOVERY. In that state SCSI command submission will hang and 
> hence any ufshcd_rpm_get_sync() call will hang.
>
> How about removing the ufshcd_rpm_get_sync() call from 
> ufshcd_err_handling_prepare() and the ufshcd_rpm_put() call from 
> ufshcd_err_handling_unprepare()? It is guaranteed that no commands are 
> in progress for a runtime suspended LUN so the code for aborting 
> pending requests in the UFS error handler will be skipped anyway if it 
> is invoked for a runtime suspended device.
>
> Thanks,
>
> Bart.

Hi Bart,

If the scsi error happened and need do ufshcd_eh_host_reset_handler, the 
rpm state should in RPM_ACTIVE.
Because scsi need wakeup suspended LUN, and send command to LUN then get 
error, right?
So, ufshcd_rpm_get_sync should not hang in this case.

If remove ufshcd_rpm_get_sync directly, think about this case.
ufshcd_err_handler is on going and try to abort some task (which may get 
stuck and timeout too).
Then rpm count down try to suspend. Finally runtime suspend callback may 
return IO error and IO hang.

Thanks.
Peter



