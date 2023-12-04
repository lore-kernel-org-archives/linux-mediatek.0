Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3379C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QczNSGHzACboVoytNWg5tCZtdRCkmmKm+xSfMrXmmDE=; b=Omn8yWqAa4DUua78HM1cr7ql+O
	FM0caSzWrNNtVNY4DE2PnUVsprpGCTHYL1kvWssVYPW3yinB6wuUAP2lv98MyFOo8YB71Ahyc44un
	HpivGU9oLGxT0KezRbo1oE+W+6A4pUull7zG4t5mTSYlzAOZY2hGTCwpQnjK1sPH8OXj0anRhWzw5
	6O0krpCK4F2eSDmc2AJ+/S/A8UpoBBDt/qlQ7YlkSboqp8vCr8KVLax5O2WUZiu3a/RypZNrcOhIS
	XdNT9K94t+bBJW81k5m3dXjeF5M++uUYMbJ31sift0EUrnfz64lwvE9+qLiNVrWvnaBEmEhEKU7gN
	voR/Y7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vc-004leo-1q;
	Mon, 04 Dec 2023 14:28:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vT-004lV9-01;
	Mon, 04 Dec 2023 14:28:00 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 18DD5660715D;
	Mon,  4 Dec 2023 14:27:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700077;
	bh=9P+rE/4yWgZyXVvt5DhwufQMuHM9oRtBwguFmMMLv6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XF6HkePqNHg5LpD6fa6rIu54nZAvfDGtCbFHqoXXEBTLXXCwX3hlSnty5GzulDZRk
	 Na31c+BbIzRWdCdMt51og6GmLEjbSZGfhYP6Vb57rcMCUb8yqTfq2RgmrlgmA+wuWI
	 WmPqljZuGxlLUZ2CF7AZTfqvs9R+1ZLGRAohez6++k1h+ygCVBpAVwPnCFBDDE1L4a
	 DlOY1bRf/f0L/xh7XhCT25A1ZbU0b/nbhW+2bVU0DcAIhZ430FsUl82XoM0O84tLaV
	 uPsRQehEBXDM9xSFm5KyV/67kq2zEzIST5ePhkSuXPvcrXuWKCjAowlbVMfNL8ojRN
	 H+iNQ88c6d+QQ==
Message-ID: <a05e75ec-a175-4662-9612-b88cf6529a75@collabora.com>
Date: Mon, 4 Dec 2023 15:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix
 Chromebook
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062759_193248_E248A096 
X-CRM114-Status: UNSURE (   6.00  )
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

Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> Add an entry for the MT8186 based Steelix Chromebook, also known as the
> Lenovo 300e Yoga Chromebook Gen 4.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



