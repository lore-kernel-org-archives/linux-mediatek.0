Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E8EC636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjYSoaJSwu59aHW+FhFNZJJcMSOvVpdvL5abf/3v/FA=; b=W2lQocm/isBjSs+C4bEGp/gD7B
	NDjAVW5N7gLMpxwD1BHKvM07oesitOwswi/3Sq8IdlPBdwPvvaV8XTFTO8U1FbZoBR5eY5F/sZXIh
	n3MEOGiUI4Zl7SMBxgUDn6G5GKemKJf5XYnuU0VvlLdVFSIJle/+0wKixIM2MPjVy/wBFwuHK7eF/
	pxG8gkSKFTH5bxdN1/jEBmWpUcVxD7ONQwQuKmEBHVrClxnssukMy+V15I7r97ArGG22nyPgRDYSI
	qAbDfqDUHxBCwuPlzC6NYeLJpQY5emGcE+2Py/+osoc/1OOSZz6Q/VRDiLQPSuP5Xs5/qoTCLqtpC
	S3i98uLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOe6-007CGH-Ju; Wed, 15 Feb 2023 20:44:54 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOe3-007CDw-Tp; Wed, 15 Feb 2023 20:44:53 +0000
Received: by mail-ot1-f51.google.com with SMTP id x26-20020a056830115a00b0068bbc0ee3eeso46193otq.0;
        Wed, 15 Feb 2023 12:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjYSoaJSwu59aHW+FhFNZJJcMSOvVpdvL5abf/3v/FA=;
        b=BS733VSGL/oAprPWUOPC3Pzq4iNzNdOnQUzePg6ebDfM0nPlEp1WFjApz1M9SrV7Zz
         DAebCwkAOplHGntosCgu/mQjt7i2uept4NieYZWhZqT8VtSpqKPhyWDWynNhp8hH26Mc
         ZwHdrzsGJhitLi6mdOjkFs1qJFEdJYheoL6dWE0TtwwqWA9HpJG/L1dYS6lhg8o2LRKl
         GtOv74KPWbdeWdX1+ib45Zy5wOvqwjcjNd/mEbcRAh22MA8/m4qtkrFcinebTnJUnkPy
         /DGQf2okAnPbEhSej26n6kQ0oLxmhSIc7iBML0jo6lmhlimkwrrHHctLSqPwU06ddMoU
         tNsw==
X-Gm-Message-State: AO0yUKWobhvb96rCeaP/sHVx8dmXlH6iUvd3rxVxVw8K05AcEsbbmGmh
	iiveYtNPpHsjqGH7IPTrAg==
X-Google-Smtp-Source: AK7set8sEc2kDElwfrMygyUx7E7ji1I2dSyRJfp/5XbG5mUpm8RGvjm1PzPmau0b1qFq288NTP8ddw==
X-Received: by 2002:a05:6830:22d9:b0:68b:cb3c:c924 with SMTP id q25-20020a05683022d900b0068bcb3cc924mr1787699otc.10.1676493889974;
        Wed, 15 Feb 2023 12:44:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j16-20020a9d7690000000b0068663820588sm8099720otl.44.2023.02.15.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:44:49 -0800 (PST)
Received: (nullmailer pid 523312 invoked by uid 1000);
	Wed, 15 Feb 2023 20:44:48 -0000
Date: Wed, 15 Feb 2023 14:44:48 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Jianhui Zhao <zhaojh329@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, John Crispin <john@phrozen.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	DENG Qingfang <dqfext@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v6 04/12] dt-bindings: arm: mediatek: sgmiisys: add
 MT7981 SoC
Message-ID: <167649388793.523273.6752500904610456591.robh@kernel.org>
References: <cover.1676323692.git.daniel@makrotopia.org>
 <0c80e1dafc55a75f3a13327005ce23efb60451eb.1676323692.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c80e1dafc55a75f3a13327005ce23efb60451eb.1676323692.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_124452_026468_1C007696 
X-CRM114-Status: GOOD (  11.78  )
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


On Mon, 13 Feb 2023 21:34:58 +0000, Daniel Golle wrote:
> Add mediatek,pnswap boolean property as well as an example for the
> MediaTek MT7981 SoC making use of that new property.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


