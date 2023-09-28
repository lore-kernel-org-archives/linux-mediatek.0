Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F729E732C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9VjI2n8hqtgoxH7xmMF+d2/mxuNpn/NUYetgidyADM=; b=ejvfhwLvid63rl9/0Qf8Bftj2Y
	84tlb69p3XH44l+TeEnI04ZQWcdZxuVahG2WRnDifcaYQ/zCbkePlTdX89fcdNF2ErM4gtDN2rPBE
	NiT1mno1iMBI5xcBUhwUMcPL7D9vd9pPsCVd/gmzSuSk8voyTXJFesv+eW3RUtrOC1ai4ARhPHsK/
	OJF1NqNt3YWTS+h8XeWo9KVlZVA+aYX7HzyAqN1Yx/AauoRT+DmfqPxrFJbJ2fxsPRlDWDd23kHy8
	W1THAAW32CBzIBwWUWHUtbRLiRT/rkH15nDq/6GywT8oDgZgBXlf7R8htaifWIIvtWlvkkq2desPQ
	LoBNa8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlqDv-003omu-2f;
	Thu, 28 Sep 2023 12:34:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlqDs-003oip-0q;
	Thu, 28 Sep 2023 12:34:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1900DB81BE9;
	Thu, 28 Sep 2023 12:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1D0C433C7;
	Thu, 28 Sep 2023 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695904465;
	bh=lIDMdnTxQP7t89OuJ29zkIG40XJQFpyQ/rEb/H/3OIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o75VWMvbbbKxQKo1vCy3d5UsaSBKlD+JydA226K3A+uLdwMZ35vrCAVmaXBqm63SI
	 p1hAzFivx7QnKpLR/0/O7t9U4c5y4WyJVY7GYX+ONBez4mPAc0/eBJtPPWyyMeU8iz
	 N1rgu98RN7CALLziTxkjyhzSKokSnTdN4qIEhSHGoRzgzsX0mBvhKu38ltj+qUayrT
	 SiqDRZSO+Y+8PjlzzdmwOeqHpcAXRp7h/ZQGhBCG8ZeMChC00ttBdIMhApSozFZKns
	 5h0bqiF6eJHIJrIqyWb0mAhf3BFgIM+HgGgT+wG2IYa79cfhgxSROZWy6YgvnYPJS6
	 cVjZV+q8ejSFA==
Date: Thu, 28 Sep 2023 13:34:19 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 01/12] dt-bindings: mfd: mt6397: Split out compatible
 for MediaTek MT6366 PMIC
Message-ID: <20230928123419.GG9999@google.com>
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230928085537.3246669-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_053428_457668_35ADB4D9 
X-CRM114-Status: GOOD (  15.84  )
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

On Thu, 28 Sep 2023, Chen-Yu Tsai wrote:

> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> 
> The PMICs contain a chip ID register that can be used to detect which
> exact model is preset, so it is possible to share a common base
> compatible string.
> 
> Add a separate compatible for the MT6366 PMIC, with a fallback to the
> MT6358 PMIC.
> 
> Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Let me know when the other patches have been merged and I'll apply this.

-- 
Lee Jones [李琼斯]

