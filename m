Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E530D31A28
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghz7Ajm3bUckJQ+8UCG7+zPaTgPrics1K66DUP0I1/E=; b=UvnI+8X9fdKH/CzAoCz9mwOHSs
	qZdExO/+z+rkGImz9VwmFs++NzsWGqhisstUrEdiCHiImp0MxTM4zZHVGuxrhFkbw1EMu8qouF+JD
	RjCRd6a20+nTKXnrMTM0nCKlY/A2tIP67YavTzIiQjzhGES+WmxK8nIqa+NG/C3ZnHpgFngXjDO+n
	wajZO07I4o6L7RCDs6gJxKrUBY50PN4Fh+KI3a+mWJ7MBuZlEJUMa/sO/E8LkejZLk75XrKKdYcBG
	yERuj5UIo2cOAQCmVJiv1FZ1jzt29rE0sxhDryQoYAKhD1jZwcBhrgLlcMJMpguew3UqtXLNTFq9I
	wl7ZU65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwJ8-00000008Lje-3kOZ;
	Wed, 14 Jan 2026 08:32:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwJ4-00000008LhF-3QTh;
	Wed, 14 Jan 2026 08:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768379562;
	bh=RJ3P574FlAZERZAookuqu7G/qskejska98y0K/BBMrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oIPu0WZ4g0LaxJFYhidwQ794+AoBt7zpxZ1MTVCOTfFRvyg5JKPv+aRq/+AxJOIYz
	 g7H5bHxO0wX+v3BEBFsRPfa0a/tn6FxoOMPn8JmxCQT5tYZw+KAE824bPHo7NjOqRg
	 nwP5cu/HjRbgbWOozi2YRVsz5hKaenPEEfxYGD3dREko/JWRZTtgPl2Chf67UpfbXm
	 59lqP7spQwl7Qoq8NF5POSvT7OihCTzBJ2FPBiF4Yom+7/sn/gs7Jr9Ad890gJURvy
	 xMSooIW1RGF4e+LW7pKoEisDeR3aeGJloBu9jJLkXYb9kgNETiD0G+PMQ0tdxZ4ukT
	 KqcbqsBxiwDng==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0B6417E01E7;
	Wed, 14 Jan 2026 09:32:41 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sen.chu@mediatek.com, sean.wang@mediatek.com, macpaul.lin@mediatek.com, 
 lee@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com, 
 broonie@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/6] Fix dtbs_check warnings for MediaTek
 Helio X10 platform
Message-Id: <176837956184.8998.8649107668672128960.b4-ty@collabora.com>
Date: Wed, 14 Jan 2026 09:32:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003247_057865_45491874 
X-CRM114-Status: UNSURE (   5.64  )
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

On Tue, 13 Jan 2026 11:59:54 +0100, AngeloGioacchino Del Regno wrote:
> This series fixes various dtbs_check warnings happening on the MediaTek
> Helio X10 platform devicetrees.
> 
> Depending on correctness, either the bindings or the devicetree was
> changed as a dtbs_check warning fix.
> 
> AngeloGioacchino Del Regno (6):
>   dt-bindings: mfd: mediatek,mt8195-scpsys: Add mediatek,mt6795-scpsys
>   dt-bindings: mfd: mediatek: mt6397: Add missing MT6331 regulator
>     compat
>   dt-bindings: regulator: mediatek,mt6331: Add missing ldo-vio28 vreg
>   arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
>   arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
>   arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[4/6] arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
      commit: 178c08fd8ce53c77910fb16cc99e932049b6c6e8
[5/6] arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
      commit: aec5445dd7c8c6c84d46f2dbf07967ac54393595
[6/6] arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
      commit: a40901fe6f5c27856b7112a6e635b13446ec4c7b

Cheers,
Angelo



