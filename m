Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05E4ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRzw21CaGseMO2DlCabHmVy0w0tvTchCezYsyHvkMq8=; b=h8gLQoldHOzbJlsuQZtsH/wF6q
	lVA89I2OOS9K1xdJy/wCcMMPG3XoSyb6We7P+Lspiu2f01TpG51Cn2cH9AkYAvT3J4Ual172vfjM0
	VD+tKbQirTrO0HtCW8KV3aDxOyrlZ+ns81578doYHlJsG+8h/GBCv0FEqNtS60cn4kjZNgjCOERV9
	5vV0rtKgHqm7RVOnMYc0uSS8NxLQjovkvszzPR1EKS2ly10wxYaKeuaLxBjstZrXTqhhzhtay8dX+
	licuHymkaUKKOpXK++B8L8RiaibWuKVG8fh3I+izNYEllkAeWqEh17zCU859chy9OGN+iD19T72kL
	hZMF4BuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNN7-00CraS-IT; Wed, 14 Sep 2022 08:03:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNMj-00CpwA-0R; Wed, 14 Sep 2022 08:03:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 32B096601FF1;
	Wed, 14 Sep 2022 09:03:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663142603;
	bh=TITOuthHNLGkMHxvtBcpAKptZhyxFjhWVWDdbx8f6zM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VEJzKu+ubtFGsd5IhUiXO7bzvBSuGuepfJ4V0OMjc5+D9yiuNk6wNVa7IggUl3+oo
	 gB2QLf+t4rk0uzjX+EsbOXQ4y+4LT6bgoHG9pD0B6U3cA/CZyTiT8msaXkEQX1MOhY
	 GRDDlUahzVA8IjMyIfJ7A9bfsC3Is9ABewpB2H+N5YUb3wdrfhxErNGcMnOnYSkZAM
	 JksNOSdBPHDJCBowo/wejdGYw4hUiUsQmoVhXVNNRzU2PKmO8JmwqEbFP9EMjv8kNB
	 iKGr5iaGD0Xj21Xe7dSqmjkbmEBEOET4caFSxlAUwnwvetRWqL8fUd32Frf+JgCQh+
	 Ox5rVlzYWCYXw==
Message-ID: <69b50512-4958-8233-cd6d-4850bd5c5fcf@collabora.com>
Date: Wed, 14 Sep 2022 10:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] Input: mtk-pmic-keys - Add support for MT6331 PMIC
 keys
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220913123941.385349-1-angelogioacchino.delregno@collabora.com>
 <YyC1zRlf+AUSFKnv@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YyC1zRlf+AUSFKnv@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_010325_235638_DD0AF901 
X-CRM114-Status: GOOD (  12.00  )
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

Il 13/09/22 18:54, Dmitry Torokhov ha scritto:
> On Tue, Sep 13, 2022 at 02:39:41PM +0200, AngeloGioacchino Del Regno wrote:
>> Add support for PMIC Keys of the MT6331 PMIC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> Applied, thank you. But we also need to add the compatible to the list
> in Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
> 
> Thanks.
> 

Right. Sending a commit for that asap.

Thank you!
Angelo

