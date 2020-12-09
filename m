Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A255C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 01:09:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6248239FD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 01:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6248239FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zMyFbVeM9wZAnOfPksum5zXMqDhmNVo4G5lp98zasG4=; b=PhcCL3WZETVdUfzThc7b6xpfz
	AfO/59mdiWz6s1AgfONpTFRtTUGjL0n1wZRP/vqSLKRwsLtRb2xe69AL7z8MTZUnUZHnQ6EQ3N4Ne
	SkEOOnAhwqVyhST8MvpAgE2ti3IF8U/w/Lzk0fyh4wjTiRNuyK6IrP0n3yLvokIabLbvaQ2xTA+Mp
	3H55cPdwBDZF+Lt5S1S0pYyVbFMfpWBH8CEoWOlBfv6mcvwAmiVK+g8XgwEq6jk3gUesFVRYvJsQi
	PlPEwnZvBVBe90ymDixo0X1pxfjen2XRUCZh8iqLjijcf2//+y7gvZi7KLXDNFzpRDnhfpQf0e+aH
	ll5vPfftQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmnzH-000218-QP; Wed, 09 Dec 2020 01:09:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmnzF-00020Y-2f; Wed, 09 Dec 2020 01:09:46 +0000
X-UUID: e1c38be16e884bd9862d5eefc92eb7d3-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3KvKaE23ExOsMFcllhdIYY82q3GKWl+g+3RXbSqg8X0=; 
 b=r8w9Q7f58s5+h5YfJMC33Zbl5xWtpoYaYOmdLWOMHOQN9rD9HaJH65i5zmIFrfWH/0hpShd8IH4f0I6SgTAIuUJ+zT8NiVH235kyUNkICpjIDuahUXQlc9PrKsan7p3OCGVz1Z7Rip23Ejy7jzNHpQaaKRIuRU42qCG0+zUWvtI=;
X-UUID: e1c38be16e884bd9862d5eefc92eb7d3-20201208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1546860001; Tue, 08 Dec 2020 17:09:40 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 17:09:37 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 09:09:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 09:09:26 +0800
Message-ID: <1607476170.3580.29.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Re-enable WriteBooster after device
 reset
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bean Huo <huobean@gmail.com>
Date: Wed, 9 Dec 2020 09:09:30 +0800
In-Reply-To: <970af8b1abf565184bf37c3c055bf42ad760201a.camel@gmail.com>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
 <20201208135635.15326-2-stanley.chu@mediatek.com>
 <970af8b1abf565184bf37c3c055bf42ad760201a.camel@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F6065CCECF27701609747200FC9A5B0DE2F5181C9B2FFF1E34952CB6403D5522000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_200945_264050_0BEBFFEB 
X-CRM114-Status: GOOD (  15.91  )
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
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 nguyenb@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, jiajie.hao@mediatek.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, alice.chao@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-08 at 15:13 +0100, Bean Huo wrote:
> On Tue, 2020-12-08 at 21:56 +0800, Stanley Chu wrote:
> > index 08c8a591e6b0..36d367eb8139 100644
> > --- a/drivers/scsi/ufs/ufshcd.h
> > +++ b/drivers/scsi/ufs/ufshcd.h
> > @@ -1221,8 +1221,13 @@ static inline void
> > ufshcd_vops_device_reset(struct ufs_hba *hba)
> >         if (hba->vops && hba->vops->device_reset) {
> >                 int err = hba->vops->device_reset(hba);
> >  
> > -               if (!err)
> > +               if (!err) {
> >                         ufshcd_set_ufs_dev_active(hba);
> > +                       if (ufshcd_is_wb_allowed(hba)) {
> > +                               hba->wb_enabled = false;
> > +                               hba->wb_buf_flush_enabled = false;
> > +                       }
> > +               }
> 
> Stanley,
> how do you think group wb_buf_flush_enabled and wb_enabled to the
> dev_info, since they are UFS device attributes. means they are set only
> when UFS device flags being set.

Hi Bean,

Thanks for your review.

Yes, I agreed that wb related variables is a mess currently. I would
like to clean them up once I have time. Feel free to post your patch if
you want to take it up : )

Thanks,
Stanley Chu

> 
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
