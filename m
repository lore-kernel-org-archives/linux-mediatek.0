Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E804C35FF8
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KI2DI4Zb/l3yDary31g2hF2Qu++zP0wwUwWo2b9/rzM=; b=I8dHpuP+M5PwW+Uc/bIKNA/Hdj
	ymK+jBm6h51HKSes21ykVjl1uHqenSxTy5VpGVWKjK0hHLfPcTftcZ6mOa3XliEk5wlds9fnvhLOs
	7LxPFaz+mTZ6vwE+Q6V1jM1uDfji2Qsz4NLwjPzBhWzdIXoWiK/oEf35IsKwM4kx5Q+3tWxKJcCAd
	WLIgpvN71g8MSlJNA9bdanhkqZSCXhZnUpfxiRVtafXRCFkuuMsYD3y3EenLWKC4CL9dxEzoJinhd
	RUDgsFJ4SX7Qy19iPlBPjT5Qyu+JL1CCdk7Cini2Cn4Vlhr3jz8oQZTLqQRsAkGoIKDtURxIQxPWn
	OhICqeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSmH-00000005FP6-1vRZ;
	Tue, 18 Mar 2025 08:58:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSeE-00000005E83-0mq0;
	Tue, 18 Mar 2025 08:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86DA45C55FF;
	Tue, 18 Mar 2025 08:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449CDC4CEEF;
	Tue, 18 Mar 2025 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287805;
	bh=muVfotdBVkgMqpFob4WAELBMk0aNg3mJPn4XqjMIXXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+6YJkp63UNGN2FX4jJzXrHc/yzzH+EK/cS7L+SZrLmk5BkobWYvSKOnC/WTSrSyS
	 DLinzHSFM/0dVmRiH886cbsADDTvVKQWzjb+kYOe5FSDaRXtOxAYcWVwNRfm63Gr9m
	 fucrnOpd2AaSy4kHXmAzqf/+v/ZRg8Skk17nmyjgGNrLYwQ/t0vo1g0+LWH8lU4HkK
	 gqffAH4o0B+3DO6R92ylua25PM/eLloy4/d8MMklEAsYqRF4UT3h2cN842q1YfshPB
	 LBsjC7HDZyfZRI8I5vYJ+rGG0yVPOqFnEQYv3xklQtLUkYlrK6Fva2G4YYM+U/SBmw
	 cv++zmtoKs0PA==
Date: Tue, 18 Mar 2025 09:50:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek,vcodec-encoder: Drop
 assigned-clock properties
Message-ID: <20250318-rebel-voracious-tuna-3a9f53@krzk-bin>
References: <20250317214621.794674-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317214621.794674-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_015006_282965_D3D8D469 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 17, 2025 at 04:46:20PM -0500, Rob Herring (Arm) wrote:
> The assigned-clock properties are always allowed on nodes with
> 'clocks' and generally not required. Additionally the mt8183 doesn't
> define them, so they must not be required in that case.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


