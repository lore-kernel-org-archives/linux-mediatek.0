Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4454BC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lP3gb32IvITXLWNmpX0ClEDnCrbaN6MVvs7RH/D3wBk=; b=b7Ddz9ZJlTt4s3
	6NsWqW06MG6gg+rGis1zp9vuXdd/jGaGpiwSE51+IUuSDLkJJQRg7GZi0hnflcFyc/8yFjgFGDa6c
	tGUWabln6c8i+gkiUFq+l/71mb3qhJlTPz4IyoT8pmDCRLlMjUbyio8Ut9Hkif5yghoKleyIgjrs0
	Tw4erauEb/gg7ji5mR4sqljgmrVkmxxJCV1wYpCAZgzdTyygz9WBp4WOuNfYyxHg2HwJCF1zKHWIX
	rbxqTIc5U5/5mBlW7bTBCJF+cZfwQI3Zl6Dn0P+T9pSrLdy2IPCjsavucYQE9dDrvIyVJokBoYLJf
	SfKS1J7eHeYQF+RHhB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12lh-008gg9-7i; Tue, 14 Jun 2022 09:23:25 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12eY-008csw-Sb
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 09:16:07 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8EEoR024961;
	Tue, 14 Jun 2022 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=hGaw1xpIdCRzMGGJr+AjwkBfT2/8u311FkS5dHtbvyc=;
 b=jc2xlFdBKEffU1+ETM/D+dwgICc4/YvL113PC2Qx2JPrKi+3fJ62DNmX7titImY3CioW
 Ubp94ZqDHNYjZBXsgSdq8sUNtpBop1DXrNFqA+fY5UAz2G+M6BQkhaTailYQj8j2dp2K
 WVz2NB5SK/DNyX4mI3kxU8maV8rhVs5+oywWQSP6HowEMBs0/StfZCsQsNfVvNQ3HZRf
 5pXwUPRkwE88+lAYvMO3WZoNBBEZLEE/31xik4A/uuJCrVC7jsb15chv0OFa4RdpTJe/
 xYhjNg1c/7H1P48iMh3rsC2k71aGQ2tCDdUoBYDNk/b1Id01S0wl0MELvmEE4R0txMpD /A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf32w2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Jun 2022 04:15:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 14 Jun
 2022 10:15:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 14 Jun 2022 10:15:48 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 089CD458;
	Tue, 14 Jun 2022 09:15:48 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:15:48 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Samuel Holland <samuel@sholland.org>
CC: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <wens@csie.org>,
        <jernej.skrabec@gmail.com>, <linux-mediatek@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock
 specifiers
Message-ID: <20220614091548.GC38351@ediswmail.ad.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
 <9e105410-94d5-1801-8919-af8c0cef4de1@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e105410-94d5-1801-8919-af8c0cef4de1@sholland.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: uhUugW3zc5bftMo1ASxJcy0Ldlvdyx22
X-Proofpoint-ORIG-GUID: uhUugW3zc5bftMo1ASxJcy0Ldlvdyx22
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_021603_045096_BFB590CE 
X-CRM114-Status: GOOD (  18.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 14, 2022 at 01:39:20AM -0500, Samuel Holland wrote:
> Hi Charles,
> 
> On 6/13/22 11:15 AM, Charles Keepax wrote:
> > Recent updates accidentally updated the clock producer/consumer
> > specifiers on this device as part of refactoring the CPU side of the DAI
> > links. However, this device sits on the CODEC side and shouldn't have
> > been updated. Partially revert the changes keeping the switch to the new
> > clock terminology but going back to the CODEC defines.
> > 
> > Fixes: 7cc3965fde74 ("ASoC: sunxi: Update to use set_fmt_new callback")
> > Reported-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Tested-by: Samuel Holland <samuel@sholland.org>
> 
> Thanks for the quick follow-up, and sorry for the confusion my earlier comment
> caused. I verified that sound is broken (loud static) on a Pine A64-LTS board
> with for-next, and is fixed by this patch.

Not at all man, thank you for spotting my foolish mistake. Glad
we got it fixed up for you, and thank you for testing it.

Thanks,
Charles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
