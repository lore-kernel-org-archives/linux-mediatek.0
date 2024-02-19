Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B83DC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSb8otQFbTN03ahLIr8fIOB0LJHcKCLA389MIf9Pyrc=; b=2RlgqzTEHzKxjfT9bjlTj31ZxK
	2FCPGSF+CIHTYc3zEaTDKLhqYyxn6yk5sYHsH6FV4fu/0kfkLZBA9g+IDrblu6xt75vOTYogGQoyg
	bRYbrfItF/vk/SdiuNYx4DlseL5tJ8Eq5lU5t2P/TE6e91vhsSrqkMNlPpYJRAvP58VlXazbCZL2A
	LyoVwdnqh+v9eWKWD1Z64+SHw6JMlafcNTnrucXWUHoUQNgtjGf2cCXPbQ3YWBxyEXjUyI0Dqpb2k
	PteqloVK4+5Vu0hXqPjxejos6wGL6n+XHdQE5WcuBDAZ629ni/e6J2afKy8/NESDRRltrz8e8P+Xg
	6fcCYR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2lV-0000000AOg2-079D;
	Mon, 19 Feb 2024 12:28:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2lR-0000000AOed-0h9R;
	Mon, 19 Feb 2024 12:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708345731;
	bh=ldtcDeRxUwJgADZNUFjdHdosag5VORxjVngR/8kNA9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2QX/h5dEf+sZCPTssHqe4dMsez1TlRUdreDjiL3PuaWPku2qKDhgQiv6Pwnea66Tz
	 zlV8hy+QUnQKLwTOMpVz3Oopr/+x+hnCUEAoBJs8C7jQ0KJBXGfSKUa5lzGMEWiBrM
	 5Z0XZLYbS9nw5r8oo3ktPzlQbOI+OFqZgQiOC7yYi1b4ebBs76c4CpXJMo2SC7ZsrO
	 4cvj5Hfuu63NY2ulHS2EN3DJgEXdBjEHauDSvJ055yavjB/d9HEWgK9KqGb9HhaBun
	 V71hk03C/hdk1SeNTor0NWPmCWrj3ei6zEe0ZOV0FXtiCPgtEIa+RrwykipBUeY6zF
	 HKd3Pq8rZJ8fA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 84BA43780BFE;
	Mon, 19 Feb 2024 12:28:50 +0000 (UTC)
Message-ID: <adf70c16-f1dc-4f01-a331-b0cd975a4c42@collabora.com>
Date: Mon, 19 Feb 2024 13:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8183: Correct parent of
 CLK_INFRA_SSPM_32K_SELF
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240219105125.956278-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240219105125.956278-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_042853_537494_2515484F 
X-CRM114-Status: UNSURE (   8.31  )
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

Il 19/02/24 11:51, Chen-Yu Tsai ha scritto:
> CLK_INFRA_SSPM_32K_SELF has the "f_f26m_ck" clock assigned as its parent.
> This is inconsistent as the clock is part of a group that are all gates
> without dividers, and this makes the kernel think it runs at 26 MHz.
> 
> After clarification from MediaTek engineers, the correct parent is
> actually the system 32 KHz clock.
> 
> Fixes: 1eb8d61ac5c9 ("clk: mediatek: mt8183: Add back SSPM related clocks")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



