Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D481EC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbBdKlhTmZQtU0kUs2B88jOYkxHuQ64ZF2HwZ8vBE/w=; b=KBz8UTPhq7jt7pUxHQSodYVEDe
	UaCkauw89MAiqsCpZVN+MBF57sJKDgMR0gRG4382QT7vt6uDyv6hOd6yoiXqu+Kk/e4xwSmVlJybu
	3mEDP++wO1FgKH83L5YyY2rQIDHa+7EuvjZZZZ5zptBfL2qd7bm4XomO/PbYK0IajzcEYkNivKGbm
	9nkCDBKd/KU8sh9gIYQXCWZ84zD1EMXSQz4c6ibkRsbpfzb4kaHGkrUiTQ8/8/z+w7ba58ULWxDlW
	8Co5WD57MgcuGYpGTogAShnrCJ8XNg2e39KX057YcKhgVdF//F+TffrXfLWywOU3LJJkWSvM7rxiu
	6yP3T3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54lB-00CDBE-0n;
	Mon, 20 Nov 2023 13:56:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54l2-00CD78-1F;
	Mon, 20 Nov 2023 13:56:16 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAD116600367;
	Mon, 20 Nov 2023 13:56:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700488564;
	bh=LRGku4mgI3CyWNGC5qdMEGicvWEaOWczf1gTa2doZpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9pGTjRpycIcF0pdwS4h+ZJFwwEsCe6B92BIOnLdsALi4qQ634vUfl9h82aIRi6aL
	 Xb/GnBNmauxMVgbNA8CPIfzzoGbHXhEs2HmNzrjVG6/cMUJ4r42k6Fc80/IexCWs0q
	 HMvRUHL57K0xfvASYsEazM8Z7f6YFqvHggz1ySIo2qiSjvh4fPN42V+CG8sibmfN6z
	 lnl+V1jRvkkY7DTs2f6kir6cQb2vSLB0PDU+yesdf0s26ZDgtbGvTm77lawNlaenLA
	 qG7cwXYQPYGv29BIGNbVDOjwhlKa46K8xBLHrbbj8GiNOt1eEvulQOksZxXgXCv0rY
	 55NaZJWd6S60Q==
Message-ID: <17be794c-1e75-4843-8dda-63ca7b879c5d@collabora.com>
Date: Mon, 20 Nov 2023 14:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231119112826.5115-1-hkallweit1@gmail.com>
 <20231119112826.5115-13-hkallweit1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231119112826.5115-13-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055612_549832_3916D972 
X-CRM114-Status: UNSURE (   9.00  )
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

Il 19/11/23 12:28, Heiner Kallweit ha scritto:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



