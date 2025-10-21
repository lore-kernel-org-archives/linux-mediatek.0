Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E29CCD1AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Oct 2025 13:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMm5s9lPYIcxULYRTtdFgnxUn8mSHiEy4QAJ0lz4sNY=; b=brd7ZOd6efV/QYK2Zq3paQAVYL
	RPpXKV0gt0JJxBy6Hj7UykFz2uDfZgs/HfpZ8NjwKchCLsD0arFHKh76ujY4EuuqffBNYpBxyckqE
	1aoCj0wFUC6UQ9pSvArbt+YNaD1sZX7Lc7x0aSR6kHLPg0hs3RG5slzg5NiShvWOm7qrL37Dff7yQ
	UWF5LrBrV5QVQc5sJC6i18VYMIQZqLpBKO9j5uY1M6meywxrh0TfJOV2BW8w83NlDSSEczr3RmjJk
	ADJCANQLsC+qUtJnx3QYTxeVDmPE8kx4lMzYza2uFqYNBKpzub6iXEtylAni8la3Isw4PmjLiA6rx
	+IZQglGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBzo-0000000H4pT-0639;
	Tue, 21 Oct 2025 13:01:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBzl-0000000H4oo-3XqP;
	Tue, 21 Oct 2025 13:01:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03EFB6040F;
	Tue, 21 Oct 2025 13:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED48C4CEF1;
	Tue, 21 Oct 2025 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761051696;
	bh=bAOSuzIkzsOMAD3DqjZxBinmkAaLtQ6iZXn/jLl6V2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCFrou7hkHM2i3UwEjobo/NFRNvv8GUkcdcdedMIjJLBr3GyGSHXvCpUua5SdmUdg
	 sMlGwu29ciX1fx5rx3OhTIOpdiCTFK3oqdvOpoI4ej/V87yZfc7WQECv2CDTrzL3cN
	 I4ANO5Rx+lLGzEgC6q1pfCGT9LD7oHiRoEG68FZBaIG7D8PWBJw3qhu3ZuDcTFEQZ+
	 YS9dVq/de3rffqLGJiA4chc9C9YUmC4yUYP1Ktz1JwkICwiSUlQAouPODfSCuT72j4
	 CFlaaRUh9ovua5iNbnQPBmo7LAV2IgmCij3mwFpATmUGuNNyUkUSQYiBJySrzPkmlF
	 sb6kkoFNcK+RA==
Date: Tue, 21 Oct 2025 08:01:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>, kernel@collabora.com,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8365 SoC
Message-ID: <176105169286.4039322.13842766904505593753.robh@kernel.org>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
 <20251021-mt8365-enable-gpu-v2-1-17e05cff2c86@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-mt8365-enable-gpu-v2-1-17e05cff2c86@collabora.com>
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


On Tue, 21 Oct 2025 09:30:51 +0200, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8365 SoC, that has an integrated
> ARM Mali G52 MC1 GPU and compatible with arm,mali-bifrost.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


