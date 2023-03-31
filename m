Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDDFC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqmCbKfXilOLnwaD1laW4aHDyYOGkSFatHGcUZ9So1A=; b=0fi/BLFVtpxJMznEXCnNJt4HW1
	e5HYDoOrDGyG29kscLMrbU64ScuX60M1O0weY5J12GJEGyP5gCJnvgj5wJvoI59nKYlbcl4qksoRg
	m1gDOxCrMexd3fl2L0aXf9BNgdwShll3+G4IVI9W8GpWwf627oKuGtwKMZryiWBU3FfaQY5BdJUb3
	wBe+ROUYvtbHNrN31axEXO4CpKk46RC6EHWKvRbSa4z+Km+yYLeYGKUu5OkZ3+gegGqe/Doi8sjij
	F6k7d2kVFWqkyxHpOVyKUgR4linA/31OaTyXE7fJeZhV/a3mvU+h4f+2To5p1LEpPPEXmTOytYlwo
	aOesToYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBVB-006pEe-2X;
	Fri, 31 Mar 2023 09:56:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSw-006ngA-3A;
	Fri, 31 Mar 2023 09:54:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EB7B6603192;
	Fri, 31 Mar 2023 10:54:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256477;
	bh=uO0m8n14JLI7IWscEOpkhxVDFLw0lJfH0RRYJJ0etvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QO+tIyI2Vr3sxGboyaTqWX9ggHX4L20aTc8kN94LcMlW0vENMEuNnej/sb8+uNu1b
	 AI87DzJcK3IrbmE21XuNt61EF1MmpcYbUQc2sbQyfGQyWjFe+eBjvpUqo1Dy+orlIK
	 tX4fOIPY7SYJeufHNmlp86G0KrV/z2W3/XpZPPxM1xi4He9FNRtrO9bVSXmte6xoaB
	 StHcmqRm1Z56HLhlLsVNkJPCDOsJRvWQGuFN1dNH8VfQ7zC3vR2qTWjEuls2VvP+/M
	 C8Yfn+4JvusQ2JJSjP28Y7m0sEfhP05R/l1v7+6QX1BBxdDHZdOPmn1V6KgJBEdf/j
	 aiEAVq82o/oug==
Message-ID: <abb74f12-a1c0-7d5f-ad11-c9c892a38fe2@collabora.com>
Date: Fri, 31 Mar 2023 11:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 09/19] clk: mediatek: Add MT8188 ipesys clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-10-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-10-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025439_218681_5A75C669 
X-CRM114-Status: UNSURE (   7.13  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 ipesys clock controller which provides clock gate
> control for Image Process Engine.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



