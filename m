Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 06:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593FC60F5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 06:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 593FC60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzFLZV72aT2BedJPfPhv+kpVBF2cfQ5UJBnALgt9Qc4=; b=Jf/Bp9g29n+lYS
	+02ElTSwnGJXS4Qw67oUZwr1FQVSerrSDrZtsAZt2HGAMHGjaCm0ZY0DbUWt5yIEsg2k1bjTDoTrK
	lDTxl/xQGapYovLTxzusd0wP2MjDeGTxxyqT7/ljH/05z/W8xsicgPrqofe9AUaHyhyWkAwzJxmxG
	IDKvupEwCovub1fAHTx6U8WR/abL9tkG60XDp8MQMzSg0Da4PawMde+F6IWyiCTQv/8knE8mx4VfA
	x9wtkD8wSdHeGt7MGZvip0XyRLdMDch0NxV4QmB8OB0bxQrHITqW/ATXZn6RYOjykA3JCh/dSG/+C
	ESNMaebwDQvMI60WBpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPf4K-000Lot-Su; Mon, 13 Sep 2021 06:03:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPf47-000Lla-93; Mon, 13 Sep 2021 06:03:41 +0000
X-UUID: e172e24436f1454eb47310ca3c93990b-20210912
X-UUID: e172e24436f1454eb47310ca3c93990b-20210912
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2143350107; Sun, 12 Sep 2021 23:03:32 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Sep 2021 22:55:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 13:55:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Sep 2021 13:55:38 +0800
Message-ID: <5fa1e99f1b9097336a3e610dc383170f09036b14.camel@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
From: Trevor Wu <trevor.wu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>, 
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dan.carpenter@oracle.com>
Date: Mon, 13 Sep 2021 13:55:38 +0800
In-Reply-To: <20210910102358.GC4474@sirena.org.uk>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
 <20210910102358.GC4474@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_230339_354692_6E7F816B 
X-CRM114-Status: GOOD (  17.68  )
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

On Fri, 2021-09-10 at 11:23 +0100, Mark Brown wrote:
> On Fri, Sep 10, 2021 at 05:26:13PM +0800, Trevor Wu wrote:
> 
> > When memory allocation for afe->reg_back_up fails, reg_back_up
> > can't
> > be used.
> > Keep the suspend/resume flow but skip register backup when
> > afe->reg_back_up is NULL, in case illegal memory access happens.
> 
> It seems like it'd be better to just allocate the buffer at probe
> time
> and fail in case we can't get it, I'd be surprised if there's many
> platforms using this hardware that don't also end up suspending and
> resuming.

Hi Mark,

Thanks for your suggestion.
I agree it's better to allocate the memory at probe time.
I think we can still keep the implementation in the suspend/resume
function as a fallback solution if user doesn't allocate the memory in
probe function.

In the new mediatek SOCs, regcache has been used to handle register
backup.
Do I need to add the buffer allocation on probe function to the
platform in which mtk_afe_suspend and mtk_afe_resume are used?

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
