Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF06CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feltnLXNxgTRXvLRVay12OJp1dDgpFRXeIzE4ZuJRM4=; b=CQnb3WASCx8P980KmGqXttDs5e
	h+PWnk4Euiv9pwKrPQChwinI1qqFovA/reqDfuQ3nbW8UFsJwAe9fI/7jkByByLNMRQeChYRI9c/h
	UHIylU6Q1SxPBwYoLDGqIz4WoovgnIbdtgSANEyQ+oJa+8Um7NC/0Y61XHPZ9D5BnRoN/9OyA498t
	ZHOWG9E5qaRjlcpZ8S6/okhi4Hj836mYFx19DDLYGIFnCDXZafj3Rgx5o5efZ7Im1eB/Ajfdcx99F
	Gwl7D4LFehqaIgsUXZWiFm0qOsVWq9M8022hEmFQh9g87rZKS/5Sb4evnFr3gCUoZsmckGdffJoGF
	FBqAA0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2ac-0000000FtQq-01Ic;
	Thu, 06 Nov 2025 16:11:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2aa-0000000FtQL-3kZm;
	Thu, 06 Nov 2025 16:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F34AA61903;
	Thu,  6 Nov 2025 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D44C4CEF7;
	Thu,  6 Nov 2025 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762445515;
	bh=Wp6NdwsggFSpzb+dFMYQ9X2r0whMaKdMwlJTTWgTI0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeCEa+aDlWQ5u1cQUfOXi+ERK0SJ33/+W5IPmwxfaVVar2Q74v178OcPqMXqVExMU
	 IHd6DTxKFMKcitwkI917TFx3tvCTjrW/52zos5eyychIJfljT841HirV5O3ONbWL2a
	 8V/UXUkDYvJG8KYOHNYbir7F1TILDu7/B7T/kyr8ZFzQxxjnqIqgbd0fnifQ2IMYDy
	 zl4LDBFHt4ImPFKl0HUvtk/HAkRAmeigzyqxzVV6Vxxik/kmqxXcZGNZxusw5P+m5T
	 AoVopRgLYb4OpkTxH3cQZRjinOKgbsdQp4X9cSv07CQP8CRx4SRYIZSiTq5W1Sl1uM
	 2RbeXbAYy0OXQ==
Date: Thu, 6 Nov 2025 16:11:49 +0000
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
Message-ID: <20251106161149.GU8064@google.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
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

On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:

> Changes in v11:
>  - Removed unnecessary #address-cells in all mt6316 bindings
> 
> Changes in v10:
>  - Added "struct" prefix to structs kerneldoc
>  - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
>  - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
>  - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
>  - Some rewording of comments as suggested, addition of more comments
>  - Refactored IRQ domain handling due to deprecation of function
>    irq_domain_add_tree() to use the new irq_domain_create_tree()
>  - Fixed to use generic_handle_domain_irq_safe() to avoid races
>  - Added support for two interrupt cells in translation
>  - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
>  - Added support for handling PMICs without IRQ Group register for
>    upcoming MT6685 implementation

The MFD part looks okay.

Let me know when you have all the Acks and the set is ready to be merged.

-- 
Lee Jones [李琼斯]

