Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4334C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phodh9dSjJzX2PeFL9NecYgsjvgGiKlWRe8gXiLN/C0=; b=QTG3kI1YsakF5/U6m8s/P/SNb2
	F9yW7RQN4RLTgLeYUmepVzR4czjUprBei1uwNWCARuGABz5pUhC9wzdnZNLbgrci0EXsGj3OUFhYJ
	4Toy51MJyWg/KH8uikt0gKEPRrf0dpjPI+eddf30TD4I+tc9PATqd11vLzpNsRqR3sb9oRvqXmfsD
	stFNMuJDCyhGARmfpWYRfcK9jEz4tGMYptZk2mgD7TWhIZC6E/llsVrqJJf8e/mNU+4VieP4eCJMu
	vuzfy0uIzYhhDh03oy1MJPK8I3vDFAxo/hgN8JW9Pwfya18BWEUDBjQTI1oN50CBTh25GNvSxrtQ7
	yHiBZDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HUH-000p4R-2J;
	Tue, 07 Nov 2023 08:31:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HUE-000p2b-32
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 08:31:04 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA8E466074BB;
	Tue,  7 Nov 2023 08:30:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699345860;
	bh=UnylclfTzVUGvBNhsNbg1AWvk76d91UX8f6YeykP2QE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S0Uj+oSvu5NHNd3y4/Z6EXNktbAvLtolCm5rOioMMwgmZm8q6R8vQAPlU9FRd6ks9
	 m161naKI5p7OTpHEc9YHfZtN+mSv31XAbbN9XE7J7CpCod6kCMCmf60L4lJ3ZOJRNS
	 agxmNiqGjkQSoIITav8ZzNP9J7JGzpJLLuKqOSTFChesgL6g0LtQPQ9ePx6Uv2gpkn
	 mxV7W5Pms9gjhzdLp5PLKJ5V/IhvIpXe+81DmZbAtAikzNyrWXhC94A/NlbIRELnjt
	 re8FwtrASkpywmkk9Q9IXmt3/0aYlSGiABO+f2FdSrFK5H3EQR4uAmvjv5jN6D6cM8
	 BK7ohCRBpagsg==
Message-ID: <f1990975-c3f1-4758-a718-f30b36743bc2@collabora.com>
Date: Tue, 7 Nov 2023 09:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 2/3] ASoC: mediatek: mt8188-mt6359: add es8326 support
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-3-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231107031442.2768765-3-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_003103_104279_B975DF99 
X-CRM114-Status: UNSURE (   3.90  )
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

Il 07/11/23 04:14, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


