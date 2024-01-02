Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70834C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqL7q26P9IiF+NjyZdizoHlpz2acdbbh+vgf9IrqO5E=; b=vVb3YDow2K3gBGMFS99E7XKR/R
	5xkPlrMWnImeerMNw73uJMZMhdnvM83cScEkkzXMcd6FqLlgLgqk403K3pDCf601ebAqViUYg9dvH
	B3pDhlIbJei0DED8mN+sYKUROeL5/OYwtBpZLWN2OEFxH2nk7/TXpcTbgHP9m4bG9SHMGDE9tmRvO
	VQoRP5wiGmumnHFgvm2aMk6TSdgA8vyV9gIg+Zg1gw9iEQpK/BaUTvM3GaUbWYkoQKU73oTwQBfWW
	fkZdUbXIWdK68K9izPRyLRw1Oki8Jqh7EkZSi01aTfdROjSdwPQtSjhM1NFGgKTVkR6BUSEYiB+Ks
	QXOGuqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKb7r-007TB7-1t;
	Tue, 02 Jan 2024 09:31:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKb7n-007TAC-36;
	Tue, 02 Jan 2024 09:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704187910;
	bh=GS1ilAjGtQe9kYt0ZI0ljTUErP/Rc2UM30xX6zpBUl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hC5jvCVas/Ki5j2R6EMxqy8XF1AZwdw0WBI++dRQdLK8BF7Czcj+1Mk/pg2Q5D0V9
	 3aRpZnVS/OU9GI2ZFp6vGxtsykLR7XHYgG9ap6SRWHOhD9Mos/KDykGIZ5y9GAtaka
	 syEVvz0ceeDCbtkfyAfbRumHjHIfklYBmzWxKf7Y6n7U3g8Zs6znpMdKmnLfMK6Z0O
	 ZlxeH7ysuRCuY2rU45gJm21/abxJCWBxqv2TFxVBSRi+uvopFMpOm86kR99IXURS9X
	 d6Igr+QeM6FYjxbm30Kf4s4FHJ3YwmxFisRHKB1PQPHUkVY48A/bYgOgWbyT74vYG5
	 u245MsWFF5YDA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8122737813DB;
	Tue,  2 Jan 2024 09:31:49 +0000 (UTC)
Message-ID: <db7b4cb4-7302-47c0-9712-0d746347c6a9@collabora.com>
Date: Tue, 2 Jan 2024 10:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: mtk-xhci: add a property for
 Gen1 isoc-in transfer issue
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
References: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_013152_133189_FCBB3DAD 
X-CRM114-Status: UNSURE (   9.73  )
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

Il 27/12/23 07:03, Chunfeng Yun ha scritto:
> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
> still send out unexpected ACK after receiving a short packet in burst
> transfer, this will cause an exception on connected device, specially for
> a 4k camera.
> Add a quirk property "rx-fifo-depth" to work around this hardware issue,
> prefer to use 3k bytes;
> The side-effect is that may cause performance drop about 10%, including
> bulk transfer.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



