Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0573C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 07:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFqBUKK2OOngPXplli9VldQ4EJWeKq/FA71iWOACfq0=; b=LdlEwG5yJ3tjkP5es9P0A2Fi4R
	pnhjFJP7PKJ5kjx4QCNEvP3gqs7vcCUphI+7vdl2fniZMxj9A3/Wp+BOat4d+ILm5RHU5BLa4LnIS
	1eJLyYd4g/FOwL1PXvHfp4zxYWSyoQpzcIjfRJhao7FpfWidN2gIqI5UDV7UZJrXTv3jJaU9MZUfj
	0FYykUesJumCpk7sTVupDzjMj6+fuDV1uBeFlzcW4SxIoVu5g80I4Ho5tGnodlsp5OKa+pwe9yRq1
	svZzyYI0VBx0AX2uboFtY62gQDwzW30XMqNnrjmKvvXZdaYxgIc0eejnQ8AFBAuF5eIFZ+igeHKVX
	RHg9WvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AAP-008Pz2-05;
	Thu, 08 Jun 2023 07:34:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AAK-008Pv3-1J;
	Thu, 08 Jun 2023 07:34:42 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9D576606F10;
	Thu,  8 Jun 2023 08:34:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686209676;
	bh=VlzcMt4Fb2IUSQOj1lmUGhufnD5Kd0XdRMKEOvM6z2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JxoKYSTyQEGjwx6KZxhgPuCRSQJzGSA4cGn4WyDKEGQubQN7xPdAdFRrmt6eW02lI
	 XbGh7pKY15vhWpxovlkhibj5eCCK6LrpfNGuMCawkt7CNS1LHYbA2el2orwfgb8gT1
	 BchP4/LJXlVsQfYaEk9baTx2DfWbYL4LLJLtCjCPrQk6/iqN+OMkiFYCKi9743LGGm
	 FAAl2qaRDqQMya3FV5C5pL8wwDaZ/HoPp+v+t5ld54EA9yeuI4Sy0b1/aO2KpmGUCU
	 TnGLiEvhB1In5yPKKeq5S6Iv44I5+dias4puCOHqLZkeEpR2D3VypTDJ/oUpfUkX+X
	 sm/gU8sl+ZXVw==
Message-ID: <caa38329-71a2-414f-6378-567fa92110b8@collabora.com>
Date: Thu, 8 Jun 2023 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 4/5] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230607205714.510012-1-nfraprado@collabora.com>
 <20230607205714.510012-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607205714.510012-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_003440_583664_0041A102 
X-CRM114-Status: UNSURE (   7.91  )
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

Il 07/06/23 22:53, Nícolas F. R. A. Prado ha scritto:
> Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
> enabled by the VPU once it starts decoding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



