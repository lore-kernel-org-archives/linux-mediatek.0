Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE18BE8FDDD
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQPGqOuZNJdhgdi+75ZWk/pFVNebMgzT6ABDEPO78xc=; b=Qkd44Tj5fNxKY/BMlWPTyPXCVO
	GqkDg5SyKo+pWecn04cEWF9uZ81VgCjp0w8g8/COOzIkbV62Qky9l9yAA4KUBA/VRWDf+6jHQL8ud
	EigZl3QSNnSMstKFbB4y7M6QFXcFxiK/B+LluX8vmFGJTcjJ8fR6XrksQ1x8q64ntkjno+wj+JzZD
	UIp6tbaPFKK6knFufCxXYSluJuSPpNMJL8KEHaGWH8SK44STwD7cBEYM11olhGsYeBJiabjQq+syF
	YZ6pEr30ugE1pPfPZWYJAEorXBRdzm1uqD6KmHvlZOc+6dRbPrJ5VVVWR1FiCrkkNcbbH4U/JINUu
	sCfamNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxuo-00H09S-2F;
	Wed, 04 Oct 2023 09:11:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxul-00H07n-1m;
	Wed, 04 Oct 2023 09:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2045CE1B78;
	Wed,  4 Oct 2023 09:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804A6C433C8;
	Wed,  4 Oct 2023 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696410688;
	bh=3tcd15/ZhZ377CKHNn8APJe8bHeAciTOTOhoUjvaohg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DxSpJYyVREb2yGfKKnw9XSQ1b8/PfzDDLw1n0AfAWJpbDxN5aeF8+GwUULbrMkUgH
	 OTYTGKvD9ba9vCfGfHV/aEOrTNxwhtl/O8OABpQABMAs5FeM3+KQXz5I2RPk9b9flc
	 wkSZcKKx2DnIhFcaKgCjwVwezihs8unE9xmAOWGilJIloCd5P/qWQjHr/TxxfTfQua
	 jWcbgEjvR2M/TCB28g8Z0+FI7lrSHPsiMqsf9jRUghMqKqj5NI6yKqBZODV0D3DHJH
	 gsJLlCAtLQIRIuduqECIQElhZszhdkr0VExwQN2Xz+dEF58YZVBizNAUpZBSI5JGxT
	 q8VeZop7iehGQ==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230928085537.3246669-2-wenst@chromium.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-2-wenst@chromium.org>
Subject: Re: (subset) [PATCH v4 01/12] dt-bindings: mfd: mt6397: Split out
 compatible for MediaTek MT6366 PMIC
Message-Id: <169641068524.66814.2537584517055836452.b4-ty@kernel.org>
Date: Wed, 04 Oct 2023 10:11:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_021131_784057_93BFA296 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, 28 Sep 2023 16:55:24 +0800, Chen-Yu Tsai wrote:
> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> 
> The PMICs contain a chip ID register that can be used to detect which
> exact model is preset, so it is possible to share a common base
> compatible string.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
        commit: 9e2a2fd1ca0555bd0c278cd4061cc4bd9c8d0f7f

--
Lee Jones [李琼斯]


