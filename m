Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8FEC369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YNKQ8XWDNOGkmttM7lmuBkuDKFI1SZERoqQRgu4+Gw=; b=Dk0Pe0Q8PdMWJOOduNZZf+dMis
	vqmDi01Zh0pE1rW6q0aot5ppFLycqOzqbg0KNyg6GT36uKfks/2cX/a7WLnpfKVMlDROy0kEcZlvh
	HMHq7l0L5VmVqhKDAp5iz6wYFf7iAaTfwTcoS6HCyZ+F5JjFd9QBmSu9Za8n1KxA/ogkcbUjrMEXU
	0f9Uo14QXdVCZNo96o688k2YOHUB5Udsd+vh16KPQakJUyRmzdplGA+yYynE68mJnkTNBLkhk5Ha1
	67GqFrkJBRxvhpTtRLLLSu/7JMYTzOsIdR65erG+dH9H9oehnB9u5d+9c4oXaFRoYChA0qZBFLlKF
	wiQnjubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6y-0000000Efsb-3vTr;
	Thu, 24 Apr 2025 16:07:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ya5-0000000EVaM-2aC5;
	Thu, 24 Apr 2025 15:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1782D6845C;
	Thu, 24 Apr 2025 15:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DE8C4CEE3;
	Thu, 24 Apr 2025 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745508820;
	bh=wU9jfyce70/Gvv2ki/06OL17ud+SeMYiIauhmhd6z1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MSUPMNRpw+9NAbENzEu/+kpPuwRDFbBT5B3WQ6jEWpnVUdLMhWgHBwMRVnbg6HvLp
	 2QhU+fICktAQ8iVtXMB9jSnerbcSQJrM0LikVBpAS6i/kT81Hm5fx7kXKbGXGQcuPu
	 f3DOiCgZuEbUidiRV3U0vNZYphBr9t4toROxbXNtmF7DgcTRh70Og3B22oP/6FWmcj
	 ljppaKAvTLvJJYLm4vZ9KnwnDEYiwGLfuNU460dcn7SD87T9B2pnqKpGYJJhLn+ckE
	 P5uQwsWXmzJkvCDL7IEvaJsjX2D61B/tGTLMrY9+f0MFiT9Im3csqvbG47k4G+Cykt
	 eR9+sf18dq+/A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, mandyjh.liu@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
References: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add
 support for MT6893
Message-Id: <174550881826.1465250.14293935570790727278.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 16:33:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
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

On Wed, 16 Apr 2025 14:02:25 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> Dimensity 1200 (MT6893) SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT6893
      commit: ce37cf8b8520aa292d2eb975b009e15e38347351

--
Lee Jones [李琼斯]


