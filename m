Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD75AC2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 11:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkYXlWPqVkWLFR2EYGDxx5WJkFPsxIIMcqCVxLgE+Kg=; b=xYNUsZOEgBMwsscKOh8xwcNR0Y
	vZmq6lnUQz90NINKfXw7KRmtNJmb1Td5yuhZnnEPK19P7NfWrsGA44Bvf+2nWTVe4itMLtocHmgPK
	ou0YFhvr/oB1XcspNAqj+f2lJlJttqHw+6uz/x/i8otpQR0/t9oX8Jyt48VNZmOMLSpnjbbAdNjTA
	Hv0OnqQDZwnRtQdtGohaZPGvHwdspCKUE3u7OX104OBeVD0UsTTdaEwEMBisD3hZotykczDPUSawj
	blANHX/70ju/d2HCgOpuTUW/huPxg9kxvOzoQmxHUDTeukzQl6FNgrfUoMO2que+BrfsDk+8dtdY2
	6fKroCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJti1-000000012y1-1KAR;
	Wed, 19 Jun 2024 11:42:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJthv-000000012uw-0WoC;
	Wed, 19 Jun 2024 11:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718797342;
	bh=9nbzgzoMSz4g+t+2ea0rpY+XNFLSLRWc62G32S+O2Hs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ezkOXUhvHectTqnAcLrhzNGBcHg0uPI4mgEc0gMmVkR4o6ewz6Sbxha3wkztemMX6
	 uL3bzjdXpLqqY9By9GL5Bz22MupxTL5Qoadk4KDY1o/2AzE80dgdRMInlEv+Dn0ibx
	 JK4rOev2qmubnpn1wxRFmsZiDm30OFcjLHvlNxyr6BQw8r54L+6FM7p0Wuf52nqwMU
	 mFN5YM8nUfFHLeG2DbVOF/hj/bmyL2X+GqCJw3UIkPQMuKjq3NBYOFzklf6wXtjLgw
	 E+5Ke0utNmc8ROdmwksPXzWNnwqW/VbJueTgBkNtNqiaMxpqkwrZzUJwMsCszJ/N3G
	 WBxe4JGqAi+tg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 969F737804CF;
	Wed, 19 Jun 2024 11:42:21 +0000 (UTC)
Date: Wed, 19 Jun 2024 13:42:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, steven.price@arm.com,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/2] drm/panfrost: Add MT8188 support
Message-ID: <20240619134220.683ae228@collabora.com>
In-Reply-To: <20240611085602.491324-1-angelogioacchino.delregno@collabora.com>
References: <20240611085602.491324-1-angelogioacchino.delregno@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_044232_023918_B2C17334 
X-CRM114-Status: GOOD (  14.03  )
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

On Tue, 11 Jun 2024 10:56:00 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Changes in v3:
>  - Added comment stating that MT8188 uses same supplies as MT8183
>    as requested by Steven
> 
> Changes in v2:
>  - Fixed bindings to restrict number of power domains for MT8188's
>    GPU to three like MT8183(b).
> 
> This series adds support for MT8188's Mali-G57 MC3.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
>   drm/panfrost: Add support for Mali on the MT8188 SoC

Queued to drm-misc-next.

Thanks,

Boris

> 
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml      |  5 ++++-
>  drivers/gpu/drm/panfrost/panfrost_drv.c                | 10 ++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 


