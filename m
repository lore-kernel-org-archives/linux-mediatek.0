Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1492C388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 09:39:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A902469B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 09:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EtMnMIjY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E3RWoJ+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A902469B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MCiMx2Lbom+dR3STwzdZb5MZ0eYNykYCl5C2/fTk/s8=; b=EtMnMIjYSCYZPpR3ctyj3rVJ2
	mrKS+6YyOwOcGRq+9CAptIJQivFgvuRM6PX4BWoSq2kCHDPfTvAny0StmoFNGzsCnfLTXcdeGE1fo
	2ljERatlo6kg+l8DCeL2kLWF2l1fXHUr5QsoCyOogEqcxxcZzkQfWbt3GiPVOt5jOjoJvhVpEYX5h
	4QlZ4PaOxNTEdAjOvX7aHZDN0YGjtCN7O40pmIEXRZkT6VCSzC75lp34i/3gz3J7w8jDZvWnHiWyj
	r1ez9EfIJJhQgmfPvTYqZ3RAfGhjPHYJKFTin/h6QPd8IQeoFavmDtLNTFZrrtmzQS++gCivhUR6A
	7BOD1Yudg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXhvf-0003oE-05; Wed, 28 Oct 2020 09:39:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXhvY-0003mN-KX; Wed, 28 Oct 2020 09:39:34 +0000
X-UUID: ccf58c9a37154384af7399d668654abf-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NyaGgpuufUFBzrnTMBUGoQ6YITkAhsSqrfDv+fq13JE=; 
 b=E3RWoJ+g4b0gquhyhIuM7PH2q26KAvPWUORHWpHdgpJuxD8G7BFerS1PbsbuRVyUl0JPBXEVwoz3KPZPfk+BpqEBJeHGeysuF6rzmvj8C6/GvctZdO0SwEwGMCmLuRMgwIfdqcQCghUC4JuVcIu7TYeWEQpBiuGmkdUNZdPvjLI=;
X-UUID: ccf58c9a37154384af7399d668654abf-20201028
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2128479893; Wed, 28 Oct 2020 01:39:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 02:39:26 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Oct 2020 17:39:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Oct 2020 17:39:23 +0800
Message-ID: <1603877963.26523.10.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 28 Oct 2020 17:39:23 +0800
In-Reply-To: <20201027131519.GA4895@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
 <20201026123325.GC7402@sirena.org.uk> <1603794538.26523.6.camel@mhfsdcap03>
 <20201027131519.GA4895@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_053933_423250_2D301D8B 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-27 at 13:15 +0000, Mark Brown wrote:
> On Tue, Oct 27, 2020 at 06:28:58PM +0800, Jiaxin Yu wrote:
> > On Mon, 2020-10-26 at 12:33 +0000, Mark Brown wrote:
> 
> > > This seems like something that would apply equally to all DMICs so
> > > should be done at a more general level rather than in this specific
> > > driver, for example it could be done in the DMIC driver.
> 
> > So you suggest that we use sound/soc/codecs/dmic.c to control the delay
> > after recording?
> > If so, should we add one more CODEC('dmic-codec' and 'dmic-hifi') to
> > dmic's dai-link? It looks link dmic.c has helped us do something to
> > control dmics.
> 
> Yes, exactly.

Thanks, if so, then the modification is mainly in the machine driver.
I will send the PATCH v2 again after you review the machine driver and
merge them.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
