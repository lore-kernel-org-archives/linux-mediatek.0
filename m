Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0FEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvJn98X8XPV3Nq54YXdhMknCnK53tr/EmI8RAl4B4Ok=; b=TkQ9LbPLpbgPq044xrTEkP9rDp
	7624h6qSNzc5mAxVJ38dZ/mLV5qluc+1B12g/VEmHu6a+Id3CmCaGp4RkDCaMFcETK07TG33n1wAA
	FI5BFKZUcVZwBaEG1/W1Bu4fX60R/q83c1xuSBg2oUDVq3sbreL96oGVlqhc9zyXWNW56750w0QlJ
	MTV4eO54M3OghtujQGfzEosAZiGxJhssMe4ZEFXZb1+bJZbU5NkxxYe3wZi7FZtbEoQtGVuDihCOR
	aVjX4kq94TEDu+PUFWbk7SY0A4QFTRDgV0UF/EuXsGH9svmxzUhUKsW3X1xGImSTGZUPi2jAE0XU5
	KzSjndcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkJn-00FEJs-8f; Wed, 23 Nov 2022 07:37:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkJk-00FEHr-LB
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 07:37:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 200CEB81EDA;
	Wed, 23 Nov 2022 07:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C77C433D6;
	Wed, 23 Nov 2022 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669189028;
	bh=DkMxWFiG8y7zqTgwJQjsxzyy9YxJGvEU4ofwChdGo24=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=d1h+bYJHsowHzhPgWLTRj8v6FjJ2pUpZ2NLH+6g1Fh73B5OLNBdkXQZYtyfPpgngg
	 ipBRG85vzD+QDjp04UzDRh8Q4dDpT0W3IHTm7gKMhA6Smo+QqRJNKtcl9Jaw9OGCIj
	 lUiNIzF2rGikvUPZW7Uw4NQz9muhwY2EPMmsU7NMkbE+tyb2BWa5sRAZHhmv+tBSuN
	 Zf9+H2P9iQeXbMa+AObglzC7rmt8OlHmT6BtkSmtBD7afuFn4QC4r5+za2oDSioQKE
	 RZ0pebMX1/QaBcWHlM+45khL0KEqr3L60/M3USuOHGHzdEMfoaQ+hnmrtXczcH5ZK5
	 WXhkrfYy84OIQ==
From: Kalle Valo <kvalo@kernel.org>
To: shayne.chen@mediatek.com
Cc: =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
  "linux-mediatek\@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  =?utf-8?Q?Howard-YH_Hsu_=28?=
 =?utf-8?Q?=E8=A8=B1=E8=82=B2=E8=B1=AA=29?= <Howard-YH.Hsu@mediatek.com>,
  =?utf-8?B?TWVpQ2hpYSBDaGl1ICjpgrHnvo7lmIkp?= <MeiChia.Chiu@mediatek.com>,
  =?utf-8?B?TW9uZXkgV2FuZyAo546L5L+h5a6JKQ==?= <Money.Wang@mediatek.com>,
  "nbd\@nbd.name" <nbd@nbd.name>,  =?utf-8?Q?StanleyYP_Wang_=28=E7=8E=8B?=
 =?utf-8?Q?=E4=BE=91=E9=82=A6=29?= <StanleyYP.Wang@mediatek.com>,
  "lorenzo\@kernel.org" <lorenzo@kernel.org>,  =?utf-8?Q?Chui-hao_Chiu_=28?=
 =?utf-8?Q?=E9=82=B1=E5=9E=82=E6=B5=A9=29?= <Chui-hao.Chiu@mediatek.com>,
  Ryder Lee <Ryder.Lee@mediatek.com>,  "linux-wireless\@vger.kernel.org"
 <linux-wireless@vger.kernel.org>,  =?utf-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?=
 <Bo.Jiao@mediatek.com>
Subject: Re: [PATCH v2 9/9] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices
References: <20221110093525.29649-1-shayne.chen@mediatek.com>
	<20221110093525.29649-10-shayne.chen@mediatek.com>
	<87ilj8pcqr.fsf@kernel.org>
	<83f60433f893331337012a6ce8ed920db67639c4.camel@mediatek.com>
Date: Wed, 23 Nov 2022 09:37:04 +0200
In-Reply-To: <83f60433f893331337012a6ce8ed920db67639c4.camel@mediatek.com>
	(shayne chen's message of "Tue, 22 Nov 2022 09:04:30 +0000")
Message-ID: <871qpup1en.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_233712_854428_693CD704 
X-CRM114-Status: GOOD (  11.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

shayne.chen@mediatek.com writes:

>> >  18 files changed, 12288 insertions(+)
>> 
>> This patch is too big, please split it. One patch per file is a good
>> rule of thumb.
>> 
>> I did see some suspicious static variables in pci.c, but otherwise I
>> basically skipped everything.
>
> Thanks for your reminder.
>
> I've splitted the big patch into smaller patches by functionality for
> easier review.

Nice, thanks Shayne.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

