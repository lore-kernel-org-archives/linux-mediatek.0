Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E9C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiWC72t5X6/y2SG3bHl14Tn6Tl6IUgel79YS7kEoldo=; b=09/dI7SOnoaNkx+QKsyIMll1bW
	SuIBWwAeJ4+DwQ12xeP3uDgmwXBwW8axc+7EuZyv1U5MEOVzinrs558tH19IjATQgctXLNiCvKmTS
	Ia4wE3KlMxDtHoJOjirxZbSd5VI1/3szNXAb70ODjOdkbLeoq1xySh5AQ1WDEsg6l9bV7hSYovOAq
	c/DonNM9st9iDH54fD/268COEFM6q9xzzJH3u/HM0YiuTLNAqaQs+e3mw9xJt74jGry3679Tj+zTO
	sykp+SIiAyeyfxaXRBFmBFzJiNEUMZjmTUaxIdUTCRpadp94zh5PvpL7rS95/T09R+GAo2bNsosuZ
	g2aSzlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZgw-008TGY-R1; Mon, 01 Aug 2022 17:58:59 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZgp-008T5L-Kl
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 17:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659376731; x=1690912731;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SiWC72t5X6/y2SG3bHl14Tn6Tl6IUgel79YS7kEoldo=;
  b=IIIo+ZR40pIRws2l18tZHRXzrBpbnck3LviN+zwNv51+946ERu93C5pq
   p/hTbCOsiQ5w/hCOdCb7bIgzYpmlUMUDMZLLpM103n/FUEk+U0T4kaxEA
   lvX13H0o09K2hKrieMg4OrjdTcmcoHoOZZiwtqFxEZJ6e4/DpekjqQiiJ
   g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Aug 2022 10:58:46 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 10:58:46 -0700
Received: from [10.46.161.58] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 1 Aug 2022
 10:58:45 -0700
Message-ID: <d492e8ab-5378-7e94-f457-936ff5411a28@quicinc.com>
Date: Mon, 1 Aug 2022 10:58:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
To: Bart Van Assche <bvanassche@acm.org>, Asutosh Das
	<asutoshd@codeaurora.org>
CC: Peter Wang <peter.wang@mediatek.com>, <martin.petersen@oracle.com>,
	<stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
 <ca760b93-e6e9-abea-f2b2-dbb0c592690b@mediatek.com>
 <dadc85ee-1252-38e8-a34f-3d1935f16b29@acm.org>
From: "Asutosh Das (asd)" <quic_asutoshd@quicinc.com>
In-Reply-To: <dadc85ee-1252-38e8-a34f-3d1935f16b29@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_105854_444665_0041CD6F 
X-CRM114-Status: GOOD (  12.55  )
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

Hello,

On 8/1/2022 9:43 AM, Bart Van Assche wrote:
> On 8/1/22 07:30, Peter Wang wrote:
>> Or, do you think we can direct remove ufshcd_wb_toggle in clock 
>> scaling and only let sysfs to control wb behavior?
> 
> I think it's worth asking the people who introduced this feature whether 
> it can be removed.
> 
> Hi Asutosh,
> 
> Commit 3d17b9b5ab11 ("scsi: ufs: Add write booster feature support") 
> introduced the following code in ufshcd_devfreq_scale():
> 
> +       /* Enable Write Booster if we have scaled up else disable it */
> +       up_write(&hba->clk_scaling_lock);
> +       ufshcd_wb_ctrl(hba, scale_up);
> +       down_write(&hba->clk_scaling_lock);
> 
> Would you mind if the code for enabling/disabling the WriteBooster is 
> removed again from ufshcd_devfreq_scale() and that a new mechanism is 
> introduced for controlling the WriteBooster mechanism?
> 
Qualcomm would need the load based toggling of WB during scaling.
What would the new mechanism be for controlling WB mechanism?

> Thanks,
> 
> Bart.


