Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F06EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 06:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NzR1I99w+OmqeIk+63u/6cXl7l8eopBX0LWmbrlLvM=; b=t6Ixk1Qj/oK2vUudyt88ianpsJ
	blO0taBHKOJCi6yNEujFTM3dNkInQiafj+H49E4hQwjQw5L2Nh7vVovtNKe0q5J+vIwz0kGgd3tvS
	jfUR0z6ob7uWQpJRK64CmlIPqPBUauhhRq7qmqI+WKQL/zas1T8tGkzFVIOT6QUI76YyO4hQHeX0E
	urGJVWVzN1zVI2vqf0xbKnbGUchLn/SiCGDt5nWPVfTKTcEQLmrTw4k9nXrR7EqxvGdCFaHZUjr4K
	TUPua9isMy+6CSx8unhzGKE8P4sKyj37IMXFggggyl0/LUO3ZTM0RLkbQ+cM/+3AQ7Su6sSWhxf+V
	Nxo4CEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfajX-00HLrN-04;
	Mon, 11 Sep 2023 06:49:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfajU-00HLoQ-0b;
	Mon, 11 Sep 2023 06:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 172FA60EC2;
	Mon, 11 Sep 2023 06:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFECC433C8;
	Mon, 11 Sep 2023 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694414934;
	bh=hPkw5GuTE8bPGfOu0uc05CKGeaAlGIBq7eXbCERyugc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ldhH/t0eiRtV+iZqz18Dv1szdI3r/3d5j6n9FFbDsWFdFE82vSeKbXvo+TBa57BKv
	 6Z4Kbb8pfOH4sPXuzEXBbsW0ZEMS47IT5HfsK1sKXFqYVrh1ZF5EJ3XzBDmXDxRXIi
	 rfwwWluSwQNnQzoeAznGl9WbBfa8C9zRqSZ6FSndf4T/B6VJA22jqSCmAXMX1XXIQ9
	 SxYb/5wLKkuE8hcSlMovNHP736w2vNTbT8p8BBx+dOqX+qMlUaNRSluFXu4TjBvTO/
	 5c1lxGkXI13A8E27RaTHYdpzJ//L0LdG6gvsillgR/Wf9zcCzLTu1+YpOdzia3te5v
	 oYjFxdiJYO0+A==
Message-ID: <f8f2403e-5931-1b33-850e-e88cca4b057b@kernel.org>
Date: Mon, 11 Sep 2023 08:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 01/20] dt-bindings: display: mediatek: ethdr: Add
 compatible for MT8188
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230911031630.12613-1-shawn.sung@mediatek.com>
 <20230911031630.12613-2-shawn.sung@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230911031630.12613-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_234916_283651_E96BBAF1 
X-CRM114-Status: UNSURE (   9.51  )
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

On 11/09/2023 05:16, Hsiao Chien Sung wrote:
> Add compatible name for MediaTek MT8188 ETHDR.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof


