Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4FEC07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1nsU6G9+dJBL+H+um2LKp+0M7TJ52ob9HiOYSkASW4=; b=l+UTNC6XYR25TFwLgCSvIq+UBm
	KeSfy6XpGKvElrI+3tBn1tak+ZVBNSJjCrvCtpl8EnfRNt6EByto+vZfPvDhGZIAcFZK4trNYSQK8
	7xPtQAtiwUABtysqoKgGEMzRB97ihFm6Lx8i1cL2PQKN07IKAhZ0ypz/Fn0qi339HzCZGGB2m6br9
	J4fJJoAhONRl6z1xPjxNzw0ZfR4SgLjIrsa3hRkOYCKMRw21Ga44shUsg7SMKNSt6BbEtO4KQK8fc
	2gKNBv4Xkxx5G5wwS6whbiKvI5au8NqelWWylZaYGVUfoDlDiVSh9hv4x+YXQVNPP6S2xEXbIhCaI
	1RBhD51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocird-002sQg-QU; Mon, 26 Sep 2022 07:49:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocirK-002sGg-V3; Mon, 26 Sep 2022 07:49:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 656976185F;
	Mon, 26 Sep 2022 07:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978F3C433D6;
	Mon, 26 Sep 2022 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664178538;
	bh=Ls0crOyKk+lkt5TTs2uBxIeihBWmZjPuhe4cTEvU2s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEFaMW2CEFbnuKtlIjOgMxeDsj9tyJuHJZaXMY/oHyOOw1vDBO9xDon1sV7Bcv6yp
	 Cf/J5L/E8oxCvjn+C3Ptog6MkUAxyq33d95WzV0Zhm+xDLlW74loKvJrlNI5Ezewut
	 u+K9x+IpZVsl9/RhCopjzTHMFrqMAur5ojhymucQmWb0Lgb1+nfvXduEjlXGHwTzIi
	 AzXkxrCHpRdUTb/XmOxI/JVtrwEwVXE0fG5UrUDkqjyzMND5e2xd7mbHHXHLiw3t1W
	 voh4mA8XMMKaLywuwJxgLJPEj8EEfxcy/d8DQoodT5Nm15AinVEOGP0wlsWUZFK4V6
	 tVdZWA+WyCRig==
Date: Mon, 26 Sep 2022 08:48:52 +0100
From: Lee Jones <lee@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	hsinyi@chromium.org
Subject: Re: [PATCH 1/5] dt-bindings: mfd: mediatek: Add scpsys compatible
 for mt8186
Message-ID: <YzFZZErEDZLC9Cuu@google.com>
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
 <20220923131148.6678-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220923131148.6678-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_004859_088057_73BA7A90 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, 23 Sep 2022, Allen-KH Cheng wrote:

> Add a new scpsys compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]

