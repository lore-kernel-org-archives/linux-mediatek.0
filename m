Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25F5C71153
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccDZ28jO2WBbmXMXtrjbvjTbF9b+yUIzvjHodBodfac=; b=g4tRRybYiBuJN+OJyjf8qvMwOf
	VPoHgelJ5KmaZSZBoIfd7YJdMk2bYwrXPYUo6OnFDgDT8U9NwnqklzFTB0M5LF8PK/HINoulJQAAa
	tqlSVMRCjsB/TEgFH3RnDMYwDzx8VMyW1wKQ5fSlNa5+UHmDsrNKjTytb2bGiH2VGyDeG6jq7QE+G
	YPIgXbK7pfns9J5cojBx8W8gkBbfeDjA8ZxBsuJKrZphcHz+J/FAfzq8XKlvi1ukvM8wQmTMPx9Cv
	8FajdxVhi+Ib6YFSWY0CWuAJHMr7ObQahxCzHhpNk66qkdKF8z0I0QnKxQC2RJKPyqY9Pv+8Pqzj6
	N+fMmQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd52t-003Zvp-2P;
	Mon, 04 Sep 2023 08:34:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd52o-003Zv0-2a;
	Mon, 04 Sep 2023 08:34:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7405D660727F;
	Mon,  4 Sep 2023 09:34:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693816488;
	bh=95fRj8cpZa7uWjfFUAP1aAqIMJzKCDnQz0gfY4gwKkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khqvwN1Lr+jaHM9QrdEdIdn77+1NkegUGk6y97QZgGhkC3Kk8Nte2+Xlmy8z0OMT5
	 /Dc/CAryTtk8bwJAdnR3eaK2MEywHJuR9ZsX5iGuhk5HxL0WyWzzNGGiBnIgDnflIN
	 gwJPl98nqnkNNVCgSUEUYeGrV22sAzf11+yzJWaQjfNKu40+Re8/Q9IfkXkE5WAt1Q
	 e6sslU1hpMxJD+1O1GUd66flJNWoqGIRzuzDGMZNMSzTsvjqW07RBj/3abKAXWAzmt
	 Kf4gW4azpEkLjfU6D/03qhX5aGx855JD9wWMVfAGRg2lza6vk75KejsIqUS+ymgUx6
	 2KsKZ+ptsgbeA==
Message-ID: <40013c91-4941-1d03-1aa2-083bd6b44afa@collabora.com>
Date: Mon, 4 Sep 2023 10:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND,v3 2/3] ASoC: mediatek: common: revise SOF common code
To: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
 <20230825024935.10878-3-trevor.wu@mediatek.com>
 <ZOiCVCJMaNX9Xhgy@finisterre.sirena.org.uk>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZOiCVCJMaNX9Xhgy@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_013451_026804_63637963 
X-CRM114-Status: UNSURE (   9.53  )
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

Il 25/08/23 12:28, Mark Brown ha scritto:
> On Fri, Aug 25, 2023 at 10:49:34AM +0800, Trevor Wu wrote:
>> Originally, normal dai link fixup callback is overwritten by sof fixup
>> callback on mtk_sof_card_late_probe and it relies on the mapping defined
>> on struct sof_conn_stream.
> 
> Angelo?

Sorry Mark, Trevor, I was on vacation, far away from my workstation :-)
Thanks for the ping on this one btw!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

