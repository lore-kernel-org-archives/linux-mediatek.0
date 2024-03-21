Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E24AC54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxgAfr1I2vm9y8PlElHdBGy8hrf6oDSiVTrgpUe+mEw=; b=oIzNIrMR6dTzVLdt3X6ryPQGm3
	CWWesGGGOKLKeSwomgUo13S4Bv2O6gXgw67BJljVqW05tbRHv5TuqoUvEcnKgiYHE0i6obDZRXdfI
	L9GQ1hwY/5Qm9dlHGw9vi5Um6UZccAW82P6RIQTFmO1KqihYcbb7bM/LsLv4YV5wRQRTcfzpzXFVJ
	vDR7Qx5zah7VT9YY5WrCHoF0W7e9ebp7vC/DwI8a3ITuPsoh+lovvZW7MppmRKzGPbfw5vQD73QtR
	C6LtOvRanAqC1b+E1U50xRtvMG/7lMZ9QjdgeyfW95cWNY2BH6tusvzSICcdGy/VeFaNqHJnFJeHF
	jUkSwDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEGB-00000002PZF-40X1;
	Thu, 21 Mar 2024 08:58:51 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEG6-00000002PV5-2dXA;
	Thu, 21 Mar 2024 08:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711011525;
	bh=0McerFxltJL+1DQ8q/eKcM6q/K4N01ogbaM2+Zm5fr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=il4T5zrz5aHxyx2Cow1i1RHOWEQvW38z+g0pmT3DDfNEBz2lgq9DSYd2tl3RSQYsY
	 1bmFMKCXH2s5KywWVn05K+6fR1vCWTi1eUXopl/Cw4koS2OJgdpR+iSBrVXBgDt3KT
	 JuDOzwTyeXoSDvDO5TGRRCHJ/yHo9RP/8kMmIt8Y3BoI/C384o37HgbNxlJb8FSSSO
	 4bXjhpkPrgon+UYl7D1B3WMXA9OiK0hLKe/fyeyyXmYulvE8LDNQifKzGzecU+TYfO
	 yRGubQtXK+JLPisHevflTZc09b3KjggbfOvnhL/EuGSSEAmrvm7FRUgNRQUZMItB7r
	 i3pMfr3bRdNlg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC3D537814A4;
	Thu, 21 Mar 2024 08:58:44 +0000 (UTC)
Message-ID: <5ec12d01-e229-4a4d-abfe-da069d052adb@collabora.com>
Date: Thu, 21 Mar 2024 09:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: spi-mt65xx: Rename a variable in interrupt
 handler
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
References: <20240321070942.1587146-1-fshao@chromium.org>
 <20240321070942.1587146-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240321070942.1587146-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_015846_885111_341F9CDC 
X-CRM114-Status: UNSURE (   8.43  )
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

Il 21/03/24 08:08, Fei Shao ha scritto:
> All the spi_transfer variables in this file use the name "xfer" except
> the one in mtk_spi_interrupt(). Align the naming for consistency and
> easier searching.
> 
> While at it, reformat one memcpy() usage since the coding style allows
> 100 column lines today.
> 
> This commit has no functional change.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



