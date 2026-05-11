Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD39ACD37B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fELXy0QjRCIKsNnt+bDdYoFqfMvNziYjzulokwSYO1M=; b=0ATPIYVjki8D69toFz8h7I70Yo
	5iQR4Rm4A9A1V1PH9y9QVHwQ2pY8ES6tVu1fOpCKR68E+VymGY48XwKVcdwmj/3xYFs0gIxD/1lU1
	EZ7077YJZbLPxa5DyB//DA3Ii2SlsNoYRPr3Q+f3KRt7mWr/ZZP83NeUIPWS5CRfZWbfrUO5ziJ/a
	AIR5Uo/cbqq0qs32UPRH9R5ysK4GlRk4Sej/69hVuucWeeYzffJbOwPS6NbSxi7Q8LTwMO7OqvKPE
	cJ3M5cyJ3eTXw0mWxVDV9PE3SZRTGk3/i0Zi3x2V+KkWww6W8FP4QYX0FHjXv66iXntQzj5LHWx86
	zK1cCLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMz9-0000000CwAz-272C;
	Mon, 11 May 2026 09:31:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMz4-0000000Cw9O-1DQk;
	Mon, 11 May 2026 09:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491888;
	bh=nvTUNLnx9vUQ7AVLQ9mpVIHJVwNY1VmyH0f8WzQiWrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NURSKGnY1+wvzAV1y+sFWvgNRH55eIYD6SGtU3lrYGDzMxEHAZ/I3hxsCfqBq51KH
	 nOdC+OxdDQyBJHp9V1ZZD89oqGKCje8peM+kSqFESZ6WcI1zagmOl5Lu7spvSlfWeq
	 Qk5wn1DdFRczqyWVpSGMqFa5vZj0mIgeYjjAgZ/rUb90WK+0W5AZzVcRVjwH7QLYJP
	 bgMHUUd5xE/cPI9IezhfHeOpUYF4CPTTaaINTB4Rp9nPIYvgyvPExSYsvW6UhXgQxQ
	 8pskSBERlEaZ9XEu6jNrbqe2sEzgn+69F5VcRtIkjU8ukl7aosvo7qnePTf3Tt+0QY
	 06Q2x+Xhj/0XA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E57C17E0698;
	Mon, 11 May 2026 11:31:27 +0200 (CEST)
Message-ID: <3f666523-15bf-482e-a9ea-085883b3d838@collabora.com>
Date: Mon, 11 May 2026 11:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] regulator: dt-bindings: mt6360: add buck regulator
 supplies
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gene Chen <gene_chen@richtek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
 <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023130_475207_29ACFD6B 
X-CRM114-Status: UNSURE (   8.39  )
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

On 4/14/26 13:44, Louis-Alexis Eyraud wrote:
> MT6360 PMIC provides 2 buck and 6 ldo regulators, that have each one a
> separate supply.
> Currently, the supplies for the ldo regulators are described in the
> dt-bindings but the ones for the buck regulators are not.
> 
> Add the descriptions for these missing supplies.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



