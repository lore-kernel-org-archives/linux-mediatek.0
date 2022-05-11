Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kl6ewAb6qwpq6Sz2vclEoV0BHacP2+Nsd6pKZguwUw=; b=RsW3zFDCN/ghbb
	ECCfeLQQ5SMSyQPZ66oI1d6ffikN8p6PR8Shm/GG1tNY5dXqmw08+ZRkUV3cFqWEPp3kY86uKbfHl
	qhN7NCZ22yoh60VRXXmM2InNBVtmA5BqLfHa/inUD8ncBj0cc2IQmcNmhsl48r199ol/T4wl1OiKT
	FN8UB/E3ksSKV96wuPRzdLsGgFQYuqqSjNIDX/vGOqRpksh6xQMyf+DoLtSn5vAHVjCpzNq/qmXLK
	kyjaz/rklhPkbqUPbEAJdKIrCwS890QwaCTeBoe5hk+90v7QCoNlkQAiHWgVal4JTEmq6VCj3iEp1
	D9NTH6JrgQbQXhSWYTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohKY-005o8B-Fd; Wed, 11 May 2022 08:04:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohKE-005nsM-2t; Wed, 11 May 2022 08:04:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D83611F44C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652256237;
 bh=rHxWTERdNk4Yn2qQ3l99Wkt4OciBw5SAAHBYUVwgMjI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=F8dtqKHodXJaflkn78tiHZVUD3rdaQHxtgZaG11wQt6u9lXnnnEXsW1FcnkrNez7g
 yyruKMsi5Jeixps/EDL7jIZLhVUPodcqzRfAhmbeXD2mkQNalL6oYQw5XcyjWYJ+KP
 a2/jcHMj00BFUsuGa/v0+C/1jNm3w4vwKiAJagwKwNLSJ9r/w4yOMnm3aoYY7P5WP0
 nfuuB0z+Quzmv/fTisag1HhlkeEpdi5HJX/dbV0m/gW7d6boelyxOuYMuZmrCofdQs
 ut4rB/8Ijm2QcxEfyKYPQrjBQpU3mssRe5meJKXZRglxShhvoBAPiU5g/6PSfflkNZ
 x8FZnPhf910CQ==
Message-ID: <18fee6fe-2378-391e-993d-425c887ba40a@collabora.com>
Date: Wed, 11 May 2022 10:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 00/11] clk: mediatek: Move to struct clk_hw provider
 APIs
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220510104804.544597-1-wenst@chromium.org>
Content-Language: en-US
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_010402_459929_EC0E461F 
X-CRM114-Status: UNSURE (   9.49  )
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

Il 10/05/22 12:47, Chen-Yu Tsai ha scritto:
> Hi everyone,
> 
> This is v2 of part 2 of my proposed MediaTek clk driver cleanup work [1].
> 
> Changes since v1:
> - Rebased and added coverage of new MT8186 clk drivers
> - Split patch "clk: mediatek: Replace 'struct clk' with 'struct clk_hw'"
>    into arbitrary pieces so that they don't bounce from the mailing lists
> 
> This was tested on MT8183 Juniper. Apppreciate any help testing on non-
> ChromeOS devices.
>

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...and this entire series was tested on:
MT8173/92/95 and MT6795 (Sony Xperia M5 smartphone, clock drivers not sent
upstream yet), so you also get my:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...and last, but not least:

Thank you! :-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
