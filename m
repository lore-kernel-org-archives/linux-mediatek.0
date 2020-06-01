Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02B7C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 07:35:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1F9206E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 07:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqY9qxuW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p2waj1F1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1F9206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkNCtX+8RV+HIFpUrmz/bwDKqkNXnXkodHSWJSQGhfw=; b=jqY9qxuWOfzGsH
	RSzmYy5+ljsPQlqaGVXVspcdHAW3c9QOJ7UjMKlTWH6J/a7WbyqkopIX+2uQIzaUnv/OvnbHS7+T4
	xSzBudL/rf7fJA1O1mKK80tin+b47rR4vdrAN6ziVnBK6zLz7angP9aBRBCSsyY6wIM0bnRDlsa3Q
	gWQjdLz2N+SvahpnAHhOtYDp8kQrI89onG/lkXO2SYhi/0p+/7zBlLp0N6RJRVFCdm2K5uabw4tzi
	TKt2NfRxqzOmt7KDRvvAf5RRAiSYg6yD1+vZe6OrMlsz2vfK80AAJJ0F85+W+uOCWmrksUBgGJCHJ
	pwyzBxWKvVapgzr4VCfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfez4-0000Cx-9X; Mon, 01 Jun 2020 07:35:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfeyv-0008WT-V0; Mon, 01 Jun 2020 07:35:39 +0000
X-UUID: 09fea8762d69446c8663b2b563b39ff3-20200531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NTVuyzYbTFO6DFfp2wMnvMERcsSISRnV9jG7gsuPvng=; 
 b=p2waj1F149vQe/RvJ1Fnw9HP3qt2JNm0TZDTq1x+XyMp8D+Abtes359bvUrJzjqJldrMytdlrWw1sEKE7bPJeLQFCDHZZTPNCRtTFZMzCkXQNwpZ+K2TlwusuaeolRpfgxDtXnPvDAwZvSXxnPSS6W0TwDptFstNmI09gLTDy6s=;
X-UUID: 09fea8762d69446c8663b2b563b39ff3-20200531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 175440630; Sun, 31 May 2020 23:35:16 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 00:25:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 15:25:25 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Jun 2020 15:25:24 +0800
Message-ID: <1590996325.25636.30.camel@mtkswgap22>
Subject: RE: [PATCH v1 1/2] scsi: ufs: Support WriteBooster on Samsung UFS
 devices
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Mon, 1 Jun 2020 15:25:25 +0800
In-Reply-To: <SN6PR04MB46400873245235EA56838A19FC8C0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200530151337.6182-1-stanley.chu@mediatek.com>
 <20200530151337.6182-2-stanley.chu@mediatek.com>
 <SN6PR04MB46400873245235EA56838A19FC8C0@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CA49A87DC9E16E8F08365655C751610B75A6F21121B1FD7877FDA8D5650F85E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_003538_018217_047FEE04 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sat, 2020-05-30 at 20:37 +0000, Avri Altman wrote:
> > @@ -2801,11 +2801,17 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum
> > query_opcode opcode,
> >  {
> >         struct ufs_query_req *request = NULL;
> >         struct ufs_query_res *response = NULL;
> > -       int err, selector = 0;
> > +       int err;
> >         int timeout = QUERY_REQ_TIMEOUT;
> > +       u8 selector = 0;
> > 
> >         BUG_ON(!hba);
> > 
> > +       if (hba->dev_quirks & UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR) {
> > +               if (ufshcd_is_wb_flags(idn))
> > +                       selector = 1;
> > +       }
> > +
> Why not make the caller set the applicable selector,
> Instead of checking this for every flag?

This way have the minimum modification efforts and places compared to
other ways. However it looks a little wired because the selector control
is better assigned by users. I will submit next version with changing
the way selector assigned for comparison.

> 
> >         ufshcd_hold(hba, false);
> >         mutex_lock(&hba->dev_cmd.lock);
> >         ufshcd_init_query(hba, &request, &response, opcode, idn, index,
> > @@ -2882,6 +2888,11 @@ int ufshcd_query_attr(struct ufs_hba *hba, enum
> > query_opcode opcode,
> >                 goto out;
> >         }
> > 
> > +       if (hba->dev_quirks & UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR) {
> > +               if (ufshcd_is_wb_attrs(idn))
> > +                       selector = 1;
> > +       }
> > +
> Same here
> 
> >         mutex_lock(&hba->dev_cmd.lock);
> >         ufshcd_init_query(hba, &request, &response, opcode, idn, index,
> >                         selector);
> > @@ -3042,6 +3053,11 @@ int ufshcd_query_descriptor_retry(struct ufs_hba
> > *hba,
> >         int err;
> >         int retries;
> > 
> > +       if (hba->dev_quirks & UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR) {
> > +               if (ufshcd_is_wb_desc(idn, index))
> > +                       selector = 1;
> > +       }
> > +
> And here.
> But this can't be true - 
> Are you setting the selector = 1 for reading any field for those descriptors?
> Shouldn't it be for the wb specific fields?

Yes, thanks for remind this.
I shall assign selector = 1 for WB related fields only in descriptors.

>  
> 
> >         for (retries = QUERY_REQ_RETRIES; retries > 0; retries--) {
> >                 err = __ufshcd_query_descriptor(hba, opcode, idn, index,
> >                                                 selector, desc_buf, buf_len);
> > @@ -6907,8 +6923,10 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
> >         size_t buff_len;
> >         u8 model_index;
> >         u8 *desc_buf;
> > +       u8 retry_cnt = 0;
> >         struct ufs_dev_info *dev_info = &hba->dev_info;
> > 
> > +retry:
> >         buff_len = max_t(size_t, hba->desc_size.dev_desc,
> >                          QUERY_DESC_MAX_SIZE + 1);
> >         desc_buf = kmalloc(buff_len, GFP_KERNEL);
> > @@ -6948,6 +6966,29 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
> > 
> >         ufs_fixup_device_setup(hba);
> > 
> > +       if (!retry_cnt && (hba->dev_quirks &
> > +               UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR)) {
> If you only want to enter this clause once - you should use something other than retry_cnt,
> Which the reader expects to performs retries....

OK! I will fix this label by using another more comprehensible name.
> 
> Also, this is becoming too wired - 
> From your commit log I get that for specific Samsung devices,
> You need to query wb descriptor fields/attributes/flags using selectore = 1.
> But what it has to do with descriptor sizes?

Sorry to not mention clearly in the commit log.

Here driver needs to update the descriptor size to a "longer size" which
includes the "hidden WB related fields" which can be "found" by selector
= 1.

If descriptor size is not updated, any query can only get the fields
offset within current descriptor size even if selector = 1, and
out-of-boundary desc_buf[] access will happen in
ufshcd_read_desc_param().

PS. The check of "param_offset" to prevent possible out-of-boundary
desc_buf[] access can be patched as well.


Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
