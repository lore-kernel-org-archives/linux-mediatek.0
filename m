Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C2CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3+zPrKaNnzYv9WFPUJfIg/d8VseXpxb2RSwL/1N090=; b=bvyu3KlJPdP+A2
	uTgWQb9Xdljb6FbAvWBobQYcEwCQAUBS5Qnb99BhkczuFwoA8bwdvRkLwuAN2fMr9iFmNUooZ3T+t
	0xwni+beAI11IK8kh0UDGyH/milnJG50b9P7vBINGE8Eo3RjOtmfnDljvYZqRg2Vi40tEAsCkX+Ye
	Uil8MLLcB9O31caTSl3hr9e3DH9lUCe/0LxPYFNmdmMAuzT7er9G/Y0qz1Q8tLPTAmB4P0ZR2F5Qi
	HdZfTbncu/A0ZqlTz1VzUUrAelEmJcUmB8Yo5/md3XZXgqbZZFt9VInr5fChnfcn/XvvQopqt7Zz2
	A+eLTwaJ2HPCYBPUSC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYqk-000cxC-1v; Thu, 03 Feb 2022 09:56:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYl3-000a1a-Iw; Thu, 03 Feb 2022 09:50:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D5E981F45305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881828;
 bh=lYgHb3dAkmY8mypiBgZpo6dpa8MBYUylGU6Ko2OA/+c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EvtqZBlVczSaej9X+PZau4GjQnWxdLp09eKfiGyk0DgHHIvFJ6H7AKdoD3jte5r2V
 4N9jJbnlMuFUxft8LrnzvyISCSIgn7g4TiBc0mytzUKK1u4LT3HTpMB5DXIeHv2k1p
 mnR8xz09oZyd69f4zxSQb5GaKrukgFcmSyQcrjC+CilAUJqlUjprog9Fle8mzJDOhT
 NVo5deWM51SZX4gm4mhZ9EWebRun+TO49rrQVheZMsIihHhM9zeQLlcRhll8x+Wp++
 9JY1b06ocduj0ozy9fuHujbGajPkhIEn7buoF0vdxFKegBQyfcIwneaCjOJtzNj+Wl
 VS9bDbDLOOQXQ==
Message-ID: <a6a8e54a-7ae8-6085-42ba-f12cadb0f98d@collabora.com>
Date: Thu, 3 Feb 2022 10:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 14/31] clk: mediatek: pll: Clean up included headers
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-15-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-15-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015029_815799_CAD910BE 
X-CRM114-Status: UNSURE (   8.97  )
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

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> Also, copy the MHZ macro from clk-mtk.h, and drop clk-mtk.h from the
> included headers.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
