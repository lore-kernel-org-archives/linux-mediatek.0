Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E5C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88bCPw45KPiHNjAEa/tyQC9F1J49Mnf7zq55/8CFELw=; b=MYc3JGN3Zr2pFrkzV+7zVsjMij
	IhyB/x+nn7lr19k/UnYn1ur2aNeObKY2sJzRJ6443EICe59+iMLtwPQFE21DfHp2yV5d6xF6FSpuS
	R/9T8BNM3aN4yp6DLYQsclS8+HnfHr1uIlA5+8Hx4RE5ktNXdSLy2QR6hMbPts6gY80xnLv9nNeLt
	ychVKoAR4bVMgVTJNys2b5G2yoXCW6xVCNp3yLQorIwW74VTMG8Rmnpk/N534NeCvPElMne3EKgrt
	ZuDZ2UFreKMfdEr1x9NDf7t4gfI+vmd0yW4Ga4i3t4J5l5U4CHx7xDjASCiw1K4GtDTN61kd4kXIJ
	SNf3OOhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU48O-0000000DnqB-0pYM;
	Wed, 17 Jul 2024 12:51:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU482-0000000DnmQ-26xk;
	Wed, 17 Jul 2024 12:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721220687;
	bh=gZwVFjzSRVTmALU1BmNQ8keVRNZSkGcSyT2qhAkCHmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=acmYZ2c+SQF3vKCNlalGE51ieTweRpud/cjgYlzKVq+P7EKQcfAb6MvS33njm2IQl
	 CCU3Mq8ky4G1q3LB1B4/a9drmZ1zqEqjPZKUSJQqcpSlx9T8nbycVEY3xfdlkC9j0U
	 19oi4BnJM2lNJQjbBrWrwsgvaYiuLVKxKtKQL51HTtgILUSNFj778hfM7mP3haNMh7
	 wJzufg5YIowyAT4ocL60xMKqqXMulxJ7YItCv9vic+bR9WH+UOHtovIH31SKFVlELX
	 XVM7uzl2JU+blLyThS/PW8noqjFFSoVYrh5e71qsLy/itEQWUaBsccQBj7BBXFu1yZ
	 0Xm/HI2M7ffLA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 851A53780480;
	Wed, 17 Jul 2024 12:51:26 +0000 (UTC)
Message-ID: <10cd2114-e809-48a7-939f-75d95e68d9d9@collabora.com>
Date: Wed, 17 Jul 2024 14:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: reset: Return regmap's error code
To: Fei Shao <fshao@chromium.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240717115919.975474-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240717115919.975474-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_055130_736482_FCFC63A2 
X-CRM114-Status: UNSURE (   6.13  )
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

Il 17/07/24 13:58, Fei Shao ha scritto:
> device_node_to_regmap() can return different errors, and it's better
> practice to pass them to callers.
> 
> Clean up the hardcoded -EINVAL and use PTR_ERR(regmap) instead.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



