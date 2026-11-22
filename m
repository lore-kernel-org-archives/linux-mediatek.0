Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4CF606A32A
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1aZ9GHHI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGMYpIkd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EBU7rnFp3oNZ1pkjtzcdL/kgfbKnHYrr06MJchmz4II=; b=1aZ9GHHI8WFlvKyPcV5ipKgDRd
	nyyiF5sWZdEU32k9MVzlTsQQkqb825VPk39ryRqd/Rf6N0FZ8pG58GYfq4WGXEVkOZf6rEYvpeoJd
	NDTctrZWg+cU5CAVeE9qOivMDvuCS6VUaA9nB3byRVTx4pJ4UaL7lS3Q6hH5/fWZCIe3TicOaLhgw
	3bNWIAsuewDLjof2VJieA88OUkZScDGHr2BCBXWrQo+z/bLcIx96zLju+pH1Bw2lOSpJ+0lGZA+6U
	HzWbxzVunG8pcEsbg/7BLy9MzFfbp7I+ztkQDEUqWiL2G7Cqy+RCzSU0/EtQD4TfdHWIHVxnioNph
	wvbRe/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8hJ-00000001CvM-2jbx;
	Sun, 22 Nov 2026 14:37:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8hI-00000001Cuq-0hoj;
	Sun, 22 Nov 2026 14:37:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AA9260625;
	Sun, 22 Nov 2026 14:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C4A1F000CA;
	Sun, 22 Nov 2026 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795358258;
	bh=EBU7rnFp3oNZ1pkjtzcdL/kgfbKnHYrr06MJchmz4II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BGMYpIkd/ioMH4S3kcMt+04VqtNUNSg931SSFKuMt8YlPxRXmAVTXP9IyxuwQbBpB
	 ffc+Ecc6wsbAhOVHs40Gq5Xuoyf4DFsIf+VhP6UKdlI9bhq25Ux5Rtr6OtGFMAJgDo
	 9vgNsQFFAO5L0TgpjnP2cMdlwH51CyAh9paGR1TUTviFYI5CFmaCWozTx5bOBRrUU5
	 R9iOcIsNplkKmu6q992OIc8UiAnA7ohOUb6HVtURnHCyfSLDooQMOCccXuwRKrvSPg
	 UkSE5Yvf7RROOeiSBUoajnFotCuguSbPEQKPPzuERmHrT4JhbD2XoBGQrPny3shxEQ
	 +9Mk2FmUKnNEQ==
Date: Sun, 22 Nov 2026 15:37:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, daniel@makrotopia.org, 
	linux@armlinux.org.uk, arinc.unal@arinc9.com, Landen.Chao@mediatek.com, 
	dqfext@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Subject: Re: [net-next v5 2/7] dt-bindings: net: dsa: mediatek,mt7530:
 describe 'passthrough' hierarchy
Message-ID: <20261122-millipede-of-excellent-energy-33efa5@quoll>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-3-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116183332.168858-3-cjd@cjdns.fr>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 06:33:27PM +0000, Caleb James DeLisle wrote:
> Due to hardware limitations, full switch hierarchies are not supported
> with DSA based on the mt7530 DSA tag, however it does support a simplified
> hierarchy in which one or more switches act as passthrough conduits with
> only one CPU port and one DSA port active. Document this capability.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


