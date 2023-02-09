Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B29C6379F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSLuEY9TrtZkNP+N0SU2bcAGAZ4vP0Y8x9BpuvjX9ug=; b=NSNJZnhJpbhH8SRDUKdzfcuNp+
	Z3HebjGF0HRIYE/m6Iv/o+RMhcB5ySMwqd7gaN363o3AgfpU3q+vbrrY1aC6w9Z+IYc+7TQkOTOkt
	057nNbLJi8xc1GfVm4T4yBzx2UZJfNR4xIsgABKkY3ekiaO0lJy1xn5nFsKNVv+/piHiW1NqV9HBJ
	9i9KhgYs8ODiSPQBOSBG4+RDUAjavY211sCVfebQPrE1K3iFdKJC9Iuf2iyJSGIewWl46aljMnQEk
	Mnmg8QYS9aMSlKjrdVd2mVOqycfRx9aFcy+0LmL7W/WueG55wvN45gCiIzr9K4oPFRYY+/660W9SX
	RRwweyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6U2-001Zaj-0E; Thu, 09 Feb 2023 12:57:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6Ts-001ZYU-2i; Thu, 09 Feb 2023 12:56:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B4E7766020C1;
	Thu,  9 Feb 2023 12:56:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675947410;
	bh=B5hP3G6FgIwkwEQg0vRoKUhdtFs0lIrWXYoejF8e8E8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DpNy81Y8cZBUImPcWpwdydIZDClrhB11oZkdB51NOK1gdJxTSZKa17INB6Y1qOA/e
	 1aBmlAIARNWb05savxMJ34bL1fEHn13Xxc2YLaIrQK8HWlxrjKDZij9GO45nzBQhjn
	 YuxI0QTVwSzZKW62zvUvRnd5b1OwwIaIQd1LXWLo9UqM6F2Dg7DC1x4ApKe9+oBk4i
	 loSoUCPgPnZO/w/0yMqrEpm7uOa3/TKrOhHzgLVSznM7Y8xdZqd9UvMzpOEZwyxxKg
	 /YA1Dvjh27HhPl18JDBra/T38K5VUZLdfPcVnwlcnllMegylMsh3zyO8az1Q3genrP
	 LELxvgOf5mSQA==
Message-ID: <28f167b7-c468-8752-29d1-2a122e8142dd@collabora.com>
Date: Thu, 9 Feb 2023 13:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] media: mediatek: vcodec: Force capture queue format to
 MM21
Content-Language: en-US
To: Tommaso Merciai <tomm.merciai@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230209074025.1816-1-yunfei.dong@mediatek.com>
 <Y+S1cA4PXT1MVJm8@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y+S1cA4PXT1MVJm8@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_045652_362259_4002DA95 
X-CRM114-Status: GOOD (  15.01  )
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

Il 09/02/23 09:57, Tommaso Merciai ha scritto:
> Hi Yunfei Dong,
> 
> On Thu, Feb 09, 2023 at 03:40:25PM +0800, Yunfei Dong wrote:
>> In order to conver the format of capture queue from mediatek MM21 to
>> standard yuv420 with Libyuv, need to force capture queue format to
>> MM21 for Libyuv can't covert mediatek MT21 format.
> 
> Sorry, just some clarifications on my side, just to understand :)
> The problem is that libyuv can't convert mm21 format into yuv420
> than you need to use mm21 (forcing this).
> Did I understand correctly?
> 

vcodec can output either MM21 or MT21C; libyuv can't handle the MT21C format,
at least for now, hence he is forcing vcodec to always give MM21 for things
to actually work... at a later time, I hope and suppose that this driver will
change to not force anything anymore.

> Thanks in advance,
> Tommaso
> 

Yunfei, since this is required to get "basic" functionality, this commit needs
a Fixes tag: can you please add the right one?

Thanks!
Angelo



