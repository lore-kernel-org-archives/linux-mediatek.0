Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439D3C25B06
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8H3C7vLWZ08jIC2f4kfLguCPNFh1PnkyOg0jzc2D8c=; b=DFrGcsX/3vgkwfbBxykzxCenVl
	9Z3PCtkOH+Foyby3+9o/WdJEgGihzePR8/h1tpmxzOmS27GswgKdNfGc4+IDApt5Ds6qGWulLNthn
	LLw6VC+Ci6yAFOxsjOFkohLmlhcgxIRlnwjilH9n7HWx/ZLNiZ7sj9K8ifTRWdQOtvcPWRkf/EVCX
	WdkqEMvxbjIHdZ5aahKp/lRtexROwazOPuvJUa3mmQR1LCtb9lZox5EVrF5BDF7Dh3q2aTA0HJMhb
	HbTrqqE6DR87EH3XTWuS1LYOD64VMmUm6BfRDFOXitpmNo1d/A17hsmRQ0mbrbKNVMkERvfNL3+F0
	EkE1RDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJbxS-006mEd-Fl; Thu, 04 Aug 2022 14:36:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJbxQ-006mCo-EA; Thu, 04 Aug 2022 14:36:17 +0000
X-UUID: da548dd7b68041a185febe64ad2d07d3-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8723eb6e-3e92-42f8-bb1c-b3e94ba48821,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:16524725-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: da548dd7b68041a185febe64ad2d07d3-20220804
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2108742124; Thu, 04 Aug 2022 07:36:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 22:36:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 22:36:07 +0800
Message-ID: <644d24503899e6ed8b6a7321979e11e46577a610.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Introduce optional callback
 of_machine_select
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<lgirdwood@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<daniel.baluta@nxp.com>, <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>
Date: Thu, 4 Aug 2022 22:36:07 +0800
In-Reply-To: <YuvG4drwG/rYoozp@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
	 <20220804091359.31449-2-chunxu.li@mediatek.com>
	 <YuvG4drwG/rYoozp@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_073616_512030_CA047B46 
X-CRM114-Status: GOOD (  19.25  )
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

On Thu, 2022-08-04 at 14:17 +0100, Mark Brown wrote:
> On Thu, Aug 04, 2022 at 05:13:58PM +0800, Chunxu Li wrote:
> 
> > @@ -284,6 +284,7 @@ struct snd_sof_dsp_ops {
> >  	void (*machine_unregister)(struct snd_sof_dev *sdev,
> >  				   void *pdata); /* optional */
> >  	struct snd_soc_acpi_mach * (*machine_select)(struct snd_sof_dev
> > *sdev); /*
> >  optional */
> > +	struct snd_sof_of_mach * (*of_machine_select)(struct
> > snd_sof_dev *sdev);
> 
> I don't understand why we pass this in as a function when as far as I
> can see it should always be the standard operation provided by the
> core
> - why not just always call the function?  We can tell at runtime if
> the
> system is using DT so there's no issue there and there shouldn't be
> any
> concerns with ACPI or other firmware interfaces.

Thanks for you advice, I'll remove the callback function, and directly
call sof_of_machine_select() in sof_machine_check() as following.

int sof_machine_check(struct snd_sof_dev *sdev)
{
snip...
	const struct snd_sof_of_mach *of_mach;
	/* find machine */
	mach = snd_sof_machine_select(sdev);
	if (mach) {
		sof_pdata->machine = mach;
		snd_sof_set_mach_params(mach, sdev);
		return 0;
	}

	
+	of_mach = sof_of_machine_select(sdev);
+	if (of_mach) {
+		sof_pdata->of_machine = of_mach;
+		return 0;
+	}
snip ...
}


