Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39E8EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zceX5T5JfbPcdubGbgLcb+VM0WYFwyuL1l9jSJDfc44=; b=l1HUOWll3SSovaTMHy8Wt1hwZv
	U7CkBcvERs+mjlvb7vxgvJLEQc0XwqZ7qVg/uRxl+co6atP3nvYVziDXxp09WPN5/DrlEu4KLLP5P
	apdTHGGjD2kZmlrDDjxuwsVUr2u/5k3jPFH1ZXQNWgW2oYsISYX2g6hflwRhWdjGBDpC54BkXbV2J
	BuYijeyAfNNfMcmIhtQHQD1UWhlzF2Q3RMUf88WSLNwn4RfRMBCSDKjbpjflwowa/mecxZ20ECRb9
	O08j6EKiejNVGf2Tw/9Fty/Wy5M+1AfWx1j+pXz2MQIJWYPD4An4hK1gufgYzju9DH3DUWZGIjtHB
	im+1YELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIzt-003MQD-1v;
	Mon, 17 Jul 2023 07:50:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIzq-003MPN-2H;
	Mon, 17 Jul 2023 07:50:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 962586603203;
	Mon, 17 Jul 2023 08:50:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689580217;
	bh=0YNi/N9joc9dy/ImQjHQQ6avz1iVC6jHegx/zkubv0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cyf+LcE6c2dEJceUa0ySl9PdhqtfoVygeYrD0zAjeNwPTnE+vHJ/fG/fV7Wmho0UU
	 WnCNWApVhovuQ4aSoew4LtRWJtO3h/FK09+7fCPJITxetNVqyd45wtlJenlDOM0mPW
	 eFM5j00M/0lGZA7r14J1xsKuaFoR6iknDrKgNJOPrv9qIlBSk1/dHwPpILJ66id+5m
	 /fkJEQ6xNL5gJlcRgyoSoRX9ANwi3hpLVstQ5x1eQvISSV2lR/iZBMT33sSkAPJcrE
	 j6Qz3QzQ3hpEdPB7DAe+kvrObR6IT+ZZIC8iCUpybYodgibHUJcNwBDCvJrPeCt6FS
	 awkMxR/nPdY6A==
Message-ID: <c91e9ae8-53ef-c686-2606-494fc08caaa2@collabora.com>
Date: Mon, 17 Jul 2023 09:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] soc: mediatek: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230714175136.4067557-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230714175136.4067557-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_005018_870226_9F9AA4F2 
X-CRM114-Status: UNSURE (   9.43  )
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

Il 14/07/23 19:51, Rob Herring ha scritto:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


