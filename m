Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81907E810DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOGy0QaEIXprRvCjQA5OEF1KBK+vLSQf4WRPYydQ85k=; b=cKWyfz0zj0h84agRtzySYvd/6f
	+DVsETmtcKDysK8x1R+hJV0G2cxrgl6WHsp3Rq8L1DUVm8pFkhraTCh5eVxG5tRrFzTJB6wXUE6hq
	yBKcR2/DLhOiPJt5S0WqYnvWhM9q2S7UoQqnvZEmyFMBYIeBvpzH6TlSWzQnDCoDIeVtkizSEjzMf
	QCLoCpI7VZ60f6UMo7PnUYJcYOX5mYsNHWHd37auuf66s5G0uLhpoCeHTNK+JLeo2jxrdrx7QJGrB
	g9Q/s/evxRj8RaNmDe42leHFwaHjTBAeUMliMCAQQwkjj1sdCEKBJ02vfMYLKPpCwallG2dlnNcFj
	OY03NLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlTbd-000swY-1W;
	Wed, 27 Sep 2023 12:25:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlTba-000sul-0L;
	Wed, 27 Sep 2023 12:25:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5300F66072FA;
	Wed, 27 Sep 2023 13:25:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695817521;
	bh=3alifQHOTZ/qI3YlbbyRGBc8mUVf2wmTb8Mv6zKX9iE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NsL9hOLGKdjWajaVH114o3upsbIWtWm501MGIDavSoMA8kIqQY0P/Eg5hMDVVOzam
	 pvTVpGsCUixwpI9DoNUYSc1VKVTaomnKLK3CZyAE4d/3lXWMbWH5WqkAx4h+f5tEnb
	 N39+Kq+8vIdrRcWzKEQCve7I+OVqV6hiPCQ/aobAknzTFHAP7KBATAaSCn4dwnIkWV
	 ad0bQ/CL8JQ49NAKC5AVM8+iK73VRMWwU/d8XWs+Ntt4y4TwZdz/LAIxAZumKkycXK
	 0oA2urvSmpC+y952k+NICWuj78L6Dcm6Fdrwd8AQbMudGyqW4uS5xEnpo8eCU4FOFO
	 v9W87iOUA6gcA==
Message-ID: <78e2b144-5267-158e-db82-8ba1a5a0e1fd@collabora.com>
Date: Wed, 27 Sep 2023 14:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing
 additionalProperties on child node schemas
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230926164513.101958-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230926164513.101958-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_052526_299312_E48963CD 
X-CRM114-Status: UNSURE (   8.57  )
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

Il 26/09/23 18:45, Rob Herring ha scritto:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



