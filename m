Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B987FC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RupT8e3l6c7V6ux+6h3Z+mdWvwvDjI3AX/lrgrv6+Wk=; b=WioN+05qK5UU8EcyXezEdyIHZ9
	xRj+BUcl7Bb3B2BJwbLGO9jPs9vu0HIylAe+k7cMGGsQ0M/Fhu7oelNgHDMT+6rBhj+ThEemIABaf
	JX2DIZmp8zYF/5YIK7IdU8uOSLKjtOFiNgDlPOohZbD7+/yjuU7DcaUWT03gTRrrP0V3ps+3Gcw+C
	7DPCKQKY8vZ2qE184jbsxLAofzKNVoDig2qQAt8uLcNz0h6h0IHqxAUfghh7Kb7yWZp+hiyS5EatG
	AbXs9D3Um40/DS+5+L1WUcWGHwj6UU/ITKc1O37whY+sawcfFhVK6Uv4P17gmePh1l64kKUXH7i7B
	YtFLn6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaStE-00HFVx-Nr; Tue, 20 Sep 2022 02:21:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSt9-00HFTi-F0
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 02:21:34 +0000
X-UUID: 61f855192869408e83e405f575308ba0-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=RupT8e3l6c7V6ux+6h3Z+mdWvwvDjI3AX/lrgrv6+Wk=;
	b=SYmOfzkr2IG8wnMtzPbNrKk8jTW1K87z+Kg34sES6RO/61qKN7vFLDeiJBUNj6V2E6/fuuVFyUPIi95eXnOvSYcFwjt47LGyB+oE1rcQeAOaYUYW4He3GcK9/1WjJBVjoFd/xsGvFKLBHOi8P9fZgPDp6KPOEkDRYKnTGUTei/c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:99f26614-1998-4761-b9c9-292ebc396ec3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:11125870-dafa-4a42-b716-cf2cd4845592,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 61f855192869408e83e405f575308ba0-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1823152536; Mon, 19 Sep 2022 19:21:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 10:00:49 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 10:00:48 +0800
Message-ID: <aec67382-d9d4-052a-50c4-574cf5c4a501@mediatek.com>
Date: Tue, 20 Sep 2022 10:00:48 +0800
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
 <647e3423-94dc-f2c6-0fad-7896e709f291@mediatek.com>
 <4acf4f39-f6f8-6b65-2bc6-a4c5225d9a04@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
In-Reply-To: <4acf4f39-f6f8-6b65-2bc6-a4c5225d9a04@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_192132_978396_910E6AC3 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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


On 9/20/22 00:25, Bart Van Assche wrote:
> On 9/19/22 07:47, Peter Wang wrote:
>> If the scsi error happened and need do ufshcd_eh_host_reset_handler, 
>> the rpm state should in RPM_ACTIVE.
>> Because scsi need wakeup suspended LUN, and send command to LUN then 
>> get error, right?
>
> The following sequence may activate the SCSI error handler while the 
> RPM state is RPM_RESUMING:
> * The RPM state is RPM_SUSPENDED.
> * The RPM state is changed into RPM_RESUMING and ufshcd_wl_resume() is 
> called.
> * ufshcd_set_dev_pwr_mode() calls scsi_execute() and the START STOP 
> UNIT command times out.
> * Because of this timeout the SCSI error handler is activated.

This case will not get rpm, because pm_op_in_progress is true.

So it won't hang with ufshcd_rpm_get_sync.


Thanks

Peter



