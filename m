Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F852C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVtFVVLuXt+0fSxOSYxY3n4H8Cvla5xZWG2UKu1ZiHg=; b=QTo0vMUwa5PWH7jzhp9KV5gArM
	4/LozMwVIn6T4PflUSI2iS8n/X2ut/7ij5GB1tX7ph7FmzIY3Fse+mBV1Tk9ReQlcr10TRte5CktN
	YVTyfoRar7DHoL57gD6GAotfS51EauOuWETLhOesixg+W5SKiQzUsJxE08rxDtiW3YQAzkmgs98nI
	NF573ZyW+ttfHekNRT/8cdiQPl4a0pymq9cYSIbP1FVbXcLBh/y7pvBRAox0SRhvDWxlVf27jPjWk
	8Ymo5hD5S+5G+T6YHvTK/ytBmSDx0rKWuWk4zjlaXFlbuDbro+/eznu0NkzSobWv/H6va5fgM4fz2
	3dYNQtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJb7D-006QxB-SF; Thu, 04 Aug 2022 13:42:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJb7A-006Qvl-Pl; Thu, 04 Aug 2022 13:42:18 +0000
X-UUID: 3e251296e14145c3bab34e2a64baf42d-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a51b6b13-b748-4f7f-8035-ee0e1a152d3c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:34964625-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3e251296e14145c3bab34e2a64baf42d-20220804
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1164616387; Thu, 04 Aug 2022 06:42:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 21:21:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 21:21:37 +0800
Message-ID: <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<lgirdwood@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<daniel.baluta@nxp.com>, <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>
Date: Thu, 4 Aug 2022 21:21:37 +0800
In-Reply-To: <Yuu+elYxBv3xZ1O2@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
	 <20220804091359.31449-3-chunxu.li@mediatek.com>
	 <Yuu+elYxBv3xZ1O2@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_064216_848173_5E2F1E9D 
X-CRM114-Status: GOOD (  12.64  )
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

On Thu, 2022-08-04 at 13:41 +0100, Mark Brown wrote:
> On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:
> 
> > +static struct snd_sof_of_mach sof_mt8186_machs[] = {
> > +	{
> > +		.board = "mediatek,mt8186",
> > +		.sof_tplg_filename = "sof-mt8186.tplg",
> 
> The mediatek,mt8186 compatible looks like a SoC compatible not a
> board
> compatible...

Our dts config as below:
kingler board:
compatible = "google,corsola", "google,kingler", "mediatek,mt8186";
krabby board:
compatible = "google,corsola", "google,krabby", "mediatek,mt8186";
they all use the same sof_tplg_filename, so i use "mediatek,mt8186" to
match these.

The original code looks like the following:
static struct snd_soc_acpi_mach sof_mt8186_machs[] = {
	{
		.board = "google,kingler",
		.sof_tplg_filename = "sof-mt8186.tplg",
	},
	{
		.board = "google,krabby",
		.sof_tplg_filename = "sof-mt8186.tplg",
	},
	{}
};

Which of the two approaches do you prefer?



