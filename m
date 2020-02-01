Return-Path: <SRS0=uvF2=3V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7788BC33CB2
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 01:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47BA120722
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 01:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAEhhEm8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PnfObm0N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47BA120722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8a3hMsfdN150/vgM7cvxqAI7zjcEkiLJN6WUQg1RHPw=; b=uAEhhEm8veVwsO
	B22+xC/Gkfw/B2McRK+DWsZR9xxJHE7FYW8ZOslLyMWoprwyGoEiHWS+nzX6nYZAlhHesWP6Rhy12
	QdZ6vWR+Hzc5AjpZo/rnKq7W+gpNC1l2tcO89tg9X62GtGH/SX2Vzw/BF4RVjZ3rCHS9HDtYf5k1W
	uU92I0qq1a8SQWeiFaImnSUCkjl9VV5eU4FBEPdzAIu5V7y6oyzZmOZqDqFQWZ1tEA6dfkxRNcjIt
	rxkiEdd7RX1CWzUrz2wmrHagtBs4nfeylKwHG5FYDfw2G05/b+UK43jMe7S/8zrqNdNvcCcpiVt2c
	hHhVS34KZTSVV/htFY4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixi0p-0007N6-3a; Sat, 01 Feb 2020 01:55:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixi0c-0007D8-Oo; Sat, 01 Feb 2020 01:55:44 +0000
X-UUID: 7373e6bc93d74e988dbf1142de6cf0c7-20200131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bKHd1tAggSIYDv7JYfnCgulY1L3xWENBKRTIMPNCxIY=; 
 b=PnfObm0NMA1GnJ3uWv5kD2RIpWjGCLw0RhHHAS7EUdh9M/+drlk5yzWbJ8nbi8SV4vlXxyQGqPjfvvMhInESy6rR72J75w7xsS9saOcdczd+4uByMN5/kXAOcH0eiofYmJyWg2HymZgit6t14xYKWMNte4H/Vj5nZ9lY65D/g6w=;
X-UUID: 7373e6bc93d74e988dbf1142de6cf0c7-20200131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1907505324; Fri, 31 Jan 2020 17:55:32 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 Jan 2020 17:45:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 09:44:04 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 1 Feb 2020 09:44:11 +0800
Message-ID: <1580521516.15794.10.camel@mtksdccf07>
Subject: RE: [PATCH RESEND v3 4/4] scsi: ufs-mediatek: gate ref-clk during
 Auto-Hibern8
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Sat, 1 Feb 2020 09:45:16 +0800
In-Reply-To: <MN2PR04MB699108FC14777CC364522069FC070@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
 <20200129105251.12466-5-stanley.chu@mediatek.com>
 <MN2PR04MB699108FC14777CC364522069FC070@MN2PR04MB6991.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1F82E7DC4A3A53250291462851AFB1ACF9319A87D203BA06A9D76D33D8EF52862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_175542_817668_993F34CD 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Fri, 2020-01-31 at 18:48 +0000, Avri Altman wrote:
> > 
> > +static u32 ufs_mtk_link_get_state(struct ufs_hba *hba)
> > +{
> > +       u32 val;
> > +
> > +       ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
> > +       val = ufshcd_readl(hba, REG_UFS_PROBE);
> > +       val = val >> 28;
> > +
> > +       return val;
> > +}
> A little bit strange that you are relying on debug registers to setup your ref-clock.
> Is this this debug info is always available?
> 

Yes, this register is only for this purpose now (query link state) and
always existed in MediaTek UFS host.

Thanks,
Stanley
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
