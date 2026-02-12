Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EE9EDF04C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdFHMHaAi/WCOTtByCUb1vcjSy/y1NNYZ7qsG2LkLrA=; b=Y38JhmwLq5Wlbh+RGrJxLuhWzT
	/z3wcjgCrnrp8+yIYFzrLYupN3UEfKeQRu7b4P50n0K0z/5vH/RPovyelXGRgV+PuojhLbPxpdgQf
	8OFucivxHYpJ0KowzJSgFECpIwrCUiQc2ZQOIod70KpIgCoTqMTOy8Xwza8RrKedgUbrdD9rs1HJn
	79CCd2TtqJ7tUk0OphfQLMn+maAeVPmL4RlxpHmbqmieDqPau8qJmOY3rx51LmpV1iKWHs9jZLPZi
	7EaXW0RzpOk3UTJBG/jODm7Ow8i744hFa6Yz1oR/3kcFwyP5syd4y5QQLdLZ0LkaUpkrnMhm+iM8D
	p002TBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRSz-00000001j33-3y6m;
	Thu, 12 Feb 2026 07:50:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRSy-00000001j2x-2F3y
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 07:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A04F60128;
	Thu, 12 Feb 2026 07:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC780C4CEF7;
	Thu, 12 Feb 2026 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770882623;
	bh=1U0C4j4IRPA7SGJDOiYWsjuxUsF/Yn+InqOZr+cYhSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UW7NcYfnLcmYeuwcnCWMFCnTnAJiWZGMuFtNCzQcC89Q59KqG+UtJJ/t63wzf+gXp
	 zJFV7X24BaSFrqc2D++308FFCFoswzbkONC9TEKbY3OQ1Nz34y2LxFPYeLVPeh2wwd
	 B3qPrFX2eVEzXghkptS5ggmXgNs/cJFidRqxQ/FfmcnPVJf95a/X8cmUwceN+RvORy
	 h918CF+m68eNbyRZsV6824QrNdbQNdD85JxTxaBbz1GE4No6UfIToRqtpNRTH52JGO
	 tlUy0zbOjJsXZxltWyn3FlL6ud8iSt+xNfPFl7vjrqtFa8zeZ/NpXegNxJTb9hbgIg
	 CmfYBX2pXAI2g==
Date: Thu, 12 Feb 2026 08:50:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Allen Ye <allen.ye@mediatek.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: net: wireless: mt76: clarify backoff
 limit usage
Message-ID: <20260212-benevolent-peacock-of-rain-afbb6b@quoll>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770856296.git.ryder.lee@mediatek.com>
 <e39bff1d56a3f8b5146b881eef3442a4af97078b.1770856296.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e39bff1d56a3f8b5146b881eef3442a4af97078b.1770856296.git.ryder.lee@mediatek.com>
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

On Wed, Feb 11, 2026 at 04:36:06PM -0800, Ryder Lee wrote:
> Clarify the usage of path backoff limit properties in mt76 binding.
> Add explicit documentation for old generation (mt7915, mt7916, mt7981,
> mt7986) and new generation (mt7990, mt7992, mt7996) devices, including
> the difference in beamforming and non-beamforming entries.
> 
> Rephrase the paths-ru/paths-ru-bf description to make them more precise.
> 
> Co-developed-by: Allen Ye <allen.ye@mediatek.com>
> Signed-off-by: Allen Ye <allen.ye@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> v4:
> - revise commit message
> - use PCI id as the compatible string to replace "connac2/3"
> 
> v5: fix missing starting space in comment(comments)
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index ae6b97cdc..20b868f7d 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -27,6 +27,11 @@ properties:
>        - mediatek,mt7622-wmac
>        - mediatek,mt7981-wmac
>        - mediatek,mt7986-wmac
> +      - pci14c3,7915  # mt7915
> +      - pci14c3,7906  # mt7916
> +      - pci14c3,7990  # mt7996
> +      - pci14c3,7992  # mt7992
> +      - pci14c3,7993  # mt7990

These are two separate commits with their own separate rationale.

>  
>    reg:
>      minItems: 1
> @@ -252,6 +257,14 @@ properties:
>                        followed by 10 power limit values. The order of the
>                        channel resource unit settings is RU26, RU52, RU106,
>                        RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
> +                      - For mt7981/mt7986/mt7915/mt7916
> +                        - Beamforming entries for BW20~BW160 and OFDM do not
> +                          include 1T1ss.
> +                        - When 1T1ss is not used, it should be filled with 0.

Shouldn't be skipped in such case? Why filling with 0 matters?

Best regards,
Krzysztof


