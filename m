Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWQEciJaH38ds3Zx6wsD3Ah2ZOD/rNZvg42ZSmq2Mlg=; b=RoF9x1zvqnWqTu
	6h2gjStMGf7yTC+lOYoBwwwK9/VGgL7J3T6N0HGoReQl/tQ1HSORjJqNsWBOEuY0JwFayjovXy62+
	pkCfCxkI7h8lDUaw0O8i9mw/Bz/S+1WZP15Mfj6a9Oo6h0RhTad+TQw2/h9x0NHdKYvIBqdTjFumP
	eOcZr+KsFor8R52F4Q0RceJw8bftS6kjCuXZ+/BF64P3Dg5x80vEmO5nVWbvxknHMGLEl5tTTypno
	5HBenQcFTiL/PQY06/QodxEu7OlAwvM3i9WSo1o4QOXId1K4lFzWXlB/kAPb1T794bHp9/pYfr6Cz
	SrU2drBU9VYMwslmr7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRa7d-004aMb-1r; Tue, 08 Mar 2022 13:43:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRa7O-004aGQ-VN; Tue, 08 Mar 2022 13:43:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 22AA81F433C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646746993;
 bh=kSUI2BRp2JNG5LsOGU9IRITk5p6tBa0tvOC+DAN6vH4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q17/LXQEF1Xjh+aRlsNdjnnsHqr21WtQKV55Zg0+Gie1vBzNWqbspKyuzxJGQggds
 FpmVkV2N8dx2CQ6XBB85sHQ/Jc9emmJ8hgK8hBKCTY7MiM/DYCYP+LaF9yIgYSpeoI
 TTjC63wCGpDBfYPEEcbFXek3QHGn8Pso+VW7FtSNquuOuLBPqVo7U3EOOeBOcUo6es
 CKHcCasSUH4BrjSfrtAz0EsfymVDtAziRJ2MQZV87nccB2uLprZ0JzWcWWOowr6YG8
 50ZVWoJt2+O5aszZoxUiF9NZEzTowqD4CiAH6R8pk6sar49wsDKaZneTz3rUhmPKKZ
 /05k2uL5pyCWw==
Message-ID: <9f794d5f-49ad-d2f2-b1ea-6beaa1d5912c@collabora.com>
Date: Tue, 8 Mar 2022 14:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RESEND v13 22/22] arm64: dts: mt8195: add display node for
 vdosys1
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
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-23-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308093018.24189-23-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_054315_181632_F350C55B 
X-CRM114-Status: UNSURE (   9.11  )
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

Il 08/03/22 10:30, Nancy.Lin ha scritto:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
