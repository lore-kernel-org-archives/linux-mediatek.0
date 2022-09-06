Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CF4ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZG8g4NtkGO2RoNIpNlY+NS+2Ui7FU6Q25k2j8upy7Xg=; b=UyBUNJh3dfofEGRvft4moseigV
	s6mbaXjkV+rJX2n7KlQRntDsS6edLahbgAfE8CiRL6Dp4cKKAbNsf9UsMDNWfnGv9n8CWZDr3Ytun
	J/N7hFZOCVkIeh+KiMDnSTklMmIdqLvH8FL5colsRZQblF0fmJ9ZEKZ+wlnGhAOaipj2zkzLQ7eW0
	uSlwbmq9GYn3JTFNNX/2apiPYxJsk9z9kXPAImqarqiVCJCNq0bV1Pn1dhoUa0nq5/mzIQ1mStwiO
	5l70Bw6NYyqI4TH4pTfUoLpLZqEJReyt0Mq+xM8hhXRL20F3UAKl11hG8rsd5sC5JMHOlimLcMVLu
	zsklADpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV3i-00BxaR-WC; Tue, 06 Sep 2022 09:39:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV37-00Bx7X-0G; Tue, 06 Sep 2022 09:39:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D6D46601E73;
	Tue,  6 Sep 2022 10:39:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662457155;
	bh=ui8VF8R/cVhCiPreQKiPi3N7NXDpyZgztN0vQRp128g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XVreqPK/QS8zqvw/2JHogzhejNyfQZv7Tls1enApGHem93HeNMYG4fmqNGUwPWNto
	 /jBn90HGzyrVHnC/YeGTHpSCQxiO8K0NhD9Vvsh5UtBP/QcJpAwhMkyeJsCEXMbIer
	 RJnHP+S1AE3VBq7rPU5JU/ZYEa+GjGymbII7QuqPy/6EwvmfcIPih0zg5LweRu1Nj4
	 tQKj1JW8tMbqdmKDzWlLSm7etTLtLvzagjEoT+M5Rg/KZGUuCm5oSwZMK9p3iatGgz
	 oRialr1Ni7okRrbmKl+n4zrjxVUm72LsiEJn0znEXxctCrahodr/ivokaFEPfKqmzq
	 beeqIojVm/jwQ==
Message-ID: <82bb73ac-9b7e-92c0-9630-2c62b069d298@collabora.com>
Date: Tue, 6 Sep 2022 11:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com,
 lancelot.wu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-3-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220906084449.20124-3-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_023917_234090_C58314AE 
X-CRM114-Status: UNSURE (   7.68  )
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

Il 06/09/22 10:44, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


