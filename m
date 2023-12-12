Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE80C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wk9d9JFLoNMPV2pdwxxEBrRxeL3z+lqsSGSg3Y1lCSA=; b=3z1vWVML1Zy94xnisGbSWr5Wg8
	yxpoCqUiDP3xwT/aOrrrx/xcuQi31STZDKVrCkphyMDykrLuf2QppayndimYDm4pj9VVRLmQwenYl
	ByoA3kfuwdTL10RFDjE16/10gua+sLybfsNOYtYiRN7WFj0InkXuf8ReMClWAOgS9SqCY2aNt7ILn
	r2K4vnlY7l0tLroG0FoDiBPMheiQJyz04lXkSgILTrpZ3f+16LE8utRIbY2snogR2exqY8HxbMm4S
	G0IR0ii62WJlPivOS4Vx34m/hUVw9ZdW7l2EjAXLxdoTQJlC/1yLgh4+HcDf13bcgeJTjwPEmR7Wp
	XRYcXr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz8k-00BDKx-2z;
	Tue, 12 Dec 2023 09:33:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz8h-00BDJ5-0j;
	Tue, 12 Dec 2023 09:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702373598;
	bh=DngQeOO2YELX/6w8IEVqEz75HCOEMeCfiy2nH1Lvr9A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VD8+7GsmaUgBrt67C533y61acmy2sX48b+8+Cw16eKK/vujiDNKieaTiIjnpWUMj/
	 0/qcOYaznzHmUnSvAiH7kAhjD/52/nTZHP6OiJF9livV+wGcpmDo3SdNb2UK7ziYWw
	 xp92JreRroH7Ta5xchcWgJG2i+SKMJ4G8236IKX6BkWOXqGg779n803dd5fL4delAk
	 EqOPEelcZFkDhl5Tm4a9yF9EEDyJfa7VMOpucu7hV4jLqSXtlcTDvNsNcuaeq6FkpA
	 41gW223RmcuNeDTOZXd8zIttUNoDrSUeUGr8/cOp3FbN0O78R31lSDZ7PTNITNuWMb
	 hMZi1CMbMw4nQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B4DEA3781423;
	Tue, 12 Dec 2023 09:33:16 +0000 (UTC)
Message-ID: <8585cdce-648e-4c27-a769-6441dac77707@collabora.com>
Date: Tue, 12 Dec 2023 10:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: mediatek: add MT7988 clock IDs
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sabrina Dubroca
 <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_013319_390353_8E91CE78 
X-CRM114-Status: UNSURE (   6.63  )
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

Il 12/12/23 04:18, Daniel Golle ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Add MT7988 clock dt-bindings for topckgen, apmixedsys, infracfg,
> ethernet and xfipll subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



