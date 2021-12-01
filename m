Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E3C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5U8o9kr5gixD/gy8WAeELP8+eWmdCzoe3WGwOzNGHc=; b=VBX+AwxhQiVClosOQ/z79TmaSB
	DM6mgJFx/PRuUhtXzHHmL4r4q3h0CE1yKfe4ddYrcHJ84jg0LUs0WVbBtwunrUZqLSgOJ5+6jkq8m
	M8GHf3ZnOgFD4pZmCXeNk31sYzoz3MobpUrpOkBSTXEA9n7fTYOgLLrHRQ/Q5Ym1zPrwo03yP0nIP
	CtkVQVLEekCsV46EsuJJkaaNk6jxONeC9kQJiAT+uX0/kkqFcRyZthMZfsTFGVg9f3IQPojsaejQR
	5mPi1aZqzlr2PcnhGhmZ/FqXYn9i/5ZyjUzGqvyHaOEN1yqBhm5gj8A1Fq1zKg2lsmgpSg03YY1UW
	i78JYdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOaL-008PXw-Oo; Wed, 01 Dec 2021 12:19:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOQU-008LXh-Kc; Wed, 01 Dec 2021 12:09:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 35A941F458EB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360569; bh=0YgzXkVV1X/IZvgSoD4iMcxH7QCuIHr0V9DiB0TY+bw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fHJpzr6GCyngtbkTI3bZ9s8It12v3Wnta73EBxeK78/mXmFFIQAhUW+aPYgf15Lix
 qU9X+8gQ9SQPYplpZSYBeuAyt576NfriyKed5C0OiWnis3cbYOa4PAZooZ/gui3Dcx
 7PZNt+K/7zYMeIpzd1AXGmOsxU5YMpM9yEl2GLrYUWcl4czFsSVolJ97VJrUAIsGGk
 sE7qlHEhjtla7xqwYXNhAFcUgCXka2QbsZBEDVkYr9TnNHwXn/eDzP6KIe1VBAJb9m
 A5V09mWUabZkMfXlBHoswoM0onIcwQy+aOUhXcGnYiJaSfVImhOqelwoXQhXVgwbKN
 DOjX6FhZaNBXA==
Subject: Re: [PATCH v11, 04/19] media: mtk-vcodec: export decoder pm functions
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
Date: Wed, 1 Dec 2021 13:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-5-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_040930_883399_EDD052F4 
X-CRM114-Status: GOOD (  10.05  )
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

Il 29/11/21 04:41, Yunfei Dong ha scritto:
> Register each hardware as platform device, need to call pm functions
> to open/close power and clock from module mtk-vcodec-dec, export these
> functions.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
