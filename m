Return-Path: <SRS0=oHVa=6S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045AEC3A5A9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 14:34:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE9BC20757
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 14:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMZhjKgh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cLhv8/f7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE9BC20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCxhG9DJhl2GzN3zj+vtg74LiaUQ0EvGNGRt6+VhMwQ=; b=dMZhjKghgrriQG
	wZhIk5mGz2TAgmN+0N9woajr9SRfrRiE6fVtbzUaTr0UPMt9LwdV00oD6qQkr4SK3boLOqiuU1MXW
	9T1itNixl2InQpST7mM8Qeh6kq1glZO0f9CBmhbG+NV5tYokA+S/EUSPlY+7YqSS3yQYvAgGHcz7L
	2wHygS/94L3zPG3c+LGGGb6jQCAWlc7dOP+jg1JxyY3rrRXkuLZlH4lbaLzsFa82VD0liMGH0BfDG
	1O/oDfmCpc/mcuFg+QoHETMbVGVr16ZfSZpcvrndg/VM6wKTZbqJX+h0M7eeG1QetGR+mHn8wCMJ8
	gX+mNH1i8FEhKHRtgzOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVcAh-0000Ak-Jh; Mon, 04 May 2020 14:34:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVcAZ-0008TA-MV; Mon, 04 May 2020 14:34:09 +0000
X-UUID: f8743e098d974d4687569879d2b6a7da-20200504
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LkDTTU5vitAXtQ17b+YTzyueCYv6Vy7Wfw0Qkwja9cQ=; 
 b=cLhv8/f7/SkFxZRm614AfJi4VBv1yee51l0ZCDslm/zP9biTJWtGwuLcw2zSlAnJ04r/R5IE62FSVlsWQqHfQkQuSjdlJ/TSyR4Ni8EzsQsXnmZ1otHkEJWjMHMqJmD1C7WjXMzLWko7pBt12R4nznZGIJm0oO9Fhssmila7IiU=;
X-UUID: f8743e098d974d4687569879d2b6a7da-20200504
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 538638120; Mon, 04 May 2020 06:33:54 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 May 2020 07:33:57 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 May 2020 22:33:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 May 2020 22:33:54 +0800
Message-ID: <1588602837.3197.32.camel@mtkswgap22>
Subject: RE: [PATCH v5 1/8] scsi: ufs: enable WriteBooster on some pre-3.1
 UFS devices
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Mon, 4 May 2020 22:33:57 +0800
In-Reply-To: <BYAPR04MB4629F2C00ABAB512DB833232FCA60@BYAPR04MB4629.namprd04.prod.outlook.com>
References: <20200503113415.21034-1-stanley.chu@mediatek.com>
 <20200503113415.21034-2-stanley.chu@mediatek.com>
 <BYAPR04MB4629F2C00ABAB512DB833232FCA60@BYAPR04MB4629.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_073407_741349_53CAC9E1 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Mon, 2020-05-04 at 10:37 +0000, Avri Altman wrote:
> > 
> >  static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
> >  {
> > +       if (!ufshcd_is_wb_allowed(hba))
> > +               return;
> > +
> > +       if (hba->desc_size.dev_desc <=
> > DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP)
> Should be 
> DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 4 

I think this description length check is redundant because the device
quirk shall be added only after WriteBooster supportat is confirmed in
attached UFS device. So I will remove this in next version.

> 
> > +               goto wb_disabled;
> > +
> >         hba->dev_info.d_ext_ufs_feature_sup =
> >                 get_unaligned_be32(desc_buf +
> >                                    DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
> 
> 
> > 
> >  static int ufs_get_device_desc(struct ufs_hba *hba)
> > @@ -6862,10 +6890,6 @@ static int ufs_get_device_desc(struct ufs_hba
> > *hba)
> > 
> >         model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
> > 
> > -       /* Enable WB only for UFS-3.1 */
> > -       if (dev_info->wspecversion >= 0x310)
> > -               ufshcd_wb_probe(hba, desc_buf);
> > -
> >         err = ufshcd_read_string_desc(hba, model_index,
> >                                       &dev_info->model, SD_ASCII_STD);
> >         if (err < 0) {
> > @@ -6874,6 +6898,16 @@ static int ufs_get_device_desc(struct ufs_hba
> > *hba)
> >                 goto out;
> >         }
> > 
> > +       ufs_fixup_device_setup(hba);
> I don't think you should "hide" ufs_fixup_device_setup inside ufs_get_device_desc.

The reason is as below,

ufshcd_wb_probe() needs the contents of Device Descriptor for
initialization. To avoid double reading the Device Descriptor, I keep
ufshcd_wb_probe() inside ufs_get_device_desc() to use its "desc_buf".

And ufshcd_wb_probe() needs well-configured device quirk for entrance
check, thus ufs_fixup_device_setup() shall be moved before
ufshcd_wb_probe().

This change does not affect the behavior and functionality of
ufs_fixup_device_setup() since it is still executed once only during
ufshcd_init() flow and not be executed again in the future.

Thanks,
Stanley Chu

> 
> Thanks,
> Avri
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
