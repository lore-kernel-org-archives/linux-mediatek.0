Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CC0C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBKc9+rHw58VktgGzHBl0MA2GmuRcvP24BAwcGDkRA4=; b=egjlhus2XqNPZq8obCEPaT6dvE
	RR9NANjqlh0u+Myrl3R9dVe/sYRSabXG8axz5RAA9JRSslW8bdo77h2r9rT+GmzqjERdUnHi4J7tb
	JP+VlYzPjE5WkPEJJy9nuC71+/1Rwr3Tp83XisoBbb9Dm2uAVSko+DS1DAXh16HmMHq+5osEGph7K
	bRSqJnew6e3m7+JfMXzXxFiiVJvSX5YH7UtEH/UsH7umrxY0S7yABool3cY9Hfz40EO0ayN+bSycE
	OIdvLTGaDsCDGGrrjrx0+Uq6WLD3wx7nYtPNlX1TiNWCto3O2ddTZXQokCz9sIUU910qXhwjWukLa
	1KrMSsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltv-00DRL9-2p;
	Fri, 21 Jul 2023 08:54:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltf-00DRC1-1o;
	Fri, 21 Jul 2023 08:54:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA98C660709D;
	Fri, 21 Jul 2023 09:53:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689929638;
	bh=Xya17JrPtcaUFCD4nxdiCsZbQZPla3RR8rxHI/ZOwo8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PixxK+yV7PsLsucPhBl0hzV/wy2iNF5QTyTA5yai9TWOEOeJeL8W2yEgzpbRruJPL
	 6HUsg9xuWA/aoq4hW/6E6xgFzXwBVr+xrz1rFDbsQi47DLBaLvLkL9cbcjXoorDrI2
	 urI4NiRgk4cJ+enTYNrXFeInXDXtyML7th+9W0Yljcx4TNpBUDaZXm2OHVx+johouq
	 TsBxNlXf9xWSiGJ4wDKt2jFrF9ZeHbsaC/hGMIZLKHhT4hKdXnySCg85Wtn0TCei1e
	 00Ty3Y1uxCP7JkByHuW6hgncEaHWLxAhgTtEiurVOceIj+/NhGkuoRUvlMk/IKJYPe
	 A8mL9+mjLioMg==
Message-ID: <de1c411b-f1f3-613b-5b6e-2b3dd3c1d4fd@collabora.com>
Date: Fri, 21 Jul 2023 10:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v2 2/7] regulator: mt6358: Sync VCN33_* enable
 status after checking ID
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230721082903.2038975-1-wenst@chromium.org>
 <20230721082903.2038975-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721082903.2038975-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015359_728805_90E54B70 
X-CRM114-Status: UNSURE (   7.93  )
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

Il 21/07/23 10:28, Chen-Yu Tsai ha scritto:
> Syncing VCN33_* enable status should be done after checking the PMIC's
> ID, to avoid setting random bits on other PMICs.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Fixes: 65bae54e08c1 ("regulator: mt6358: Merge VCN33_* regulators")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


