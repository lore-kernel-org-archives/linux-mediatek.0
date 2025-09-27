Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4BFCAC5B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Sep 2025 22:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8gS3lBr3j7Wvud1lK+lD9eX9tSSo9wWSRk6jSkPi+Y=; b=w771IudyMiWlVXVAxAaP67929a
	sk9PVgjiPFEdpvUFxz9hyfrK8UlyF7zilVgxiMhspOFfQ63rh+qvhqPhunViUD4Yw1Q2iUn/GYizK
	6mtKFpObMqZBB4p0XTq6Bukon2vOwseXBWzGuad9rj34NQuQiiWfmEn4IjQH3tfrgIbw+n6Xhu0B1
	s+WC5jw0NlMR1q/zuj59xZTKuwx7dqQosY4dXTmZDa6h5j7t37lfI73On/dQtQhm+q7yEHQscQjQw
	e9+olOl9+oofrZTblNkZxwusyU9dnjsObHHlOolyMVv2fUmA4+D/rTpseHrNOyOzpS+MWs6YE2KVo
	yIObFneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2dcf-0000000D521-2V8Z;
	Sat, 27 Sep 2025 22:42:33 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2dcd-0000000D4zm-0XnF
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Sep 2025 22:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W8gS
	3lBr3j7Wvud1lK+lD9eX9tSSo9wWSRk6jSkPi+Y=; b=SCUrABG6nCFnoowG4VFN
	zpzTaCxwHx6HIP8KwDMyizitPF4QVumwiuztsIKD+sL7lT3S1lvRo4c4YLHisrEK
	VJFD5U/AiAajMgXydB6Wu/IIXMxgulA8BhcQtyWu8fB8AIkvqXGzqFSiUuonvjCS
	/fOVsLiygNzuelks6eJ/qr/q1tzrgfrWvVV7AUb1qqDGm4UXNeqeuwMK1r1hu/Rd
	QAZ2Mm/R0kUsonjB57vEWI4j1cq4zH5lmmeXhQp985GEQ+vAEsHpkRoq6rxO6qjA
	aqdwoOAmzbPkY9oKqXlC4KQYI9NPal51DWikUoyEfkVJK/knMrk2NUQJOsW8jiwF
	ZA==
Received: (qmail 2704494 invoked from network); 28 Sep 2025 00:42:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:42:27 +0200
X-UD-Smtp-Session: l3s3148p1@miPlHdA/jssujnsw
Date: Sun, 28 Sep 2025 00:42:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 3/3] dt-bindings: i2c: i2c-mt65xx: Add MediaTek
 MT8196/6991 compatibles
Message-ID: <aNhoU8AUVJUepzVf@shikoro>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_154231_436652_08DCD628 
X-CRM114-Status: UNSURE (   7.56  )
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

On Wed, Jun 11, 2025 at 01:08:00PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek MT8196 Chromebook SoC and for its
> close relative, the MediaTek Dimensity 9400 MT6991 SoC.
> 
> Those chips' multiple I2C controller instances are compatible with
> the ones found in the MT8188 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied a rebased version to for-next, thanks!


