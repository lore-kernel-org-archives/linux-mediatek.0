Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A269C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueQslRrv0xtGaVId8xAEBFWPVgtnW3Q1mwzpWlzeiJQ=; b=CfzYv3JGbByJiaIqrNV1zqwmhP
	hHYaFkGLj3g/qa/j/RxlTWYgPhgxLPKS4kdCBTAOb+uGJb6KWAu98/SeKpDWdPOawaiKW785Jc5jI
	mDivVc1LfIMHnWITnokjaV94wIjRHd6nPWZqWhb1dgDlYZxELbGyvMvZhDyscFCESHY79m6NYPw6r
	fI7zIaBwUkjWsq58hjOfUVQWY0raNFEwRARyFXjR6r5JlOVSGkIBT81qPbkXp+RBHlL2KDKHImhSs
	yAm53spy77eynnQ/sf0DbrelSO/sgc7PPx3jFXh8KeSPCpuNstp4VdUW7n3V8x+KAFL1HUk2I3mNs
	3R82BPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIKP-005EDy-A3; Mon, 03 Oct 2022 10:05:37 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIKM-005E9o-0j
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 10:05:36 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2933mftP015208;
	Mon, 3 Oct 2022 05:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ueQslRrv0xtGaVId8xAEBFWPVgtnW3Q1mwzpWlzeiJQ=;
 b=anYf/CBFOnG+DF10cSyYxmw7v6/qn4Umn43ORi8y9d1qfph96wcXaFzzzHsCw2lLQpdu
 zTH9DFZQymHQEwd7QGJT/JdQkaa1anVb+44MobnF81T/0Fl03ZLgYuoqijRJztAQqYU0
 e2BDkxH5A8zhfgkzD6QoriECHTDhWeNt9CSVW5dHfB+TYgdrIr1BB5kTe8GW1M5JGett
 SFMeTEdmm2Kbh/hjlCw+eUjtS0xJX0tET58jXXCcaMX0C+bz4TrNKRtyzRgmz30gWBhx
 V9fpmKQkbUwsLupPppxSzz1TAlCZ4O6vcMiXCdtEX1t8Q0l33lh5QjWyrer3uSxvewaM JQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jxjy321h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 05:05:08 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:05:06 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Mon, 3 Oct 2022 05:05:06 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 61FC8475;
	Mon,  3 Oct 2022 10:05:00 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:05:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <matthias.bgg@gmail.com>,
        <ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>,
        <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 -next 1/4] ASoC: wm8997: Fix PM disable depth
 imbalance in wm8997_probe
Message-ID: <20221003100500.GV92394@ediswmail.ad.cirrus.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-2-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-2-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: uJtWLhYPS0UUPJWIOZW8OPgmgRRWhBZN
X-Proofpoint-ORIG-GUID: uJtWLhYPS0UUPJWIOZW8OPgmgRRWhBZN
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_030534_106524_6FBFF4BD 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, Sep 29, 2022 at 11:06:50PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> Fixes:40843aea5a9bd ("ASoC: wm8997: Initial CODEC driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - call pm_runtime_disable when error returns
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

