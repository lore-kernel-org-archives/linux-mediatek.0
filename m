Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCD4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJW+C9vTonGp1NyIcvrH0beimOntbf8ZrAWHpCkW/Z0=; b=GhvvZ1+fy4rEJb+RFu4UcX9spH
	6BGJEQrwmwlFEhJ88+X1vGxdlsesai4e6fr74CHFPdqSMyxIY5IgU//4gRWOVRZQN7UOcaKunxxtw
	oLEzh88LN6qneZy2p1ecSu4nNNCrDccVXGfmSKz0QSkSmnsRlMhx4lWbr+Lw52ln6TmHD1LcMBJRk
	qP62pN5ZdrmssnCcH89Kt/Q3lirCZ34Gm+zgpFhlPh7SEJ+pwx4LbreE05HUzAOXflCAGUhNEesa4
	4exKKXv9uF2yxrXCblYC7uML/GrYLmfyEsd2UKzzUCGH8sBzuDEbiRjrjuRah360riWm2CVjLwNBi
	TvNgtZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCf-003xsM-H5; Tue, 11 Oct 2022 10:09:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCH-003xj5-KB; Tue, 11 Oct 2022 10:09:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 927826601F8A;
	Tue, 11 Oct 2022 11:09:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665482952;
	bh=i3HHxh7xC9p97pyUrhsg6g9sE/hWZzUUBCP1vxY9ybM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hJc5ESNir/u0jHIVypQUvKlL+l7HBw4/V96DqxONX+JqG7Rlu37btIk/oTurQtH2i
	 rssCvKJYq3Gml6Hhp/bZbRSgOP/fU4vonwd7lQ5lTJBWfN+4roEzXAJV6yNgvjus93
	 on1eutyR77CDxwLah0QsDWJP398QmDol1SjIy1MAxYVLgs7Bp1fimvwhD3/hWf2BcH
	 jHISi3lIVgxodDt/W5ND2MeQBJj0ZnKMHz29zV0QETFRGcjaWl08nf1XXdRz3hoWWP
	 BS1HZr2TA6CXlVLhZ4ubzrR0rDIa4nFMVxfaQqhyxXxT6/1YISstbux98WCR6U44A9
	 OlLlkzqLSm0fw==
Message-ID: <0ee171dc-38aa-e30c-542a-7e6524ab5275@collabora.com>
Date: Tue, 11 Oct 2022 12:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: mediatek: Add support for MT8195
 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221011070356.682-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030913_816180_EC233E4D 
X-CRM114-Status: UNSURE (   7.98  )
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

Il 11/10/22 09:03, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add compatible for MT8195 VPPSYS on MUTEX.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



