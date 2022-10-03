Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8964C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GkMKwa4wMokBkGs+5Lle5e/G1YSm7WhGMCxCCqFiOk=; b=LBbsHPZQobmDb07xMzzZmk+7k7
	9Pvkfz8h6yJan+w7D/whZM191eQ1AkfiY4oWBCI5wQt58fkwo0qpxmO1hmKqz99daTtkAWZQMZPqE
	tr0DXTMj0j5dHPeViA01f/LKCg7Qwdl8Zn/4pN4O41mkA/o31QyBXnkz1yb0ygyEpw9yI5/s4x/Fd
	jgLr8BzCx6mXdp8bljN2DHTJyzqxYIRFbbXc+LWkgj5whddrj1pLqkE547hAj8zDqczIurc/k7TjK
	sVOvXD0jo9BtvMNlefd6TRGrOnbp7N6m9iLLxu+51S1MUNzP9oZZ2mAPT4JGNGtS1rTfnBo8NDacc
	0ozEarnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofS14-007VAR-PN; Mon, 03 Oct 2022 20:26:18 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofS0q-007V6G-Is; Mon, 03 Oct 2022 20:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664828764; x=1696364764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8GkMKwa4wMokBkGs+5Lle5e/G1YSm7WhGMCxCCqFiOk=;
  b=xzdl6YyY6Zrk57PtvXqnBlLP6COhQA4dGySUyWQW4NQDvRaSn1icuR15
   8ccS5LbKlBm7GFPkB6t4q3rLaju9eKmxc4IKskz0XQcCcQLe4GPkRFD+A
   G4VIiXYj2D2P/FIynLS9Cjw/wk/3TQDrEhorgdu+AMtl+7Gkh3eY2Waja
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Oct 2022 13:25:59 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:25:58 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 3 Oct 2022 13:25:57 -0700
Date: Mon, 3 Oct 2022 13:25:51 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
	<quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
	<quic_rampraka@quicinc.com>, <quic_richardp@quicinc.com>,
	<stanley.chu@mediatek.com>, <adrian.hunter@intel.com>, <bvanassche@acm.org>,
	<avri.altman@wdc.com>, <beanhuo@micron.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Kiwoong Kim <kwmad.kim@samsung.com>, "open
 list" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 07/16] ufs: core: mcq: Allocate memory for mcq mode
Message-ID: <20221003202551.GA25671@asutoshd-linux1.qualcomm.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <66d2f7b0794b4f95ad8db223408b710d7a5e2b8c.1663894792.git.quic_asutoshd@quicinc.com>
 <20220926154532.GH101994@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926154532.GH101994@thinkpad>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_132604_690099_AE8F893E 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, Sep 26 2022 at 08:46 -0700, Manivannan Sadhasivam wrote:
>On Thu, Sep 22, 2022 at 06:05:14PM -0700, Asutosh Das wrote:
>> To read the bqueuedepth, the device descriptor is fetched
>> in Single Doorbell Mode. This allocated memory may not be
>> enough for MCQ mode because the number of tags supported
>> in MCQ mode may be larger than in SDB mode.
>> Hence, release the memory allocated in SDB mode and allocate
>> memory for MCQ mode operation.
>> Defines the ufs hardware queue and Completion Queue Entry.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
>> ---
>>  drivers/ufs/core/ufs-mcq.c     | 59 ++++++++++++++++++++++++++++++++++++++++--
>>  drivers/ufs/core/ufshcd-priv.h |  1 +
>>  drivers/ufs/core/ufshcd.c      | 39 +++++++++++++++++++++++++---
>>  include/ufs/ufshcd.h           | 19 ++++++++++++++
>>  include/ufs/ufshci.h           | 21 +++++++++++++++
>>  5 files changed, 134 insertions(+), 5 deletions(-)
>>
[...]

>> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
>> index 6d16beb..f624682 100644
>> --- a/drivers/ufs/core/ufshcd-priv.h
>> +++ b/drivers/ufs/core/ufshcd-priv.h
>> @@ -52,6 +52,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
>>  void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
>>  int ufshcd_mcq_init(struct ufs_hba *hba);
>>  u32 ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
>> +int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
>>
>>  #define SD_ASCII_STD true
>>  #define SD_RAW false
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index a71b57e..5fc1e5e 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -3676,6 +3676,8 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
>>  		goto out;
>>  	}
>>
>> +	if (hba->utmrdl_base_addr)
>> +		goto skip_utmrdl;
>
>Is this change belongs to this patch?
>
Yes.
This change frees and reallocates the descriptor memory by calling
ufshcd_memory_alloc() if MCQ is supported and configured, see
ufshcd_config_mcq().
I will add a comment here.

-asd

>
>-- 
>மணிவண்ணன் சதாசிவம்

