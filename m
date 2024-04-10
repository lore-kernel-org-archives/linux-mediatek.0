Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C410CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIBfdhnmtiJDOLH8MoG/fZrJV6en0YN/WbexkYEZZFY=; b=ZKga3OJndERdmy200Nv7BjUY/F
	ynVj/HzLJlKxevKkBzpLbTdoaJtQ5dsKgUIgDOyUSWXNO2yrT2vtn2vofdOza/E3k/5HOvmP6mznw
	6oeI0khaSzDOtYC0vxn3ReHrJxlqTxT3rDJR+eDPvQcbkXUDBYJxsIpKzHRn5+mb/y15DR3UF26m6
	uyZaMwoMHKNZP7oPfJmAneInrtv7MoPj+MpbSjpYdJnYTULSI265xjt5vOVdluDon1IpfKYPsoF8R
	2QwDVVxktR8nbWj9Q8m9Tob/UdQthT84BE5VoHtyiZGzLBonC68N7tvAEUfoHBRlySRd9ZjbId5Iw
	8Sv4H+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucH8-00000008Os5-3zds;
	Wed, 10 Apr 2024 18:02:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucH5-00000008OqX-3tfs;
	Wed, 10 Apr 2024 18:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 048EDCE112C;
	Wed, 10 Apr 2024 18:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A31EC433F1;
	Wed, 10 Apr 2024 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712772137;
	bh=l+8qKYjj+N3M1apcMI6K5gZozIGCeJp8ySXUDsOhuO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr3dzcKxhC80GNydHScB18HbhVS3E+gOBfHmcmNEF2PFEMwoEmXTrDFZgH1yv0BNx
	 1DiPpcK8AYc8iC3iqCHfb/G4fV+BvNqp7Yf3036Vx2kec8rf7MOUG/FozDw4NWTeyE
	 j1h2uvcfIutozomBt13+u6NUtRKbw6X+xtaFvkCeyvcRdkBwd4/5x47dK860T21l34
	 NwGh+uWnr7ubm0fi0vjPqxxEtstjgF9mlHDCeU+8uZCpO6vAdNfR5WCj3bpUqZpgZt
	 fiyqAABVM4xiqivGwnjy4W0LOEb8gbpOwrr3tOSbqQt7/i+wpw3akwiJHSQQTsvyfE
	 fe3feTwH6Sr8A==
Date: Wed, 10 Apr 2024 13:02:15 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mediatek: mt7622: add "antsel"
 function
Message-ID: <171277213295.820159.3023089832430236921.robh@kernel.org>
References: <20240408090506.21596-1-zajec5@gmail.com>
 <20240408090506.21596-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408090506.21596-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_110220_182743_06721477 
X-CRM114-Status: UNSURE (   9.37  )
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


On Mon, 08 Apr 2024 11:05:05 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
> the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
> pins/groups"). Include them in binding.
> 
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml       | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


