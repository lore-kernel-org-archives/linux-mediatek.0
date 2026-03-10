Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F7FFCC9DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeH7XPZJStq0X0OCAxKVN7P1u+yWEiPTCZ7NPbPQGPQ=; b=LfHAVR/dWWb7pOtnAENrIlsFIk
	e2LP3MGyiAosVNmJ5RKer/L92ZtEHMcxLzJnHBUvBVvZq0nGINYMpi99exA6vSGatt0qdlQQR9XE3
	98jvZekOljeEOTGN5PbiOY1xHjlVM7b7oBQMxOoD0N1V/JKy+GPWCyrPfmvTMhr1ghpFukk/qnFIB
	+E6zyT1Wfw/B/ZLSabEFkQDrxXLUwBIJpvHuUZcsJV3NSFlgxpPYNlZ+w5a7ZKp4cyryz7obujjhb
	I+gz2Vm33NRCxE5GhnUqwJ3+kC6CkFWVtnMujobSMORj64qKJgyyj7JMbvoDcOVBzkOPkWhMHq0if
	K/u0Fh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsPU-00000008wRt-2TEW;
	Tue, 10 Mar 2026 08:25:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsPS-00000008wR7-3pQQ;
	Tue, 10 Mar 2026 08:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57F1560054;
	Tue, 10 Mar 2026 08:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E43C19423;
	Tue, 10 Mar 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131146;
	bh=cuyXodzCUJDUciuTuMLZ7yq7kwx0PZeH+CANPawJXyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JieQepDVERwVWnitXD9N0MA2AcgB0PzHHytY/SxYWvP2Xligm3ViBnsiU8IYik0dR
	 +GgsBzXMC+1Sb674F/+Vrzicw7e4nnJCBVRozia6Zw2unGpEwFwYkdSKoHMJQs0Rnl
	 1WnAIDL8Y0AMpElTrVqOgd4qcLzL4Iryfv8XC2vObnJLBhLpPYFvOzMyG3Mb0+kI9E
	 ZVi7cuwk/TJp5wf9lfyGHBWhPFvmGQpVWSg48WyYdJMC8xgBxEUhCMBnJAeWLSpAvu
	 TMlz+ZnNkCKWW4b3G0MEbyElarMvt/40ChM9TztCXTpysEDuaBfNFGdV+Q12NVj7Sz
	 Aza/AOg1DwWmg==
Date: Tue, 10 Mar 2026 09:25:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/8] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260310-onyx-ibex-of-progress-fdf1bf@quoll>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-6-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309131818.74467-6-cjd@cjdns.fr>
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

On Mon, Mar 09, 2026 at 01:18:15PM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie.yaml | 1 +
> 	 1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> index 0b8c78ec4f91..57cbfbff7a31 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - airoha,an7583-pcie
> +          - econet,en7528-pcie

Patch is heavily incomplete - why do you have variable number of clocks?
1, 2, 3 ... or 6 at the same time?

Look at the rest of this file to understand what you need to write.

Best regards,
Krzysztof


