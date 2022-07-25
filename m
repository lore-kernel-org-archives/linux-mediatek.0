Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57851C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 06:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koE1sOchZGcuAQ6ZIasz8+3z8ouCYYjQCDzwRp9wkxE=; b=WjBwFt2LAxUFNMFg+MHw7tEEbP
	phG7bn5ixI1J237ycjO817F+XpjQrhBbSKR+AOo33H8kCHgVdJflZKq8YPtXUl2yGk2j326tUg3YW
	pNyNZaZl5nvnvWsdiKmE196XVmcs0Vy1zoiZUrFEaAedmffG+Iq6XG3qHhVAvCf1OoJYzLPQVaOS0
	/nng5ewkqd8scB5lVPQy/oNf+FOzsUfUfXaJddF+xXipBjXndfyYVJuJRwNQLaHbEJ/rriLDruQoi
	+RyvpJp6YmyoM45rhQq55XzNobnFyzTJwT+rK3Zqqau7oz8vKDgs1tN/MjDVIYmDpsTUhXEoGijBB
	TEyz4zYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFrqA-005eCH-Dz; Mon, 25 Jul 2022 06:45:18 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFrq8-005e7D-2o
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 06:45:17 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31f1b271dcbso8309967b3.10
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Jul 2022 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=koE1sOchZGcuAQ6ZIasz8+3z8ouCYYjQCDzwRp9wkxE=;
        b=Rcjc8ntxdRRnzxYtaeC8PNuN5mEqizkS+usqu0ltMEG3LntntbO+oSzNniJmafQwEQ
         kWd8OOtIHmb4VWGTZbhqaaHlPmIQAX9jcNBMHFE8lMInOR9PsqFDldUjdXu3A1P3iDIq
         2cUPz3TadTV49aFZGesO2kJgSOwPxjfjIh/UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=koE1sOchZGcuAQ6ZIasz8+3z8ouCYYjQCDzwRp9wkxE=;
        b=EJUVjEGxuV/tKrYApO0apYifleyzgKTTjOkWLTKynIvIUrhz87wFfsNLspAoceuwm9
         jInMzhoK20XX5TBMgAS0Bkc9cECypM82FSJA38THEJ02nD3zdq7uLKOO2juKSRYp0D7c
         qU5bLM+FCylzLbNGzecCKj+nq9oJRQmSVtR8BtMjG4lq8aw7HZ1bnqXnSfduSxTSsdtL
         ibuPtQcuBtT466jcvPx/eDOJPButMxvCHTxu2IFIV259+VoMlm4KSkcQDvU+Y7Ods+RL
         K0q/pNcTzCqDR7nxMMocitBJYiG8tzAxEWiwZ2B3MMpgxnnMtEK0U4YijlXkfN+y70iY
         PCog==
X-Gm-Message-State: AJIora9k29HJTZxriPNHntMVWuydPRPI490xV+CE2n6cpPc0s8+TexXZ
	89/KLGDQSblrvXZGjRM5WoTCdxDMticuFv0vJ3eolxm/6OoRcg==
X-Google-Smtp-Source: AGRyM1tWX8v8lA94PgQz8q4L+DWzhvEaTMIwan7i6g4iVoqzmL5YsXQN/5N9OGYvaAFxZcMla6oIVbP/pg4cyghjqs0=
X-Received: by 2002:a81:610:0:b0:31e:4822:6807 with SMTP id
 16-20020a810610000000b0031e48226807mr8670649ywg.354.1658731513346; Sun, 24
 Jul 2022 23:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 14:45:02 +0800
Message-ID: <CAGXv+5FmXVYTtOusB8gqh1SprWHuNJYcC5MNEHQUGKQx8yrrLQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Complete driver nodes for MT8192 SoC
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_234516_172483_72511AD0 
X-CRM114-Status: GOOD (  14.93  )
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

On Tue, Jul 12, 2022 at 7:40 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> This series are based on matthias.bgg/linux.git, for-next.
>
> I remove vcodec lat and core nodes PATCH from series and will comfirm
> clocks usage then resend PATCH.
>
> Also should reference below PATCH for dsi in chunkuang.hu/linux.git
> dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
>
> changes since v2:
>  - add mmsys #reset-cells PATCH
>  - add missing fallback compatible
>  - add display aliases
>  - remove vcodec lat and core nodes PATCH
>
> changes since v1:
>  - add Reviewed-by Tag
>  - rename dsi-phy from dsi-dphy
>  - add missing power-domains in disp mutex
>  - Add remove mt8192 display rdma compatible PATCH in series
>  - use "mediatek,mt8183-disp-rdma" as fallback
>  - remove mediatek,larb from rdma node
>  - remove syscon-dsi and add power-domains in dsi
>  - add reset property in dsi and mt8192-resets.h
>  - correct Typo: s/ndoe/node in commit message
>
> Allen-KH Cheng (5):
>   arm64: dts: mt8192: Add pwm node
>   arm64: dts: mt8192: Add mipi_tx node
>   arm64: dts: mediatek: Add mmsys #reset-cells property for mt8192
>   arm64: dts: mt8192: Add display nodes
>   arm64: dts: mt8192: Add dsi node

With additional changes to asurada.dtsi I have a working internal display.
Needs a fix [1] for mtk-drm from Angelo on top of next-20220722.

For the whole series

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

[1] https://lore.kernel.org/lkml/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/

