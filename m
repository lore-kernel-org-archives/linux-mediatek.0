Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF66CE79B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff/FHZ6Ao/tqijGeJdKpq+HHyTAVx3Hui1Bc04SzyG4=; b=lOwcuDuMeCgz8iUzeLLR5oLFUV
	UPlmV/IdNVlr2a50mNI6zkEjaFC3FrsD9U6tvawdWSe614gu2fM4Q42gOwuSsjt/7nn7tBariNM4R
	DyB1YyICwdzdXAwKkyJv7VbIsCT5jyfafgpr9dJrRWw9m/+Z3XvqYjpNkOx2CsfpKii2/CYIZiKE8
	dPNoYG9qJBWgqauBq4o65MvFbBG5DksE3LM5eP/uIsyg41SzXWbOLwHNvu1GPdUTbj0v9fI8DdNML
	aSYNgRjpvbXpxhHQg9zlNUowheppgZh7IXNDujuKQT/6iRO9udTnBgRt2Lis1TA3Rq6/YxeEQbb2X
	X9qicYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuhA-002evJ-07;
	Wed, 20 Sep 2023 10:44:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiugy-002epd-03;
	Wed, 20 Sep 2023 10:44:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F15966020EE;
	Wed, 20 Sep 2023 11:44:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695206662;
	bh=v6OXoORpooHQSXX2uzSECYJDG7gT9Gv+5nUaIefwooM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8OnldgrfVAP1gPm+4lEweW46+KBWAASsSFF0cvTBnF2Y5wLGdgve1HstxTroceg8
	 4h1Kvw+RK+NRmL1EOVHB5avww3XNrtPBbxuDPHAFha0ty67hY4QlYzwBe59qda41G/
	 a/ywvx2teWbb4EDcRN1dRhB7de48lVZMT1+3jrrGfgdYxOXQaZhTgJVWsiEqDr9H3E
	 vBS5ArEOlnZwcZV4Qf9YnxdtI+kgeB94IDgnm1day26RVdqx/5GqeEervS1vMQeHkL
	 JzGOQ9pB3kXyJL9VUYsDGZ1JcswcTiYJFdy1L5fs7RO5PrlQXgX2NLC43SrP8lyTAI
	 SDOy2rabeep+w==
Message-ID: <e4a6d5c7-fbc5-23df-c91b-e433d8d05eb8@collabora.com>
Date: Wed, 20 Sep 2023 12:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 10/12] regulator: mt6358: Add missing regulators for
 MT6366
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-11-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919104357.3971512-11-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_034424_181659_A6031249 
X-CRM114-Status: GOOD (  13.75  )
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

Il 19/09/23 12:43, Chen-Yu Tsai ha scritto:
> When support for the MT6366 PMIC regulators was added, it was assumed
> that it had the same functionality as MT6358. In reality there are
> differences. A few regulators have different ranges, or were renamed
> and repurposed, or removed altogether.
> 
> Add the 3 regulators that were missing from the original submission.
> These are added for completeness. VSRAM_CORE is not used in existing
> projects. VM18 and VMDDR feed DRAM related consumers, and are not used
> in-kernel.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


