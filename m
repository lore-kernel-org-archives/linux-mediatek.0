Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3E8D21279
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIYYnyvx0NHfdSZanxSphX76OXMhVhjF8pE5cbgDEuo=; b=s83EUihK3Maak7cTP5g2tIPVIS
	JiGtT1NmUKobTefENr0qYl7Wzcy7tldQ2ZIxt51BDyQYhMDTnK6L/rMVBmjkjaaEWOUAQZbiKB9NC
	G8gvX6CF96WnqXUjq+x+fHOdBwGzEspTken4jM5iI/UvhOvoKXYdpNtvk89Hnx7w9txsogoYv0WEk
	pgXg4THgHGTRtHQ74DcO04nse72T1iiRBU5dfxIhUjUMx1jbhY/9cJ69zAoHb+qmA/z4pTMxu2+pg
	+M78IaNvei+yOepifv91TNSPpxFW8LPJs4ASxNy6hN/dgfQfZikZKyZWLWqNx/Htz88WLhaJp1rVh
	yM5Tnrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OFG-0000000EZ0h-2XKN;
	Thu, 17 Oct 2024 11:00:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NYb-0000000EUWu-1HwS;
	Thu, 17 Oct 2024 10:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729160194;
	bh=RwqIFfRGEqyQW9D+vcB52y+EorSTxslTKNQrItVQj8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SZv7EJsEYTOyLVOmgPHOkmX/FgACtcDz4NaZtZYGRAjThR7/05LMATp3LlgAkoFn5
	 KDaX5qqWC5o7jP8Su4IXglFwEgCD8gMzue6evaLee2QCty3JudlV2bIDMntsJFzhs7
	 Hmk8FO67Aik9t4tO+Sa+qcIus2mX0/iurdq6CuvO9IJYfIMZqtEjwedVFjnG2mLV7V
	 8BJ9IsKmfqw1jK1QLi6+4mko79ZgNKWqqXi3q5b8r3S7n5w6lc50cVaGCZHgdD9QYa
	 JypAIBjqHInbR3YLCOD/gDkhPy8Uqwv4mo6erep/YhIcYjTSgHzqGNgaUShss3D+fR
	 Wyv+v9tuQXfag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEBF217E137D;
	Thu, 17 Oct 2024 12:16:33 +0200 (CEST)
Message-ID: <d775bf60-f876-475e-8db0-511e87667a19@collabora.com>
Date: Thu, 17 Oct 2024 12:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: power: Add binding for MediaTek
 MT6735 power controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Alexandre Bailon <abailon@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241017085136.68053-1-y.oudjana@protonmail.com>
 <20241017085136.68053-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241017085136.68053-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_031637_537321_35C47F4D 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 17/10/24 10:51, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT binding for MediaTek MT6735 SCPSYS power controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   .../bindings/power/mediatek,power-controller.yaml  |  1 +
>   .../devicetree/bindings/soc/mediatek/scpsys.txt    |  1 +
>   .../power/mediatek,mt6735-power-controller.h       | 14 ++++++++++++++
>   3 files changed, 16 insertions(+)
>   create mode 100644 include/dt-bindings/power/mediatek,mt6735-power-controller.h

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>



