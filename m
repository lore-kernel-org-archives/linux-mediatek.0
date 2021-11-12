Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E228C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E308C61075
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E308C61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mw472g3RXlfCDInxRS+LcbWCWvgwK2cPi2noWWAoRoA=; b=suuYrfr+FKHyxN
	v5fzTpyFMKmRSNfY+/I1PyhJyJ3+IdCnxHTspqGv7RRW1fMhI8yZRdTOtOyknnK//2P4QLp+JtkL5
	bAEvbP3eSBU/KhksEr7ouVQN60x3Z8yMJyND8xO1EjdnpiDOdRmogGe8BwXB+k+VbE6dsyT57LfXS
	4SbnyabHfPKKBhaYKNYS7izdrRQpUOvVIfG3Zt99bQ/DIBmgMr7vFh0XMKy505VOQ0aVNPaZZfPXB
	cimacSVWFbUzRLMBDGix43pYpSAqSfReC9qEaL+NcnDOFkmkrTf/LnIAdiAOVqLbi4Rkm75UnYf3M
	aUWreZsOXqEHkySkun5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlWvV-00Adzc-JG; Fri, 12 Nov 2021 13:49:09 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlWvG-00Adsl-MJ; Fri, 12 Nov 2021 13:48:56 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so13860376otm.10; 
 Fri, 12 Nov 2021 05:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6pHca0PIi6BrRjpQqaAzxuZW0QOl0VIRadxfTfhPAkQ=;
 b=Nl9CrmSrphJ+kQu9B6p7MQWPTCM8KTSj19b6Bbrp1AMbss8yy9ILD6mc/CH/BYeP7o
 +5Qb6aVf8LCLxp6IZJG++/NUoO8I0fNZ9rJxpH8E5YNz5LKdjP1B7BoMXghNE2M9gqfI
 mM3N1C6Ru40cEDcDVi9GEbsIP6kj401U59CEoP/L9pRHzmga61uyGlXjXAE3jKWrJ1R0
 KP2bt8+TGaB20ZIUhs2Qi6HZBf6aTgIlRwElIWz3v4Rpe5njoA+Lq4VVPlXG7jr/AIWB
 RRUfqWohYUmxewgU+nWSnAStrlO/YqMGiLfKN1qKsNQ2UDz50LEcKP1smCEwlcqcOE6e
 vufQ==
X-Gm-Message-State: AOAM530urj87lfWuQJn9dvkGy+sKVYKlB5TjLMi8+r1AWZKg6aFWrPvz
 DSLiSlgc99FuNOzpXxb3bA==
X-Google-Smtp-Source: ABdhPJwly26891iEK8vtNTXyQVNzHORW9lkbyk3RQPIGYIxK3HMgQYC5n3VkFR/ORX4G7j567JV10A==
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12025731otj.16.1636724928903; 
 Fri, 12 Nov 2021 05:48:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a23sm1053194ool.3.2021.11.12.05.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:48:48 -0800 (PST)
Received: (nullmailer pid 2463375 invoked by uid 1000);
 Fri, 12 Nov 2021 13:48:37 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 davem@davemloft.net, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, macpaul.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 srv_heupstream@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, dkirjanov@suse.de,
 devicetree@vger.kernel.org
In-Reply-To: <20211112093918.11061-5-biao.huang@mediatek.com>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
Subject: Re: [PATCH v3 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.159298.2463374.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_054854_764290_E9BF8499 
X-CRM114-Status: GOOD (  11.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 12 Nov 2021 17:39:15 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 157 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554228


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
