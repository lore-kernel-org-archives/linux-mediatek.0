Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1moqP3A2bwl62SN56AGNJwGXJANlGVGyj/tqswbUkGI=; b=Oo0fsoVd4zrS3ApLfa/wkYQY9S
	LuCzmyO4aZ0+9ZrOU1cvPHklfVBiKapnyLxW0oEmQbwXCdYOMoTxbia+eHZjXovA/wkggYx9zBj+R
	gszIndy05gtzFaaJlpxioYvZXeqXUiOim1UgSSa3pJTNlOHi8OJBHOhkstrbj78O8r1DwCptw5Ij2
	QbHn805rjwlFgkR91/8CGmguRhZbYzLXTf8Trx/H8o3HkO3bTkjSXe2+l+1k2JMk8LvxlcJ3xBI1y
	8E5/1tbDPpIGWTGCPVY/BjmwbF9z59xxjiP6NqEvCpOlFLOA2mHVWb44KgtvQx1IVmEATW4v3Beoz
	3DZTjwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIKj-005EMa-TB; Mon, 03 Oct 2022 10:05:57 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIKh-005EL5-8T
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 10:05:56 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2934nZPn015297;
	Mon, 3 Oct 2022 05:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=1moqP3A2bwl62SN56AGNJwGXJANlGVGyj/tqswbUkGI=;
 b=AvAOIc/HF35V3MGOYWM31SvHmh3FhOKU3OrtaD3/zE92voFS1mtXC/VAdvJJ2xuIXTc5
 7UzRhvniyAgrv3aq28cN1vFd+NLO6LfiYHcB9iWoB/9cYV84XJ2KtjKL++kvqHG+WMcf
 wdkHDiizPoIF9AhNiTPi+/nE+QiHO6ffK0EheBm+pDm0kp0e6zuaajn1GIeX1Rz5QszB
 Vql13YUPNc89r+mQDW3Q/iItOC9ijoRASZIhckDiOvMtDPxIytoJsnCkYEt1/Jhhoy6f
 TxdLO4GY1lVa1um9nCE2RFYVlefn8/g7hZhYCtYbIv9cEryqlkkjwSfxgY5qSkgVsqzQ mA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jxjy321hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 05:05:41 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:05:39 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via Frontend
 Transport; Mon, 3 Oct 2022 05:05:39 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CB8B3475;
	Mon,  3 Oct 2022 10:05:39 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:05:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <matthias.bgg@gmail.com>,
        <ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>,
        <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 -next 3/4] ASoC: wm5102: Fix PM disable depth
 imbalance in wm5102_probe
Message-ID: <20221003100539.GX92394@ediswmail.ad.cirrus.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-4-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-4-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: AATgxrvH0syWluTFEonSgN-vMsR87xO8
X-Proofpoint-ORIG-GUID: AATgxrvH0syWluTFEonSgN-vMsR87xO8
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_030555_328057_D8815EB4 
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

On Thu, Sep 29, 2022 at 11:06:52PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> Fixes:93e8791dd34ca ("ASoC: wm5102: Initial driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - call pm_runtime_disable when error returns
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

