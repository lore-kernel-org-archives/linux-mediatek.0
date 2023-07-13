Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10477EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 03:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qawsrB2QjObGFKdtBJBr24bS4klgjaH5RnlsFvFaqdA=; b=LFsF9v7Fs7N0N+XvXGdW6PWsZL
	H1WCkNypDtVZ5T3dZaiwmhR2J2jLM0icuf1ITuwaoDKDEYcWjwe4vAbm/AzStb89krYvcxdcr0yjl
	OdtdNUMn3xwimjQriqvOq31J9hNVcxQTeScTUVdGRO23CYKQrO9QYc2WpdVCA0NOwcdJkgUY4pmkt
	IdFHL9vQmDVeKMKtb+QvnIcIvYiH1LFYwQcl7ac0xRtnQ6J+E+zduHGTsfRiC0mbEyVfKokAUWp4d
	6SLT4LkidkmwtiQXt2JIRqz1itHT/HNwNNNOHe18jwEoJOoZx6cAdJDLjzWpULP1t//vKas2M6xuF
	agzLk6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmqZ-001nxa-1k;
	Thu, 13 Jul 2023 03:18:27 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmqU-001nwt-2H;
	Thu, 13 Jul 2023 03:18:24 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3460aee1d57so928305ab.0;
        Wed, 12 Jul 2023 20:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689218301; x=1691810301;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qawsrB2QjObGFKdtBJBr24bS4klgjaH5RnlsFvFaqdA=;
        b=IQPhHKnIGsWbOnNd10/3/TdCPAH9no2Y7Pqb+Xra/2EcZxOsKnB/zGObS0x95orfSR
         WpDJtHgg9HtURlsQvez7iNE0loAmqN4gZfGhjkHu82QduvFTYoex5sbJf6qzS3Htc7BW
         MNOMgPWiGwl6/kwK148G7H25vNh+ZLM0MTRFfuKb87HadVTXHF688kCHMBQVtOgxKVZn
         HQDJ+lqiTVhJKC1c5PLG2aklo3XfXNId82MbfXqxbaKCdzqE5peHpH52CQ6Re427GqJW
         y+d+8PGZ/x6X8KnAb5dYKGgNTjE/o6CDZTw9qHPI52OVcwwZKhfyNSu+xbx33/vUd+FC
         +Idw==
X-Gm-Message-State: ABy/qLakmBlxyWuxfNyjF8HpsPJRI1BrSZsW+tMQVqn51W+2bJsoQIZT
	yuMb1UHAXR0uQJwF+dOs0A==
X-Google-Smtp-Source: APBJJlHY6uobXkZ7Ot/PXNS2zXB03TK8FxoMtNQm5K2O57QB9S+kej4dH9EdpogJCIV4sH4ZYuGddw==
X-Received: by 2002:a92:cf4a:0:b0:345:aba5:3780 with SMTP id c10-20020a92cf4a000000b00345aba53780mr405972ilr.22.1689218301057;
        Wed, 12 Jul 2023 20:18:21 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g2-20020a92d7c2000000b0034579ffe2b1sm1745730ilq.29.2023.07.12.20.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 20:18:20 -0700 (PDT)
Received: (nullmailer pid 2687664 invoked by uid 1000);
	Thu, 13 Jul 2023 03:18:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Eric Dumazet <edumazet@google.com>, Greg Ungerer <gerg@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, =?utf-8?q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <6c2e9caddfb9427444307d8443f1b231e500787b.1689012506.git.daniel@makrotopia.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <6c2e9caddfb9427444307d8443f1b231e500787b.1689012506.git.daniel@makrotopia.org>
Message-Id: <168921829748.2687635.17297461907605978671.robh@kernel.org>
Subject: Re: [PATCH v2 net-next 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Date: Wed, 12 Jul 2023 21:18:17 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_201822_743748_89252A7E 
X-CRM114-Status: GOOD (  18.35  )
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


On Thu, 13 Jul 2023 03:17:55 +0100, Daniel Golle wrote:
> Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
> The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
> 10 Gigabit/sec supported by 2 packet processor engines for
> offloading tasks.
> The first MAC is hard-wired to a built-in switch which exposes
> four 1000Base-T PHYs as user ports.
> It also comes with built-in 2500Base-T PHY which can be used
> with the 2nd GMAC.
> The 2nd and 3rd GMAC can be connected to external PHYs or provide
> SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
> 5GBase-R or 10GBase-KR.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/mediatek,net.yaml:76:9: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/mediatek,net.example.dts'
Documentation/devicetree/bindings/net/mediatek,net.yaml:76:9: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/mediatek,net.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/net/mediatek,net.yaml:76:9: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek,net.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/6c2e9caddfb9427444307d8443f1b231e500787b.1689012506.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


