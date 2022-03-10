Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE70C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7lAM8vp+zO2QfEfXDArTENwztYOZUk0cJdgl7ZQAG4=; b=QT8EfTrs3MqWw4
	c9NY0MAzCQjoKLHAi7DM+qnoLGBKMH4V0vNn8GuhJW3m6cuQty7iujpY/ScEZcMOqeh3OJrv94WWY
	XRt/ooyiIYDgrB+6ZiH1r8Frgz/QkYjKEhectbm4jkmGhy4/PIfaxeyzsmFGfwRugOB90wHq4D0bM
	Uf3WexW9Om1J0Uyzeq23PgeYVe4SfrR1zq5pfOkbTEuJuURF4Ao3AyAQp8PgsG+0la3fpunhQbr3h
	ZHMYjmAKrjE4839+++RnjOdNe18rhW3h6YLomzE5WBUZ19yud4r1qSadSdfTxd0mdtYdk58xyp9Nr
	NOGhZLrjK3RyZg/0po3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGRc-00CVRa-SX; Thu, 10 Mar 2022 10:54:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPd-00CUDI-Ms; Thu, 10 Mar 2022 10:52:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 514991F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909572;
 bh=OIHzCHMj5k3sWfXIEjFNU/tLKLnLH7CCNdUZCAzV+8U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=noDVc6PlWR8NHZ+flnpVaExec2uRYYw+ohrKV9EspZ+HOev+L2pQYMDxNfd23VwQU
 zl3qV07k/Fif3WnLoFCx5GhsIKA/kAucN0A6tT1ezc9pc3qU1Deit3Pvqyi53vC3ZG
 Aiq5pBow465nZBl9dEVtKUikTRpo+/ko2LbXP5t6MPWYI/QAVhOBOmIJpDMtMNpUz1
 VVJ3XiJyKWJpJRHVRuZfYB2dq5E19nWV6RQF742dei02CZCa/a/tXK7RIyvIgelxJx
 PQTNWFF9KmvrR+MJ3+gxUfQueBKbCnDP3FTi83QUERxEqoah3OgUMMi6yUHi0Swqnm
 02oLql+r9oM1w==
Message-ID: <72b85cf8-cff2-0bd6-e0fb-d007a0a81d0c@collabora.com>
Date: Thu, 10 Mar 2022 11:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 14/22] drm/mediatek: add display merge async reset
 control
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-15-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-15-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025253_963466_7BBEB2FA 
X-CRM114-Status: GOOD (  10.71  )
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

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add merge async reset control in mtk_merge_stop. Async hw doesn't do self
> reset on each sof signal(start of frame), so need to reset the async to
> clear the hw status for the next merge start.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
