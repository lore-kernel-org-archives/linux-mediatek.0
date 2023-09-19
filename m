Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F668CE79A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcx2jlIFSsxYNYZTzuc6q25cxdoVpSopebg683fouEw=; b=3O4XA1+Dw1uN/HFVqw+FNl3dOQ
	y75RUJZ8t5pXoJgngE1hloU57ShcZaRppwAEn4McXjesGV/RwvdUH5pVfU0jzFsbPrDuKBsIpH6lR
	xpzWIbtxreL2BOQ9jz4o6PO+gdzDmQcAOV9JuFoJTnRfeRDF+3Oied+2IBTA/3xMAa9R5MqrSIV4m
	hI0rLJCIv+UwE8cOjx5DD2UmmirWmTKU1XA0MZU41t+oAOX/8D+uEAHAp2YBJyuGgawh53tqnEeeU
	jksRi82kBKi2CbMQkTfZNtADudzqPNIkyH1uZtV3LZXpHr1DZYeBOhTZURADZDmdkXDgH4u5xANS2
	pe6Qv3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qih5P-001DbQ-0L;
	Tue, 19 Sep 2023 20:12:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qih5I-001DZb-35;
	Tue, 19 Sep 2023 20:12:40 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCF7B66057B6;
	Tue, 19 Sep 2023 21:12:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695154349;
	bh=Gk/Fpq7OlN/7K4OFGI5P1G3mmMaho0D846k02v3os0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwR0eVPRMgRwtMIoqmAdY40aUrrTOaSttwHcbhXy8qgtHq12Y3m49YX6lmYSBq1xU
	 s2PnktGWwhFNugqguFyl4o29yoMEWKMc3rILXbPOeUKIQwCfAvfQx4d0CASM5JCFi+
	 HQtJmlcjgXl6ssfRvrY6k4Up1JBQD7ZAzC9mfsTeHVS3WIwMxURL7BHaetASvqLmNm
	 UgxccnBaomm30ebdVozUdI13wCw2sfdlMmbo8cNARUiEmKsFp5JUB8nPQd/sakAtig
	 b0H8eiE++uIbdzfQp+sJWK+IbA5Bn63eSuDHNxglbPqc7M8to9/SU1gKd5jVAH4yKi
	 yG1nga8d1f8yA==
Date: Tue, 19 Sep 2023 16:12:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@google.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	James Lo <james.lo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] spmi: mtk-pmif: Serialize PMIF status check and
 command submission
Message-ID: <7b407eda-702a-444a-b644-5e8dc31f3991@notapiano>
References: <20230724154739.493724-1-nfraprado@collabora.com>
 <a4684a81-eb04-492a-bff6-a5ff78fe6b0f@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4684a81-eb04-492a-bff6-a5ff78fe6b0f@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_131237_140026_43631E60 
X-CRM114-Status: GOOD (  24.14  )
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

On Thu, Aug 10, 2023 at 06:03:53PM -0400, Nícolas F. R. A. Prado wrote:
> On Mon, Jul 24, 2023 at 11:47:33AM -0400, Nícolas F. R. A. Prado wrote:
> > Before writing the read or write command to the SPMI arbiter through the
> > PMIF interface, the current status of the channel is checked to ensure
> > it is idle. However, since the status only changes from idle when the
> > command is written, it is possible for two concurrent calls to determine
> > that the channel is idle and simultaneously send their commands. At this
> > point the PMIF interface hangs, with the status register no longer being
> > updated, and thus causing all subsequent operations to time out.
> > 
> > This was observed on the mt8195-cherry-tomato-r2 machine, particularly
> > after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
> > drivers between 5.10 and 5.15") was applied, since then the two MT6315
> > devices present on the SPMI bus would probe assynchronously and
> > sometimes (during probe or at a later point) read the bus
> > simultaneously, breaking the PMIF interface and consequently slowing
> > down the whole system.
> > 
> > To fix the issue at its root cause, introduce locking around the channel
> > status check and the command write, so that both become an atomic
> > operation, preventing race conditions between two (or more) SPMI bus
> > read/write operations. A spinlock is used since this is a fast bus, as
> > indicated by the usage of the atomic variant of readl_poll, and
> > '.fast_io = true' being used in the mt6315 driver, so spinlocks are
> > already used for the regmap access.
> > 
> > Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Hi,
> 
> gentle ping on this one. MT8195 Chromebooks sometimes boot to a broken state
> without it.

Hi Stephen,

once again kindling reminding you of this important fix for MediaTek platforms,
solving a real issue impacting basic functionality observed on the MT8195
Chromebook.

Thanks,
Nícolas

