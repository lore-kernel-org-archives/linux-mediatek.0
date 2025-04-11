Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F96C369A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZlzTaUTWuHW5xBT0sVI85B5bgiEOliqUztFBmHrmSE=; b=YJL1/Ne5RxHxIsTb/8qgPHg9et
	jTJMoOKatwyF7bmy4pL6i2sPCEj2Y4SFjk4rdxOg629QRUtdDAeRD85Yot7fJWF5fetXB3hZqcVex
	6uTRSIFcnWmHRiYCmPwvRdj8VIEeqseTiaqF2NQGOLXNPJVKGO0KC1koE1hAUYDPFbnk+Ao/H7Civ
	0m4OD6EXcWbw6UvI5jgOv9fZlX52bSWGii8fypfWsGezOzvrCYjGfgEPZgX1zr2axP0fVR+GNoJnP
	JaRH64V9LiaGubKwHJFzxm7lWyPdCX4DU+uiN8JTAKaNs4TWYwyjY9VU8oZ/5xB6hVE9z3V6Z022R
	ukPGMong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I9l-0000000EWGS-3UIr;
	Fri, 11 Apr 2025 17:27:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I7w-0000000EVrS-0Urt;
	Fri, 11 Apr 2025 17:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A71B8A4ACAB;
	Fri, 11 Apr 2025 17:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B2DC4CEE7;
	Fri, 11 Apr 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392314;
	bh=wKL6klck+zBAXPJH7vpcgxZNxZBcOAkRLudiLM2Ns3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up/PWyhT0eLoiCHQaOrBL9cHonTnfSQPtDomBOSEM813K7ZiLq985bQklbdSym773
	 O33EAI4T2+Njvk+qfa0JE0ZeejoEy/Cj3TNZBSC93t72tKBK2oJlx3vOOBicD+54QZ
	 HL+PXJj9CO5w9qIBL1UZ9eooKlKRBkM8b8H08rCP2hOeB+EBdHusZ1mY5i2LYIQKHu
	 QxcbmgnCsbkTILHGHUBtrIdZTvXdVR1Nn8ukV5CaFUIzNAWMTC9rgxnULBvDwgfd66
	 HhSrBtfoe+HiEa4iLQrQYRJ8gjwbhbwEM1m9YNGcBVGRM8Fd5dmKFev/Chf+Or0bYy
	 9B3MK0o/cyIgA==
Date: Fri, 11 Apr 2025 12:25:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: power: mediatek: Support Dimensity
 1200 MT6893 MTCMOS
Message-ID: <174439231282.3566165.14821715325780672996.robh@kernel.org>
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
 <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102516_217909_3847B498 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, mandyjh.liu@mediatek.com, ulf.hansson@linaro.org, kernel@collabora.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 10 Apr 2025 16:39:42 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the Power Domains (MTCMOS) integrated into the
> MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  2 ++
>  .../dt-bindings/power/mediatek,mt6893-power.h | 35 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


