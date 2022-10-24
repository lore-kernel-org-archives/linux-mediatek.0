Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36399ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jm8Z/STsh6ZtSXhL0p68t3mhS6r4bb6F/JkO48Wf2I=; b=ibAFxH/b94+iZbDebo7VwD6RsU
	AhLRC15EVP+sRkfw/xExCFYO4v2Q7/No7Ct3g3FCwh+10iLY3M6w6vCdM3sy2hxptXJcnAcwEU0kn
	TDAEXz/zWRd4EPToDBOAWuvAYKmAzRu0+mQkmxnr7/p6X5vGZH9iHzTKIefqngQoINv1eTN0/ewz5
	er+jyKNXEOn142usVpSvxjtK27KeqbiqHCCIDnZmra1JeD+0ViDsvDIS14xXFH1louy4ijWe+DTDg
	AoZsdtHFgslNv25V46unk94ghqLPUFzgDZMpXUcgWbw5cchvFCXrnmmtMzuVqbDJN6Ysf+aUWH5mw
	Xxp4eCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omzf9-002AT4-Ik; Mon, 24 Oct 2022 15:46:51 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omzcA-0029Bj-Ca
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 15:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666626226; x=1698162226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5jm8Z/STsh6ZtSXhL0p68t3mhS6r4bb6F/JkO48Wf2I=;
  b=xSxzBX1y7Inwp/5riIEp30nEfZrtL41eDSLWsWe7d0bOdAJ1YPUjcZTp
   frUsDGgmAp61KJNubgVOFL5I81TtKervG2G+DNoIqoa0N5IPGIdI5GIBb
   ybiQY9IDdHQ0aUbTR1lCSEwPwm0SeNU8nSNdN5GEISw5Ri8j6fseg21n3
   c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Oct 2022 08:43:41 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 08:43:41 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 08:43:40 -0700
Date: Mon, 24 Oct 2022 08:43:40 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <peter.wang@mediatek.com>
CC: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>, <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: print more evt history
Message-ID: <20221024154340.GC18511@asutoshd-linux1.qualcomm.com>
References: <20221024120602.30019-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221024120602.30019-1-peter.wang@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_084346_515820_D92D604E 
X-CRM114-Status: UNSURE (   6.93  )
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

On Mon, Oct 24 2022 at 06:11 -0700, peter.wang@mediatek.com wrote:
>From: Peter Wang <peter.wang@mediatek.com>
>
>Some error event is missing in ufshcd_print_evt_hist.
>Add print for this error event.
>
>Signed-off-by: Peter Wang <peter.wang@mediatek.com>
>---
> drivers/ufs/core/ufshcd.c | 3 +++
> 1 file changed, 3 insertions(+)
>
Reviewed-by: Asutosh Das <quic_asutoshd@quicinc.com>

>2.18.0
>

