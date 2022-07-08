Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C41C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmJZpSzBvwlsrfeiPYqghcYPu08tJZ/TK8ng2dzyhtk=; b=0Z6Bt695x5rqOUvBdwCT9WX2Zy
	7UF2nanwo76oXH44Dhm5FchqWMVoLvvCHNRHc1UkH3cP8zJaK6pX6FBZNJBDHJANb3XgQqADJUxpi
	oIxgry0Pgw8qi/+nvB0z62rQza4McPA2mJQPmfPBn53ZgopTuHYxkz69k6T+eJZN6GuQe7/A2iGoG
	0BgC84eI0nsVo100ahZ3lsmY4gwFSa9dnDt3phH8q5EXGQxzA/o500YgtOHgTcuIa60iHsDoQXzEg
	QPZjj6JHRRivMJVXqlKnzAxL/F7X6wnxxdeIrn+0LoekyfE1DgpqBCm2OkgbTnh/N3L7QZvpQofTg
	qOxr1xiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9pnw-004Keu-7Z; Fri, 08 Jul 2022 15:22:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9pnl-004KcU-D1; Fri, 08 Jul 2022 15:21:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D4723660191B;
	Fri,  8 Jul 2022 16:21:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657293708;
	bh=/4l6Hm4ZPFYh5Jg9Pvp/I+AUhyuHpkqerH8ILiSQSbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PjNsbvhO5bl88hl69hhVHhysA7/8JkOnWdDAwnz/eOlzd1dNw+kpkvZNFzr4vWZ1f
	 3UDbtNKz/QpabAffCJKQlG5tsj3DNm0jBrZCOu8rDa54DlKuSscV3xkOAI87pl3C40
	 g3yb/lFow1opOw6G5s64o+B5ADo9SyfmwWhaeJ/2Yoc/tN47psP/f59LU7YXKQol9l
	 +nCyZfPUYWRnXTXBqwGThXxnf0gWEATVY+ipfYonktwgk2YgBJHdpDu6i1ToWCyjpC
	 SykPd2bMqtZ/VWoUsT6bZce9VJsLI22GRC+ppBB8FfMYsR8jcb9MiPI29hywZxmveN
	 k9YnxZddOuQnQ==
Message-ID: <b8709679-3c12-22aa-d118-803bcfa8b79e@collabora.com>
Date: Fri, 8 Jul 2022 17:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] dt-bindings: mmc: Add compatible for MediaTek MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, ulf.hansson@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220708114747.13878-1-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708114747.13878-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_082153_602066_E4971D81 
X-CRM114-Status: UNSURE (   7.12  )
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

Il 08/07/22 13:47, Johnson Wang ha scritto:
> This commit adds dt-binding documentation of mmc for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

