Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32963C32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZympAosiv7HNtkzYL+OA1JNxX6tPZ9gldgX5LGSRhg=; b=O/j8FWXYqFSA+NnFa0NzRwQili
	9XD4kWAB3L5yBi3A05vCxGCUrYvwGO05k0QYo1zzcGEeIQibDiC3Rfx1WPtarlWQ77kT+8H+p1/B/
	hGCRUZnW9zCDldd7K2/8K4fFomaEeTq5mJPEYmbs9u83tHAJQK1CTmgZmXSHwIYehxo0iChB0+54g
	KmijZNEpN9KntzvvLJEgsDpyzN1fzImLb8wIzhiH2tGkXEunfLn9LXy3PuBntTPaCKhc8W9BZ6QJJ
	IFCjHLeIMCtsLvuHCi/fuUfZAufbyybaMEFptwQA+WCdf2efFpidAhksA3NRiVb67YVOsavqbj55V
	yvztYSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQU96-006OBP-Cu; Tue, 23 Aug 2022 13:40:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQU8p-006O5E-2h; Tue, 23 Aug 2022 13:40:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06DE5B81CD9;
	Tue, 23 Aug 2022 13:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BCBC433C1;
	Tue, 23 Aug 2022 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661262023;
	bh=2+G8RngWyxAqke4bxt5usQSl46UvUFATARmSK6gRm08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UR4Yhx5x3P7UUehzGuqNuzCVIf2gG92TqIHiUZCgn2xLTwYRb2BVaZrDxywPFMTuS
	 DfZsw9vCLLbY7N/bQZC23Zkjy41FwvdEeo5Tun5uOeKnzCyF74pyaeEisT3P6+PjEs
	 BsgOioP5FYI114KFoLroQy1P5Lnh4LYS0nwkjlMLhNMEg8PJQXqgj+lwFwiN+c9KN8
	 8lYKt4V/iCZLVw0/KJPCUfWw+PNu4zvZrY0ehvbtPOVGWPXckhaBR3eX9u+geCzmem
	 W4PXWcPnwonjUG5yfZfHDDOds0GFC5E483C5vp3iorMnxsgwARYXAeEgllZNj0blXb
	 AiehE9Npm4yuQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Rex-BC.Chen@mediatek.com,
	Liju-clr.Chen@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jian.Yang@mediatek.com,
	TingHan.Shen@mediatek.com
Subject: Re: [PATCH v4] dt-bindings: PCI: mediatek-gen3: Add support for MT8188 and MT8195
Date: Tue, 23 Aug 2022 15:40:15 +0200
Message-Id: <166126199986.63298.9651112044432926221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802120624.19258-1-jianjun.wang@mediatek.com>
References: <20220802120624.19258-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_064031_448948_BAACA096 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2 Aug 2022 20:06:24 +0800, Jianjun Wang wrote:
> MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.
> 
> Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
> "peri_mem" instead of "top_133m".
> 
> 

Applied to pci/dt, thanks!

[1/1] dt-bindings: PCI: mediatek-gen3: Add support for MT8188 and MT8195
      https://git.kernel.org/lpieralisi/pci/c/7f08e806a03e

Thanks,
Lorenzo

