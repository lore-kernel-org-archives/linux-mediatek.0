Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75311C98304
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P0k3hiKGkpk1Fi1QdfvymEGAMVjJIDevylceiC3XnI=; b=SAdBSmLDqGxr1e46x5adpwDyXo
	D/Q66J3Ufk2bRHCPlAJOXWJnDQORF3anuHMcTkAI/Yb+upaXw+8f3Z2tQT6MfS+a7TKsMzQv5UtcA
	QqIPCQV10rj5PzCsDccl//maMIRWTKzpWe61t4uZShd2GoILX2Fz0pECPzwCZ/HzoVJ+/AcBEEeyf
	5uqUYCI+hSReXHlcKxDWf3e/5EHQtXgrqKasKW2UBnkLKHblO8YvQ7ohlA3G5i+Jncrl/FOxUAFUX
	4EOEF8Bxm+7gcNsSTkoj/xEoA52GixPFD9RWCxvUF8L5UxXvh9afPnTJcgLo46SUcavlqIepDeAui
	dE6DYp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PLX-00000008oyH-15TT;
	Wed, 23 Sep 2026 15:57:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PLU-00000008oxf-2nZm;
	Wed, 23 Sep 2026 15:57:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03D7A4400C;
	Wed, 23 Sep 2026 15:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D101F000FF;
	Wed, 23 Sep 2026 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790179039;
	bh=4P0k3hiKGkpk1Fi1QdfvymEGAMVjJIDevylceiC3XnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=El4Zf1lkzCwXQ1+o2MLB2VmC3YE1om69fiHU41tHfctUSij3bfIWxCcUcd2fwlH7+
	 eJUymQ0VGc/4/3ZpNgw+flxz/v6SoBqs/mDE0qGc2jES7+RKw8PJ1ll2hInOUJ+FRV
	 2WfyL4bRk1oj5Kyo0FXCGw/bYmfOgn9R4ogfk2j80bFZ2RSJxEOj86q3Y2m57dgk+T
	 F8BJB8svO+7DvEdUXYshAcbg6NvFNr3VOhUxMN2QJWRMEZbZVtU+nkvAnmZZbQgXL1
	 ZKjezw1N5ZwVOTWUS2IMkZSOT8FCuclWXdcimT+F9lrH2x8mZagysE5MKfxpCBLHHN
	 qzIFw5ZLkYNJw==
Date: Wed, 23 Sep 2026 10:57:18 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yong Wu <yong.wu@mediatek.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iommu: Describe MT8195 infra IRQs
Message-ID: <20260923155718.GG27237-robh@kernel.org>
References: <20260921232716.3134140-1-robh@kernel.org>
 <bef176a0-7b13-4753-9d9c-494a0bf04cea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bef176a0-7b13-4753-9d9c-494a0bf04cea@collabora.com>
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

On Tue, Sep 22, 2026 at 01:45:05PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/22/26 01:27, Rob Herring (Arm) wrote:
> > The MT8195 infra IOMMU has one fault interrupt per IOMMU bank. Require
> > the five bank interrupts, named bank0 through bank4, for this
> > compatible. Keep other MediaTek IOMMUs limited to one unnamed interrupt.
> > 
> 
> Why are you introducing interrupt-names, and why would that be a required property?
> 
> I disagree - interrupt names are not necessary here.

I agree. Not enough review of this one on my part.

Rob

