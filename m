Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9BBC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlIw8D4TKs+tCuApUds7M5n3/MW1x5CpRDcPHdQOgVg=; b=fDJi52EaoQXB/dA98769l94BBY
	b5pVD98qBkAZmHNqcHGPZmcx0XYY3o+pb+G9060fJ7D5YD9whvU1GfKnAJqpDDpNRlIp6zw7QfxYK
	P9i/GD7gvFq2ovOhC0tJ3lFbG91xCcp8JwOxbHh7mhapHeMpdmTxbcU3HkdgeDYL7nU1MXgamb07/
	Ltwf5E4sxVy6scRBiD/BG6L2D+VVtcago7Fxgp7kmBHAcuDJBO1bMgGAbRo/gjDAhnGnXXoY0nzL9
	UP6Of0Kync23ngOW4HT6ZGYR7zPdsCHN2R7cJo5otjKvM4Qz/XPo4ClCtBFLG30lBQc1WGSmL7ao3
	PQrtKtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2eo-006OW4-0Z;
	Wed, 19 Jul 2023 08:35:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2ej-006OU6-1j;
	Wed, 19 Jul 2023 08:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qlIw8D4TKs+tCuApUds7M5n3/MW1x5CpRDcPHdQOgVg=; b=hr2ZqKc2b7Ebh5XkT6gXIPDHgi
	Njq/1zOcjXt4hJcjAH5WIt3jvGsdb0UK6KIWyAz9jlJ1pml6XzZ63XNxOnaf3Map693FV6dIST/+v
	H2njWLNyWeRD/vZiBemcD4QAJ7PxQdo6lrn2cb346Daa+auZy1wNKWNEz2YQyoE0TKowZ8i1E923h
	3LHn4eHhkx2VkhqPcASwIw36zbcmD0MrVAuZCo+mHn8qFGmxPJJodjpW6509Mr8H916bktBd9goMM
	oAjWW0xNq0VrxUle8D/KJCjEfpWfStQ7DuutHi2/BvTHQbN8tli+GypuocjLsk6IBInn+7M96GZNI
	/F1rCOwQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkAl-00BWfJ-33;
	Tue, 18 Jul 2023 12:51:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4D27660703C;
	Tue, 18 Jul 2023 13:50:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689684648;
	bh=Z2VzqDas6Nis4F/8NfuT3J6V8ait8J1iCHCN0Gg7wys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xgb70RrxXrCfGPAjSm/YR4dpzrBsEBoEoY+ByKEKpPOUY1I1GuKzfb+JLt7e1J320
	 dco1/WU4WlpbqBqTUm80tb8A3C8PnLphatvqnVjksebkbjnmPk/scxaqmveczCer71
	 zF5cXgUO4w5rKT5X0XWNqlPgkgtKQIQGTRGr0quekCvGsKgQYt7oDTTYmqmqnyDJ4j
	 R4uU0tuTscPp3z+6PAWD1VcPjMj32gIEv+0TteLiIwyYGzHWF5FAn5WQ55H4SAC8w/
	 e/6JXyPIbZUjkojKxMwZy32HYbO5WK7JNiKEsMjsuvZU8DFloBmw1qvayHtBLLdohN
	 yrQ50cj7DcUqA==
Message-ID: <f42c453a-b701-83c5-0214-08dffe1c1031@collabora.com>
Date: Tue, 18 Jul 2023 14:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230718110947.13426-1-jason-ch.chen@mediatek.com>
 <20230718110947.13426-5-jason-ch.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230718110947.13426-5-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_135124_408437_65CC7424 
X-CRM114-Status: UNSURE (   9.21  )
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

Il 18/07/23 13:09, Jason-ch Chen ha scritto:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
> 
> We add basic chip support for MediaTek MT8188 on evaluation board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



