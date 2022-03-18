Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C6EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9hvZ1wvV8qdFqJfrUzTb0VeGaTFyb7tyqPBFGyPiCI=; b=WsbSEQWl20pQsk
	Vb2S8hk5hoMrsiPRzc4NEPRme/HqRItzIQAPj9gwbbgjkR2rWMdh30dUPUlz1LQE3p68f1aw4huEi
	yBMV+jDnp+y5rP/ElBizpqG8LjlpLBl96538HfHmiDZBbSaoDCEfUoox33fqXyPCtK9l06PEWB1eb
	U6Z1lDK2z81TKhCeBPlQPazfuD0Cfrj7dlJMUOwn9WlZ6KPSRSRd8aKnTNjZO2GETLl9N312HK/eG
	1eFpfbujNnX7THi1LupGi/VcogK3amM1mYkSCJ7P4+YHn0QwxLEiv+luUR/LuR2oYr+O4o39VIOcw
	adlcWrNB8/iMCvjguM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAvz-001RKC-ED; Fri, 18 Mar 2022 11:38:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAvG-001R29-Np; Fri, 18 Mar 2022 11:37:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1C8B91F45EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647603453;
 bh=HEbHZXkfpwq3S1FcdQbuhM9tVhx8Xv8BuRA4LclJiC8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mNMz39O+ZMEOfKmWGkyQ1cADDZsEHAAizAz0GdccTV/RBiQmnoO2YgfPf37MYH25q
 sQjom76sRq/ZN/jWYByltJJlSIxyUDSsTWS/rtNwyOgxvL14dhbdECv/eDLdk/SyuX
 Bb21MZac9EVfUO6Hehn1FECVy/jvnyDdpx/TpNcjbmrEJPsdnTSGn3d1qKPpQ3q24X
 vBl3Yv6l5Ut4c5us56x6izl5xXu2W5e9vnFc843qtIKIVjgdpANGp7SMojmPKdIoWU
 L5AyqCP3OnDiQjfbOaVmzpuydaIvx8Jh3vb4xO+VzfjB6TAcNVqGU1MEcoMdNgH78e
 FyUXQjKimkNew==
Message-ID: <8ac7a386-049a-ccfa-6cd5-11c53c060229@collabora.com>
Date: Fri, 18 Mar 2022 12:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] dt-bindings: regulator: Add BUCK and LDO document
 for MT6358 and MT6366
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220317030402.24894-1-johnson.wang@mediatek.com>
 <20220317030402.24894-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220317030402.24894-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_043734_954267_C48BB311 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 17/03/22 04:04, Johnson Wang ha scritto:
> Add buck_vcore_sshub and ldo_vsram_others_sshub
> regulators to binding document for MT6358 and MT6366.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   .../bindings/regulator/mt6358-regulator.txt   | 22 ++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
