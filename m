Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08C1CCA473
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BtT5kWVHkZCHYYvzhi0dUg4wfVVhnHdHn0rc89nniPk=; b=mwjZK0P68wsOws
	fCqrH4aLBB8H512SJYntLN9GpdSmAcL8TptTC00OEMxS08/2qmcgfknG4HtdwQIedENQH+LaSqvhZ
	tjs4CYHQ6I7GPjepgYL57cvv5vMq8cMnxohWo39WY14dS/lv0QalGnmzISt1diqRNc2IY15P+gZwu
	zOxJP4jf8WYttcpppl5N+iiuAz2ERQcbPQ1+jWx/Ficm2jazKbpVdR4LEqvN81eMBsd4nC+NWOoEE
	HRZWOvQKgr/wsu5aECCCIuecHemIRC+I1zC+SfpjevAR9kTreUB5OPolNA6UGUmbN/AG3LedXQffg
	pMd43dZxMk/yt44omAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1UzV-00FAOg-Vz; Wed, 15 Jun 2022 15:31:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1UzK-00FAOA-Dn; Wed, 15 Jun 2022 15:31:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00BA061720;
	Wed, 15 Jun 2022 15:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20695C34115;
	Wed, 15 Jun 2022 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655307081;
	bh=r+yRrxHClzv1P38azR8w13O3Oa7kVO4IL+igkr/tjqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NsRoNoq8fE3qubujywO1GcEOTOQeZqx6h1IKN9ZdyW1BfyjX8+3S9GHfirXsE52Zk
	 poqn+5/PPTm0kG4HgW0EbqyJssvgQUfkjUdfoVoQYmO5jrET8HQHq20D9vqx404hZs
	 eyztWGEjNJ7EZYyLa2Dr3JY2xNe1O3Zaw5UbDHAzEczTRMa1u1rUiqDCySwh4Ow6tL
	 RcQy/emi+IQy9h2d5B4kZD2vGXPxcfGbmQBtwvgN1p86y4nd1ZYkhVSMVrnIuvjvqv
	 nRFYEy2X4GTfz0CI0GmNS8PPBycVtoYixfiKfThx8DlVuim19gfzF6lmKFZWZkPPiN
	 xbw7eQaRXz9Pw==
Date: Wed, 15 Jun 2022 10:31:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v10 1/3] dt-bindings: PCI: Add support for Airoha
 EN7532
Message-ID: <20220615153119.GA940910@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615125335.96089-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_083122_544639_F54F75A8 
X-CRM114-Status: GOOD (  18.60  )
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

On Wed, Jun 15, 2022 at 02:53:33PM +0200, Felix Fietkau wrote:
> From: John Crispin <john@phrozen.org>
> 
> EN7532 is an ARM based platform SoC integrating the same PCIe IP as
> MT7622, add a binding for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Applied patches 1 & 2 to pci/ctrl/mediatek for v5.20, thanks!

I assume patch 3 for:

  arch/arm/boot/dts/en7523-evb.dts
  arch/arm/boot/dts/en7523.dtsi

needs to go through an ARM tree, right?

> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> index 57ae73462272..684227522267 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> @@ -7,6 +7,7 @@ Required properties:
>  	"mediatek,mt7622-pcie"
>  	"mediatek,mt7623-pcie"
>  	"mediatek,mt7629-pcie"
> +	"airoha,en7523-pcie"
>  - device_type: Must be "pci"
>  - reg: Base addresses and lengths of the root ports.
>  - reg-names: Names of the above areas to use during resource lookup.
> -- 
> 2.36.1
> 

