Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B4FD44C7B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=; b=xdKK9+PoPtzM8QEyiZX0eHYPOG
	zqcJL+GS9BPtA05DibmI/JmyiJn9rKdmeo06xjculLVoz0Fxe0V1AhMSI8JSgwHmr6yVZ63Ch102Z
	IAfeQp3EnqBBJ9jaMSxYOoU35xqBXJifIMwEgWOvf6ppinF2G1FP/j5ovtxpUVKicjb1IfA379pEj
	9BqdULpC+LcOmv84Gs9nJdAZDWV0WGuP5R2w4sxRimRrh/p1Uv1avuPgtVFLvlazAwudj+D1liYGu
	WmZkb6D5ai4XgaRJg9+x91MzYwx64eJfHHLb7nyiVy9n6v+R4VL3YEehhFY966uq+EkDtRNVlAa3P
	U0JgTSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9B-0000000CgNU-0rtk;
	Thu, 15 Jan 2026 16:24:33 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ98-0000000CgMJ-150w
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 16:24:31 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-382f9930e54so17159091fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768494268; x=1769099068; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=;
        b=FcCBqeabsyrDr7QQx9SRaI62TwFgj1yv3JvIc8xKw3cnyUfYpIfSyaYePGMINKUyrh
         31HcRmltKEog6MyUyx+JQm9gKENZI6YAIx5+7wgNBiyrNQL0pd3KtytQ1blnUmYXworR
         j/IJAjDEf5hK7lEnCCM5IBPIMHlawitQeGzRWDK9AiCQsyEKwjYrZMueM4OPcg9Ufrq/
         82ctX4+K4+mXd1JEaAsAaRf9O7ZT/sG/C4x1STDZJI3cxEexqcjHkwfM9EJ9UEYGeVSl
         6wBh3Tsg31DWl28iSuoRJnKmQs+Sw63Aul0MbwlQddRVgjbZBbs/t/onL+kjhrG2SdYo
         WSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494268; x=1769099068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=;
        b=JU8aPttCmgSMnToKUjLG+zgFDEMlLF9IqHa/4Y0pTfMbpikiLx1yW/0SPBJEyyiLKq
         4JEgP7dkmvnU4w6gC37YVfkFyMz+uo+9Nr/SWn9zOm0vwba3g3PUfRk2qZ2laQwXjk1n
         YC1xvmls1AMkuRvbXQPrePcYEopmJ93XAfMXirU4biB8kEBmktlEUHHYVhnKkHS+WAaG
         ve2UrQSFhiRFsUtv07uX+NB9hUW0HQQH3Zecj1xSNTgCfKO08A9tMv5caUEooKkGB7rg
         QgGJSrIPiD+4GldtZF3tyR1tmrzyWb8eX2OQzUQ/L6P2cIRP0+laxBrE0AvOBjEQIzqg
         dX2w==
X-Gm-Message-State: AOJu0YyFif+nrlXziU6FwmSkwy6y3XmzNXFnfK8LU2CQQDypzOE+/6U3
	PJqKxp9Yt3537rMiCAuA/4xfJMU2+sZVWsao6Q1dkSg4WJq+YlSDmd79hPIWITbhoidcB2ZpbuG
	8r/qdf/XEJctY6yE3aM/LjSBRia2KAQZgpcY3qSPQqw==
X-Gm-Gg: AY/fxX67SOMbsM8hFMivUef1KsqhNNxN3qDpIBnNuQvKNYqT0wMXUCF/+OYaIhaj5E4
	d6n0zwl6YHPB9XPXiTqyh8Z85dGN1cwoWD6Af0SZ4py/Fs/G1vVTNxpRDuRJRlkB72mx3xLrCgL
	/hrWIkkQC9s7gbcpVqPicwsUZHvmC8SyD1AnkxJSeVA3zWiR/L7GNkF5e+a+hxQtNG1y+v6qI/L
	CTBPkiz3N4yUO2agrGMVq4rgtHfEJ+SOBkdWlanZdvMZ29SPUyDttOzAh4Sg76mxvpan2yn
X-Received: by 2002:a2e:3003:0:b0:383:543:66d with SMTP id 38308e7fff4ca-3836f09c3afmr8580341fa.16.1768494267944;
 Thu, 15 Jan 2026 08:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Jan 2026 17:23:51 +0100
X-Gm-Features: AZwV_Qgstc2v5holxo2-uqRefc6HR54B_5kwg-eT_5uV86kY4RNFn6HUBQ_JID8
Message-ID: <CAPDyKFohjOfdg1vz1o4FAhThm_1CTF46SgrWSJuJYt3mLLJwNA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix dtbs_check warnings for MediaTek MT7622 platform
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	matthias.bgg@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_082430_303018_56CBCB63 
X-CRM114-Status: GOOD (  11.55  )
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

On Tue, 13 Jan 2026 at 12:00, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series fixes various dtbs_check warnings happening on the MediaTek
> MT7622 Home Router platforms devicetrees.
>
> Depending on correctness, either the bindings or the devicetree was
> changed as a dtbs_check warning fix.
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
>   dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
>   pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy
>     driver
>   arm64: dts: mediatek: mt7622: Add missing clock to audio-controller
>   arm64: dts: mediatek: mt7622: Add missing power domain to afe
>
>  .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi               |  7 +++++--
>  drivers/pmdomain/mediatek/mtk-scpsys.c                 | 10 ++++++++++
>  include/dt-bindings/power/mt7622-power.h               |  1 +
>  4 files changed, 20 insertions(+), 8 deletions(-)
>
> --
> 2.52.0
>

Patch 2 and 3 applied for next, thanks!

Note, the DT patch (patch2) is also available at the immutable dt
branch, for soc maintainers to pull in.

Kind regards
Uffe

