Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C977F33808
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxEzVTQ0/5YkEKxh4Slo4nsWqkIJV9PIHRwtvUEFrN4=; b=YffPAClCTJXPqS20JLlcpH7Wt1
	wI5pFrjDSaebco8NwZvbSG0ibwbuKNKyfKdJj+cKd2qKUl4nM4Wo7BCglNmPgBEX4U9zL+PAaQX/e
	M9iLb3Vejs/ZrupNKSNrj2iFTWEjs+oLOqOR1sPTy8hy/bScnxXPAJ9zIgxvfL27T9ofCE1/G9iIJ
	3GYLph51Ufs+BV5j0jocfFnY/9o+jShuP74XoeHpoF97c7KhOZbuh382aIkHVAAxXvpzw4sFo7geW
	Ie+lzFSxYH2q5ZJ4D7MxW4Y/n3MOOIoDOToq7628+OUxsW604rzSrMK0/cvbRRoeBd1ZOgwZwZqZw
	2PKb5cUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OoY-00000005ZHi-3IF3;
	Tue, 17 Mar 2026 07:26:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OoW-00000005ZHE-3o7i
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 07:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1626960103;
	Tue, 17 Mar 2026 07:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39822C4CEF7;
	Tue, 17 Mar 2026 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773732363;
	bh=KMKAdvpD2asi94LOZ7jH4G+VPl2+Iliqwp2bhPbfUxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WpXz/bV4SdPFXXSpUQ05WRbcGKDUCY/81Laisbg4J3SllB96Cfg7GHRiV2025+ZYZ
	 2y/yz1dgkT9xuXBNbevh1QEGyoX3C+cpFxuAhw4iNZnbDpdv6wP9bX4ldb76HMbskn
	 pL/RhwY5WdLC4ElRsjBmvbjA01o2WhxA7XyjtbBUDjUfk4QmQc8uP1iDk6u0ZJ561P
	 IVRurwb9po8NDG5e2ndDxn6DGDVpkzZCd1+xEB/p8n56YFD6vClOxDSCxiGnj31If+
	 gtYwj6XEvwFyU7wo7W34/r/veDTz84QPc65ghTuk83N7Uj6dzOzG6zBzFFjqGOnf7X
	 cBCVQ69c9GkZA==
Date: Tue, 17 Mar 2026 08:26:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260317-feathered-cyber-snake-eb72fa@quoll>
References: <20260316155157.679533-1-cjd@cjdns.fr>
 <20260316155157.679533-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316155157.679533-2-cjd@cjdns.fr>
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

On Mon, Mar 16, 2026 at 03:51:55PM +0000, Caleb James DeLisle wrote:
>  
>          mediatek,pbus-csr: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: econet,en7528-pcie
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          maxItems: 1
> +
> +        reset: false
> +
> +        reset-names: false
> +
> +        power-domain: false

Wrong property.

> +
> +        mediatek,pbus-csr: false
> +
> +      required:
> +        - phys
> +        - phy-names
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -436,3 +462,59 @@ examples:
>              };
>          };
>      };
> +
> +  # EN7528
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/clock/en7523-clk.h>
> +    #include <dt-bindings/reset/airoha,en7523-reset.h>
> +
> +    soc_3 {

soc

Underscores are not allowed, but honestly neither soc node is needed nor
the example. There are already 3 examples, it's enough, especially that
there are no new properties here.


> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        pcie@1fb81000 {
> +          compatible = "econet,en7528-pcie";
> +          device_type = "pci";
> +          linux,pci-domain = <0>;
> +          #address-cells = <3>;
> +          #size-cells = <2>;
> +
> +          reg = <0x1fb81000 0x1000>;
> +          reg-names = "port0";
> +
> +          clocks = <&scuclk EN7523_CLK_PCIE>;
> +          clock-names = "sys_ck0";
> +
> +          phys = <&pcie_phy0>;
> +          phy-names = "pcie-phy0";
> +
> +          ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00010000>,
> +                   <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
> +
> +          interrupt-parent = <&intc>;
> +          interrupts = <23>;
> +          interrupt-names = "pcie_irq";
> +          bus-range = <0x00 0xff>;
> +          #interrupt-cells = <1>;
> +          interrupt-map-mask = <0 0 0 7>;
> +          interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +              <0 0 0 2 &pcie_intc 1>,
> +              <0 0 0 3 &pcie_intc 2>,
> +              <0 0 0 4 &pcie_intc 3>;
> +
> +          pcie_intc: interrupt-controller {
> +            interrupt-controller;
> +            #address-cells = <0>;
> +            #interrupt-cells = <1>;
> +          };
> +
> +          slot0: pcie@0,0 {
> +            device_type = "pci";
> +            reg = <0x0000 0 0 0 0>;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            ranges;
> +          };
> +        };
> +    };
> -- 
> 2.39.5
> 

