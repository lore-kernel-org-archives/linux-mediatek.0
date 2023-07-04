Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0824EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BlEUp6mMhUM6la5lJpb/HLM/YCGybEmt8QhOJvy+D4=; b=KtywhoCpPA/cl27iV1DaghLxPe
	n0e3ZAifgH6cmouVg5rI+Yg7n3lQpvCbJRSWpB6a4t3FmvFewkNBBNT0gWdk8I8Uz73X3uCHWW0AC
	UfuCTLBDl89YzmZYr9yFZvnDhE3u6Zy4Z3bhubwyc1VbtUxd425JtgNVwWwvrGXs4g7n0kLSLRGxG
	0eaLMgf3EeEVspXCSlbZzPTCNqgB/Y+iwsQUrwNpZFQCzisEr8IAqwr7uc4oI3rOPxRcWczUdXBGV
	lrYwW5D7eleHOBwOxaaY2dT97IknprRWUYSwbkRu5Cgeyp4NTeCs/DFyaXy8LnpZR7+5vz+5Za6ru
	JGOg6QCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdFt-00Csfh-2T;
	Tue, 04 Jul 2023 10:27:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdFq-00Csds-1Z;
	Tue, 04 Jul 2023 10:27:31 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 77EC26606FA4;
	Tue,  4 Jul 2023 11:27:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466449;
	bh=jBQ/r/u+AM0rCAhryqrH6qIZUfh9m+zpg0u9afPJ/7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/ICrcE32nz+sM3WWaUJbwX0Q15lgBWVAOXXw0pw1KeOtYQVY27qnGxXDhG/5GcNA
	 d8CDYEHBrXeRKFaP/6mlFriNjl/avgL0Pwl9EWta0fnH6V9b4UFEAXbapg9jHH9Vl5
	 CIQNjdZ+yQodgkTZ2UVIlHcYqTar3GMlpd0zLb3GBSCqsHFbc4lk18LNF0eJjM6gLm
	 YkB3N/WzHt5FVjh3QBrRi3bOEXWZTHy65r9FNhtMY5JHvHYJsusIEgtsCtyzYMM7tr
	 Ob+VC8xHu6xIgpkBdb0S8vpARPQlos/DgLM5gNWt0LoZNMHsx7eMNnKaMQko8akKcH
	 fMnmS1xA0Nebw==
Message-ID: <7a0a607c-bca7-80e3-4abf-1f368c695d91@collabora.com>
Date: Tue, 4 Jul 2023 12:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 7/8] soc: mediatek: Add support for
 MTK_SCPD_STRICT_BUS_PROTECTION cap
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-8-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-8-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032730_656421_73A96AF9 
X-CRM114-Status: UNSURE (   9.97  )
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
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This adds support for MTK_SCPD_STRICT_BUS_PROTECTION capability. It is a
> strict bus protection policy that requires the bus protection to be
> disabled before accessing the bus.
> This is required by the mt8365, for the MM power domain.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



