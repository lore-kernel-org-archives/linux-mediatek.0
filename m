Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTcEFOwEwA9F5v8DTSiq1WQlAHUM3UUxGDRorA+1hEs=; b=X1Btgd/ftHPi2FFdGf79GhV/ew
	RfRda0mgcZtsJibwY8kwIZnbuPbQByWDh/v9FL8mj820ciiBaexTIWtaf5J/VUhLcFuR8K5baipLw
	T8FpCkePxdFhsiT5ibFnObGtltxJonBJ4o8OzmFITJv4kpnUaqUIxW5xiSOBJf7oRCMKZaSO5LsmO
	g0ih2m4sjey16Qv1hfqBVjgcvBqtP3ojNkorrNQ9g28z3xLRzK9qjEekwO7CbhTKJZOdql9a7iXBK
	zSCSkkOm/Ad3sWYUVNGEBXSZ8rl1zyuNcaqgTt/8DOkudc+Jjo7jSmgJKDXB6g7VqScdmByyP28kb
	fyRV9uUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Dbe-00FbmT-TW; Tue, 11 Jan 2022 09:38:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DbQ-00Fbi4-SZ; Tue, 11 Jan 2022 09:38:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 667821F443C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641893882;
 bh=b8Xg2TY9K50GlJfbze5lcpegIc1dskT5b3FS7WqdRO4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i2PLvZs8vfmY7doeiSC5KcbrBqFDVWWMHoFXb5TKCQPOKkk8wx9Axe4UyVrX2rQuP
 etjlE/X1sacDQCNP8Mr5JosCt8FbdgnJNlV0IM/Oe1Q9HwvCC10WbH+3qjazZxpmPt
 3XyaPez4hN30Q1GLQ7mXfWgQSOR7Gym4eLktEiSGzlhYokbAUdAztk3YP3zBkJj+cY
 q8sp6tp91sIiabYJIdTPi03NFt0rMxCUMz1NedBnhsWoIokznXadvQRZRY+1TNVfc+
 5Gkkcgdf3gvb+jX9cNzhpi3nZVrST1alH/lf6tSRn70UiMYpKj9a6TPlGK4DFUQYt0
 N3udFBEvvmZjg==
Subject: Re: [PATCH v11 4/4] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20220104091712.25670-1-moudy.ho@mediatek.com>
 <20220104091712.25670-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <a78a4654-2442-e4b1-8e81-2a6d399407ec@collabora.com>
Date: Tue, 11 Jan 2022 10:37:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220104091712.25670-5-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_013805_111015_D41988B7 
X-CRM114-Status: UNSURE (   9.65  )
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

Il 04/01/22 10:17, Moudy Ho ha scritto:
> Considering that some functions have timing requirements
> in specific situation, this patch adds several interface that
> operate registers by CMDQ.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
