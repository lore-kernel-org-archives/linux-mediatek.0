Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6498AC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 13:13:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C04206E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 13:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W8ffQBTU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c4eGnLXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C04206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrZyqbu37XDWqofTuYcs/p5Fuw2NWvIP1bSLoUTgtl0=; b=W8ffQBTUdv5zPE
	6SziHwN1G13FGf6Fe/s8mcXSTbB4cilFoz/vOLMz1i8uFrtzT6DksJuKb2TNlvMxhGMM+oXGvEtGn
	QmX0Qmzm4uzRM4W9ruCFhW0K2pf3LHkwUtgdCthqUaIk/3Z+gvM7zrWY6XZnd2Ct49xD6zGoXyOwU
	z7Jj53MnlwzdttW0uWPc0ToHW0hmMlf/nOgEh3LfJUX+lXmxrQmLD1E7bu11nXMMyueAdtvtBadNz
	Rf3FUnIR5Z4OyglVi8apcFdtLX9MAoCHLkOlJFUGqCnQ5r/TJUXVBnBmEpJVVlBZ5A89BfJr+2IIQ
	jE5U6p4TNpPhq2yragfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3gD8-0006As-Af; Mon, 17 Feb 2020 13:13:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3gD0-00063U-09; Mon, 17 Feb 2020 13:13:11 +0000
X-UUID: 5ac752f253b24c9d8e19ad0493931150-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=I/tzgvV2R++XQqqJXAJs1pGeA3QGkcVi7IaA4ozzCKc=; 
 b=c4eGnLXnZ4GKfGe12tWJAX2BDHbZR+ybkFWRgfB3jbekxVbg9wMEb10urm3SVu9D0DFzeLALeSGMYC9+MdvQQ8tnDAhM7HVJbRyEKVS9kgaUxYtKyzWIuRbcd843WPPbBhP+qc8etrAB0zSF3hP2tHTSWnA+eIIlCrHo0Tyafb8=;
X-UUID: 5ac752f253b24c9d8e19ad0493931150-20200217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 495442648; Mon, 17 Feb 2020 05:13:02 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 05:13:00 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 21:11:05 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 21:12:33 +0800
Message-ID: <1581945168.26304.4.camel@mtksdccf07>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Mon, 17 Feb 2020 21:12:48 +0800
In-Reply-To: <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
 <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_051310_053901_AD033EA6 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,


> >  			} else if (!on && clki->enabled) {
> >  				clk_disable_unprepare(clki->clk);
> > +				wait_us = hba->dev_info.clk_gating_wait_us;
> > +				if (ref_clk && wait_us)
> > +					usleep_range(wait_us, wait_us + 10);
> 
> Hi Stanley,
> 
> If wait_us is 1us, it would be inappropriate to use usleep_range() here.
> You have checks of the delay in patch #2, but why it is not needed here?
> 
> Thanks,
> Can Guo.

You are right. I could make that delay checking as common function so it
can be used here as well to cover all possible values.

Thanks for suggestion.
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
