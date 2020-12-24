Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D594C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 13:58:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5DC622287
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 13:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5DC622287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BLSGWrwvi9TR0fPbKizGfTpFh1E7b1CZMXM4+77KQkM=; b=P20/L1wxCkYQhCK9Bm9kQ0v7e
	ISa9LmjWqKXHGDWVpQzOsllSfq4hl84K1SPnARq+TYc4G2J0LQVRtp+J4QqAhUkdIvs3iRqv0xh21
	qfyNYjPRMty151P2ywdibrDknQekK4XyKaD9U0DJaDHBS1XBEtCxw1RPOjKxMNyMD+AxgXbrk5pBv
	quswj0PlnIWFFn2yIhPcHi+En3y1ehJrOkL91+AUpG9TkevO/K+BaQ9XRrimrdho+BGGmz8GeS52g
	+OFipwRnJSIqNTU2PavZCSp16Ic9tnQNOYiHfZCyp2aPKce9Nj/6ofMk8wP0wmecJG/uK8VoDS8Os
	iLdSFO8bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksR7x-00026u-Ef; Thu, 24 Dec 2020 13:58:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksR7t-000261-GO; Thu, 24 Dec 2020 13:57:58 +0000
X-UUID: 1643330dbfc74742b634adfdb1a4bfff-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z5h5EwYy/XrQnTmDEIGcQxTHLr/QiYtC7dM7hPx7/cQ=; 
 b=bACbrIL5btHj0ikmpw8hM6JT3CkZRns+pV5M7rlP0ZVXGieDjmTzia4SjovNA4dE/iMIdNAyCNXQE1erSMncdBJYanBImHeyRfFsfKL5uMLwNO+UiTNHVr1+CIxHAM+9WyN2iNKoGT4Afrr+5sHt6L5e7IhEEa9fPlUYGk4LwTw=;
X-UUID: 1643330dbfc74742b634adfdb1a4bfff-20201224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1606107664; Thu, 24 Dec 2020 05:57:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 05:47:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 21:47:35 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 21:47:35 +0800
Message-ID: <1608817657.14045.30.camel@mtkswgap22>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bean Huo <huobean@gmail.com>
Date: Thu, 24 Dec 2020 21:47:37 +0800
In-Reply-To: <5eb12622222bd9ba5e705801a204f3160ba3966b.camel@gmail.com>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
 <1608796334.14045.21.camel@mtkswgap22>
 <DM6PR04MB6575D0DD2C04692AEF771494FCDD0@DM6PR04MB6575.namprd04.prod.outlook.com>
 <5eb12622222bd9ba5e705801a204f3160ba3966b.camel@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E5D6A4B292CE8157DB5E053A6579C29FC5F9632B357D9219E59E6662DB493D8A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_085757_761843_4094E178 
X-CRM114-Status: GOOD (  20.68  )
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
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
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
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri, Bean,

On Thu, 2020-12-24 at 13:01 +0100, Bean Huo wrote:
> On Thu, 2020-12-24 at 11:03 +0000, Avri Altman wrote:
> > > > Do you see any substantial benefit of having
> > > > fWriteBoosterBufferFlushEn
> > > > disabled?
> > > 
> > > 1. The definition of fWriteBoosterBufferFlushEn is that host allows
> > > device to do flush in anytime after fWriteBoosterBufferFlushEn is
> > > set as
> > > on. This is not what we want.
> > > 
> > > Just Like BKOP, We do not want flush happening beyond host's
> > > expected
> > > timing that device performance may be "randomly" dropped.
> > 
> > Explicit flush takes place only when the device is idle:
> > if fWriteBoosterBufferFlushEn is set, the device is idle, and before
> > h8 received.
> > If a request arrives, the flush operation should be halted.
> > So no performance degradation is expected. 
> 
> Hi Stanley
> 
> Avri's comment is correct, fWriteBoosterBufferFlushEn==1, device will
> flush only when it is in idle, once there is new incoming request, the
> flush will be suspended. You should be very careful when you want to
> skip this stetting of this flag.

Very appreciate your the clarification.

However similar to "Background Operations Termination Latency", while
the next request comes, device may need some time to suspend on-going
flush operations. This delay may "randomly" degrade the performance
right?

Since the configuration, i.e., enable
fWriteBoosterBufferFlushDuringHibernate only with
fWriteBoosterBufferFlushEn disabled, has been applied in many of our
mass-produced products these yeas, we would like to keep it unless the
new setting has obvious benefits.

Thanks,
Stanley Chu

> 
> Bean
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
