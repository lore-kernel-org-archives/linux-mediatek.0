Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DDEEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX8Z+k7+U+YqBHBc7do75ENFYr3+LlMSYY/YzzHVRJY=; b=M+TxXH4DqBNNoa86zy3sIuAeM/
	o28Q4DkAg4qfQF2yEfIOx+EST1+P3jUrm7yJ8iqIhxpvyEN2N8mKplf71pwkzCkjJaMXS8dFKQzBX
	FFAm2qZ+CzZSu+l7HvM+tP0BgMwEwoMgcyUrNKLU7Bi3xltGNVb570nARzf0ljglb7QHBY4MiQtQQ
	+D2NjoOyBGMM/xjVyYNsxSt1FwSX8o72kS8WVYyw0lHs3mldTo//FHuOUf5g/+FJcH6S4bfScbrYy
	kfewRuKydV4Z1S93831rkLT/fUyk6AyQxnBUU0ZLUPrqm9+mznPCz43z8p0QMzNXa+p2FzzrIgDwV
	a9sGW1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEd-00Cs77-0g;
	Tue, 04 Jul 2023 10:26:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEZ-00Cs5B-1L;
	Tue, 04 Jul 2023 10:26:12 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D94D6606FA4;
	Tue,  4 Jul 2023 11:26:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466370;
	bh=h8YjWj4OCIj+gXo/xRwiz50tagQ9R8F5djfXAt9/OVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C9vHtkknQgwDdjZHLmQs2y5Pg4fiqYXZd5pKaVBAmNRHi2Vd5FzCcVD70dEsvMWCP
	 k1cOuOrfnFsGd/vkUvxGXfokmUVK5K8QwFU7MvAeAgsUfoYz1ecVdcVSgo0WYFuwZB
	 66nz7NQAZjuNm/fFL5tV3IJEB4H1FObInPlso2VqSshqZHIBLykvdgf63OFbMeTAqz
	 BSyVSIE+lHMenSQl+6UxCjueDdjQ/xwJh8H5UESp1cPTmC6q7cjsUXmu4juMeNN4Li
	 cx9/3547XdF09PL/SWIXITdQXwrGaM/c9BV0+HIFNXYrKcA5ZjU7b0qV+lN/3jFJBl
	 VYqMgGkeLdOug==
Message-ID: <94e93f3c-dcce-52fc-58b7-9c85efd4ab62@collabora.com>
Date: Tue, 4 Jul 2023 12:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 4/8] soc: mediatek: pm-domains: Create bus protection
 operation functions
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-5-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-5-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032611_577992_64526679 
X-CRM114-Status: UNSURE (   7.68  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> Separate the register access used for bus protection enable/disable into
> their own functions. These will be used later for WAY_EN support.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



