Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4815DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 01:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ooavMI26VS/rgEsvGJZdTi0rwPkW4R7VrMOyd8Gas0=; b=CUtVP85as7Mv8OGFHks9xsqLjF
	ibPV1xsT0IPDuYBq8DYZu6onOxn+/bam7Q3ksXy8gM0RW5NPc5Fxd+0EpCQRPWRz13mUPS7cKD6OR
	PNAetIaFToQyfw423Kgwvco2FM1kCEo4hGZym8K8M1wCAbYCdgI6+gfhuCZu1ThyeLsYuF3oWjpLb
	UYcANNfCERDPCYIWIOaiO1PBTNIYCACp0lk7cIVcWOBrzl4m4kgKSW1MBBiJEhWna3oZpfViMtD0U
	gH+btxttUTiDoLQplKwSEz2uPTpk4dR8AikPtdne590aMHg6jgdQVelZJfGBcZ7Sc/hV7XVKzZpbK
	6219HA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBIv-00D5wF-J8; Thu, 22 Sep 2022 01:47:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obBIt-00D5vm-On; Thu, 22 Sep 2022 01:47:04 +0000
X-UUID: 6ffda3f2c6f3430eb62fb4e4a7a00dc4-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4ooavMI26VS/rgEsvGJZdTi0rwPkW4R7VrMOyd8Gas0=;
	b=k/ln69CKqBDVX43egJxyQbJb2YLHXlhn0l00XZkk56xmJaRTmmRtp0xOx57ulhGl4yt+g3OJrEm6sUAesR8+NU4YsPaFYDE2+ietPQiRgrGQ3INUE+FypzW5KDYWUZSk95s8MxTMp55EKsLKfM79sykKiRY1LSHyfjYQGtTyiMw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:7d90c5db-cc03-4be9-82aa-388686b81604,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:8346785e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6ffda3f2c6f3430eb62fb4e4a7a00dc4-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1666423967; Wed, 21 Sep 2022 18:43:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 22 Sep 2022 09:42:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Sep 2022 09:42:51 +0800
Message-ID: <45bba23b9bea4c5df0ac1751c9dcd8f1ce5df6e6.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
From: chunxu.li <chunxu.li@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
	<daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>
Date: Thu, 22 Sep 2022 09:42:51 +0800
In-Reply-To: <dbe3f7fb-5fae-b147-f824-cd39ba3900ca@collabora.com>
References: <20220921120239.31934-1-chunxu.li@mediatek.com>
	 <dbe3f7fb-5fae-b147-f824-cd39ba3900ca@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_184703_821356_94750D9C 
X-CRM114-Status: GOOD (  10.34  )
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

On Wed, 2022-09-21 at 14:17 +0200, AngeloGioacchino Del Regno wrote:
> Il 21/09/22 14:02, Chunxu Li ha scritto:
> > add pcm_pointer callback for mt8186 to support read
> > host position from DSP
> > 
> > Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
> 
> Hello Chunxu,
> Can you please also add this, along with the .pcm_hw_params callback
> to mt8195.c?
> 
> Anyway, for this one:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Sure, certainly.


