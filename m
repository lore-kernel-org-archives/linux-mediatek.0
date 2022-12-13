Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X7NlLL42kTQQf/saaghcEcHUAjz57kve2ZQ0E+X2Uc=; b=uz7hUGUWlrwdT+rbLZy9eWTXc/
	grqeAYz76oK6k9bJWSUv7mbWzldHEMlrRhxDnaqeMfpRW92S/Tv3JG3LZxXW1yoxzIM/6+fSkhE03
	QHOYO+ktb/g8o+bFlg66wwqC3qtXOvAp6R94BDsiPLhN2wjowMw46dYTPWCaK577KOeA+eF8/0dHJ
	ALDvL9Iji+/lcqUaM4F+f9IDNuLSc0M5OCGwEu4LrWJkn1e/t7MWauzMznyA7c0Q+vnIfUc6Ygq41
	5b0nDPPfPfzRkgfWfeA8V6BCdKJu5JfLlv/AupBBCo6qIG6XfJd5dt51EBSw/Onr5uwQ0H40HmEF9
	IN7x/yMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51il-00EYNp-8j; Tue, 13 Dec 2022 09:37:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51ib-00EYBK-7d; Tue, 13 Dec 2022 09:36:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C54546602C2F;
	Tue, 13 Dec 2022 09:36:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670924215;
	bh=fLn2UAeQvWXC9MeuL7iKd8dOQ4ZLh8KobKr8uewjk20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eAZmkFqe31udewZc9gRFBkak1tXZAfCHVQtSZtQXetMuV/wIXuzpNEYdeexYqv38b
	 6ydmVOTgIJvRpZSb/DEmaa4p788XkpMxEj/HXMRI33qAbT7SHSH2VSmXMeIm1NvtmC
	 HbYtiFQ34VKe9piLr3XUv8538tB3CSD9DPxthgGJ1maEmVB+PX5LoG5mqoyeIupXZ7
	 WjauhF7zgY8VSFr9nF3FRnZj9hd+tqxUPnNnxvPBjrYjW9WKEOaFBYaphK9/yMjUah
	 NHr9Km0MSJEZycZHGRVZExwmqx2gl3rqdj0uXwfbLnpV/XkmNPhWqYP6Daxx59SBUw
	 XGB9IVcB7SNkQ==
Message-ID: <e518539d-6573-85ae-e69c-6c5318e367fa@collabora.com>
Date: Tue, 13 Dec 2022 10:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 3/9] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-4-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221209064317.2828-4-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_013657_428914_70683004 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 09/12/22 07:43, Xiangsheng Hou ha scritto:
> Add ECC support fot MT7986 IC, and change err_mask value with
> GENMASK macro.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


