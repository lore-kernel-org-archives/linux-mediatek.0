Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791CCC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 22:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl1E9BfZvZYbpsQIOv96jlcFLSCW7GEBBalRGY9gfl4=; b=BTuGnlBgG57fhukBiL3NyuJMZj
	AKS/sGEM4+GeKB6rF3n/dm6fOfOPJW2zcxBeA3IbAafzz3zvXfb0hlDpIs7Z53yEXIik+4jBGi++v
	rnWHD0coaio+4+ndhHYWZ6J1lIx8ZJ8dM7UdyJBFCbS1L74Iclgn/NWJsvLz5K15qY7LolJ4gbrHi
	WcdXK1rn5MAopIQ5sil8ltVhRotOoS9tezjdhypSzkeCu8Ol6CRzB+gmS3unJp9ZKYvNQlQPmwPMJ
	ftq77gkf+W66EhPvxetTMhmh6N3akw93tJOUfpSqJ5yQWnCCxZrVquToJ/mqVNy0X9aKwXGfjBUqx
	c6ldMjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofq6W-00BKKa-RV; Tue, 04 Oct 2022 22:09:32 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofq6M-00BKJh-08; Tue, 04 Oct 2022 22:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664921362; x=1696457362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tl1E9BfZvZYbpsQIOv96jlcFLSCW7GEBBalRGY9gfl4=;
  b=tGo+MeGmndW/G6BHLd4M3DlFhy0Pr35qgTZMMTnQmFCuI1O0WbUyuDRS
   LOLvhYSwGPNLqopm+wfo+/FIcPnbnP+y/fITTPI6j571yFJJmJppQtPHo
   Y7kvIwPOXsYR0vkfadMaO8lAZjWeqpTnyo66tVFQr8/AUsc1nTXUTyv+0
   k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Oct 2022 15:09:16 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 15:09:14 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 4 Oct 2022 15:09:14 -0700
Date: Tue, 4 Oct 2022 15:09:14 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: Bart Van Assche <bvanassche@acm.org>
CC: <mani@kernel.org>, <quic_nguyenb@quicinc.com>,
	<quic_xiaosenh@quicinc.com>, <quic_cang@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
	<quic_richardp@quicinc.com>, <stanley.chu@mediatek.com>,
	<adrian.hunter@intel.com>, <avri.altman@wdc.com>, <beanhuo@micron.com>,
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Jinyoung Choi
	<j-young.choi@samsung.com>, Kiwoong Kim <kwmad.kim@samsung.com>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 01/16] ufs: core: Probe for ext_iid support
Message-ID: <20221004220913.GC25671@asutoshd-linux1.qualcomm.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <ff7cdcdef82f6c9d709e2b6ed5d91e255327b780.1663894792.git.quic_asutoshd@quicinc.com>
 <2f5a8742-b25d-d6b3-c6a4-1c119a94d569@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2f5a8742-b25d-d6b3-c6a4-1c119a94d569@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_150922_099124_9D674401 
X-CRM114-Status: UNSURE (   6.54  )
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

On Fri, Sep 30 2022 at 11:23 -0700, Bart Van Assche wrote:
>On 9/22/22 18:05, Asutosh Das wrote:
>>+	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
>
>What value is reported when reading the REG_MCQCAP register on an 
>UFSHCI 3.0 controller? -1 or 0?
>
It reads 0.


