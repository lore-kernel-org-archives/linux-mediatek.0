Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E981CC004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21aZOJb6JuMoq2tUtRbDCx8ZV6FPqFGSAXWbs6z++TU=; b=NSIFbVJkRKSRKFrmBXACzMaegM
	rvYWWM4hLlfvMd0vluQ02roxGOQn6QXVYETje4epFUaPASvF7hszs4hy6FA9VQfP1MOGlcsZXQFOJ
	LcWIKchs88hlKc+fUgR5w4efRAjFmt6EmhOuutRro2XqZCYDDZu0mJp3jkGUx+hiL68Vq1nlGJYmT
	WJzZDzN6N7bZzGgxrSSySVi+JkC8CvfLgHg0Sdpu4gkiRLAbiCp873jDE0/3mrIiSgRtIsp644N2G
	VGGZjl9O7ki/dRXZMRSeZCntY0djKaAGHaAOakIgFaRE7L6a539W+cvS0qXXzQ0wmjsEtumZg6Lcz
	ACuIHM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusmA-007CzP-2f;
	Mon, 23 Oct 2023 11:07:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusm2-007Cwy-1z;
	Mon, 23 Oct 2023 11:07:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D3796606F51;
	Mon, 23 Oct 2023 12:07:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698059225;
	bh=H1B9KGgQAiRUFMaOD7pDr+fGSwuRs81e04oqqbnXjZ0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TMmCx2aKkdcBER4WpXQVelH7qKmezHjQUJy5COnfDn6OHB3zqBVlTo9CVwPKEo3IS
	 VpaTwSsPGsCPN6AiPa/NHfebcyOfP4awZmHhbZK/HcohNASZ0VyN51NhiSJ/qNyUAy
	 OPklcHBMBhh+wadySMo+ufaI/n4ANhf5+q8SrQN52toT02g5dMVQi8xWCbRWgSXV4+
	 y9gJClwIYYgjwiRgylhJ8Y59IkUpeV+HoZskBcZYGF3HCewS9eR8L/6sFe4k2LC7Lj
	 P7uBU41qCXV2IE3JvdBfsa8zfSJSaDzkLvu3UGtQTxWVjFMG6YnL3i6CXltevycI1V
	 XAII2clCo2drA==
Message-ID: <07af235a-c6d5-4d8d-9b44-ff7157e2a80c@collabora.com>
Date: Mon, 23 Oct 2023 13:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt7986: remove redundant remove
 function
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231023095453.4860-1-maso.huang@mediatek.com>
 <20231023095453.4860-2-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095453.4860-2-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_040706_788912_32636B76 
X-CRM114-Status: UNSURE (   7.22  )
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

Il 23/10/23 11:54, Maso Huang ha scritto:
> Remove redundant remove function of mt7986-wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

You're doing more than what you're advertising; you are:

1. Dropping the remove callback; and
2. Removing the mt7986_wm8960_priv structure

You can do that in one single commit if you really want to, but you have to
use the appropriate commit title and description, saying exactly what you're doing.

Regards,
Angelo


