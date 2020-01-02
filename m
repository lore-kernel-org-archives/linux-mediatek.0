Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22048C2D0DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 09:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F2721734
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 09:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTKQkvBU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PuSL3Oqd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F2721734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6tPptR0Cd7FZATAcVeVZ1+IbD1DHejVGlxQ9AWrbe4=; b=PTKQkvBU9XoXX4
	ttEFGc9gnxv2PEqL1peZfCNi38pC4/o5XJ4uo+ELsao6PL78naQIf9la2sZN0C8a16zglHVzbw9bX
	EJyTv93/g9qbrONqcr6kphUyhgciOVcv+7Qq9GjMIyDA+Hgx7gBC7tNFGD6b95AH5DE6xBqnZgxM4
	q+TyM5DS2WGWOgn2L/SwxL0JOMNkZp4ukdY3bPqZ9u5k1ep0Qd0EaHZv8rzhpbaoXOeIu9iHlUafM
	la4qm3Fq55oeVGbxRuRtMTqGFPA5fu2q7sTLCQu+vyoDntqbToqR3XbyaRPvgkfGpMvgJsZiGdOyn
	imusXT3/HHBh1awHxk/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imwNU-0003HN-LX; Thu, 02 Jan 2020 09:02:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imwNS-0003GN-UB
 for linux-mediatek@lists.infradead.org; Thu, 02 Jan 2020 09:02:48 +0000
X-UUID: 2928ad0edb744747b6019b2f87993e81-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KG5wsHgrhZl10PEHCnPs6GHV74q8j9w1qmh4P5J1XhM=; 
 b=PuSL3OqdJRpGb4HpMtfHs36bBtT1VMGRcTyr7zfyrJUGM6tyDmmR9SWb91ktipRYnTx7stxLQ1a5wB+U35/9pLD+t5jNnI9V5gcSiHprQoN8s3R6ziz1unHRZwHfXonSElVQx1cqj3pG6CQJseJGf4M9NmJExVs5w4M4lssf1hM=;
X-UUID: 2928ad0edb744747b6019b2f87993e81-20200102
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 797817518; Thu, 02 Jan 2020 01:02:39 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 01:02:41 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 17:01:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 17:02:38 +0800
Message-ID: <1577955756.23575.2.camel@mtksdaap41>
Subject: Re: [PATCH v7 1/6] Check gpio pin number and use binary search in
 mtk_hw_pin_field_lookup()
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Light Hsieh <light.hsieh@mediatek.com>
Date: Thu, 2 Jan 2020 17:02:36 +0800
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_010246_973540_D0EE32F2 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: linus.walleij@linaro.org, sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2019-12-31 at 21:41 +0800, Light Hsieh wrote:
> 1. Check if gpio pin number is in valid range to prevent from get invalid
>    pointer 'desc' in the following code:
> 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> 
> 2. Improve  mtk_hw_pin_field_lookup()
> 2.1 Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
>      search.
> 2.2 Correct message after the following check fail:
>     if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
> 		rc = &hw->soc->reg_cal[field];
>     The original message is:
>     	"Not support field %d for pin %d (%s)\n"
>     However, the check is on soc chip level, not on pin level yet.
>     So the message is corrected as:
>     	"Not support field %d for this soc\n"
> 
> Change-Id: I498a18df73e6a693e0e35635d5b92b8dc9c063ac
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 27 ++++++++++++++++++------
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 25 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 6 deletions(-)

This patch series change MTK pinctrl driver, please add 'pinctrl:
mediatek: ' as prefix.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
