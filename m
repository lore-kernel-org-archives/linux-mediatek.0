Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF1AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5yIPm15dTUa7uhTK6r6pPlpwQmWJZXa4luU32Vn24c=; b=3xe/UPac1AUGL7
	8vQUmbTjOj1lpaX7jo8t0alPol9QbJOJO5nA3uRRxmoqoaWWuUsdh9V5MI9KfWYrz9mc/FKCX4zR9
	t6y5Ja+q7eaMml499MWCh1IHCnsSDpu9NuY1ufia947gRSIaxf0qD0NaxywLLLu6duT/oOL/AB4yp
	rKVlHx/79piKF7yD/zJ7VWr5nXUhFKkDtXFVR7glRwKaNBqbAheMWzY0wCdjQ27tOFYwUvpGYKt2e
	HThAIaLqDv0aDuP7nyPDDdAfEHt45r+yoY9bzqHssrBnizbfqDWSFXSmwL5JKnwSOxypde+us7m8I
	TH8hEaRh3CEI2I/ybwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRw7-007eod-3R; Tue, 24 May 2022 10:38:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRvO-007eWa-Hf; Tue, 24 May 2022 10:38:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 23BCF1F4297D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653388678;
 bh=etll5o+x30UMEkWrtEntHbi6Qfc9TIi2cHHAAYdcrI8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RB+miw2uhWHevfkESfd+oNlk+0IsU+bKudXzWexwtjfck4oXzg7WA1oK2Y+/PeP1V
 e+Sp3oyLW/rc2RYTdwI4mI8stvYyq+pbN4ENWq0alq11rhrbd9wFTy6TcLkDTou/mb
 ag4SjRvVlUDOj5a5jMGNLYG4zujWKMkSkF0wWCFCFVyMuEU2gPUCpPCbBdHD/eTktK
 YXkIlaGWUalnpy2zv1L9VjBPAp1dWLrYlXmW87Y75MpuclXmFBuHYTHxYiY3rsduEC
 gDAjvENl0hICufAjPuuaYxmrX/spznt2sbygmn7F0Ur3yq9iHYj8XNgxSHf5iIriKr
 vx3j0eZboO6Gg==
Message-ID: <9cb97ed4-2951-360a-2a0c-773a8d78116c@collabora.com>
Date: Tue, 24 May 2022 12:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/4] usb: mtu3: add support controller reset
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
 <20220523090449.14430-4-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523090449.14430-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_033802_865875_2CA4C3E4 
X-CRM114-Status: UNSURE (   7.84  )
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

Il 23/05/22 11:04, Chunfeng Yun ha scritto:
> Add support controller reset via a reset-controller usually in infracfg,
> it's different with the software reset by IPPC which only used to reset MAC,
> and it will also reset IPPC meanwhile.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
