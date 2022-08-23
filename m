Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF92C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbiZWRUcicajTq1G5vO+gcweLyMS5zDHAhPgh7VHK8w=; b=RQV0QMuOJ0ojjxfvhtD4LUpung
	vy887obfND81DZZjjG6Y5MfZkD4W9PZVkH1HR2258G6YY8htoM9UYiJIEk/xdch5qOYZCpqUy+LHf
	4u3aP2gmukupTI9M9Nc1amXl0iley6Rmv4Rv0SJaq9lMlKTdYPYWFaap3UYc5dxvvvvv+W044nkAx
	ItjALhDoF3JKip5Pa4Gpd608WbcP2FnnWOziLjqbIah6H/ClqaDIfX1MesjuUMd3nRZXxdk+i7mYy
	yHJL2SO1Y12tgLhTn/Ls/sR1tM7om/Zo+Of/Aik3EER8KNKMj4YCDZsgM2uCVuR159sZE1Eb2lExF
	+FrGGN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQbLP-008nZ1-Iw; Tue, 23 Aug 2022 21:21:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQbLE-008nVi-9X; Tue, 23 Aug 2022 21:21:45 +0000
Received: from notapiano (unknown [194.36.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C2056601E70;
	Tue, 23 Aug 2022 22:21:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661289700;
	bh=qOOsmekSkW6Hia7P0btdf5BvIM63lXWon5zF81T+xjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1GAVjs8IiKtFV7MJaFG95tBG+MLa8oJFUvGYtNsiEALKI+3MZglvUYIgntZGS7hT
	 rR9Dzz46TbUA+Soo6IuDntNDo5+4XJEaTjxmwoh1muDfNprrQbUlwuXhw5OFCsWu5a
	 MNOY+NRKM7Ptimy1KMIeTP/gjkl//v0jrejBc9vAIReA4ha0qbL9i9xSkQp/mnvbM7
	 01FGmuV/ZY0MnuRW2+M5VXBuEyXn8nzjijQSsL7C7NKdU3MTkZmFjbQ6BfZ8EXemky
	 SdWxx88ibt7ZSAqkCf1RDfsL2WwUp+SgwfI9+VrNsBqhXq6PLROXIl7ZKCp4oXzV24
	 VnQMBX1l57R8A==
Date: Tue, 23 Aug 2022 17:21:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Hui Liu <hui.liu@mediatek.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@google.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
	sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8188
Message-ID: <20220823212131.negnjw7eww7woe3d@notapiano>
References: <20220818075012.20880-1-hui.liu@mediatek.com>
 <20220818075012.20880-2-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818075012.20880-2-hui.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_142144_483285_4927CABE 
X-CRM114-Status: UNSURE (   7.97  )
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

On Thu, Aug 18, 2022 at 03:50:11PM +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add the pinctrl header file on MediaTek mt8188.
> Add the new binding document for pinctrl on MediaTek mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

