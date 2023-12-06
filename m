Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D3C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKUyAGPVNJ2iCz/byc+vad2U0HtCXFR/OKxsFSUjBSo=; b=drH784DsNnBFAGHJeI5XY5iWGt
	MqPEhfPBUWYAP0OIJcXG5/2/ij1WHQFcwOKGrtOWVS2YEgD5fg9KNbVDlD1UshK9Qs2NMB16glHaj
	aJJClo8Soz4azcDdD8JX3vesneFzXDkKRFjLjW3Y3S52GhprRPrI5Oj0eKhP18PmdgspCZLBo1Tqk
	Kep1SAi0fbVurWAJRaCj2HeOXxj/4P7x88CvUH3d9qg9IWEwgAYdJrdQ+0cm1BO9imzi8J0ahTPMO
	qhqRQub9HQkn7d30l+GN819YGF0xwsu+uSjYCD7mqT91bToY8HhBCOQ+M22TnHxbY1cgwpPZWeTBn
	W/KwCGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAs2V-00AOcw-0t;
	Wed, 06 Dec 2023 13:34:11 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAs2S-00AOc9-0G;
	Wed, 06 Dec 2023 13:34:09 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d9d29a2332so46602a34.0;
        Wed, 06 Dec 2023 05:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701869646; x=1702474446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKUyAGPVNJ2iCz/byc+vad2U0HtCXFR/OKxsFSUjBSo=;
        b=kUmqBE2ATAWmxYNy3PzxspgcqsZg1hHUoEsef52DRuB2LRZMmZlFyXyVs3pDfXoLde
         HHxq3ir0Wy1+7IXU/Dntmd0f9is2gQiLnZ3788HILiCoXE2EO9Yi0gPBV9Jv963wN9/T
         5lxVQBIiHZSa67Na9Bh4ei1rvm83CCEDbPNS1YdYiYEcksNH9XFMLO2UFOUUI/bZdQaS
         WgJ/EuXFxCqlXe3HMdfYlQyR3mYQNX4VzsdMQfmlarWd3cX90Kjo6zZbikq07br2X7OO
         qNYEQC/wzJXSlurWMWTYw44iIm8bebqDxlFynN1voVl5lwysUpHeTOHITyZpV2/6c3TG
         oiwQ==
X-Gm-Message-State: AOJu0Yx/cBNHlRlidpIpSRXu4L9+kYAwsb9UDhCmOvmLEVj1H86C5hA2
	44r7sJHCV7iXwu53Exg+Qw==
X-Google-Smtp-Source: AGHT+IHWs8BDYeEsQ9p7nU50NuMdIrEA5NhSUWcTgZm0IYA+OhimehJYkLAie1qpwHIrrcHjciYBFA==
X-Received: by 2002:a05:6830:2aaa:b0:6d8:74e2:552a with SMTP id s42-20020a0568302aaa00b006d874e2552amr431988otu.22.1701869645696;
        Wed, 06 Dec 2023 05:34:05 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2665206otk.45.2023.12.06.05.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:34:05 -0800 (PST)
Received: (nullmailer pid 1911334 invoked by uid 1000);
	Wed, 06 Dec 2023 13:34:03 -0000
Date: Wed, 6 Dec 2023 07:34:03 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexander Couzens <lynxis@fe80.eu>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v2 5/8] net: pcs: add driver for MediaTek USXGMII PCS
Message-ID: <20231206133403.GA1894508-robh@kernel.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_053408_122693_37F8904D 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, Dec 06, 2023 at 01:44:38AM +0000, Daniel Golle wrote:
> Add driver for USXGMII PCS found in the MediaTek MT7988 SoC and supporting
> USXGMII, 10GBase-R and 5GBase-R interface modes. In order to support
> Cisco SGMII, 1000Base-X and 2500Base-X via the also present LynxI PCS
> create a wrapped PCS taking care of the components shared between the
> new USXGMII PCS and the legacy LynxI PCS.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/net/pcs/mediatek,usxgmii.yaml    |  46 +-

Why are you changing the binding you just added?

In any case, bindings are separate patches.

>  MAINTAINERS                                   |   2 +
>  drivers/net/pcs/Kconfig                       |  11 +
>  drivers/net/pcs/Makefile                      |   1 +
>  drivers/net/pcs/pcs-mtk-usxgmii.c             | 413 ++++++++++++++++++
>  include/linux/pcs/pcs-mtk-usxgmii.h           |  26 ++
>  6 files changed, 456 insertions(+), 43 deletions(-)
>  create mode 100644 drivers/net/pcs/pcs-mtk-usxgmii.c
>  create mode 100644 include/linux/pcs/pcs-mtk-usxgmii.h

