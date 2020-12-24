Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32887C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 02:21:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A86122571
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 02:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A86122571
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MSZx1d5bqKGgr9yCYP2o+5e04U2/mem6lZbT2bre/IQ=; b=Afc5kqYjEGdvqaymefJIR3hse
	6BxsxT3/tPGJodS0/+nNqLUxZYyEKxAr7gBhpeKCDm/nli/3TPUEThhscw6nCeFKI7VPL5Ik095Xc
	U3ikY5by8g/mrT6bVrnO5nbT0vncNq/fCAqVPiZrqhD8ivIK2PIV0ut8kscCiB+Xytq2ZR/0ym6rm
	7wQW7lITULLYv8//KMsqe4BKAc491V37xCZqrqgiW11Rmo+LJX6+DIMtF2O0B8N9Ehh+GXdnVMLyy
	J8q5tFiusPa8jh1n76FXJuQMjlZafEtrLYDwPDXvUYjqXOf16wDtPVbgbY/4WvXFPyaz1l04CFTfR
	Zdj/vFCxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksGFg-0001C3-71; Thu, 24 Dec 2020 02:21:16 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksGFc-0001BX-78
 for linux-mediatek@lists.infradead.org; Thu, 24 Dec 2020 02:21:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608776471; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=S8nLSphtgRIthcWd+DqYiMxGoyZFuv5gfG0AMVjl8Ic=;
 b=XGGkKNSWyGz9q72DlS2hj0tzIy0JtJueAbRZOe51HYWK4Qqs7Zm8oaO9prnpSkwCdW6+8otH
 vRm3A+P5IoxM0OmRnMnlIyWIbJpUkUhpWmOftMXtZLBzutCDfgYMz1eaRhQJ4i4w5FZHuSS9
 L6dLMFL1g/3shKbV1k0TzG6Xvww=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fe3fb16da4719818887cd4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Dec 2020 02:21:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49CDCC433CA; Thu, 24 Dec 2020 02:21:10 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B8B6C433C6;
 Thu, 24 Dec 2020 02:21:09 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 24 Dec 2020 10:21:09 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
In-Reply-To: <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
Message-ID: <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_212112_391442_C6ED0270 
X-CRM114-Status: GOOD (  16.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-23 12:41, Can Guo wrote:
> On 2020-12-23 12:19, Stanley Chu wrote:
>> Hi Can,
>> 
>> On Tue, 2020-12-22 at 19:34 +0800, Can Guo wrote:
>>> On 2020-12-22 15:29, Stanley Chu wrote:
>>> > Flush during hibern8 is sufficient on MediaTek platforms, thus
>>> > enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip enabling
>>> > fWriteBoosterBufferFlush during WriteBooster initialization.
>>> >
>>> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
>>> > ---
>>> >  drivers/scsi/ufs/ufs-mediatek.c | 1 +
>>> >  1 file changed, 1 insertion(+)
>>> >
>>> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
>>> > b/drivers/scsi/ufs/ufs-mediatek.c
>>> > index 80618af7c872..c55202b92a43 100644
>>> > --- a/drivers/scsi/ufs/ufs-mediatek.c
>>> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
>>> > @@ -661,6 +661,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>>> >
>>> >  	/* Enable WriteBooster */
>>> >  	hba->caps |= UFSHCD_CAP_WB_EN;
>>> > +	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
>>> >  	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
>>> >
>>> >  	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
>>> 
>>> I guess we need it too...
>> 
>> AHHA, if you decide to add this in your platform too later, maybe we
>> could change the way it does: Keep manual flush disabled by default 
>> and
>> remove this quirk.
>> 
> 
> Yeah... I will get back with an answer later.

Hi Stanley,

Do you see any substantial benefit of having fWriteBoosterBufferFlushEn 
disabled?

Thanks,
Can Guo.

> 
> Thanks,
> 
> Can Guo.
> 
>> Thanks,
>> Stanley Chu
>>> 
>>> Change LGTM.
>>> 
>>> Regards,
>>> 
>>> Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
