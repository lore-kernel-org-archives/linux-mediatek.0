Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DF3C54EBF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7a1U2/c7WJv3NEBfJYAOixnmGcKLo0CuycVU47++aQ=; b=Hkb44aZpZ3Q70waOT6PzFhPq/2
	NmijG2gR+FjJOE48iIDQ81e0DcT8TBogZwDhvtnEBo35e55+MMNWAAX+M4HeeZXKq1CHo5Q0inJLW
	yyV67zF6daI2VY6STthNCXwbMg9tcljrnLLaPrdkZURhXG5Fwp6Nv+xvg+m2WuNM+/WEtPqKjtC9a
	hlg2ym9i5OKpHEfl2GWpMp0L+gw3E2yzp5b/hSK+uh9AJRJV1n4XwfLBfXhXCBXgq/yvip8e2i0BG
	misrrYnLaJmlUI+u07dgaZjxnKm4cEJjpBaKx3ZiikzN2vKKB1TYVOBooXt7HXcqGZrDSFS9OPFEE
	dXFrJtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmek-004Egw-Iv; Tue, 03 Jan 2023 19:09:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClWr-003dRV-5S; Tue, 03 Jan 2023 17:56:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i15so45028683edf.2;
        Tue, 03 Jan 2023 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7a1U2/c7WJv3NEBfJYAOixnmGcKLo0CuycVU47++aQ=;
        b=aKwytJh4KX20LXxOryZJE0HuJG5HcaCeIxX3tFX5yZz0gEhN3vG/Ugzp3jfNHHAfFZ
         zpCCt+btieU/rdBGPWbe3sejqYvYS8FTg2R49yHZy6jaIbMe+hPE/DtWRavxYZwoIN0T
         QVzbnO8+eVVo9l/ID7dtlfG3fmFswrJrboaiZ3nNEzQHN+QM9WO5pCpA1f5g1joQhIXW
         l72WenGT/6K3hPFCxw3kIKLiLCVK3azdhhESTO51lnjK++sWuiMrmBZf4WNy7jNIp7fY
         YzJXiRkbxN0lvgynjSnG5SWR5+Uu2VYbKX6KvdPUI1pO/IiTONJIZdImNLn22/Eq/9AP
         aWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7a1U2/c7WJv3NEBfJYAOixnmGcKLo0CuycVU47++aQ=;
        b=UMT+350emZEqHyb1bHN5OkgYHe0SizMFrcCz9sg6rqhAaXakiaTpuzXJkljXFNwMp6
         /lmZS2rR3GuXHxPfZVENmncQfzJc+9UUgodG6wGyzFL3ZkHxPc93cNdzL6zuqTv/UmXQ
         gT4P3AiKvNgdh+1c4TDQnYtRwkC0rKb/d6MX3EhJ0mN0mIe+AK8MsT/3WLa8AteHUaoC
         cjXop1GhJX+CeHs+O5JrIkJ0skQK+OEha6tU5YVA7kTV9udrT8DQSoPbFSOtIbdp0o2e
         T0TmohS5urYZ5i6WfvrxsNnE68V3FsPRpPXllYtEeB1SpDPYchCiG1pfH0qrtgK4LO48
         BAYw==
X-Gm-Message-State: AFqh2kqghg52Io8p1ZSzdzxVbHKuTFSd0TzgJBYHSeNpGnq4iagmOKm8
	GvvtRGTyOUbm5FI+mSgspkA=
X-Google-Smtp-Source: AMrXdXtEtXWdICTqd1aomJDuH7ZCpdFY3T3zFdVGv7z0OI1uDhXO0zYB+HaMBkbXi0VNrPwD5wFXmA==
X-Received: by 2002:a05:6402:390b:b0:465:f6a9:cb7b with SMTP id fe11-20020a056402390b00b00465f6a9cb7bmr39249116edb.12.1672768605161;
        Tue, 03 Jan 2023 09:56:45 -0800 (PST)
Received: from skbuf ([188.26.185.118])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7c94e000000b0046f77031d40sm13864230edt.10.2023.01.03.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 09:56:44 -0800 (PST)
Date: Tue, 3 Jan 2023 19:56:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 net-next 09/10] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <20230103175641.nqvo2gk43s3nanwg@skbuf>
References: <20230103051401.2265961-1-colin.foster@in-advantage.com>
 <20230103051401.2265961-10-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103051401.2265961-10-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_095649_330743_FFA720B6 
X-CRM114-Status: GOOD (  14.87  )
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

On Mon, Jan 02, 2023 at 09:14:00PM -0800, Colin Foster wrote:
> diff --git a/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> new file mode 100644
> index 000000000000..126bc0c12cb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-switch-port.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Ethernet Switch Port
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Vladimir Oltean <olteanv@gmail.com>
> +
> +description:
> +  Ethernet switch port Description

Still doesn't look too great that the ethernet-switch-port description
is this thing devoid of meaning. What is said about the dsa-port is what
the description should be here, and the description of the dsa-port is
that it's a generic Ethernet switch port plus DSA specific properties.

> +
> +$ref: ethernet-controller.yaml#
> +
> +properties:
> +  reg:
> +    description: Port number
> +
> +additionalProperties: true

Also, I see your patches are deferred in patchwork, and while this isn't
really for me to say, presumably it's because there was no announcement
so far that net-next reopened.

