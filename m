Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C16AC6FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8uh+ApfvIKfm2joczzTVJbXywBrTY9Z5R7gfqR8KR8=; b=sVng+NV89HSbA7ub3ypPHhmvMG
	VLwgZFS/zJ63rxJ/u9fAZRX6c9gqWlxSP83DSezPk+ngiPi4WzOUTGRTYE31On9KiVYUWRHj9ZM8p
	nlkXqxunMN9fOYHs35shdmw2xdNrPvhqy9D9ulOWXcUXnffWxQZZx1Kr5cQWh+dotkmn6qmSuPZnT
	30Z+/EC5N/N0vXbMD8B7FLj7RCqFQSt5eWyD+pqVuDSJjCpwMzpGVOyqXYjlWMfbR0NL09OgmnwOB
	qs2jkj3VMZbKtqNxs8if5eIeurRkmBO8z7koSOvjVlB/Z4qaXqVu9lWYxaVKKpUnAavK0djpjxqHZ
	qZD14KxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80r-009uCz-Fg; Tue, 27 Sep 2022 10:40:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80D-009toH-7k; Tue, 27 Sep 2022 10:39:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A8B6660225F;
	Tue, 27 Sep 2022 11:39:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664275188;
	bh=9oJQjywKlDMfwAImptwT2qI9qRdrXJZDRc0OLQQxTKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RRDCxYBAg/5sAacauybkzGdFRgbRmXkz2N9biveYu+HQx+Vk+RUq+Lh56smtaA1+x
	 CQC2/JpLgOKW1x8TPP0rj/qplxu9/1TMSgCniQ1aJg2El8pdZ1RYsV/AHBo0cg2L4W
	 uzfHVD27qhJnkJ0jcMotVB8kZGXNmxbE3TGbN/3pN4buLw/qzXPouzjigBz47SwI8E
	 PUOzvzjjgo4EVc8j2vEuULUC+T2A1goCMgFmDQSM1IxCLLVvD15lsH8QJKEipJZh1x
	 gOms0/scdhfEOp74FiL+QlZnefe2RuHilDZtCpRhm7vsObUA8FCTtddCvY0SMr5G1e
	 sGTwOWOsmHuWQ==
Message-ID: <13cb7e98-7db6-5111-8cc7-9f17d5a3b62f@collabora.com>
Date: Tue, 27 Sep 2022 12:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/6] clk: mediatek: mt8192: deduplicate parent clock lists
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220926102523.2367530-1-wenst@chromium.org>
 <20220926102523.2367530-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926102523.2367530-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_033949_444014_6792A7F9 
X-CRM114-Status: GOOD (  10.25  )
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

Il 26/09/22 12:25, Chen-Yu Tsai ha scritto:
> Some groups of clocks of the same type share the same list of parents.
> These lists were declared separately for each clock in older drivers,
> bloating the code.
> 
> Merge some obvious duplicate parent clock lists in the MT8192 clock
> driver together to reduce the code size. These include:
> 
> - apll_i2s*_m_parents into one as apll_i2s_m_parents
> - img1_parents & img2_parents into one as img_parents
> - msdc30_*_parents into one as msdc30_parents
> - camtg*_parents into cam_tg_parents
> - seninf*_parents into seninf_parents
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Makes a lot of sense, agreed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



