Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486F7C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:27:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A3261D1E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A3261D1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTqIZwGpnY62Q2YwpGvwmjuL4L7rXjFbDgAdIb02sRs=; b=j8n1E8Acw1TdfB
	4Hl6Cah82oafKRGQKen8df/cZJ6pzG/nNovBdZoRHc4p4ScrlpvAXK4LNrFkBfYeqU9qLEXl1oOTs
	7cOfCLMOrfJ6/Q/LXg9ECvqqZmTeNDon17GM8sWx0CWwpqfcD4tqv7HQPs2qXKWdR/GwCnA9h6A3L
	xKWhMHAPWzRhMtO8A5jfyGMHdkKGRCGbAnD1Z+gN1lt+5MVsY7otj6wDAkNjNArCcKtF5LXp2NPjL
	yyFi9ogsXMEcEVAfkk+dGaiu7D8AvyNORmBt5nDm9s6Q92Aks5H3yd3UV92WzDJGWhEqkBzh91sSp
	0JvxvpiJr4yFBXbscS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loUdo-005XxU-7Z; Wed, 02 Jun 2021 17:26:52 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loUVP-005TH8-Et; Wed, 02 Jun 2021 17:18:13 +0000
Received: by mail-oo1-f44.google.com with SMTP id
 o5-20020a4a2c050000b0290245d6c7b555so719392ooo.11; 
 Wed, 02 Jun 2021 10:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nIOAi6NGVLlsemIL0TG75iCzb5F9XFdTz3HwPbCx7Gs=;
 b=PB4Z1ZihBxfD4P0MFCYKYP66VwJYg66Un4cvYZEKY2cuZLfq3QSVY8g2VGMqolxtp2
 EKdjVW9/lZ9R5UvfOmJNESeG31w2HQ2D5C8m25COKjgUixZnMyjEzTnVXNQYq8jErokO
 sf/AOmvCcOG893R3mBLQKJ5Z5Bk79fNosshRm8ELHIpoV0Gq0sAe1+ykf+3+kdN+d0oS
 nb/T1QMh2LPZggV3Fuem66cwSZBe6IU2Snbb5Wp/WvHQrtTC4dTLbsFZzfrmA7rnvmOq
 6E2a8rMVebINFrn8sz31pUcLoz9kCxHsUI6ekLdxbhWPliNcUvbmVbAZVPMLP0igb1zo
 8Ajg==
X-Gm-Message-State: AOAM530esCkl71kDyCc63shXqYBh4dQj4DkQuNxFGndRoy8Qhcat9qy/
 w3+cUyT+GqQno38GtsatVg==
X-Google-Smtp-Source: ABdhPJyeIWdhxbSCxtVdSzG3l0YklSQ69PhjwvvmKsi7IJAS3cEWrG6NjcwMLFresI/dnUfLc4458w==
X-Received: by 2002:a4a:ac04:: with SMTP id p4mr25569614oon.70.1622654289975; 
 Wed, 02 Jun 2021 10:18:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w186sm92622oib.58.2021.06.02.10.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:18:09 -0700 (PDT)
Received: (nullmailer pid 3600851 invoked by uid 1000);
 Wed, 02 Jun 2021 17:18:07 -0000
Date: Wed, 2 Jun 2021 12:18:07 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v9 04/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of scp adsp controller
Message-ID: <20210602171807.GA3599942@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-5-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524122053.17155-5-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_101811_541370_7FD5F115 
X-CRM114-Status: GOOD (  17.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 24, 2021 at 08:20:35PM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation of scp adsp controller
> for Mediatek MT8192.

Same comment here.

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,scp-adsp.yaml       | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
> new file mode 100644
> index 000000000000..1b4335c054f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,scp-adsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SCP ADSP Controller
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek scp adsp controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-scp_adsp
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    scp_adsp: syscon@10720000 {
> +        compatible = "mediatek,mt8192-scp_adsp", "syscon";
> +        reg = <0x10720000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
