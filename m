Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61ACC04E69
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 08:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBU5IDU3YnwBp53y57StMty8aQuniHRL4zQy92EZojc=; b=jWPTszK3+UScCUS7EPoR0meMlr
	pq5u2UOfgzqiG7n+tZCiUtSCmIsqaLul5rQRaEZuBo8PERYQgCXJULjBwSh6iVIQV0APe20Uu/CJS
	+0BmylNOH6joBv/YXGYoFjeUORejuxHpCE0I9USFxpvfqodPHb1vdWz1JfaHRi6W+5H6OounZnw53
	Vw791pMVkxUyatwdLt0MgaTcy4I+oqfn6EZk+lIOiDGLEv9rH4Y4FIWRrt0JlUg+x/atPYNPCZ0nm
	n/Oqad5MVSzG/5NGJmQn/n0+WBAyIs+uqd7fZqwb+VxT5eBnKB7D0W51AGSdjjSzOGEOwNAfxptxV
	mJgl/bfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQkMv-000c18-2G;
	Tue, 01 Aug 2023 08:04:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQkMr-000bzq-2p;
	Tue, 01 Aug 2023 08:04:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96792614A8;
	Tue,  1 Aug 2023 08:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823D5C433C8;
	Tue,  1 Aug 2023 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690877072;
	bh=Tv+oYDR8L9V9W/c2l2OAdHIcJgsgGbcswiHtZzQaNhQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=I114Msy+sme9c8Xqqa/nLUtJEsHDs1ACQd4cp3G1yIxuGDbjrG8iwEG6x4by7ZNSH
	 bHOu12c4zWevOcO96Tz4nntB6501ZgchVnA6z9du0NVknqaNnsmsupZmfAncKadfq+
	 Tx4PoXAL4oyrcsFtWR08l1NYgkm9AT8c0WLygRyLteAZJW352I0lMv8m9KpOoiHf3s
	 p/299KpE27dGdrO/BVSaah1LYuYiSXTElxyIABR0XLzmnNNFT5U1ehbuPXkbc5E1ka
	 s12EYyRFq/BCKDDBAaHf7YDST3PkxF90VP+sTuqNWNMK48RZ0U2gVi+fxXBZM4488F
	 QPRXnUCo9BLSg==
From: Kalle Valo <kvalo@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: mt76: support setting
 per-band MAC address
References: <d3130584b64309da28a04826100643ff6239f9ca.1690841657.git.daniel@makrotopia.org>
Date: Tue, 01 Aug 2023 11:04:25 +0300
In-Reply-To: <d3130584b64309da28a04826100643ff6239f9ca.1690841657.git.daniel@makrotopia.org>
	(Daniel Golle's message of "Mon, 31 Jul 2023 23:23:16 +0100")
Message-ID: <874jljyyra.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_010433_977114_31162252 
X-CRM114-Status: GOOD (  13.96  )
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

Daniel Golle <daniel@makrotopia.org> writes:

> Introduce support for setting individual per-band MAC addresses using
> NVMEM cells by adding a 'bands' object with enumerated child nodes
> representing the 2.4 GHz, 5 GHz and 6 GHz bands.
>
> In case it is defined, call of_get_mac_address for the per-band child
> node, otherwise try with of_get_mac_address on the main device node and
> fall back to a random address like it used to be.
>
> While at it, add MAC address related properties also for the main node.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

mt76 patches go to Felix's tree, not net-next. No need to resend because
of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

