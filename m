Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D47C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:28:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C77A2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lMExOdhE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z2tU7S6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C77A2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+O22mSiDyg378cLwqtxpfPs2AHKtQqr2/1NiE0JC0o8=; b=lMExOdhEdGC6Qfl+30ehWg7CB
	gsnJsl94x+seAXd1UyYuTv402RZSlcrDNGJq6QCrLUykJdltVhjcaDZzfZQ/Xwd7m9VKpKEMLQqXq
	K4pzE1kvDtZa8WpLDHICnq2iNm6KRSSNIee8S4Z145y4cQYII8sJnHJMr9exw4teXGQke+leMhf6B
	N4PTbatjEgY/6yhBrreRcBkqz80u/nhPsbLM4rAcQYDvXXT08wAVdgplJYmy8iQrOGrD8/cckfuIi
	TZ0WwwptiY8iKiTr4IacWWnZV4cRqiYPiVDJDZa1cfN4O+BFtCYLj33QK45jaU8uF9z8f4gIvCxQN
	tmRIzyJkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0fYv-0001zb-DQ; Wed, 29 Jul 2020 06:27:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0fYq-0001yK-Px; Wed, 29 Jul 2020 06:27:34 +0000
X-UUID: 3a0c2dcea70f4e0cae6f17fdad3e3e4a-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IGn+KSjR/Fh4kwTgkA45LGe0gYSdGsUC3/0lzAXY+BQ=; 
 b=Z2tU7S6hNB/N2Jc/g1NcEI++BlU8PNb6p167FDms7eVaiFNGedlH69/s/XHxOivitiz0YWBg2ZCSJd1x2JyIBLuYQQ+Ps8MqspDZwisEjcUPH4vmi4WzMqZJ4KkI/9SS/YZz78uZb7eWkR3Xgo65bfUn8uMoCC+/wssClv/ybmA=;
X-UUID: 3a0c2dcea70f4e0cae6f17fdad3e3e4a-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 689975905; Tue, 28 Jul 2020 22:27:29 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 23:17:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:17:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:17:17 +0800
Message-ID: <1596003438.17247.5.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] scsi: ufs: Introduce device quirk "DELAY_AFTER_LPM"
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Wed, 29 Jul 2020 14:17:18 +0800
In-Reply-To: <b859b49f4b5e85b81a24735a53f5aa4e@codeaurora.org>
References: <20200729051840.31318-1-stanley.chu@mediatek.com>
 <20200729051840.31318-2-stanley.chu@mediatek.com>
 <b859b49f4b5e85b81a24735a53f5aa4e@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8CA4841E40437A66263CD9782EF3339DA00BBE70079063160976C02DF856FD952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_022733_056161_C8E3D904 
X-CRM114-Status: GOOD (  12.91  )
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
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cc.chou@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Wed, 2020-07-29 at 13:31 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-07-29 13:18, Stanley Chu wrote:
> > Some UFS devices require delay after VCC power rail is turned-off.
> > Introduce a device quirk "DELAY_AFTER_LPM" to add 5ms delays after
> > VCC power-off during suspend flow.
> > 
> 
> Just curious, I can understand if you want to add some delays before
> turnning off VCC/VCCQ/VCCQ2, but what is the delay AFTER turnning
> them off for? I mean the power has been cut by host from PMIC, how
> can the delay benefit the UFS device?
> 

The problem comes from both sides,
1. VCC power rail design by SoC vendors, and
2. Device strategy according to VCC changes

Take Micron UFS devices on MediaTek platform as example, our VCC drop
rate may be too slow and lead to incorrect resume strategy by device.
Without this delay, device may not resume successfully.

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
