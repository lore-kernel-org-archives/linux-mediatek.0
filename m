Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51519C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 13:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D5D2070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 13:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMhVBUKT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qnAHORGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D5D2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+WGITK5wbcAJrFvDRNIFLSBDybJr6lZis+WQzLUCv4=; b=tMhVBUKTwNQ2gy
	ZGcug9Mc6G+PW284DHPtQz73EDT/8g/fs+DwldlnTXgclZ6UeaaXTpiB6/JskBgG3iZaw2h03PeJr
	Wq8tiqUGOnAtdtxz+ump1OgBXPBKFQ9usyYNiy7Tm6vjjIe9nSEgj4RS9GNN6pR3kp+ym68nJhspt
	9TOdWgh50ewgzc0NkBJ8Hqi7Gi1nggVFDR/rSHzEA0cX2B0B8JMkGW1Zf29QdiQv1eQdQ0usFEgCa
	A7hdA+x/py0BHXHhjO0jhUtkR4tXml84L4HS0dqDkc7i/LIS7SX2jFR7B5Nb6YHzaCEWripYcztyQ
	gCCPestLpW3okWsyn7kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3gXg-0000u5-6c; Mon, 17 Feb 2020 13:34:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3gXQ-0000iE-QI; Mon, 17 Feb 2020 13:34:18 +0000
X-UUID: f94a4cd370c14d6388e0c9b079a79b60-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nY3Ke1klULAjNa7h8M2psxk/X6t7HIt3248sL2BxSR4=; 
 b=qnAHORGVI3aJQur92wg0N4iIHjRBAJ2WyAkPw72wSAFmFZixNwIeseOxTycH74gJfPzt0N//F7o/sRpOusTvI2sMaH3sc+BzSKd9TfOoAHcwWbWxADu12PsxQT3f3Eb3qWJWq4lI/O7FNO672Hl2b44/oW/9oCbc6oeVNaq2JVI=;
X-UUID: f94a4cd370c14d6388e0c9b079a79b60-20200217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1012253574; Mon, 17 Feb 2020 05:34:12 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 05:34:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 21:32:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 21:33:54 +0800
Message-ID: <1581946449.26304.15.camel@mtksdccf07>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Mon, 17 Feb 2020 21:34:09 +0800
In-Reply-To: <e518c4d1d94ec15e9c4c31c34a9e42d1@codeaurora.org>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
 <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
 <1581945168.26304.4.camel@mtksdccf07>
 <e518c4d1d94ec15e9c4c31c34a9e42d1@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2685DCB7C055937DC0B6D9BC68FB0DDE9E72F441D9E0C6E1EBB4875D879A48E92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_053416_890729_B03C4F31 
X-CRM114-Status: GOOD (  15.94  )
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

On Mon, 2020-02-17 at 21:22 +0800, Can Guo wrote:
> On 2020-02-17 21:12, Stanley Chu wrote:
> > Hi Can,
> > 
> > 
> >> >  			} else if (!on && clki->enabled) {
> >> >  				clk_disable_unprepare(clki->clk);
> >> > +				wait_us = hba->dev_info.clk_gating_wait_us;
> >> > +				if (ref_clk && wait_us)
> >> > +					usleep_range(wait_us, wait_us + 10);
> >> 
> >> Hi St,anley,
> >> 
> >> If wait_us is 1us, it would be inappropriate to use usleep_range() 
> >> here.
> >> You have checks of the delay in patch #2, but why it is not needed 
> >> here?
> >> 
> >> Thanks,
> >> Can Guo.
> > 
> > You are right. I could make that delay checking as common function so 
> > it
> > can be used here as well to cover all possible values.
> > 
> > Thanks for suggestion.
> > Stanley
> 
> Hi Stanley,
> 
> One more thing, as in patch #2, you have already added delays in your
> ufshcd_vops_setup_clocks(OFF, PRE_CHANGE) path, plus this delay here,
> don't you delay for 2*bRefClkGatingWaitTime in ufshcd_setup_clocks()?
> As the delay added in your vops also delays the actions of turning
> off all the other clocks in ufshcd_setup_clocks(), you don't need the
> delay here again, do you agree?

MediaTek driver is not using reference clocks named as "ref_clk" defined
in device tree, thus the delay specific for "ref_clk" in
ufshcd_setup_clocks() will not be applied in MediaTek platform.

This patch is aimed to add delay for this kind of "ref_clk" used by any
future vendors.

Anyway thanks for the reminding : )

> 
> Thanks,
> Can Guo.


Thanks,
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
