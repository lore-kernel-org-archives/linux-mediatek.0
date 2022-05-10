Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B22C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/3Xf5HlAjx2cdXR1pbYVn6O8tzN8SBoZin9JOqhJuE=; b=TqSmiDesh+bUNb
	hnsYD/R6dm4VeLs76vkN6W8oqC5OQ7B8n5+8B4VmNiUMdMbpur03BUOLXk+rkspC/9SrdcHkCjgQc
	HFbdgNlCYdI+AoFUJrn4k2M81P1mxeh0hnoBYaqxS8YiEmtWVhgnQNqnvv/q/05ncSE0qlq04nOAo
	MjpafK46EDC9DIxT0rHnD3SPNGZT/eN6A1qCdQgIdmc1FCGMBkldQYHfx7BOxlsEl4YqvEiXWMibN
	473cMoNPJ/g0Ix79fi04BVimCqumPsMAsJOiLBcl0AmgW6lJ6vxpvW9h1cGKTmc75H4R9VBRCz4ve
	pLZElR3ACKBGrXemUF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noRoM-002jTY-Oy; Tue, 10 May 2022 15:30:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noRoA-002jMr-0D; Tue, 10 May 2022 15:29:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F34F21F424D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652196583;
 bh=uJRHaCeOEBQcOZ0I5YodDyMVQnV4u4MF2nMkQyoDrmg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b8jMcQgCtA/xqIWPX4KqwUbHiEE9vt7wnr/RsMKkR7UGTITO5Lb7eQC4g0FIndVoP
 /gDyg3b66kVa77mYqnjFbNWKhWp0QtsnCp7lW3N4h1dvwRrWGeDfrxy4Lx3gTX0xwp
 cQEhX1tqiHZtyHdMIMWY0iYfKUOBTOCwRh/re781GYdsQB0HMb5/sIdEwqFkV8Sy2L
 2nStvk0DaQEoXJaUcFu5sdxaMXH286Hh+Jdqxaf/evE3/WtS1tP4+h9FACEEvJbuok
 C/HcYwGTqC6C3JQIir1vk4K/xQ48bpETkXImRkvKLC/jbrhHSUtO5Ga3WNRrnhDkjB
 GFDwJp+nDwB4w==
Message-ID: <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
Date: Tue, 10 May 2022 17:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, matthias.bgg@gmail.com, 
 zhiyong.tao@mediatek.com, colin.king@intel.com,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
 <YnphFjs4E4EYafT4@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YnphFjs4E4EYafT4@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_082954_300069_9EC0894D 
X-CRM114-Status: UNSURE (   7.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/05/22 14:56, Mark Brown ha scritto:
> On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:
> 
>> Sorry for missing this tag, and also I'm sorry for the noise.
> 
> Hey, if nobody broke anything all this testing stuff wouldn't be worth
> it!


Haha! That's true :-)

Thank you!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
