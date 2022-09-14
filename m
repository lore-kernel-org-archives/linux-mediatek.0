Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A8C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 01:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtf0pV6OTBxyNK49AbgnpY+uE7h7WetWSrNYxrsJuHU=; b=L1vZewboK6Vg+Lk9vu/2NVbOux
	wbub4coaaH/J+0boYH5gQobCBeZryG1NGueeZhjFKtl1kGPvC85zCBflKHrEzWet4aYVtAI8Q5xvA
	pNK1Umoo9o+pHtbaQo0VIExWzh0RQDFbzLxBZF0nTuzYszaTRWLdFyi81nB3tMhw01ew9Lq6wLPhw
	c6qUc53Cw+0mWCcHgFrNhvMuQE/gYeOP76ehJedwu5rAsBGxh5MwX3b55dC8MJ7FKLNXpy1pgGir9
	zWiEQSmIlBJtyH8Yg5QTQW30PcNaMapB7znBEo6+8TqgskoFqFBUAbX3GR2/WZUMV1J7pzjkbynb9
	rkEvuwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHEg-003YVX-KI; Wed, 14 Sep 2022 01:30:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHET-003YJE-Gg; Wed, 14 Sep 2022 01:30:30 +0000
X-UUID: f366f20ce0004a88b297995a3932e650-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jtf0pV6OTBxyNK49AbgnpY+uE7h7WetWSrNYxrsJuHU=;
	b=f2fXZzjNKtadxACtMHBlNa47yRiQYPEXfl4BnWZyx9c11gaLPIndbgGaHmNcMD9BwCV64De28DfEL3MGobbowAgp+MTRD5EviwDRnuXsizF+mNf4ao57s7/bRc9B57Oef9XyjiRyGvwrDlMd8919s002+W5WqaUVwOlTn8I13bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:862faf89-70b9-4673-b486-633b45687a37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:11e24bf6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f366f20ce0004a88b297995a3932e650-20220913
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 256701785; Tue, 13 Sep 2022 18:30:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:29:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:29:51 +0800
Message-ID: <dccaa8ce9e3a494afb165d4b8ff02b7589241451.camel@mediatek.com>
Subject: Re: [PATCH v3 3/9] drm/mediatek: Adjust mtk_drm_gamma_set_common
 parameters
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:29:51 +0800
In-Reply-To: <90908764-b5aa-34a0-74c8-9f9215dcb89b@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
	 <20220911153734.24243-4-jason-jh.lin@mediatek.com>
	 <90908764-b5aa-34a0-74c8-9f9215dcb89b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_183029_581173_4E123A87 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Angelo,

Thanks for the reviews.

On Mon, 2022-09-12 at 12:12 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > Adjust the parameters in mtk_drm_gamma_set_common()
> >    - add (struct device *dev) to get lut_diff from gamma's driver
> > data
> >    - remove (bool lut_diff) and use false as default value in the
> > function
> > 
> > Fixes: 051524cbe62d ("FROMGIT: drm/mediatek: Add lut diff flag for
> > new gamma hardware support")
> 
> This Fixes tag contains a commit from a downstream kernel, which is
> useless
> fo upstream. Please fix it.
> 
> Regards,
> Angelo

OK, I'll fix this.

Regards,
Jason-JH.Lin

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


