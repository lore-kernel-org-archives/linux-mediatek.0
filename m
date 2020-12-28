Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87ABC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 02:11:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7473F207AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 02:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7473F207AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BRN/qin+gmeYxgLk+4eieIkk0lJY9NzXYodf9WUM7xU=; b=Rxf/5NFQ+9cqyKxzH2KsbxxMQ
	aNVNur3kRfA5TunpBEubDJmgPOREbESMuKuaY5WA/QJt0W9vxHIrw8/vQ63HvyWqo1abFAxc8H87W
	4TL+4z8KNnxb7D0jkKXUniVSBQwWiEa1TQcbYKbw27JBc5juzOfKm0+PfG9/iPyXTqRiFmLlq6nOW
	y0+j9sLAUtfRnfXia7DTjPc+//LxonkvDdc5/GNOUJWMMJq7kvz9mr5WpUwSWJVfoy9Pqi5Xh1CfO
	Tl/ymOZQMxafgewqGWu1L8zQ8dX0X7QUxq3klIUlitF4+t6oim+LuYOiWNY2bmoVrbNtjpE6VZl/j
	nbja5X0ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kthzv-0003Ok-Rv; Mon, 28 Dec 2020 02:10:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kthzr-0003Nl-8X; Mon, 28 Dec 2020 02:10:57 +0000
X-UUID: ad63c3ea6a7149c082ec88319f8abb89-20201227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lghlq2WNbpEu0PvmmpgWkbvLTmJY+DeCSBWN4strJ3o=; 
 b=OOfDu8xn2kpnmKIog3qrdqYJFTg0YYFVTRM++E5e7+6znCkDBRVayj/f+iRgrLYfqD8pj6zX5TKUPnzTF/5o3zl5oPoZ/CEiNBWgcsbC0JxAQyUhMSz6vSx26G2kSxVWTmGQJzrPy1apf6Q/LnnSm2T2YTCx3QB2zkop10yu8Ao=;
X-UUID: ad63c3ea6a7149c082ec88319f8abb89-20201227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 952776952; Sun, 27 Dec 2020 18:10:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Dec 2020 18:01:52 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 10:01:22 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Dec 2020 10:01:22 +0800
Message-ID: <1609120814.9795.10.camel@mtkswgap22>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Date: Mon, 28 Dec 2020 10:00:14 +0800
In-Reply-To: <d77a22a9-ea8b-0785-4a9b-62056d8e8e56@codeaurora.org>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
 <1608796334.14045.21.camel@mtkswgap22>
 <DM6PR04MB6575D0DD2C04692AEF771494FCDD0@DM6PR04MB6575.namprd04.prod.outlook.com>
 <5eb12622222bd9ba5e705801a204f3160ba3966b.camel@gmail.com>
 <1608817657.14045.30.camel@mtkswgap22>
 <d77a22a9-ea8b-0785-4a9b-62056d8e8e56@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FBE4D875DB8E08FF1AF6A7ED607A1D1D36A585F0A832FCCADABAD6D4CBF13B042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201227_211055_531847_D8C1A1D0 
X-CRM114-Status: GOOD (  27.23  )
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
Cc: "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 Bean Huo <huobean@gmail.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 Avri Altman <Avri.Altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Asutosh,

On Sun, 2020-12-27 at 17:32 -0800, Asutosh Das (asd) wrote:
> On 12/24/2020 5:47 AM, Stanley Chu wrote:
> > Hi Avri, Bean,
> > 
> > On Thu, 2020-12-24 at 13:01 +0100, Bean Huo wrote:
> >> On Thu, 2020-12-24 at 11:03 +0000, Avri Altman wrote:
> >>>>> Do you see any substantial benefit of having
> >>>>> fWriteBoosterBufferFlushEn
> >>>>> disabled?
> >>>>
> >>>> 1. The definition of fWriteBoosterBufferFlushEn is that host allows
> >>>> device to do flush in anytime after fWriteBoosterBufferFlushEn is
> >>>> set as
> >>>> on. This is not what we want.
> >>>>
> >>>> Just Like BKOP, We do not want flush happening beyond host's
> >>>> expected
> >>>> timing that device performance may be "randomly" dropped.
> >>>
> >>> Explicit flush takes place only when the device is idle:
> >>> if fWriteBoosterBufferFlushEn is set, the device is idle, and before
> >>> h8 received.
> >>> If a request arrives, the flush operation should be halted.
> >>> So no performance degradation is expected.
> >>
> >> Hi Stanley
> >>
> >> Avri's comment is correct, fWriteBoosterBufferFlushEn==1, device will
> >> flush only when it is in idle, once there is new incoming request, the
> >> flush will be suspended. You should be very careful when you want to
> >> skip this stetting of this flag.
> > 
> > Very appreciate your the clarification.
> > 
> > However similar to "Background Operations Termination Latency", while
> > the next request comes, device may need some time to suspend on-going
> > flush operations. This delay may "randomly" degrade the performance
> > right?
> > 
> 
> Have you actually seen this happening? I've not come across any random 
> performance degradation concerns, hence asking.
> 
>  From what I've observed is the handling of WB buffer flush depends on 
> how flash vendors implement it. Some vendors that I've seen just create 
> a separate WB buffer in an instant. I don't know the intricacies of 
> their implementation, but I guess the new WB buffer handles the requests 
> while the previous one is being flushed.
> Anyway, for Qualcomm platforms we plan to have 
> fWriteBoosterBufferFlushEn=1 by default.

Thanks for above information and discussion : )

Actually we've not come across any random performance degradation due to
fWriteBoosterBufferFlushEn=1 as well. Since the implementation of
fWriteBoosterBufferFlushEn may differ by different vendors, we would
like to keep current configuration used in our mass-produced products
first.

But this is an interesting topic for possible termination latency of
WriteBooster flush. Maybe we could discuss with vendors to explicitly
define the required latency in UFS specification, just like "Background
Operations Termination Latency"? Then host can choose the best
configuration according to the definition provided by the device.

Thanks.
Stanley Chu
> 
> > Since the configuration, i.e., enable
> > fWriteBoosterBufferFlushDuringHibernate only with
> > fWriteBoosterBufferFlushEn disabled, has been applied in many of our
> > mass-produced products these yeas, we would like to keep it unless the
> > new setting has obvious benefits.
> > 
> > Thanks,
> > Stanley Chu
> > 
> >>
> >> Bean
> >>
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
