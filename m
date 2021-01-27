Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC5BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 01:35:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9EE2068D
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 01:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D9EE2068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hfamViYzWPI9qCeZjA1mt8a15At+lrF2XOMuwDmrbRY=; b=vUtZ1QkTkpfq3+8Ogk9RVV+na
	Xmip7HVWopQtDvO2ppJFrPDLyPqR2E/S58sZ+tPvlUNclwRuM1oYfpxQ38Ne04L+y7fXXVdKO8FNo
	l4u+cXfWiSIwPfPKLGbesN+iHHCRop9onIp3PSjwU2pA2JU9NwQR9DnIroXaR/mSxu+py9Qj76Qc7
	I/YKmJPFkOz5LlV8zlw9S8h+berPxdr2GPwabCzm/pZN9RWypmo8+Ur4ouWPUkDEYoraeW2spHbft
	EpVHCPNP+Vg3DJuqZDwxVFtKPwSULre8hom75BbJU+39Axo21dX3EQxHAOj0WgTap8LV424ZiagHt
	OQGVw8fwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Zjm-00085N-UB; Wed, 27 Jan 2021 01:35:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Zji-00084T-C1; Wed, 27 Jan 2021 01:35:12 +0000
X-UUID: 39b7528f51c84d6ca5253d9c69ea62ec-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W0SI6VZP8Q1hw4fDOJjfeymFT5BpumTc7D7uysoxZVU=; 
 b=Gx5IuA2e4jUfJdC2k8p80uA5Ru4Qd1NyhwS1gy1qW2fkq0zaQ/Ng9JPLtYQVpG9pBtfCS0+J/UD8fSZX/C4MEug7tFATjAwX6nvXjErWNm1PCwmy1OQszZaaYYYq+qE7UMDnwbhx4ENYGJnBp/11n2boL6UCZk9TCyzbE8jXGFE=;
X-UUID: 39b7528f51c84d6ca5253d9c69ea62ec-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 291462912; Tue, 26 Jan 2021 17:35:03 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 17:35:02 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Jan 2021 09:34:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jan 2021 09:34:54 +0800
Message-ID: <1611711294.3905.15.camel@mhfsdcap03>
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 27 Jan 2021 09:34:54 +0800
In-Reply-To: <YBAjRUSEd/6sCl4O@kroah.com>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <1611640920.3905.13.camel@mhfsdcap03> <YBAjRUSEd/6sCl4O@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7E05161C49408F22B8B7A5B2831864F5353E2B4C9D13DED2804C36A88EDAC4192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_203511_134548_9C1CB419 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-26 at 15:12 +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 26, 2021 at 02:02:00PM +0800, Chunfeng Yun wrote:
> > Hi Ikjoon,
> > 
> > Can I put this patch into my patch series about bandwidth scheduler?
> > the series also include "[RFC PATCH v3 1/5] usb: xhci-mtk: improve
> > bandwidth scheduling with multi-TT", put them together will help to fix
> > dependence issue, meanwhile I try to build xhci-mtk-sch.c into
> > xhci-mtk.ko instead of xhci-hcd.ko.
> 
> This should probably be merged now, first, as it fixes an issue that
> showed up in 4.20 so this needs to be backported to older kernels.
> 
> Please rebase your future patches on top of this.
Ok

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
