Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09888C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 12:15:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2244611EE
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 12:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2244611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BSONbg8yIQvoeQi01kS62ZoAsfcI/DMBstAwnNpBl+g=; b=dk4hJPBnPvtu+MBUz2B1/+Uhc
	SpR+uEO3cfVo/Dwiok2Ji3MaiCrASMhIYBC2cuPP9AnGw5Zi4FSvHGiNXIVhXhC/igeGh2m0VsYuu
	kdAChxrqhNpoJoWoZGAYVMiwcijAIy45C2dh09fYcERJR68AzK5PJqWbXmcu8K0tBMMIFeEMJxg0r
	bQ/p27hSW5I7PscbkzYGLQEajPgRqCDQpOE9w8aQ1wJFAFfpkfnMsQFtwQrtM55FsFqnAqBP7S2Vy
	32ZIGNz567JogYWFcl2tq76Lbi3/wye+0ja/UHR/31QfL0i5Wo0bRNqiW/gc7chNNVsnZ7pTYDBb3
	H0Yf7Pdww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU75u-004wgJ-05; Wed, 07 Apr 2021 12:15:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU75e-004wep-J1; Wed, 07 Apr 2021 12:15:25 +0000
X-UUID: af4dccfcd5a842f7a2d710cb03d09985-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sEGKramWmw81gXjpxPU0aY6E3PRKyWdBkq9b+DFD3b4=; 
 b=CCPEYSp/BR6OOtOq3NzPo/MsXLx0DFHEGQ/p1vtrD9VPl5bfG0TXtLOunekvqLjO+1VTfYwbL+F9OGvVCUGDFlHQQLzBWTq+b5Pw3gAO4m+7LAJneZRrlO4gbU7EN74QTBgl+SBh64PMQK+uMYGAVZoZUbM92esq7J+X2rZRu88=;
X-UUID: af4dccfcd5a842f7a2d710cb03d09985-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 235733954; Wed, 07 Apr 2021 05:15:13 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 05:15:12 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 7 Apr 2021 20:15:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Apr 2021 20:15:06 +0800
Message-ID: <1617797706.32076.1.camel@mhfsdcap03>
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>
Date: Wed, 7 Apr 2021 20:15:06 +0800
In-Reply-To: <20210406194856.GF3122@kunai>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4B9A90AB75786AB472DAB22F2EC572602C5BF8B0252F9FE5E8EC257F3838AAC72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_131523_760776_BA0D5015 
X-CRM114-Status: GOOD (  14.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-04-06 at 21:48 +0200, Wolfram Sang wrote:
> On Sat, Mar 13, 2021 at 04:04:24PM +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> > 
> > tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> > clock-stretching or circuit loss, we could get device
> > clock-stretch time from dts to adjust these parameters
> > to meet the spec via EXT_CONF register.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> 
> I tried to understand from the code what the new binding expresses, but
> I don't fully understand it. Is it the maximum clock stretch time?
> Because I cannot recall a device which always uses the same delay for
> clock stretching.
> 

Due to clock stretch, our HW IP cannot meet the ac-timing
spec(tSU;STA,tSU;STO). 
There isn't a same delay for clock stretching, so we need pass a
parameter which can be found through measurement to meet most
conditions.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
