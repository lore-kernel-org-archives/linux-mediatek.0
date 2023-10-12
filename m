Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD81CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49r/JzPZnjiE3R8OGVhTE6cvxyb9J8QmqwePLdFhDZk=; b=eM6E3eF+E7rv1wKQtV5E5h/RT4
	vFiNBtf7FuN/f8VBkSsDF2QamhLhjfWU8U9B9no56Y1joBTSF1xAWYl0HMU/vfNxMAjf/q6Plg3Hf
	m8ebiASGB3oozwgiCzNKBDfarPV55RvnviwUxZnlgiIdaA9OCcqzEKCJg7bdk3/axu4+z5hL4iOcJ
	+zDr6b/eO0Z4Bt5QaOz2fCkhagD2oKnwcZljW6udUEBKjQFFMO7Lf0lrbM3a+97dpvleKX5D6A5xb
	BBap7YyW6WSgE0yDx3pa3VWfe4dO5H8ygRfO5oGiuecCD/lZGz0fLlPYc+Q8PevUSRlHTtyXZDN5u
	98aarYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsTW-000UeK-0Z;
	Thu, 12 Oct 2023 09:59:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsTT-000Uc2-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 09:59:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B074D66071A3;
	Thu, 12 Oct 2023 10:59:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104762;
	bh=Bjtc2IsHhuNt1R9b4VeTXHrfdrv6Dwk49Ui3yKy7CX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NJvCwHq5v6ZRLfDRGRVl6L/Lyd2gwKhmmZAPCo0bBG3MiysD2JsYrIkOTb0zm/2Ja
	 95zDBXT9P74qkJC+o51Jn9NpaFMKex5lXG7u1Z9I0DplMRDJnkvDHuzdbKvcMO3f9X
	 A2BFWurGuVon3SmRKtHLM3DhEFmt4wRlfc6nW68aXHHHB8LSpX84wUgjck/amfDkCu
	 Nd+5hFxevcrhbDCqg8tfx5z2C7cUY+rnlKC6OgkV4i/FlLytFw1E5dUbm2vvGhppB+
	 iPfdPSgO7v1PVuD8Bfx8Lw+U3KQ96Ddjt3N2YLKy/q4U2Ceknxxh3DdgsVY0g41L5k
	 Nqq6lwM4FaC0w==
Message-ID: <924236b6-23ba-1767-5d18-4e306db35d3a@collabora.com>
Date: Thu, 12 Oct 2023 11:59:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] PM / devfreq: mediatek: unlock on error in
 mtk_ccifreq_target()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <1bada9b2-d276-4123-bfdf-03d165569543@moroto.mountain>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1bada9b2-d276-4123-bfdf-03d165569543@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025923_527338_C536EFF3 
X-CRM114-Status: UNSURE (   7.57  )
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

Il 12/10/23 11:41, Dan Carpenter ha scritto:
> Call mutex_unlock(&drv->reg_lock) before returning the error code.
> 
> Fixes: d2805601988f ("PM / devfreq: mediatek: protect oop in critical session")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


