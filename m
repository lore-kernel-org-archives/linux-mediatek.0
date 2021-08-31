Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23483C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 03:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB00E6102A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 03:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB00E6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6kvsmCZil7138IyBM4l07bT+z6tv0g9keIhogFf0X8=; b=pKZuSDacnXKxq+
	+46fPCuPGAcngEgjB74YhebyB7KG6SE6xaUpSffHMT1NNT8drD3gx6gYkMjs5UqtISfFZYJ7ehr6b
	/4PXt0gLUXpEVinIPVm+2CUf2hAPZnMX9KOpUkaguyT+ucV17flSkBwVKOKyGVD+8XGuTvebvWJYB
	VyplaDESpD4ej2tJrylNOsrnrbMwcFkkITWMSkCxL72PBaWg+M8ATy6+8H+615rC7hwDlmdydn/re
	ITRzd6UwJy+QXWs+8BWEqE4/UYRxPnwVWzIOgtRtW2frK1E7DlhM3srh6ITxwdgDqgCCdRBkp4c1D
	cqMmt/+xVjY05aBQ6UtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKupS-001GZu-GE; Tue, 31 Aug 2021 03:52:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKupM-001GXf-5Q
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 03:52:52 +0000
X-UUID: 8b44f0914de440339efa80746b3292bb-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lnxzkb/YsRsEyZLnSbd3aJpo5IND2ZTKMjx1rMjih50=; 
 b=XjTqt6ZFXGj5N93fldUdxjUbI5ENSvGFsJCh2BK3/LSzeuY8MSJLfp4lHPMulatf3QF39j2i3xKRNfFTV/wAuU193N1/7anDKoLIUY9Mo+w5SpDVuKklzCKaEL3xKlXLx/P+Lk4QMoWZ+TcoR6cR7SaNpkDjY6RHLSpboGDrrSc=;
X-UUID: 8b44f0914de440339efa80746b3292bb-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 307461628; Mon, 30 Aug 2021 20:52:40 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 20:45:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 11:45:35 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 11:45:35 +0800
Message-ID: <1292ba30d5305ab53fae51bcdaf50af16098f597.camel@mediatek.com>
Subject: Re: [PATCH v4] mt76: mt7915: introduce mt7915_mcu_beacon_check_caps()
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 31 Aug 2021 11:45:35 +0800
In-Reply-To: <d72dbfa5ce55cfd1e6700979b9f3566edfdae340.1630217348.git.ryder.lee@mediatek.com>
References: <d72dbfa5ce55cfd1e6700979b9f3566edfdae340.1630217348.git.ryder.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_205248_278173_80048181 
X-CRM114-Status: GOOD (  10.33  )
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

On Sun, 2021-08-29 at 14:17 +0800, Ryder Lee wrote:
> Beacon elements might be changed by hostapd configuraion, so driver
> should compare both IEs and PHY capabilities to get the least common
> denominator before association.
> 
> Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> My previous v4 didn't get to patchwork, so resend it.
> v4 - remove extra +.
> v3 - rebase and rework LDPC part.
> v2 - clean up codes.
> ---

Please ignore this one. We will merge it to another series as a common
ground.

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
