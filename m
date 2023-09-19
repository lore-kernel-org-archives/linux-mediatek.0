Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C72ACD5BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zNf74ux7Rb+mqSxp4E1XubDPOcic4zesOaHEPnVf+E=; b=2F41ix4giP8sp2acQZ6m37S8l+
	EavJuZFDNJbSQEn9YynEJhj+B6H6HZof7OlRWSYa/GpEETkZzZVEgE6Oj9zQYJpyauDXfF8mGsg/z
	ATy//X+P882bJNewYB+S7cPTPp34bVckZ8RrGVWH3jtNnUS19QWHSo+EY102vp7jzjnCvmgKfJyN0
	nJiywEKOcPRDRb6P4z3w6wcMK2dmur9OrMKY6pPh5miN4GQ5tGzrdrDU7GP142rsod7GWyq8/Atu3
	LVlfELy17EWAZ7x5hIoAd2ZAf8tBM8zFmQdsItI9i5JdboDRWlW5/uTV4RfeSzzDTc2i2jh6jBEld
	Jf9EoR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibCh-000aI3-14;
	Tue, 19 Sep 2023 13:55:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibCe-000aGK-1W;
	Tue, 19 Sep 2023 13:55:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7CCBB8160E;
	Tue, 19 Sep 2023 13:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8C1C433C7;
	Tue, 19 Sep 2023 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695131745;
	bh=QF/AP/89bBr/qqXTaeqtJsd27sAduRxWczz+mUKffoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJZABjBznpJIT24jQjbTR065N12T0J2HyVmb0heC6Uj1lZeJ9FaVkJoATs8bUdw1u
	 LckZmrx8rZySHcEmxBcpHYag4XPGvNOMgF1NN/Wz3J4DgU1j8yZoz8aRlanscMS2Kv
	 uwgW1DBwTLV9nWYMvUltOkNDMGOyuhWrW29k+TXXMtQSUM1G1+KHNMnhYCfYDJAEUk
	 9fT6FalKxg5jwUl7NdOFMnwhlfRWIBGBeLBpCl7wOwVVuXPlLTT5CcNv7ULcsgkUg7
	 N+Ggc+e8BSiAGzTOiwLTT7SxnGW0NmI1VMSjRskWs7Ndo5Pf2svAUBdt9XTGOTYLwt
	 FlQCcSf3EesjQ==
Date: Tue, 19 Sep 2023 14:55:39 +0100
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
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 10/12] regulator: mt6358: Add missing regulators for
 MT6366
Message-ID: <20230919135539.GR13143@google.com>
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-11-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919104357.3971512-11-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_065548_653976_9166F97D 
X-CRM114-Status: GOOD (  16.91  )
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

On Tue, 19 Sep 2023, Chen-Yu Tsai wrote:

> When support for the MT6366 PMIC regulators was added, it was assumed
> that it had the same functionality as MT6358. In reality there are
> differences. A few regulators have different ranges, or were renamed
> and repurposed, or removed altogether.
> 
> Add the 3 regulators that were missing from the original submission.
> These are added for completeness. VSRAM_CORE is not used in existing
> projects. VM18 and VMDDR feed DRAM related consumers, and are not used
> in-kernel.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Linear range selector values fixed
> 
> Angelo's reviewed-by was dropped.
> 
>  drivers/regulator/mt6358-regulator.c       | 20 ++++++++++++++++++++

>  include/linux/mfd/mt6358/registers.h       | 17 +++++++++++++++++

Acked-by: Lee Jones <lee@kernel.org>

>  include/linux/regulator/mt6358-regulator.h |  3 +++
>  3 files changed, 40 insertions(+)

[...]

-- 
Lee Jones [李琼斯]

