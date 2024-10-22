Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994F8D1CDC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl4uJxlWB6Vgq6ttCcC2hQB/dpryvySsfsU0gvLZJY4=; b=XTuTvGcf3xK5y03+4Y90Bv/ofR
	u+XdFXAmqsqUSi/lvgb+y41/hC3URty02/RHsxwtKjnAHotFSHoVvLwpR9POSBRMopgctVzYV1QAm
	xBRpDIDWMwJB780IzQRMRtadAo2YvxZbyjXBpiM18ojM0VBBlZjVo/WVafwy5NShsU8x0fMXfk5kn
	Yd+QIkRHaGBDhMfUzl+StqMQhhOoa85lnbRxs34kLeTKV0vQ3z40jhv4M9LkRjmzR+f01JfO2i/w4
	joBk7OnU5iNqFelQ2IurK0i7EnWR1P0PkxsakXyAAGBgLylltVwterv5TDLHnlR75YvpzvV+k0q36
	gLJfgmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B3E-0000000AKUQ-2iV4;
	Tue, 22 Oct 2024 09:19:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Azw-0000000AIyQ-19vj;
	Tue, 22 Oct 2024 09:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588573;
	bh=WK7Q9BUHHXh2dfmzyOC4ceHjQml49UTueInTaVAVVuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EdvnfT1uX8a/GhmvQ0G/2JiRwCTIX7JqJIx+csY8BP+vUU2KQ8mneX/cGkW61yeS5
	 AMQdE6OrUVfPvduAB9no+O4ph88nG7KCZ2r/shTaUoCBIRfWZl6t2vo5jNcTFYvDkH
	 uXbxCfGeB4KJMJUlsfVKmczxQ4h/3RwkN8MuWthUeeWTKJ0gpq27XjsSw9oujGWeU1
	 bEyZgJTE7s9ZPmM7ENSO+dH0IE3IqFjHh+DDU5/DD6vDnPpBbgTxrDHzrzOTdfFjSl
	 oR43sqSZlg0FbuLKdXtYrD+zxvVa6R62zcVfvE5TZoh4LgesktKUisO/WAIyxLBJnR
	 isJQiA/HZfgvA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B834D17E139E;
	Tue, 22 Oct 2024 11:16:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev, 
 michael@walle.cc, sjoerd@collabora.com, 
 Simona Vetter <simona.vetter@ffwll.ch>
In-Reply-To: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
References: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v13 0/3] drm/mediatek: Add support for OF
 graphs
Message-Id: <172958857271.72613.71247328907828550.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021616_544191_D872FE69 
X-CRM114-Status: UNSURE (   7.07  )
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

On Thu, 17 Oct 2024 12:38:06 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v13:
>  - Added comment in commit description of patch [1/3] to warn about
>    new port scheme.
>  - The series is now fully reviewed, tested, hence *ready*.
> 
> Changes in v12:
>  - Added comment to describe graph for OVL_ADAPTOR in patch [3/3]
>    as suggested by CK Hu.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
      commit: 713a20e598f8f8fb6660b6c38eb5071aa3fc85c6

Cheers,
Angelo



