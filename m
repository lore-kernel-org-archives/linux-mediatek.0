Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7EEC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 23:11:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDDE22CAD
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 23:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EDDE22CAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s9sItm1aWoMp8KECvvTWNTnBJORQ1ImdjmXlJVCgdAI=; b=BfSG1YG3FQ3dVdm3WnXmqSyfa
	71sYrLU02pjwXs6j6cfCDfX/nxLxbokW8KeuyAHUzHMOIep+Q3EmM3GoDSN1zxiNNcpbiQqI8y/LJ
	JqfGIkrlCe5HuO1IxHTHpHvM+zkseSCUjZCIAxumQoDWjDd7BJQrXtNAvYpysd91IQlsc+tSX+oE2
	MXqXs0fmz2eKWEsUFEN9k3un5ILpUgJO2sAENs9ocVzJ8q3PjnDv9p9Pr8xOmeHDP3OTlR0+11epq
	4eiRoVvyMfmEFLQuolqsMWoyp7Cl1fJbLxxzSWw6OkeXz/W8udHNVlyicNNMCaTIo0OUxE8/BELmw
	I0ZE4dD4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l209T-0003pC-8t; Tue, 19 Jan 2021 23:11:07 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l209O-0003oV-VQ; Tue, 19 Jan 2021 23:11:03 +0000
Received: by mail-ot1-f48.google.com with SMTP id 36so10012253otp.2;
 Tue, 19 Jan 2021 15:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zwnspLO1XU1UxAjviLLOho2793ZeLPfsqMsqct/RJD4=;
 b=FiE+5gh7pYDnrrsJc/Je7a+Yj+4P+pZPhQx/IfgPDyzdaqTu7IIQL6OdPZ5/bQDnRA
 qXbGKeusK2q4iq0eK1UBSIe1dag1nnBCEKaAjWKEOS8ZBfWO2DGoWHDq2LpZwiZRL59b
 5jKfs1b0bGiwq0B31tl0OEOdK6ierS3sV0cLDkwI3hY2GB1466QxgiqZtkDXpqxP/XRw
 IgXaADfqA9LP9KrzYZbUuKiFRJ4eF1E17qVHjXyRj9S88aon3kiZRqGEl1kF5RBn2wBE
 pwMOcnbLqGsAkTM4CnzWL6V/7eqDI0sy6ufh0WCLtugPSFc+5eFqAwkOdsb9NKJ/NMEn
 Ja5g==
X-Gm-Message-State: AOAM531Jxdy4zqTYQz/kRwAW93D+zU5RNsms/wKvD+G+IASDib6WbVaz
 TEFMAHrGboFsIgeOTvN+Vw==
X-Google-Smtp-Source: ABdhPJyTgJTFM5NXoV7ntdMWXNrAUbzEb6Iwjg696qOUlnMDqKMVqsb1IVxmC6Gqyn9VRUxLSXvACQ==
X-Received: by 2002:a9d:4e8d:: with SMTP id v13mr5250786otk.12.1611097860450; 
 Tue, 19 Jan 2021 15:11:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h203sm31052oib.11.2021.01.19.15.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 15:10:59 -0800 (PST)
Received: (nullmailer pid 2774332 invoked by uid 1000);
 Tue, 19 Jan 2021 23:10:58 -0000
Date: Tue, 19 Jan 2021 17:10:58 -0600
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH 2/2] usb typec: tcpci: mt6360: Add vbus supply into
 dt-binding description
Message-ID: <20210119231058.GA2772032@robh.at.kernel.org>
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <1610720001-15300-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610720001-15300-2-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_181103_012903_5BDCD10D 
X-CRM114-Status: GOOD (  15.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 15, 2021 at 10:13:21PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add external vbus source into dt-binding description.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> index 1e8e1c2..b8d842b 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> @@ -26,6 +26,11 @@ properties:
>      items:
>        - const: PD_IRQB
>  
> +  vbus-supply:
> +    description:
> +      Vbus source supply regulator.
> +    maxItems: 1

vbus-supply is already in the 'connector' node, you don't need it here.

> +
>    connector:
>      type: object
>      $ref: ../connector/usb-connector.yaml#
> @@ -38,6 +43,7 @@ required:
>    - compatible
>    - interrupts
>    - interrupt-names
> +  - vbus-supply
>  
>  examples:
>    - |
> @@ -54,6 +60,7 @@ examples:
>            compatible = "mediatek,mt6360-tcpc";
>            interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
>            interrupt-names = "PD_IRQB";
> +          vbus-supply = <&otg_vbus>;
>  
>            connector {
>              compatible = "usb-c-connector";
> -- 
> 2.7.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
