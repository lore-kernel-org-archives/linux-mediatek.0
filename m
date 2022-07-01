Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A39C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66bDPZcZybYREMITxoyRkvkSt9VS2+M+h6Eu4DFbiBI=; b=S6hQY8VEa3wwt+vHN0vFsN7Das
	ZhQ8ItcdaZr5doNDttP+FgESgfifxwe5TViiAAXZDa21krEonzoyJYua32xE7efl2ZN+4PpuH7kSt
	ylBWwRi2furLXwGzoLWwisOxeysqbPAwwtWEmg80BIrhbrk64CM44JKH9yzRAEGW4WBOIo3Bsxv67
	nXTZFx8UqczZvrzuOjEPgwXzJZwJpjQjfZeJACjGAl7XdTASo6nLc3NWLB3tm6xAVHHi06pAbp2NI
	C8ii9xfkPWqm3+FaPviGQ4LiXOwWMNkWOq5g3y893nU8KfHZDoRIsyDCFGD+uGPUbMTDIqf1jm/7G
	eacNxT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BxX-003dOy-Vz; Fri, 01 Jul 2022 08:25:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BxG-003dHu-Ie; Fri, 01 Jul 2022 08:24:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E6AC66601974;
	Fri,  1 Jul 2022 09:24:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656663885;
	bh=6VbdfSOOs3Mk31GnoM4flK6rivXwW2rx7zZhOL2M5uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mYFw5+jeerPUkzUWglYj+XMjkDIMdGTB6AeVXME2HCO7fsc2gX3Ece34moLO8e2la
	 b2A7aelCOsmvOQZ60qGa5LMnK+LSwPdbm17RzOE5f+9tp44JSrUkXv89n7Y4oHFehA
	 9lhXRhDnDJB0AcvhDJUloxfrrNo4JjRBbn1ccpHXU60sG2h2NQPVHSqhdqwQFSAaDb
	 mnon/U++cZloCHMuYbRrnyYgsasVnFie+kgNKgV3/pSwWQ0p8a3ljeJXbo0Co4IIf1
	 flbgLkTb5B/Skq6rh4ENMfCNDsBbrg9/H+AwfYsd82jv8irpKCDymb6PBQriLJU6G+
	 TvSwAP4NuNdLw==
Message-ID: <250cd177-fbbf-343c-80c1-d9278c01410a@collabora.com>
Date: Fri, 1 Jul 2022 10:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 10/10] drm/mediatek: fix no audio when resolution
 change
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-11-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701062808.18596-11-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_012446_782199_6765550F 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> When switching resolutions, config the audio setting with the
> previous audio parameters.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Change the title to:
drm/mediatek: Use cached audio config when changing resolution

...and a more suitable description would be:

Use the cached audio configuration during a resolution switch
to avoid loss of sound.

(perhaps also explain why we're losing it and why using cached
data is necessary).

After which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

