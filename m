Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F28C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvVAOmo80+W0BtZt4MpRFRkNfNoJAqF991Vayr5unHI=; b=HT/Nngy+3oMoyzdMT4NP04KfHe
	ANPxQFedPXhU6GCUX/Vk2j5NPrZ93ZtfK+8xW1zWcYVgvhxP3fD7747JU0cSrgYj+az9PELCa74qB
	rCreKFrXvS/iR68bVRTrug1Ul9kc61UEWjMzQgdUMC/qdwDxSu7hA2bAj1gXMBDh93gxem/wkQBu0
	qMV3xz/QrCpJEP+cyOroCZL2k+xf29dHg982PwutlepKRaX7hL9RqmCuMni5ACO/uOdISoyuWSrap
	s7xMF6xsxuAOh8iINo11+U0nFJ4EW4Qz9AtCrylBuuNkue7+Cc1vBkEg2e95pdCkXhRcSKf0DJtgW
	z1L4sQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msl5W-00CFag-03; Thu, 02 Dec 2021 12:21:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mskx5-00CCJe-Vc; Thu, 02 Dec 2021 12:12:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6E15B1F46337
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638447158; bh=Twt1cnHo5fIrWUn+6iuF4Co9D3Mu6kCIZI4gl+verPU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AUWnUaLzrxGiZCOJlSCwRigO1BcOjW4jKIffy2bzgNp8uICEVK7pTQjlk07DwJ5Wz
 FyfIU78kD0Kjra02UijJQrnzJGzKnX4CWcwgMGEeNykOHFuwcmmGhCtpecLOc2aD2D
 UdcQO7S7YFWgp7pyiJRoIZFgEUS1NLxvRjF6t4254TLxljT9xeTCHv7ZnvbVvNgEp5
 ci9vtyL2vgrxtluyz1hxyV4Z47GO3iTkQh3/xi+U2/cVJ/ihpoztJG4VLgtJ1J5hnx
 DMdPZ60vnydD+wV/+YfmSt5NgNos15QgJgz6ZTxQQC9YN+wXiWkPLS5CGNq4CVcr/0
 +JvS9SUOUhTXQ==
Subject: Re: [PATCH v10 2/4] soc: mediatek: mmsys: add support for ISP control
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
 <20211202061322.19917-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fc8b94fa-e5af-380e-4055-29c2b772619f@collabora.com>
Date: Thu, 2 Dec 2021 13:12:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211202061322.19917-3-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_041240_211925_2E493ACC 
X-CRM114-Status: UNSURE (   9.08  )
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
> This patch adds 8183 ISP settings in MMSYS domain and interface.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
