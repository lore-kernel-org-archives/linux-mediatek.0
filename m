Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E00C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcWG0xmL3sU+8FjI+E3Xlw9Uvf05qiK9rXIAjdt5Vqw=; b=zyEmy2087g35rz8wgqXOENOfku
	P6CgCDUXqkUA0E5hg+eXwb9kTP3CPmEy4uRegjJTvD+MC3gQu6cEGI7t+assyEHxnZKXvcNScK8o9
	BACIqPXOKwaWwPfE+vnqDTBXidPbSAzzshPxyUzu4F/Lg2ZXYsTGfGoGg3/f4sJ1ZJdDsGEp6IDPu
	aQO7WqR6g6piLGBIcVm4ZcgHbQy0HU7LMYIRrgA4L3JlPt7pLq6qDHUfzrrwTc1iYlAKeQI8EV3lz
	IpKdrK8JcVue0vZV6hvHVGu4ZPGJrQT9OQfsBJDUUKanjBR3AP58w0ztIIx7pmP4lS6WD97Ehn1vo
	6KD7Yv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9Rb-007eR2-4Y; Thu, 24 Nov 2022 10:26:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9RJ-007eGo-MB; Thu, 24 Nov 2022 10:26:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D8B76602B19;
	Thu, 24 Nov 2022 10:26:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669285600;
	bh=PChGdOWAoNKksgA8NZOc4zxK48bZvzgVM9A/WgO63hk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m50AbPXuJ29d0RegtXzvcO+KHByBGglehrVS3d3Q9bQmWIU2LIg+mU01nnmNTfycn
	 wxAOvjuMo9nRDkZtCmHd70nsQu8mKVqoYw1EBGT9Xc60F754tQNj8ocXpQ+lIbxrep
	 0fkgLDhTbxRpxHlS1GERfUJfjjgcOWXPOrjmzdx/9Pqm8f5+vOjODOpJqgq71/Yu9l
	 XVV2iDLzwPhggvn9hbZlx0JoUCAa7VDImXniHl3+Y6EHu8rTIHovX92i9ZSuw24VPa
	 UqxV/8gdZH6vlIsPl60p7R2uWA5JYSdsTQVCwkR2bjpwhItc4oUbTDGWDWXllTDCzY
	 QEgLom6SAXaVA==
Message-ID: <7e864137-1427-f66d-8ea2-a54bff358903@collabora.com>
Date: Thu, 24 Nov 2022 11:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] dt-bindings: gce: add gce header file for mt8188
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221124075516.1669-1-Elvis.Wang@mediatek.com>
 <20221124075516.1669-2-Elvis.Wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221124075516.1669-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_022641_926058_831D4166 
X-CRM114-Status: UNSURE (   8.18  )
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

Il 24/11/22 08:55, Elvis.Wang ha scritto:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> add gce header file to define the gce thread priority, gce subsys id,
> event and constant for mt8188.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



