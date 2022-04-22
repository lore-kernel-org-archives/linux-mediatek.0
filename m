Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3426C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PrmfmyV/h+qyDkKT6+MGvp8w3gHFUgCBXJdP87Fun8=; b=4c37+kFMROp40c
	G1C0Fg6fuiOQi8xyRqDFLlLwfeUWj+ZNspvwJPMKnyuse2gzBlzTZYMEzk6O9SSiQXVdNw6118nBe
	R7k3ypbkVYSisDqTchtbmkWMiqZzY7P/en2VdtBfbvOWih1qyo1OzGp/XLtg6ZNsS4TYgsYYNcABb
	n83ctyYW3FSThuAx3gHt9iS619hq3ott9jCrDoXnm4gUg6Uph+5DXkThfmeJHKNBspw7Gss2YIkZK
	23lDTuNRp0JaUox/lfRLtbQKHLQIghMTxCbHP5uIMsW+BqYEATzC98nQiUCeGZiD8KAUyuCWcXWbl
	pUYETcut3DTGlaj0fj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoPi-00H9uj-0g; Fri, 22 Apr 2022 08:13:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoIJ-00H6Xa-Ps; Fri, 22 Apr 2022 08:05:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CE16F1F463D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650614731;
 bh=sHB37B0oMJ/C17KoCmMigrMeNcB1ACVW2i8oQKoWjj4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H/GeFT34AQfYdzuEjWZd8uXuy1NfJ+KDwaxSjx8lRTiajFcmyy1FxDu1PBuZoRwwF
 XKpihwqRG2aYlv31Gbie6PyJu7oXGoPoYP0jRu4ayYRdiv5bmPX1EFLuyykARgVzx7
 S3Pp19UgbNQtEkKkL7PojrqFruuBCfhxvr8jev0olV/Z1GOb1bRPbVhknsscDQCOwt
 euPfJIsomTkLng1en9VmO5gVy9VaC5OKhwME3QSj6psNLU+oxUA4xMx0Axb6dn0I3T
 jvWhh4G+atYgBTRo95BsY/00VN0wXv3Hl5iK8eZ0anzP6e07MMkPLJpIIKoq6tvT+y
 plp5uidDJEP9A==
Message-ID: <b77612aa-8dfa-a8fb-722f-79d21ddffe30@collabora.com>
Date: Fri, 22 Apr 2022 10:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wei-Shun Chang <weishunc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220422041125.12732-1-jianjun.wang@mediatek.com>
 <20220422041125.12732-2-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422041125.12732-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_010536_095076_932BC2D5 
X-CRM114-Status: UNSURE (   6.06  )
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

Il 22/04/22 06:11, Jianjun Wang ha scritto:
> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
