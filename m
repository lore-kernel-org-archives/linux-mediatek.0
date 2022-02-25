Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083E7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxeuRapMIKFvI4tovRnW0gKZCfuQwgkh8h0CKBtAIts=; b=bJXCkmkD3zpJjA
	Hz2wAKf+STwaoZSL3tKKvTXL1Ir3RFKWw8B3/RIiFlkNhwpTB3qV2QgNk9QvM18rabXbFQiKlTiM1
	7hFJ524iE/WHq65TeFGjAWAcIavMbLk/eO09SOM+1fX94W0fVtcQcSDATd00A/dYtkejCJtq5Uu7G
	o0sMs3b9iUq65k9m1LvKUFKvlGlYI7F+rkBZvYvZLChRKF/3bat7laOkuZN0o3ELfA3c5pWbNRsCS
	XKtKp31QS73410+aeYRxBqvLB/ZDMd5kmPAtWx0DliDve1U3zLD74QPrlhVj/aH7E4Vgvs3Dz6Zep
	9sJFg2DBsoxMOdnH6A8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWqm-00494q-48; Fri, 25 Feb 2022 09:25:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWpe-0048ZB-AN; Fri, 25 Feb 2022 09:24:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C2C3D1F45AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645781049;
 bh=yW4gEvTplbIUHZxp9m+Js7rQRpC8PxBGMXAC4Ov2i7s=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=m9U0PRNKENRR9xiVxEuPncTvaS8KCkxL803Dl46Ra6VENRDmEW6bt+XOIU2B5YGMH
 RS9TMC7Wlw8lS7kVQyuILa6FlRJWq5MYV8r/U3+91li9UIVXkZLWt8OVW+xWIfN46t
 3g0vwNBfQQPCzr/svEFYtQA4QHXJ4IVWEgFib5pI3XV+ivqWs+Ga8PF2ARoeR8OMLT
 VT0VPgRHht6/ixv7oPgk8adPyLxkP8hXUpD3MCn8jnmOfFyNbRAgQ6CsqgYthKFHKe
 gQ8vBode5Bqu3arnu2YCgFd/TdYmBNLfOv1LIW+dPb6V9mWlRHvBl4z+W8ljZDWjGC
 2G4nEJxCBbP6g==
Message-ID: <74dd7968-6760-512c-39c2-561eeacbd3ff@collabora.com>
Date: Fri, 25 Feb 2022 10:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7, 07/15] media: mtk-vcodec: Refactor supported vdec
 formats and framesizes
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
 <20220223034008.15781-8-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220223034008.15781-8-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_012410_566515_9D43812D 
X-CRM114-Status: UNSURE (   6.64  )
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

Il 23/02/22 04:40, Yunfei Dong ha scritto:
> Supported output and capture format types for mt8192 are different
> with mt8183. Needs to get format types according to decoder capability.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
