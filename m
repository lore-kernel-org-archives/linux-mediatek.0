Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D39ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 04:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loCcaVWLk+xGtCivQyIW+uIMlTCaE8Aw/d9bp1bYesQ=; b=OlpyR0uHqo2Yotgn2Re7STYHX9
	pnBpwcwWsWupcn9jMaAzisAfwJPobG4MAzI70MwkC+fNTtyvnwtqPaVkHaynTDF93vCmhOKs6D1fa
	G8ObHUhqX+LzTf9ibddlLX3uTPhUIE1Sa72ZmdS39ZiRL1tC9hU1Z594FrScMA8sf1AonH7BPG68C
	zPNy0fEEpn0YEHxfMUhI60yFuj+A9BRuj+Y5HPLKwYgrGL7Un8PMRKXDAYG4uIs90WyCP2gnaOUkP
	ho6sQdFAofp4EDk2otXLWIewBorJx6/U3MJTB9kepcOgvQsVcafBNy3kBoUkhoz2f1dNeCoLPL5uJ
	yZhPs5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVmXV-002Mvl-UX; Wed, 07 Sep 2022 04:19:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVmXT-002MtN-0N; Wed, 07 Sep 2022 04:19:48 +0000
X-UUID: c2b1b5b0b8e44a9eb2faca8eebfc9bbb-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=loCcaVWLk+xGtCivQyIW+uIMlTCaE8Aw/d9bp1bYesQ=;
	b=ss5H4CG4mC5fmwTHp/x3qdQ7rkAov9y5jdfobDeAW1FfEj0wROoRvmUgm8/PGvQfe5iYvx4UKvQed7iE/B28CSYOfRvlyjaT/UOqq4xbAEnF4fiEL5reqpVeTJculozpW7MAhnPjk/E8Rh8T50fMpBvvXuVbcYbyagqJVcFOxrs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:46c43415-5f79-440b-ac24-68a0c60a60ba,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:95177221-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c2b1b5b0b8e44a9eb2faca8eebfc9bbb-20220906
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 68076243; Tue, 06 Sep 2022 21:19:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Sep 2022 12:19:01 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 7 Sep 2022 12:19:00 +0800
Message-ID: <ba1cb6b2be5da2a80bf03b71096cb4743b360299.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pwm: Add compatible for Mediatek MT8188
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jitao.shi@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 7 Sep 2022 12:19:04 +0800
In-Reply-To: <f473ecee-fd71-8783-dffc-7d7cf06a3b77@collabora.com>
References: <1661744916-15441-1-git-send-email-xinlei.lee@mediatek.com>
	 <f473ecee-fd71-8783-dffc-7d7cf06a3b77@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_211947_225881_909BEAF9 
X-CRM114-Status: GOOD (  12.21  )
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

On Mon, 2022-08-29 at 12:37 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/08/22 05:48, xinlei.lee@mediatek.com ha scritto:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > Base on the branch of Linux-next/master.
> > Split from series [1].
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com/__;!!CTRNKA9wMg0ARbw!yDov9LVWHiV_rcewJ29NmA7vkyd25pW3vUX-5ccIezPyqdbMP3ApsZFkmZxEL6lI1w$
> >  
> > 
> > Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
> > 
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hi Reding:

Gentle ping for this patch, if there is anything I need to modify,
please kindly let me know.

Best Regards!
xinlei


