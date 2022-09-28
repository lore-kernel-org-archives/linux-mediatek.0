Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC876C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Nd38RWaeqtyRXGOb8X7Wg1TUqXO2zohi1MBMT5Yewg=; b=dHKxlSK1LhJQG0wBHJ7n/tnbQV
	Vhd+GFtVRU276g+1RItJHhN+xSqqH2MOU+pA49IGU73bqukF1qSJA/fwFlAS1oqCV8XFwaAGi1Gj8
	TJ5IdxakLul80rBsv4t/y8oA5mx70IDO0YbDvY2tqrAhm+aPp+mZ2H73C5QkWCLOa5FuB18NVHBVu
	nBQf076g2zipexo7gSAMJa5f9luL22UvIdJt9kXA0xEJd7dfUuxRkPmRwx5iyNuOeq4JlX5UvwYeK
	vApH7rc1nhAkZuRe+jHjzfn4RQkchMOi8R8W/r4igVfkUBe23i73coDRkxk1OlX9o7CiG69A97ggu
	wPL4ek+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWj5-00GPah-V3; Wed, 28 Sep 2022 13:03:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWiu-00GPWf-7p; Wed, 28 Sep 2022 13:03:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EBAD660036A;
	Wed, 28 Sep 2022 14:03:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664370215;
	bh=QTkmnZfDvZ/mxFD41uorhVv9pmaNcBMChA47HDWMmlo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HAf2xSvWQW3fkmlTPrU8uPmlSJSSUVgnE+d+UN8sojt/d1DU8XvFBrsMIBdpgecnv
	 94XCpGQYSixf9ikw17q1zdPkbKKoC6WOdQD79Mw1c+4WmHhHukIyJr9lmv040S5Ng+
	 ES1nYHjPebgmtItBZAzfgEu1LtFKugK2cply+Ilt080KifFfiHtDeXvxfAUTIuEN1z
	 bx3E5W+GdnHDDxP3HvKt7pkiKLSCrRDKYYHz5VT8O1D7s+EFpOPjoyxHsnKAYBasrB
	 1K/faNNPiEFH/N92O9Y9YlR4zkuhueXsZi4j/lbUehDgYjstUZA8mnqnpobtH0wZSx
	 uNwYBOALDdstw==
Message-ID: <9d25bf35-dd88-70f1-6876-b8c99ae7b4a5@collabora.com>
Date: Wed, 28 Sep 2022 15:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [resend PATCH v6 3/4] arm64: dts: mediatek: mt2712e: Update the
 name of property 'clk_csr'
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
 <20220928092308.26019-4-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928092308.26019-4-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_060336_437253_399B5C8C 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 28/09/22 11:23, Jianguo Zhang ha scritto:
> Update the name of property 'clk_csr' as 'snps,clk-csr' to align with
> the property name in the binding file.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



