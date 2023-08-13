Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7148C001DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 19:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1lGPqv1iSWWYndcdm44N796wnrwYOzK/z733GpYzNk=; b=40Cjeoir/BVHHJa4NIXk94rlFM
	6C76INjWgHtj1mK4Z7dRQmLr5BCqDnPJSfXQGQiizU+CPFLiACP1jUrLtdfOMgLaJW9bV9gwYaQZo
	euznIz7s3TV6/8a/K3grxmL5oeelSIQwgxNo5G6qpFux1iUe8sIStZIfGKkMoYFmYduOklJPRPdZf
	qXOTpo54KDviHHBmVE2PecB1xlGEkbswIjiFIpPHCCzYkv7QgbtYgSqltzQLKcVDxCMYU9mZp9uqz
	QWq7t31Bc2AJ33/dHmo38kvA+pSEVkd8hEmQUaEo0CQpiCWnYfFxAQs35pRUKBExM3F+xV8Q6SOFd
	jmlXo7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGMG-00FalK-29;
	Sun, 13 Aug 2023 19:02:36 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGME-00Fajz-05;
	Sun, 13 Aug 2023 19:02:35 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b962c226ceso56369491fa.3;
        Sun, 13 Aug 2023 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691953350; x=1692558150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/1lGPqv1iSWWYndcdm44N796wnrwYOzK/z733GpYzNk=;
        b=XiCI7liiU5Y+icmm8yci6xws0x3WQYQEwyvgXGsqkFEoZx7tuJdWJKhN3GCN2DyUF1
         4IyL95YD3CQ7Nc7vyk3ts1qnnju0za83OWiz2xZ9cBAUwh2p0WxJfsRGBn86mZdIIkk/
         XKlYkVr4gc69NnL3g71JvPsJyYwL+sRPSOOf6bzSBHeV/k20hdWGtHz0q9y5lm9qGVuf
         WEiXmzXtI+RRyhBlNUfqIensHEEepUu8OeodNKmpWe6Cp42FvePmEUZjqKgiVm/9hMiT
         J8kNEbYVP+P920fy+cX1fSEVIX50IAO2+tGS2vKT4OPKmR4uux0tHK1FfjL+x/WtsxvU
         E9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691953350; x=1692558150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1lGPqv1iSWWYndcdm44N796wnrwYOzK/z733GpYzNk=;
        b=Jl+mqZ0WtWBTq8cXRyfOlj5RsXzWrCtctqc473s1WXSlDGO/T9eNEMfqfZ/UeZRife
         6C+VFlQsNKku1etwD7V8hNEXKbqqseAsGcL6K5Yt2ZnsN5tI8KbiYkYzim6uBy9iYGv3
         Y9TrnZRnYzfmRtSg+STFV0gBOUenB6RBnG33TfsPcx3IL/zj2UhggqXfMI4Wx6cQRnsR
         Z7B9sbYffcnNS31PfCg2ptSi957wlCJYYgQ1P+KP1Ti+2SY+mQR/2npxgCULJXIgeSe6
         QkMZcCwdEZ+4rCEHvsGqSLXPjDV9VuVwmKfqikJ0dMk8+AjMNBZtJFUa+YRWr5b3ouOS
         k1hw==
X-Gm-Message-State: AOJu0YxMz7rv73YBHrIRSdlM72D6948AKL9yedsJ828NGbGEiBUwvE+n
	CDn/SxZgoShWUOrFqy7CDG4=
X-Google-Smtp-Source: AGHT+IGrieknj/tH+gn9lVfd6xWvlDTto2rG2CojERZaieo4pEES6TqmKcjZxrDymguLVX6hXVZy3Q==
X-Received: by 2002:ac2:4d84:0:b0:4fa:21d4:b3ca with SMTP id g4-20020ac24d84000000b004fa21d4b3camr4649958lfe.2.1691953350032;
        Sun, 13 Aug 2023 12:02:30 -0700 (PDT)
Received: from skbuf ([188.27.184.148])
        by smtp.gmail.com with ESMTPSA id w7-20020aa7da47000000b0052567e6586bsm209432eds.38.2023.08.13.12.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 12:02:29 -0700 (PDT)
Date: Sun, 13 Aug 2023 22:02:27 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230813190227.6k2qyxfewbkmatn6@skbuf>
References: <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <891c0b67-abe1-416c-aa94-675f7f3d8044@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <891c0b67-abe1-416c-aa94-675f7f3d8044@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_120234_062665_F7804394 
X-CRM114-Status: UNSURE (   9.17  )
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

On Sun, Aug 13, 2023 at 05:58:57PM +0300, Arınç ÜNAL wrote:
> On top of this, I'd argue to document the internal MDIO bus on the
> ethernet-switch.yaml schema instead.

Why?

