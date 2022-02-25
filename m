Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqwIES3qwROp6Wrx8fMUqGLdRMuiMToHZReenYajjAQ=; b=rl6glux5iTCVrK
	asvBz23Uu6R9gm9WB7g/J38dpcmVC7ZBchnOo5p3v+qXYDqNzZzzS5jfE5PwQQPJ+MLucDZOVGAvs
	F32lUCWhY6wh3JLp1GHMZquEcU1aQVx4Cc69XE6gvFZWvksyqToXOjiyfbhFDN6RhsPaUidggZZ9z
	+MfsJVBFFTuOXXy0H1uUbG98MH5U9wNxhYX0C2r93pfo3mdPQqrUbWqUWThEp9Mkq3g+oqvBqVj5n
	CHVCqzMuPjXholOSm4VN8vdDWaWsULe53GrwXmZzSW8VfyhboON9GJGmkt1RTPy7wMvqZSmFs7IGm
	5kDneqKeF8HziiWMxixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWpz-0048jS-Lh; Fri, 25 Feb 2022 09:24:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWpV-0048VA-CH; Fri, 25 Feb 2022 09:24:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 37C3C1F45AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645781039;
 bh=SWrJfJ7PskotUKYhO/j7/0MGwDwG0Y2IytOY3Y6T/yQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YYWQbzR1n5nXyP58/+zadQkqg+hNL4GsYRsXaPRpG0rfFCFcgdwnTZHVg2nQqw1K2
 E+dlNDR5JO7+k7dsGJ9HQaNyv3SDYrz2legTree2PBVch6m1lyw0ac/xIzKz4fTtqq
 BFugGaWhL3iI66DkjurSBKONT95MdEK4l9/VBuUwAjNwa7evjO/ivR9OXmY6LRXvBb
 NA8oPzXpX3CAPFPyxXYa0TmBXmDashDpnf/UG9odG6AtoxTfMR1YI+2PslXzBMg8rX
 PaEBwg7rftw6V3MUc5scQkL7FftztzE9vnIgYhabQidMY2gBsi3if8q8A6jZFrAieF
 Qu0d7KqilV6uw==
Message-ID: <14a8adf3-7f26-e6ca-ddd3-dbbc15f3e61e@collabora.com>
Date: Fri, 25 Feb 2022 10:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7, 01/15] media: mtk-vcodec: Add vdec enable/disable
 hardware helpers
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220223034008.15781-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_012401_606367_459746CB 
X-CRM114-Status: UNSURE (   6.94  )
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

Il 23/02/22 04:39, Yunfei Dong ha scritto:
> Lock, power and clock are highly coupled operations. Adds vdec
> enable/disable hardware helpers and uses them.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
