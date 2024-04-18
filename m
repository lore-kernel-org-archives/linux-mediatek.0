Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E77C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mxoqu0AF9V4OdrDqQp1ApI+aUU8j8vHX+s9AblvUv90=; b=Fv0bN1ySgWuxjKCSjX1veZ1uUT
	nAXhHNg3+DciytHrgx+XgU9u93QkDXCw+G8wSb9nvnuKg3+U8cw69OxBPL/9QHZIxS6P5D6NUenXo
	gaB3CwCyTNKODJkvDVlHtIekQnWNe+VmbWeAc9IQ0YbqaL6HOrz1P5piXMRHtJ8+EYm/8Z61l7X6r
	ZDAZ+vmv9m9PdT9+IkNKAeCv93V44yV/yn22LzWA9mn5oJapEVaCSl3p+L+PGSHu3jDkSyO4VsTLU
	GG/xKtHKHA/hpDOTSgZBlPVcWTEh89iADzZNr02OHKJs6FLbkGh4hOZUGWH+dAZjaTopDtx9CWr4E
	lRrUDffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPOs-00000001t8m-2SX9;
	Thu, 18 Apr 2024 10:53:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPOO-00000001st3-2zS2;
	Thu, 18 Apr 2024 10:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713437601;
	bh=SDDFhbUiNOwHfeB4Vw/OZxgE2arSxDacnYuS9csQZRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kR+ja2UMsEgj0JRYQpxSDG7coPupOpBYOaLnNRByXmaQn3wgUqA6Bb02s+UX0Hsbk
	 +0YeVKxn+uPnO7zWvz8f1nhFKoLOpHo3pkgJd7UM1fvaYAfPLqO9SUNQnxTB1E4YS7
	 9aX31mD04D7PXwVXBtd3pgbbyntchqXNhLnEJEYbA5inq41D9VmqVX5vwPPSGRfvmo
	 rqSfIPrf3bwH1xWykPcvFrdEY7fNsawkCIQ1Fk4YUS86StCtxUq7W6GWshpxfN/plx
	 eiwDiR+KdEn3bDBfslA5EMajyk2uOHkqTUCtpi6rPRrY0//XiJNNff0lZpYO7RioeO
	 /D+YhDal8E4Dw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F1A3C3780C22;
	Thu, 18 Apr 2024 10:53:20 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Walle <mwalle@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
Date: Thu, 18 Apr 2024 12:53:15 +0200
Message-ID: <171343758902.247007.7489492694009874618.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408080816.4134370-1-mwalle@kernel.org>
References: <20240408080816.4134370-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_035324_984684_C2C34F89 
X-CRM114-Status: UNSURE (   6.39  )
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

On Mon, 08 Apr 2024 10:08:15 +0200, Michael Walle wrote:
> Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> computer.
> 
> 

Applied to v6.9-next/dts64, thanks!

[1/2] dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
      commit: 465fd1517d9fda695f8105867cb8547272e9963c
[2/2] arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200
      commit: 7d35c006a52661fd4d17a9f1ab627336cb215b97

Cheers,
Angelo


