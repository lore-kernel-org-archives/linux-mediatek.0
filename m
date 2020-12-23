Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C31AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 04:41:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99EDC2168B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 04:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99EDC2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r3WjydjL3oL/Ju5qCH9DqMwpFXHCMnyBGLlKrIll6us=; b=zpmzlSzcfXFLX7ZyEZqdMumV/
	b1X2EiIDa1HQHGODn0yYMw5a2+IfsEutbebcVNnzrDWh1PolxEc74RKL/6cNUF26GzbOD2uDMYl0b
	ENcS7GntLAVNbMBQMzSKlZ3OmDbIWqAoQRmk9E7ttV+p0pii5ZZ8tRQoR8Yq8lzZJVtvf+pqPFCHK
	1UcWlMaWIL13h/5P5dh+PO6gvoCACiFLlOnClVQ+W4I9mdU/sLJUmW38SbqIUTyf6IN673osLOuJA
	3L2ZB5FZzL6wiMCykCiE9cePt900XubojHbjVxdIYg1K/Ml7lHtN6jCB+Aog4egpyQnkf2KaNKURp
	uPsrzK0Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krvxi-0006jB-BL; Wed, 23 Dec 2020 04:41:22 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krvxe-0006ia-Aa
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 04:41:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608698479; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qLARzNaefrjwPVPDeA1xStKL6aHUM5wgUliEp6OdikY=;
 b=lNTlZOXRZQCJr+LzW7hlYYAlBkhWBfdQI+MKfarjQrQzIEFyl1PPiLtibvfchjOYLL3dyRAh
 1wSbwQFDgjrrGAThIIzIUd6tyoT0jpZtmbIa24FPxIPyCgNaNx+hgI33nth1bJRJK0lr8P6A
 1CAkH7kHtZRu09Ao0C2Xb21fUYM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fe2ca651d5c1fa4278bdf90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 04:41:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD590C433ED; Wed, 23 Dec 2020 04:41:09 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A4C5C433C6;
 Wed, 23 Dec 2020 04:41:08 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Dec 2020 12:41:08 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
In-Reply-To: <1608697172.14045.5.camel@mtkswgap22>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
Message-ID: <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_234119_707236_560ED6A7 
X-CRM114-Status: GOOD (  18.22  )
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

On 2020-12-23 12:19, Stanley Chu wrote:
> Hi Can,
> 
> On Tue, 2020-12-22 at 19:34 +0800, Can Guo wrote:
>> On 2020-12-22 15:29, Stanley Chu wrote:
>> > Flush during hibern8 is sufficient on MediaTek platforms, thus
>> > enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip enabling
>> > fWriteBoosterBufferFlush during WriteBooster initialization.
>> >
>> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
>> > ---
>> >  drivers/scsi/ufs/ufs-mediatek.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
>> > b/drivers/scsi/ufs/ufs-mediatek.c
>> > index 80618af7c872..c55202b92a43 100644
>> > --- a/drivers/scsi/ufs/ufs-mediatek.c
>> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
>> > @@ -661,6 +661,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>> >
>> >  	/* Enable WriteBooster */
>> >  	hba->caps |= UFSHCD_CAP_WB_EN;
>> > +	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
>> >  	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
>> >
>> >  	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
>> 
>> I guess we need it too...
> 
> AHHA, if you decide to add this in your platform too later, maybe we
> could change the way it does: Keep manual flush disabled by default and
> remove this quirk.
> 

Yeah... I will get back with an answer later.

Thanks,

Can Guo.

> Thanks,
> Stanley Chu
>> 
>> Change LGTM.
>> 
>> Regards,
>> 
>> Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
