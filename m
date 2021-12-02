Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL4jtGurD6kMf443RaquQHJMV6xSjuIY/i9v1YCCrFw=; b=4ErSbGwZRQo6AryX9bvbbzqPMr
	USXWI7HyaxD9+AeUtXKQAQ40yVAqN2shCzwKNdsqFF9r1bmd6KerxrQrU+thDuUeuTaoQB6QBgj86
	TasX8pypdpo2I7LoCuTU5nPe8SrxOTT6CJWa626zgJ+MsLuAr+3Yq+NEZ9BzpXVTcIGugdNxW/gv/
	dHq5cXT2aTfzqJy1827XnElSOIlVsPOr24Il5A7u/yEYKw0JXzUmDpGSSN9R7MU/HM9qyqjPRB/Xs
	Fxm1hyJf1TDnWLdqWJ2aD7fdsSeqKwjQYOpLRUhwIYlkzvsbpdKts3QmAwXsyY3IVav5gBM1BJGl9
	f3WE0HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msl2y-00CEZJ-92; Thu, 02 Dec 2021 12:18:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mskwV-00CC32-8y; Thu, 02 Dec 2021 12:12:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 729BC1F46337
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638447122; bh=s4dJNUBn4cysCTUjHiIKY6Kh55sL/ORU4j84VdhDGOE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LBwRxDmHSgWVDEB6Xv6+ww9aiStnzyoZrKQ3j9L7d7JOH+66beF+YBBJhgA3NX7Ht
 BE8q8V82Vpl/8jkgrEpEKBK529z0lmMV1CFoq80Fss33pPVEOyCIi5kP0ZLkJ+xL94
 /f5GTnVbMLD/7WnhwGdz4e2ys4Vn7q6K0YggjeQNt1o+2Mpg1TPTHYObSsGFQXW8Ou
 DH3UxLyLolsgVbki478JCu/7ZSk53fEnPq3zVcWIdGIaTOdJ/SMruE/3rFx0CiR/NE
 NhnN29On/2j/jo7rpBL7q42XHqr9J6Aws+6BJaUnleA6+GJjyWHCN6PTuXXqXGHSME
 Kwdlse/yKq7Tg==
Subject: Re: [PATCH v10 4/4] soc: mediatek: mutex: add functions that operate
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
References: <20211202061322.19917-1-moudy.ho@mediatek.com>
 <20211202061322.19917-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d1a291fb-fe57-fb75-04b5-72fc5e5462e7@collabora.com>
Date: Thu, 2 Dec 2021 13:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211202061322.19917-5-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_041203_504675_CE920D8E 
X-CRM114-Status: UNSURE (   9.40  )
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

Il 02/12/21 07:13, Moudy Ho ha scritto:
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
