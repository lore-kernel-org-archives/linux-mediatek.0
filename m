Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995EEC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3l/BjGiDj7ogx0ua5ecB5Kqs/UfoZIgMYIj4zv4hAo=; b=kGsLxnhd7U9CB1cj7960YBpvBU
	0hSD9eujgr8iIsay2EBDm86TTQhrQvKtiwZqbgg+yEPERzAzo05M3p27EViFLVvaw7JUNk2057DZM
	YNrPDtCJCrG8apys0BjTGW7m4dx1sNvghCaOvU4DzNfMbGHGGDZPVY+exYAta4QesFYsVn24kJOX6
	yFhJ+anXk6IAuIrye6fe23QOX1dAnuGgqz3BAHnSIUNnAOVvOhUVvrztfK0WvqbbN51Ycb+L67IAl
	27nkhja6Nmhv8u0EjDQDzBFc5B4KKM4ixUPKeqmO16mFSqtB9NGtI7mht2ELsvlfBw8QXFZ546daY
	xS/F5Hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJc92-006rh0-3S; Thu, 04 Aug 2022 14:48:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJc8q-006rc0-9I; Thu, 04 Aug 2022 14:48:05 +0000
X-UUID: 80bb77c7f69c46b3954c88cb0aab8430-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3a20d388-fdac-4089-9559-dda90b1b1844,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:45ce4dd0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 80bb77c7f69c46b3954c88cb0aab8430-20220804
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 411699563; Thu, 04 Aug 2022 07:47:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 22:47:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 22:47:48 +0800
Message-ID: <767ff0f7f40711b8ecda545e43e87036e88f0f22.camel@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <peter.ujfalusi@linux.intel.com>,
	<tinghan.shen@mediatek.com>, <pierre-louis.bossart@linux.intel.com>,
	<lgirdwood@gmail.com>, <project_global_chrome_upstream_group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<yc.hung@mediatek.com>, <matthias.bgg@gmail.com>,
	<sound-open-firmware@alsa-project.org>, <daniel.baluta@nxp.com>,
	<linux-kernel@vger.kernel.org>, <angelogioacchino.delregno@collabora.com>
Date: Thu, 4 Aug 2022 22:47:48 +0800
In-Reply-To: <YuvKjn3cW5im2Yw9@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
	 <20220804091359.31449-3-chunxu.li@mediatek.com>
	 <Yuu+elYxBv3xZ1O2@sirena.org.uk>
	 <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
	 <YuvKjn3cW5im2Yw9@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_074804_364869_7C3B6EB9 
X-CRM114-Status: GOOD (  17.56  )
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

On Thu, 2022-08-04 at 14:33 +0100, Mark Brown wrote:
> On Thu, Aug 04, 2022 at 09:21:37PM +0800, chunxu.li wrote:
> > On Thu, 2022-08-04 at 13:41 +0100, Mark Brown wrote:
> > > On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:
> > > > +		.board = "mediatek,mt8186",
> > > > +		.sof_tplg_filename = "sof-mt8186.tplg",
> > > The mediatek,mt8186 compatible looks like a SoC compatible not a
> > > board
> > > compatible...
> > Our dts config as below:
> > kingler board:
> > compatible = "google,corsola", "google,kingler", "mediatek,mt8186";
> > krabby board:
> > compatible = "google,corsola", "google,krabby", "mediatek,mt8186";
> 
> So the SoC is listed as a fallback for the board and things work out
> fine.
> 
> > Which of the two approaches do you prefer?
> 
> I think it would be clearer to keep what's being matched the same but
> rename the .board field to be .compatible, or possibly
> .system_compatible
> or something if it's unclear what's being matched.  That'd be more
> normal for specifying a compatible string anyway.

Appreciated for you advice, I'll rename the .board to .compatible as
following:

+	.compatible = "mediatek,mt8186",
+	.sof_tplg_filename = "sof-mt8186.tplg",



