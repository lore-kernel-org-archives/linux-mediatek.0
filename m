Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BF2C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 13:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6370D207FD
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 13:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j+WdWBPN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JMy7lr1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6370D207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGm3lHKrW1WvV++Bgb8c4Z6VPmPeOnjHlU9qtDl7wdQ=; b=j+WdWBPN6Da622
	Y2hH+z6Fhkey6JvT15ffBaOOSehUEHpdjtTMdDpV45m1mem3rBgN188tmctqEdiJuIGCi35wwXtXw
	k6XddKECETsEv2NAWcZiF5toh0AVCwt2TbCxaYNHjofRnDYs043VYA0JpZPGaSk+jN81rQf/AfyCO
	j/Om9wULnvHKT41Dvk6X069BNtwmDjTUpsqUSPdx3X/tU52ja61YFcqbgLV3eK9Pm/JFA2vD2yzn5
	AXe7UnuXejr5PkNh/7H4/vuTDsRh7YeFf5TfpGPrv3zrdVGdlEW1OSmPamu/V6seyhjJBA6pGsYSd
	SEC49BfykhalgcpNpBLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io5fn-0008LO-0K; Sun, 05 Jan 2020 13:10:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io5ff-0008Dv-VI; Sun, 05 Jan 2020 13:10:21 +0000
X-UUID: 2a7ce2bb406e4bcab8638215ffd1b544-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FILJcOCG2sGK9VzTixRtMJdMzeT4XRTUIkt6/bNT4+4=; 
 b=JMy7lr1A8KGvf71DVhfIAv9ELTKHAViKU7IGdjHKtUWqSGVWaaZ18T316oPaqaUGcA25TJ5+Fqh8OwQR8iIVW/qzkwUDr26B0ZRFo02S9BVBPXbM7y0JAdBeWbriogN9HRBzxCRx9uNKLB9jrm1kDdYQrYzISCYz5qAVZKvWHVU=;
X-UUID: 2a7ce2bb406e4bcab8638215ffd1b544-20200105
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 774048252; Sun, 05 Jan 2020 05:10:12 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 05:10:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 21:09:10 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 21:08:35 +0800
Message-ID: <1578229802.17435.3.camel@mtkswgap22>
Subject: Re: [PATCH v1 0/3] scsi: ufs: pass device information to
 apply_dev_quirks
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Sun, 5 Jan 2020 21:10:02 +0800
In-Reply-To: <MN2PR04MB69913F0B671032A388747CF7FC3D0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1578200118-29547-1-git-send-email-stanley.chu@mediatek.com>
 <MN2PR04MB69913F0B671032A388747CF7FC3D0@MN2PR04MB6991.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_051020_015036_6F537B2A 
X-CRM114-Status: UNSURE (   7.16  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
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
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sun, 2020-01-05 at 05:51 +0000, Avri Altman wrote:
> You have to squash patch 1 & 2, otherwise your patch 1 won't compile.
> Other than that: looks good to me.
> Thanks,
> Avri

Sorry because I sent 2 series in these two days.

Would you mean patch 1 is series: "scsi: ufs: fix error history and
complete device reset history" and patch 2 is series "scsi: ufs: pass
device information to apply_dev_quirks"?

Or patch 1 & 2 mean the first 2 commits in this series: "scsi: ufs: pass
device information to apply_dev_quirks"?

Thanks a lot.
Stanley
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
