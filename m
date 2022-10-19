Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED91C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOtMixS+5/9jg/cO0QDH/kcpFWhrEiMh8wiypx3AoSw=; b=O6aXluH3H311xBj++ItGmfqMaL
	1PD+v5Ne7/eUmfxSa5OgR0YsIZMHkKaC6mKzBQfkDJYRDsUcneiffLGQLFSfvNHT/r2yJw+kbWOsG
	BkwRLNPMP6fKXWDYrsTv9Czh+Mu0KgRmDCe/PSdK1cvz3vkyJwXE7SZwFfeX6iBY+a2rzvIevKFAE
	oi9Xe0WOx3wvobgi0pO8nEjhjKlgFw84Bbk/F0ppj66nlA4LMp8ZFAJFlmpMUx2HySDxDsZt3woVQ
	OgYs0KyhcPhu6Oo221Anf6glRAQdGRGlw3nbKsxvoy/uNYXXn3z85c7LkbhYDbmS4sxI06H8vIsl4
	YPFKxJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5uA-00013k-7K; Wed, 19 Oct 2022 10:02:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5u7-00012u-QO; Wed, 19 Oct 2022 10:02:29 +0000
X-UUID: da9be58c79854748a964acbfa7f14780-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WOtMixS+5/9jg/cO0QDH/kcpFWhrEiMh8wiypx3AoSw=;
	b=Tjno+ZpmHK1WCkroBzKXdSTGEVMjjLHBOA4NYTjhwZKylNXhQXsXLRBayIQTeekiCNZ9JDaMAVcu8sRgTJjCEmrveCT4ZxiPLbbmxqv4LFBPZGXWH9fshTlYfYBnkgJnQLTgYLsQNQfRt/5iyPUcFisaNoSsfEeq55jhHi5mPds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:7434e833-2526-4b26-9f16-bac2796ab883,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:bc2dc6ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: da9be58c79854748a964acbfa7f14780-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1498607650; Wed, 19 Oct 2022 03:02:23 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 17:21:45 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 19 Oct 2022 17:21:45 +0800
Message-ID: <b153e8c6fa9e740a73ea7f2392488526d9b4d10f.camel@mediatek.com>
Subject: Re: [PATCH v3] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: <thierry.reding@gmail.com>, <matthias.bgg@gmail.com>,
	<jitao.shi@mediatek.com>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 19 Oct 2022 17:21:51 +0800
In-Reply-To: <20221019071954.qv67h3brj6vnhxpw@pengutronix.de>
References: <1664447209-19417-1-git-send-email-xinlei.lee@mediatek.com>
	 <20221019071954.qv67h3brj6vnhxpw@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_030227_878912_240A6280 
X-CRM114-Status: GOOD (  19.59  )
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

On Wed, 2022-10-19 at 09:19 +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Sep 29, 2022 at 06:26:49PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > In the original mtk_disp_pwm_get_state() function, the result of
> > reading
> > con0 & BIT(0) is enabled as disp_pwm.
> > In order to conform to the register table, we should use the
> > disp_pwm
> > base address as the enabled judgment.
> 
> I assume the change is fine. However I don't understand the commit
> log.
> My guess is you mean:
> 
> 	mtk_disp_pwm_get_state() wrongly uses bit 0 of CON0 to judge if
> the
> 	PWM is enabled. However that is indicated by a bit (at a
> machine
> 	dependent position) in the DISP_PWM_EN register. Fix this
> 	accordingly.
> 
> > Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API
> > .get_state()")
> > 
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> 
> Nitpick: There is no empty line between Fixes: and S-o-b.
> 
> Best regards
> Uwe
> 

Hi Uwe:

Yes, as you describe, I will remove the blank lines you mentioned in
the next version.

Best Regards!
xinlei


