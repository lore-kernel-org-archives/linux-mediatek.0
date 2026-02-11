Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D252AEB596B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toQ9QOGZTFOtRYTxXhRUech4kE+Fgjq/wdPjZw6jdW4=; b=ITUcQQTwL3AMKaG0oJNesXH4BO
	3e2GE5AHLVNLc6w7tUI5HAGbLP96A5u+IzIA1mNJnXw1rR/0EjSbqNdBrpOFTkzBC4Hqo1xdfvyek
	6ENJB/xmlGuiLLVJ81u2gQh5pYfILD6j8RfcnHCliG1yDPIRnxGFrmBbwcM/kJGb/JNqnf6Abz1WR
	ptmKTNzqb7JMQwdUNCI0huF5wQup2LldhCnholjZDzilCgNaMgYaKRGwX96pbcWLk9lNiQzNmjxRD
	/z3td2wlTXdsG28/H0s2Yu9Ao9YKuj6hl50W4dmIZcKepVQlY6kJdl39NC+oXOrhFqgujze9KYKpc
	aHiZ70fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3lC-00000000ID7-2IYA;
	Wed, 11 Feb 2026 06:31:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3lA-00000000ID1-43OV
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 06:31:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E6E660131;
	Wed, 11 Feb 2026 06:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A645AC19424;
	Wed, 11 Feb 2026 06:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770791495;
	bh=96Csl2k5p8So9LCLJZObu6oNFWwMbBKL5FReb3XWCp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVKRKV1+1+5bQym0epwv9J9y098sYD/INBDZTtCvNCKAMhS9tGtDqDfQNEJxY9Fjy
	 EknYhrawCeJsTm0O80cSHkacowA7W0l9rT5EPX890W/I1DlY4/zXMEriGDFTRtL575
	 8xgCs37Nbe4vXM2+ZjL21AV7wc0/GAsNFXyLY88dahO9s8cwiqGbEfMJzcGuOAFV+X
	 IwcQJY4zCi4tYUGSTXWhHOnT22yGmRFJdIZqL6s5SBRe9mmCPI/rmpgIU97iTH4jWW
	 mW2nM/Kk72x8n/vesACEfDrjneDlaVsWvOoOf7Uu/GJMy5tBvxOKe3aQwBMzHTJSEU
	 0ts+QqITnd5vg==
Date: Wed, 11 Feb 2026 07:31:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Allen Ye <allen.ye@mediatek.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: wireless: mt76: clarify backoff
 limit format
Message-ID: <20260211-miniature-chital-of-plenty-1a71df@quoll>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770746444.git.ryder.lee@mediatek.com>
 <69521aebefef405bad5117d4d5d5fef4a5dfb7e8.1770746444.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69521aebefef405bad5117d4d5d5fef4a5dfb7e8.1770746444.git.ryder.lee@mediatek.com>
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

On Tue, Feb 10, 2026 at 10:08:56AM -0800, Ryder Lee wrote:
> Clarify the format of path backoff limit properties in mt76 binding.
> Add explicit documentation for connac2 (mt7915, mt7981, mt7986) and
> connac3 (mt7990, mt7992, mt7996...) devices, including the difference
> in beamforming and non-beamforming entries.

I do not see any reformatting happening.

> 
> Also reformat the description to make is more precise.
> 
> Signed-off-by: Allen Ye <allen.ye@mediatek.com>
> Co-developed-by: Allen Ye <allen.ye@mediatek.com>

Incorrect SoB chain. Read submitting patches.

> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index ae6b97cdc..4156e1c97 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -252,6 +252,16 @@ properties:
>                        followed by 10 power limit values. The order of the
>                        channel resource unit settings is RU26, RU52, RU106,
>                        RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
> +                      - For connac2

There is no such term as connac2 in this binding at all.

What is the point of adding new terms?

> +                        - Beamforming entries for BW20~BW160 and OFDM do not
> +                          include 1T1ss.
> +                        - When 1T1ss is not used, it should be filled with 0.
> +                      - For connac3
> +                        - Beamforming entries for BW20~BW160 and RU include
> +                          1T1ss, but OFDM does not include 1T1ss.
> +                        - 1T1ss is taken into account, so no need to fill with 0.
> +                      Non-beamforming and RU entries for both connac2 and
> +                      connac3 include 1T1ss.

Why this cannot be a schema?

Best regards,
Krzysztof


