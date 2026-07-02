Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC139C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4PYqXEPA9CrErHqa91ZJaH1kjYdbpYUf9UuYq6zkao=; b=xL5QJPQ9I4y47Icr13WcACHS4d
	rwYyfxXi6inJogMJuWyOaalzGbRn5F2CeLWIN2+7dT36T5qQz44H9QS18l1ZwuT6PKh6tCG4T3ulw
	xjHXxvVtBzStdnuDtzptwq4PpExEQ7JYu3J7MaQBMGi2pYELAll1/AHWKbdUJYqCIRfYpoHpWaVfm
	rhUsNYw8wa9BJ0a1xaYZ//UBV2wQ7JmAUlxJag+OkrlhmfFrUPaIY0AZIJ+G9HbHhg/oZFhIoMdFO
	4NhYn8E6uYJ5MDUuzzbDIQ8IZlqkIzxwacnwr2atNJjFMUpQjBufzIwT75K5JhuQ/LgsdQr872DI7
	c+gsIq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCL7-00000003nHJ-3Frt;
	Thu, 02 Jul 2026 08:00:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCL6-00000003nGE-17tt;
	Thu, 02 Jul 2026 08:00:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A86CE6001D;
	Thu,  2 Jul 2026 08:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0887B1F00A3A;
	Thu,  2 Jul 2026 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979203;
	bh=Q4PYqXEPA9CrErHqa91ZJaH1kjYdbpYUf9UuYq6zkao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nfGzv4gNN7z2ExxL240I0Gbl0zh0l+AvOBpM02Qw2GF2kbT+rsa/Vpf47GM/Dsbvs
	 UeNAX/nLxswRSgVjAeQSARnGkcKkTVWYs5wLRXsJmUrk/ou6ScpCE4GB5V5iAkNt/m
	 yzLoV+IFhj2neMYJ8INuEBG3r+7hNipm3lx9Iw/oobb/o+ZczRu586hbxyJ1B6eAyk
	 g5loD7xSWUUxW/omAGX/kRXhcO9NV8FpW1dsnMJbs8IKZFLDR5P1PTMiev8LE6N84t
	 +sf+TltQ/ErSy0kh+aJqpJZypkRjhycPmQsb+WLHfB0rzBj97I3NgadJDPcYFIL5T1
	 ImX2zueWK4vWQ==
Date: Thu, 2 Jul 2026 09:59:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, 
	andi.shyti@kernel.org, djakov@kernel.org, broonie@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Allow
 trigger-sources on relevant HW
Message-ID: <20260702-authentic-dugong-of-whirlwind-ac3e3a@quoll>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122043.19612-4-angelogioacchino.delregno@collabora.com>
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

On Wed, Jul 01, 2026 at 02:20:40PM +0200, AngeloGioacchino Del Regno wrote:
> Most of the MediaTek Display Controller hardware sub-IPs need a
> specific (and reserved to them) MuteX trigger.
> 
> Since now MuteX is a trigger source, allow specifying trigger
> sources in all of the display IPs that support one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


