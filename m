Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881BAC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gB3lYbN/QJdYM4jY1sJVJLPCx6avIPLNvNQynxa+P8=; b=Ly76810sJMCOnqoa5jTdPnVMy9
	0REs5CQjCw0FmLR89HTFooN3mohGEChF6tQEXV92pKy6JzVdXsEjY6LiRNIMOubqrqIxQgxpXePoL
	BgBSOhrVrSrzV4+YR9OTF7NsVpsjtFqTwV6NRfUIZ325eDHjgbt8ckcw83z+LQC6aJ4dio67/6ZSD
	+CqRxrA1S8yYAEtOF8b341n9teKJ7s+OceLL/fLHMG7MhGei43KqFKUyxfxHzAlMVc0wJIUBFsUpD
	/pnnHkv0bQGq4G2TEDiC1PARXDcb/cCdhPDYny8xa57jYSENyngafvT6Ave4Cq1uWYJ4AINQF2iCd
	XDQKs57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmtt-004Nt7-1g; Thu, 16 Dec 2021 09:18:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmea-004GGD-HZ; Thu, 16 Dec 2021 09:02:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6FC181F45D58
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639645338; bh=zL+DWDBWAxAva/LZzsV++QwebWTx6OWlGYYwxqnET50=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LeMrGcf6WrFDjr819fF7rrGXdWK1RGXev2g2Fe3BxmKyDKQR58rfPvyPzN/398uVh
 CPSvLQj6GuCESbkLKlzz3Stme+36QzEnpcECCfGeYxDLf2MMatNd93dxTonUZDi9LQ
 BJk0V+FaevjvId9RUuPdCKlt4PGxD7483tAYQqTmZLxdt2B/nlVMwQMAg/01n1itCP
 VMuJkAawvJXjOmy4Hf48QPoiyaeWbMWppDz17sr7FWfUH1c5ceUg3OnezI7T2vEoBb
 STf2TygCvpj5Q0nqFGVUNrzrD/RH+kXoDuAJ9JKsx+VgkEwHKgzfA9KA6a7H8XI5xG
 u7+7A9sC4+qMw==
Subject: Re: [PATCH v15, 10/19] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
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
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211216085745.18732-1-yunfei.dong@mediatek.com>
 <20211216085745.18732-11-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0eda55f9-6961-0ee5-b7f3-916a4e0a3d7c@collabora.com>
Date: Thu, 16 Dec 2021 10:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211216085745.18732-11-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_010220_818087_E043FCA6 
X-CRM114-Status: UNSURE (   9.56  )
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

Il 16/12/21 09:57, Yunfei Dong ha scritto:
> For lat and core architecture, lat thread will send message to core
> thread when lat decode done. Core hardware will use the message
> from lat to decode, then free message to lat thread when decode done.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
