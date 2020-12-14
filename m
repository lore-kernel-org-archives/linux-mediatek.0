Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70FAC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 03:25:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3133623741
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 03:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3133623741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oitW9ufpmaHCIAtlOM+/01lpWlXdeCd4u0h96xbD9UE=; b=PQ69q3kHLGRcGptebSO/LgatG
	V8hpsuzTIgRallYnLqZjkc+eJiyr0yhKNWrYwPb3JHJtvj8HmW5MDO9J9aCqXOTp5sdrPIBSqO6go
	LZ7WtEvAoNNnqvMEP2mUWarQdo0NKLqmEmbIujGrZcE25Wvh40x10xh3zcIR7S2mLEkyiZ65OLKvE
	2k7NfWPeQ5Rqz36AM1NknDuADaGySeww4i8On3U9eWfTcJUmWs+GSXxmI4R9YcZdxZ8XDmpCqefPO
	QI1NJuH82Tygw2Bci6hjaNzc2obTMzMEUyknF/MtNYBVKANAnFgJ6swVyQpMje6s1VTmGLSfkifwI
	KopMQUWeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koeU2-0000UE-RO; Mon, 14 Dec 2020 03:25:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koeTx-0000TQ-QV; Mon, 14 Dec 2020 03:25:07 +0000
X-UUID: 0add3987fc7e469eaa9495e5b7d4ee35-20201213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uqUvCWtf27nxQjiM4iTofVBTFdxaqp7ppKL1RHS9HJg=; 
 b=sZ7luNVi9AgApQz6VeKP+6QIA1mlhCnjI77dPESKaJyF4hfM2XWC+qed864iIfD3JP1UPW1CJa0092Q8otamFsCzr4FuvOqZ3onJvsIOyW9ygfNnh0gjKiFOFiE9kOM+6tnddlW17EOnm0LigjGIaZy12UH3iFDPqoFL518VVwM=;
X-UUID: 0add3987fc7e469eaa9495e5b7d4ee35-20201213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1107556048; Sun, 13 Dec 2020 19:24:58 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Dec 2020 19:24:55 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Dec 2020 11:24:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Dec 2020 11:24:49 +0800
Message-ID: <1607916289.23328.21.camel@mhfsdcap03>
Subject: Re: [PATCH v2 0/3] Release allocated periodic bandwidth data from
 reset_bandwidth()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 14 Dec 2020 11:24:49 +0800
In-Reply-To: <CAATdQgBZn3oehw_20D3yMmDA8G61oMHVax8LqJ-hPQv+9kJGLQ@mail.gmail.com>
References: <20201210104747.3416781-1-ikjn@chromium.org>
 <1607651584.23328.20.camel@mhfsdcap03>
 <CAATdQgBZn3oehw_20D3yMmDA8G61oMHVax8LqJ-hPQv+9kJGLQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F4A39B486DF1B1350015DA44A42F81388C6B305FFFE3CD87B6116D59E3937AD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_222506_065029_3C595519 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: Zhanyong
 Wang <zhanyong.wang@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-12-11 at 14:36 +0800, Ikjoon Jang wrote:
> On Fri, Dec 11, 2020 at 9:53 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Thu, 2020-12-10 at 18:47 +0800, Ikjoon Jang wrote:
> > > xhci-mtk releases allocated TT bandwidth data only when whole
> > > endpoints of a device are dropped as there're only {add|drop}_endpoint()
> > > hooks are defined. This patchset adds more hooks and releases all
> > > bandwidth data from reset_bandwidth() path, not drop_endpoint().
> > >
> > >
> > > Changes in v2:
> > > - fix a 0-day warning from unused variable
> > > - split one big patch into three patches
> > > - bugfix in hw flags
> > >
> > > Ikjoon Jang (3):
> > >   usb: xhci-mtk: code cleanups in getting bandwidth table
> > >   usb: xhci-mtk: delay association of tt and ep
> > >   usb: xhci-mtk: fix unreleased bandwidth data
> > >
> > >  drivers/usb/host/xhci-mtk-sch.c | 180 ++++++++++++++++++++------------
> > >  drivers/usb/host/xhci-mtk.h     |  13 +++
> > >  drivers/usb/host/xhci.c         |   9 ++
> > >  3 files changed, 133 insertions(+), 69 deletions(-)
> > Thanks for your patch, I'll test it and check it with our DE
> 
> Thanks, I will upload v3.
> But I don't expect any logic changes from v2.
> Can you please give me feedback on v2 if you find anything?
Ok

> 
> >
> > >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
