Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7D7C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LETYOcqMKmRIW5Ml2aZbCyaGwXdd/RSeSDnvMQtfO8o=; b=0dI+O9WzpJYWjAIraAQNp8S9if
	8wWHk+BlawIQ6XiLNuqGsBoq+f5tWwHKMGuASazVvras2MrkRTVD55SeZFn1BAD9WNSkqy+rin9mh
	TG3Ugk8ZywZQMUwdR/4trDKYRW8yR5pOLXl0zO6/Vty9R+jEHTMCV9ZDRcpxtVAY/FwZKwI8iHICd
	6X9PpSeX5MniwySTIcqCACogq1yjsMvwhXWNdfei5Umnn7dH4Dee69iS4E51zQVlmmPgsMyWpHrKw
	OPyWEUGRv/J7UAAoNk+euZY1u+LwJQ7xH/s02bE0YC78b2n2XbSmC85cyHJBMqZlNZHbex2z6OrL5
	A2/5/rHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIKf-005EKH-5U; Mon, 03 Oct 2022 10:05:53 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIKc-005EIw-9f
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 10:05:51 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2936CClu000542;
	Mon, 3 Oct 2022 05:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=LETYOcqMKmRIW5Ml2aZbCyaGwXdd/RSeSDnvMQtfO8o=;
 b=d29Haa3coy1kvCdXdTF6J396Y4w4bfimGRckt+hDp4P3cvECt5RAIPdi994XWwBYBr8o
 HzmFXJ4Cszcu/77Ndb35ihVrV2HPGv7/puwUTpxtBgj66R/vfc7cHILVSRkEIuWIGtFU
 FnAKZYJQut+y/81mRWLBuJhT3VMB6i5qo3o81Xgs+SQjEKqqmL9nI66DL+cK6WBriHUU
 Xtb0PBdIuDbB5IwGulY9OB/6jA6B2j4uCnQkhMspqMjz9EhK2khu3hcY9DOXdcifTdDX
 1qY5jiZQ1kJ5Fg98Onl58eEiarZxJbpVCMdwbyLyRIOgIIwE5nfyFsjdla3F08XpMAHx IA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jxhyq21m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 05:05:29 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:05:27 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via Frontend
 Transport; Mon, 3 Oct 2022 05:05:27 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5E4AA475;
	Mon,  3 Oct 2022 10:05:19 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:05:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <matthias.bgg@gmail.com>,
        <ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>,
        <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 -next 2/4] ASoC: wm5110: Fix PM disable depth
 imbalance in wm5110_probe
Message-ID: <20221003100519.GW92394@ediswmail.ad.cirrus.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-3-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Jj6B02k2pl_94dotnCNhMQNlthfawMH2
X-Proofpoint-ORIG-GUID: Jj6B02k2pl_94dotnCNhMQNlthfawMH2
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_030550_474343_FE512B2A 
X-CRM114-Status: GOOD (  11.99  )
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

On Thu, Sep 29, 2022 at 11:06:51PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_enable when error returns.
> 
> Fixes:5c6af635fd772 ("ASoC: wm5110: Add audio CODEC driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - call pm_runtime_disable when error returns.
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

