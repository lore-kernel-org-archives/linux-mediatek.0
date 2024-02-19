Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB33AC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mDYD0njpFyUJHu2wiRCrNmp2YUP7j7aXwEcsDEsQ/c=; b=RgFi1TTlxJSzLVuWPA0x9IBosx
	gzn49K5lCGtO1R0QT1Cx+oV75zCp9T0yFqJ3SoPEoSy2JJmxqnDLLSl4ZwplNzlkUQyhxUbzeUhR8
	PED2CJ4aXqQOHGsWDChXRjMc9CGHDa64PvdIoe6w8f+3TxLs4U+gG/GKw+RrcRfwFf9ra3U18a2jM
	+UiDM62NXo/PizwIOWa+aVc/vuXGf0Rd7WShJheihqW1D8GLA5uMyYzQElBeW7wefq/zSPBCw7HXc
	bHOTfOOpopEl5EtYEQicBD9pgFF2bSLUGWFSOCGN1ZtM7z5qNkvYMDVs5aX8YBaJpKGhw4+GD0JCD
	n0PqAb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0ae-00000009yD9-20cP;
	Mon, 19 Feb 2024 10:09:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0aa-00000009yAI-2IHw;
	Mon, 19 Feb 2024 10:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708337371;
	bh=ZzvLHqzbOzNqgDJELQJkkjJLEqLzCR/eZD/cAnNXkH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r6c/Z9IP1/y6EccSA3Cxc1flHaLxKndVJnkO75I1X/sbu1OjORcs0/81F88zlEdAR
	 uRFANdb7fNU3mruOeEnktSB8zXZnr3LWjPggn/r/dYc+E76lTZ9r1x3Qw/MjK7pg51
	 jN+j5N0ndQ2EopJJyeOqO177V7WXfMuHs6Bxgl9wr0anFrtSgVnFkrkErSRgxPMX+x
	 ECaO04ddI0GctmreaQvTrrz5f7cSZIjBBfOGzeVFZDKkJ29j5eeZUqJJ+/vfal4frA
	 v56/CjTyqXXDhi1yp85FWZTC9RmU6Kr5VihvsUui2Rq0SWoue82qn3PHjByHAfs2nk
	 K6Tfrmqxdq48g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 402D13781FD9;
	Mon, 19 Feb 2024 10:09:30 +0000 (UTC)
Message-ID: <3d98486e-f0cd-4930-8e97-4a09f1ad0aa2@collabora.com>
Date: Mon, 19 Feb 2024 11:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: ata: convert MediaTek controller to the
 json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213074747.26151-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213074747.26151-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_020932_789201_DAA0E9A7 
X-CRM114-Status: UNSURE (   5.52  )
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

Il 13/02/24 08:47, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



