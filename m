Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5734EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 04:20:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A4A20773
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 04:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A4A20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=equPW7YFh2DfrI6JjzN2MyzQa87MEEd2bjxZnkClBu4=; b=NDcUIxGYPyt17X+ru3Htg7nDC
	0OY02ricfYM3m/lAY5uJsfalumSOffaf6zqknw7DMmLuNthkvWwlRwn+rY6nsM/aB0Q9OWDLDh9lT
	YIFbLqNjC/QaLoxPyGFr2IYaf4SYXgmx7uvPyqSi+TWng6awKynLyJfwYTq4UDveur6GaVedea3vx
	8b+qz35OST/EEs7yDTCdemm3mVc2AJrIS138uEgoOc2w9XvPoSoOyXDY1xB5nIIQ0SjMGfB/UYtUG
	PU/aLMbYrHUMDr0ZAsibkO+bkYmfTZ8Qkpu3wSrz9+GSb9VA0QzzfztAGIGGclruCmgA1Xkj/+Lbh
	Y5X34t9Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krvct-0004Nv-63; Wed, 23 Dec 2020 04:19:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krvcp-0004Ma-5v; Wed, 23 Dec 2020 04:19:48 +0000
X-UUID: 48dca0e8e4ea4fc5b22eaed74958d5a4-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kYN1DWi9igwrEB93WIlp6S0R6r48fxzlcC3ib2X5TZs=; 
 b=h2OV6eEjoq7IrpJwqNcUEL+asBwoEMeqWtsr5MSASGZh5cjNnof0TSvWoOkySwJNAcSLpv8DCr1G9zVFnHm6qJ6fY+npASbLzMa9zRi3QBRoG3vrvqul/tiyRVfZf/zA1S76UENintfX09mT+VMr7ubWjNxcxY1BJiRN1nSZKNs=;
X-UUID: 48dca0e8e4ea4fc5b22eaed74958d5a4-20201222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 369159349; Tue, 22 Dec 2020 20:19:42 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 20:19:40 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 12:19:32 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 12:19:32 +0800
Message-ID: <1608697172.14045.5.camel@mtkswgap22>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Wed, 23 Dec 2020 12:19:32 +0800
In-Reply-To: <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A1C1952DF2610A7DE2CA026817120AE71FBD8C43C672D8A99274B3DC4ECF07F02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_231947_430382_1F19D421 
X-CRM114-Status: GOOD (  17.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Tue, 2020-12-22 at 19:34 +0800, Can Guo wrote:
> On 2020-12-22 15:29, Stanley Chu wrote:
> > Flush during hibern8 is sufficient on MediaTek platforms, thus
> > enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip enabling
> > fWriteBoosterBufferFlush during WriteBooster initialization.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c 
> > b/drivers/scsi/ufs/ufs-mediatek.c
> > index 80618af7c872..c55202b92a43 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -661,6 +661,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
> > 
> >  	/* Enable WriteBooster */
> >  	hba->caps |= UFSHCD_CAP_WB_EN;
> > +	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
> >  	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
> > 
> >  	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
> 
> I guess we need it too...

AHHA, if you decide to add this in your platform too later, maybe we
could change the way it does: Keep manual flush disabled by default and
remove this quirk.

Thanks,
Stanley Chu
> 
> Change LGTM.
> 
> Regards,
> 
> Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
