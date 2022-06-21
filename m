Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DFH+0Ia93BdzZB+WHLJE3vf6P3R7M1IbAKARp70spQ=; b=TQLZHkDBP98RodKXikKt/TBs1L
	Vj9u0cLB0yAZRn5rud/gbSItFs6shdGxbInq4NITC20XgWmReXiyG11KP0a7IK/eMDWOwxD6wtOq1
	3Wn1HCNmxF1kNfB9CVTncSvKPy/lpidDoneNr3UzOy1Y/httOqY+6oogA/XGmNd0xm19xUTjTZno9
	S+VYjsi1Sagd+uwbmYrNWtgz9i8MrCKduoQmX7FHpKtYybJhQSlHBOAt/6MAKEMIHxkGfxGlse23a
	l6mFcS66eiH4/AGeRbGQ0UFl3I81x3PQAdcs6v0gd4Vu0a6Ox2yUzYysHvgjhemfmloG/FuQ18tCX
	Jss9jSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cku-005FUE-Jj; Tue, 21 Jun 2022 12:13:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjY-005Ehf-FW; Tue, 21 Jun 2022 12:11:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6EAB166017A0;
	Tue, 21 Jun 2022 13:11:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655813511;
	bh=3DNZncrYFTRRbUO04o6Ge6N5kK8kJIUMsdhLMMKQi+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lafu2kFH4eYbRD042lfKr6WjPY9d7n5gsArkZVhHroikIBxBjeglJNt3unTNUTWDd
	 ocncTNUaP7weV5RCq7rWmSBlOw9uSw7Sdz8PHpsnfgUJMSPZPNfZtoCwV7ttbCAMQv
	 R3lVliXvnCZvdStXdTxpVS5cuBZYbHAFOE2GITuwOwMfWDsjIgnNC+5KQxER1vWKDm
	 nn9j1+K7Qc+sG4KyKy1fu4go62OMLWEbL7kH/Eybs5ZK57J5i5UwOj/K57OlRS7Hwg
	 +gIVxd7ZQPzcOx+Icd6RC9e4uEua/Z6+f7WJHG+48AtPmK96Nj6CsQ/X++ikufnylO
	 OfL/AfdBi4XQA==
Message-ID: <f590a525-2ae8-ef78-6c47-dce91e4e7f7e@collabora.com>
Date: Tue, 21 Jun 2022 14:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 02/14] drm/mediatek: dpi: Add kernel document for
 struct mtk_dpi_conf
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_051152_716303_6F7F0462 
X-CRM114-Status: UNSURE (   7.80  )
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

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> This driver will support dp_intf and there are many configs between dpi
> and dp_intf. Therefore, we will add many configs in "struct mtk_dpi_conf".
> To let this structure more readable, we add this kernel doc.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


