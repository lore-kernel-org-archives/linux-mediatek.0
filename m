Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E8C27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chcNcXiBmdLa/GhEdlm35Pp5FLAziHr6dY5kNoTu3oU=; b=bqvozMdAt1SOL5bqm3/+0UlEPc
	Tsy7Z/Wtmg8CiIgvlkP3LJpHsGT2Z4zbTi0OHg79x0afCRvoKjM/2iioVmeCLHcVLqJ2beXJb0qn9
	rhQmO0Ka7pIPICX0xlfWv2A944zo1Pci94qsrhReKtXM6cAK8UJORMgicdEs2ofK3Vf/75oJEwTX2
	f4yoXM81nNDh8sedUGj9fxTkrgm+DD6TV3NqkEqupGE7S7IiQidjqrH5BSPFNZ7SU/FKiW+WIX0Uy
	rKk2izKEGLAtX5bcf6oKJiH/c4O9NwRRe6QhSgbC/Pe1tWbfBBeaZrjvTFJua/clQr8ab/Mgxgz5S
	+UF4OeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAQ7-0000000ASQh-2YTy;
	Mon, 17 Jun 2024 11:21:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPv-0000000ASHf-3aYt;
	Mon, 17 Jun 2024 11:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718623254;
	bh=ZrAO6jk9dA1sTHchQuS6+oqdBYiiPwGf47ALjcv4V3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mhxo0E1BRPSW1fO65TqIlUKh2w0joiH9nAJfRNfD4QDP90c4HlfYfG+XH1KDTy2UJ
	 DnMYUI0QvA3BiK5+SYUdvN3wj/kjetgxX0bEXBp9nkBfGvQEC39sNMz8ZvVi+92pQZ
	 cMbgq91oyB/zBN5qYa2ufpAApYTKrpggcefInVbIDzxf0DbakDtKCV7Y5VOmgMOpNQ
	 Q4nXJJE3XSD/fPHkfYCgaFRzH8EAVsfErOEpLQclA6hhGCGEMg5+0G6bwTaTqqz7xI
	 sphkG4+MJrsKgLpo0Dzfge0EYjj1bCay5dY0NSdIglIZ58G91QmMn484O6fMZzmGGj
	 Lfjqb/uJrldtQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6F46337804C8;
	Mon, 17 Jun 2024 11:20:53 +0000 (UTC)
Message-ID: <358ff4e6-9150-40d9-bb0b-83376bfde99c@collabora.com>
Date: Mon, 17 Jun 2024 13:20:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] drm/mediatek: Support DRM plane alpha in Mixer
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>,
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
 <20240616-mediatek-drm-next-v1-13-7e8f9cf785d8@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240616-mediatek-drm-next-v1-13-7e8f9cf785d8@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_042056_150044_B9AFB845 
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



