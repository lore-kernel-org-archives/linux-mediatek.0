Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AB0C2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chcNcXiBmdLa/GhEdlm35Pp5FLAziHr6dY5kNoTu3oU=; b=uOGTIyou37TU9Q3+blhuk4MIdC
	Y+oAwNPDArHTXNOX66P3HA3e6Xu2GlKpH+VemnnYXFHVfhIRJPo2IeBlgQMboVsBR/i0+qpkmJURk
	rU9Ohii0VtKtSu9NeVCMNqwka2dmjC7BVVKy9++1NRUHanC2hd3vGEfNmC3HZp2lLkK49Afj9Tpi5
	hZDsKGwxXrQuUjSsy7xTzlOBOhGHmzxLYo1oo5bW2PtxJ5gDroLVa72P3iFGMXNR3K3rQc9rPMEGn
	5l+pEsEuVzgsLMRIV+Al//Ei1UiiGOLOHJ9MuwIu4+WMr1b+thixnQBR1+aGFV2VQ2dFtwJsml30I
	QSPN9FGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPw-0000000ASIy-0n7Z;
	Mon, 17 Jun 2024 11:20:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPn-0000000ASDh-3R3M;
	Mon, 17 Jun 2024 11:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718623246;
	bh=ZrAO6jk9dA1sTHchQuS6+oqdBYiiPwGf47ALjcv4V3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Umt/kUF5iB/XPQbMPWNXuiVEIkzxpMhr2h75svtcu4S6QMvrqYbxer8Y6Ve0WPSuZ
	 NLT3CWrS9aW26ASbxdIu5n6DWzWOJ8Sa+Xs3vjev7SpVXviPzWOxzg9tQkOcgQhva2
	 RkcyvVY34xIp6gGScXEKP5qp9w6jhtxdtl4pzmvJLSEqUzMaCk2PFBP33GqclcEjBN
	 7yaDo7J2LWNm0UcloSzy9xugv15A5aHXCCqSnrZBlqv4jtltEiRkdDFjIkvYSJWDmE
	 215ulLY3b9RSA8sfIVZN9196OY89eJ+cdI/y4B8yVgTOTUk41hwBB5zKqTqt2c2Frx
	 6bQeM5rv2qgdg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A30CC3782121;
	Mon, 17 Jun 2024 11:20:45 +0000 (UTC)
Message-ID: <2716e1c9-a1f0-42cd-81e5-6f1b5d014421@collabora.com>
Date: Mon, 17 Jun 2024 13:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/mediatek: Support DRM plane alpha in OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>,
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
 <20240616-mediatek-drm-next-v1-12-7e8f9cf785d8@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240616-mediatek-drm-next-v1-12-7e8f9cf785d8@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_042048_062921_B8046CCF 
X-CRM114-Status: UNSURE (   4.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/06/24 10:29, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Set the plane alpha according to DRM plane property.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



