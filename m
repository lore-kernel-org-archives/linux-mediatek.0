Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C3C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3zIk4KgNZEpMvrFFswhAMm78H4qcPhwZkeVkxEu2Fs=; b=xAB4g9Co9s9gtVvmVvd32A5pFn
	8aTW8ofs/0syZVGZL/5OTgJRl1RN3Va/bJX6xuVcKWRYl6uEugltCy0JMySOKGQnl1OVGYB4nrGoT
	kExN5aRtEKmLR9HytkF0jrZj1lRAE8/c7WL6R2/eEvAWTcj5IlxOkaVe/YKWNFF5xQNbcoDrfCxi9
	D67T1Srqm0RcfRM1b+fy9h/1m320lZ4H6wVUyEqaeV3Vz1JaaqJeMahvmpZ7L5iaEZBJu6NAWYiPo
	iOBuGU+wHyP6zNCdBnIAGKnLgOGRSvljBMIjuQNqQ8xzGYdgXO5oLj8nJKZNqapFqbpQ8/31hzWYG
	GnrnOKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pza04-00CSwt-0j;
	Thu, 18 May 2023 09:32:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pza01-00CSvw-0x;
	Thu, 18 May 2023 09:32:42 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 689676605944;
	Thu, 18 May 2023 10:32:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684402359;
	bh=BIXBKkT9CpUmrNXRPgedNskmK25Iu4nAwmFpDYjvo/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WmAsGPklPgFqrUc9WphXkzBmEOclwwubpMzaX1J0525NGxeErtJisbUatXaswTnfY
	 5wIDxRQjnA10TDWpmQj9V14PfRbpDIqPf7ygYmU7Ij3ZY2yg8tH36MeZjBIqJAmaa6
	 xSZVVGWADYgOWq7cgh32CWaX1NxtpAbmE43RLAt4HCj6WkI/b32/inkb3EBkvnaTzn
	 WZGHqK4QXUasesqYU5TUED6pH90fnBlZKF01JYh8hC4/wc3cvkgLVX4CixVksi5xqI
	 zTzcMdOHajVHPkzQEvcg4ZSeioG/4KfyoAlkthmJWUXFwv4zTwRSt1VJsnX9DPVrX7
	 WjXtB14gZ+G3A==
Message-ID: <b9531c67-ab85-5ba4-6d86-9fc83974df4b@collabora.com>
Date: Thu, 18 May 2023 11:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] regulator: mt6359: add read check for PMIC MT6359
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230518040646.8730-1-sen.chu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230518040646.8730-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_023241_462577_68B05D72 
X-CRM114-Status: UNSURE (   6.98  )
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

Il 18/05/23 06:06, Sen Chu ha scritto:
> Add hardware version read check for PMIC MT6359
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



