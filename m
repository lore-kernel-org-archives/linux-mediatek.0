Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7747CD5BD4
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vke9SpTYbi5kjTgsdQ+/omQoKxjMQQUr4eI8KwGBIQY=; b=2AKVSW3NnEiAh1w7HbpJKoqsCs
	6OG7OHL8g0z+rO3cP2ok9K+QhlkqT0nggIUIJjNfQ0zCgwJx+iTIqiXOi2NXQ1+NMwt2ZEqX8dQaB
	2fGSLyVpPjlbOmBuP7+qPhyxByPSLNrIzfo2s0Ej7CX1OpfIjMpg9tir/CGp+NoMFquCAO+scGAIa
	B+VhESRhBxNTE7+LG8GaLW8u0SKslGNNsMKuEd6gE8999p1OWUOx3H8oYUXFuEQ8JZsz605YgT2nj
	pfQ+w4pxEY7n5yuDhS8s4Arska2ZKwLntdQUSV79C1CV/7N1PQiUjinbgzAaxhpJS9u9AVgINtS+u
	SHy/SR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDya-005MRd-2Z;
	Thu, 21 Sep 2023 07:19:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDyX-005MQn-0R;
	Thu, 21 Sep 2023 07:19:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B22266072A2;
	Thu, 21 Sep 2023 08:19:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695280787;
	bh=PzRoWQpqF76uGfNg28FLOlhhW1q8iiwWSGotEZ/E3tk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gLNJUnSk7849RHPHN5OarEvqyLeNRnZWiifjDRoAQvtQ4sE1RoxLChvmCPsrDb5J0
	 TQiMH8ChZcxkpRKGHbbGzPYTcbrB570BCsdG9bHGTqHQYpxMDUDym93qqZr8Ox8ZTy
	 lVRGUGxiBCWHJC0yO2XBBRB8+Pw8UVrjZ4MmKw9gmXsWaFq3XH5b/YyqfyejXuFiN+
	 cvmxcol9mgn9lK0qpfvVHbh0jE8i6OdTKls4KSaV8wgBWYX0tdbfgu0YoaBfXNeS42
	 pypf4nTd+silSEMv0So9Fw7u96xQPWzEf0rrcsF/Av01asHcdjbTFHxQUyDqEWWOx1
	 HWk/0kh9RMekw==
Message-ID: <9efb59dc-b46f-6699-f854-efe1d2ec483f@collabora.com>
Date: Thu, 21 Sep 2023 09:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/3] soc: mediatek: svs: Add support for voltage bins
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230921052637.30444-1-chun-jen.tseng@mediatek.com>
 <20230921052637.30444-4-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230921052637.30444-4-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_001949_304738_EAAB0D9D 
X-CRM114-Status: UNSURE (   7.76  )
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

Il 21/09/23 07:26, Mark Tseng ha scritto:
> Add support voltage bins turn point
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



