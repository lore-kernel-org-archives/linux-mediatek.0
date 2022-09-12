Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD72C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iQvNSCdIGu6UTVgz7Ig2p0RKCQGqQ3bI7wc8ozG05w=; b=ooUfF2oEjX/MBjdCSqFjrUGfXr
	97SE0v0yVgyAZeSGxNpzHe2/z523qEFzZbV/qLrHvZWVPG10m6+GMX8sR61TMxtCzhSMARB58WI4b
	KZDGRzd5S2tLkemKj8wwPG59Olymx0dQtfWh9OJ71UQL2lCvGfZPvr0Pda6tGSLkEp1oSVUt2yj41
	kPe/kNuUx5E53vH1pqdt++0Ivbc4LBZefq941YNeF8sunM3f/pBx5CU78lW2j3pMkM+cqjUKMwb26
	EzKqnQlVWA5p+HsMP3hccqYvgRkIwTRlUbNyThnKTYq8JFbkHqKwFr16m77Ub/TmfgkaptmzG6QWi
	opEthScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXaGY-006dxS-KL; Mon, 12 Sep 2022 03:37:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXaG5-006dPd-Gl; Mon, 12 Sep 2022 03:37:20 +0000
X-UUID: 2427d4dd05b14fe19a527691967d6eb4-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9iQvNSCdIGu6UTVgz7Ig2p0RKCQGqQ3bI7wc8ozG05w=;
	b=eS14lgERbfazx0EJ/IX03eKDpG/nbcEiqebhl6SJ0nXpVeVk0wUjynSkBEPT30UyRpMh7PPAvPGn3L7Vb+Z5XTI3kFVCfaEFUgETW8QOu93VC9H5aT4ZWR5qW4zg7zVgEcGhevqbG6ttaTTXtkGuLvmscO/ix2FW1eoGvShTwRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:63891a43-d5a8-4666-a8e0-db4bd8fd1f90,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:193c12ec-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2427d4dd05b14fe19a527691967d6eb4-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1988638787; Sun, 11 Sep 2022 20:23:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 12 Sep 2022 10:52:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 10:52:38 +0800
Message-ID: <3b0dd4bf01400641a6b622f2c5344c9ded8b5995.camel@mediatek.com>
Subject: Re: [PATCH v2 0/6] Add first version mt8188 vdosys0 driver
From: Nathan Lu <nathan.lu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Sep 2022 10:52:37 +0800
In-Reply-To: <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
	 <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_203718_040499_6C551A02 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Krzysztof,

Apologize for the incovenience.
I will remove it.

Best regards,

On Thu, 2022-09-08 at 15:14 +0200, Krzysztof Kozlowski wrote:
> On 06/09/2022 10:44, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > This path is based on [1] and [2]
> > [1] Add MediaTek SoC(vdosys1) support for mt8195
> >     - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416__;!!CTRNKA9wMg0ARbw!zuOwDY1dopRZLeZe36Ate1lspoWzDaM06Gj2x8zf9OprwhIMON5dJOlixUGivOIU$
> >  
> > [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
> >     - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269__;!!CTRNKA9wMg0ARbw!zuOwDY1dopRZLeZe36Ate1lspoWzDaM06Gj2x8zf9OprwhIMON5dJOlixX9HBrk2$
> >  
> > 
> 
> Can you stop ccing internal/fake/non-existing email addresses?
> 
> Your message couldn't be delivered to wsd_upstream@mediatek.com
> because
> the remote server is misconfigured. See the technical details below
> for
> more information.
> 
> 
> Best regards,
> Krzysztof


