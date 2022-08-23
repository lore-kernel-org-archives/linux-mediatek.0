Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB54C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBPsYL7j3mcv1OAzKQx2qf58G+KjJKmRbYve+n9zh8M=; b=uX1Og7PYLY+NYu9KklHI4n74Ew
	Lx4uoPv6nGfvuZ5186hWrYIqvbgdDYKLfQtA/WM4HAQfeK08WOOH/rqNb8uZYetA5lbrZhV6u41kz
	6MP2vzpFlLu2JNlm5vRBpD0rtbO/ImwIjOw40+KS6H9+KpCKXAefca1KKVjm3YHTroBxVmu1y+O+k
	OneOOzwfi1LwuzI+KEc8UIJGLIuKRNyK5HiHYm/flOSqisElx+4Skia4kvT0by0/a1uXj2QZrg639
	4JxXw7AeAauCjtUkETZMe8OHH9kkz9ASQTAMLeFU5qT5z8G1NjFf6WBpWMSsOQM//Zod71aAJdhnh
	WHlSGN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTP7-0064Fa-9o; Tue, 23 Aug 2022 12:53:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTNr-0063bL-1S; Tue, 23 Aug 2022 12:51:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 122056128D;
	Tue, 23 Aug 2022 12:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44157C433D6;
	Tue, 23 Aug 2022 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661259110;
	bh=euzsWs7Ghu5JJlT1IL0uGtLV4JRhHmAKUQE3naTbSic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dd+Aht/Icr7N2Jll4Wg/zI00IwuUSpROwJnZ8p5M7i5Dy2YKJ3Y6HgtblmleWkFOQ
	 IgkxjrDNevzQhV+qTAbU3clfCyoAOfymga6STgddxkb6mBWI8q33CEjfI+ylca61Mv
	 +VaTLkj5Nc4J76/cJFporhUgz62iPcDrcbKn0IXLT4ZRAePZeMss8vREiF5Lonr+k5
	 meverhWuLOosgpjmHi1Tnqi/E8L93qHdZriGoXQWzGm1wZTQQfroxKEqQWqT+h7yr5
	 Wck5XKQHD/b9dWetTIG5nBAkrVrNq8stKXboN33brCHr0bm21+/VtkWQzPgtd6W8rj
	 fEwJUZzar7iRA==
Date: Tue, 23 Aug 2022 14:51:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>, Rex-BC.Chen@mediatek.com,
	TingHan.Shen@mediatek.com, Liju-clr.Chen@mediatek.com,
	Jian.Yang@mediatek.com
Subject: Re: [PATCH v4] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
Message-ID: <YwTNXaaotJW/vUT9@lpieralisi>
References: <20220802120624.19258-1-jianjun.wang@mediatek.com>
 <5c14e959-10cc-5520-e88f-b47a195b99e9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c14e959-10cc-5520-e88f-b47a195b99e9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_055156_754470_DED1C888 
X-CRM114-Status: GOOD (  15.00  )
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

On Wed, Aug 03, 2022 at 08:44:11AM +0200, Krzysztof Kozlowski wrote:
> On 02/08/2022 14:06, Jianjun Wang wrote:
> > MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.
> > 
> > Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
> > "peri_mem" instead of "top_133m".
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> > Changes in v4:
> > Remove "items" for "mediatek,mt8192-pcie" since it only have one item.
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Should I pick this up ?

Thanks,
Lorenzo

