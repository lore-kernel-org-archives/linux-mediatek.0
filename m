Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpvFYH0d398MdcHM3VnHph+EzyDMJtKWCCqPsmL2mSk=; b=l4jlyhpY0z0jZC
	xY/tVNq6vqZLZSI6UQo7uMBVsBZTzHqeHvTHjjkctNVwOU8NCrEatV4s/8FdhKHw0nL8BGtq9S51Z
	MD2Kx1obUu/coyLjdx33v6NZpq6TtC0jtiRnk9OVu/J8xMmthWe+m0MQwe9KpPRky7zrUQsjgDFgE
	34ahNbW+3Niu9hMKXXo5K7nJei5sEGVwdtOklKqhg9t/0nWbYnqG8Cx9+17qPUE0tz221IA+MoDFi
	HqLbm/LsFx+r5dax/l6Vt0GrCPtpAbkqnhIDe8l/F+4XgsYtKx7KMfL2a/22RubzBXIxT1rXpgr2O
	q1/nOc1aR7Jr3m8B6Mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbjPp-001BmK-Dp; Tue, 05 Apr 2022 13:40:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbjPd-001Bjc-UY; Tue, 05 Apr 2022 13:40:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0F47F1F4343B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649165997;
 bh=gQ3Pg9KvJsy1nFjnsiFdGRFbG2pjxVLA/rIpxmBYnwQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bCaiTvvM0EjvxPHg+Cq7O5T0+4hFiZUiI5RpINvgXIufUIWOgU+JCWbOLVPG4UdzK
 vl5GkV8ZyYkDoDat6rI53qT2r39VItbOp2S9bVyr7ze61LtNTD6ql1dbDHp1eYSytk
 Bk98QgZiyNDZ2omvmhhIYaq1PgqlZXI/SYHQLr+G0kHbhrMu80gamnya1o9f3R8YpT
 Im9GzEyXmk5wA7PHXkesFA9m76uC3vjsu0FW1KIAX5HqrSml/R12UNuqDrjvuk4jJk
 pe+LYZhlL84lF3r5Ouk4u2IJlRSzVwgTA9q/KiaooZQyL7co0i1bW8x9BNoHG8rtlc
 kCeCgITqZw9eg==
Message-ID: <0762b013-6c13-ef57-5796-902c9899ee95@collabora.com>
Date: Tue, 5 Apr 2022 15:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: Fix v4l2 compliance decoder
 cmd test fail
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
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
References: <20220401081302.9475-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220401081302.9475-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_064002_144863_7D9839A9 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 01/04/22 10:13, Yunfei Dong ha scritto:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD.
> 
> Using another return value to adjust v4l2 compliance test for user
> driver(GStreamer/Chrome) won't use decoder cmd.
> 
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
