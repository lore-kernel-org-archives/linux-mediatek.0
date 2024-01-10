Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA6FC4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btH8dOXng9QjAEW/pDRW67sTDxN5+BnZUFCtoJfRHbs=; b=QD1PU44NJOUgkw7UHBse8Bmqpy
	rXHxPCUaYv4BaVc5YMBWsGBHyvmjKqUQVuV4VPsO68O+pOl9DK3d8jOQm3hcTdDLRz3zQvf/GQtZo
	bu9Fxv4LweBD5gM60G3ZXRWwVrhCqu8x7F7wCt/l/ItYMpaIvVWIyfBTP2B40ptxhPWxsyeV+dyNH
	ecMO4Qdgsjdebzcz2gTnotglVAP66LV4ILGXJ5sl6o946akSS2DNVsDlOaM28dYSxmLIOpfQtEkC+
	QKtbeTVbAzaAWlzPB8+p6FrIi3bTBDAshtx/N7uviEBxGpmaJp1kDyntqdS6VXNy4Fpl/G6iP5+qp
	QruV56uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYnE-00C2os-12;
	Wed, 10 Jan 2024 13:38:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYn7-00C2jm-2f;
	Wed, 10 Jan 2024 13:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704893921;
	bh=T7aLOm+cWROBT5elzjFsSPDIlFL6HfnPYUcBRZAqaVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iLnHIaYU+ycJoooY3e9ZNh68IUzl10yaH8AJ4Sqld77b4yDjZSgkVzZN22TvIjNP+
	 u/7K4905q4HRepGOd5nDLcWC/HnTsDVxn7o/iMAACKcpkxHQo8zOi57ISadTYBPZzk
	 sEy4PVk8ZXrXZKLRakNSulPNDYBtr/EImeG1iV/owNidxBdtcKHWftW1H7A3HvCo7N
	 9Hb4j3kHZmaZuJyGS0J3W8xBZTSgdIH/6GDj+lvXnYUgcotxnHd5km/n8djPbrfkr/
	 Ivi/hePrDME0BwdaloRTHf7HyCCyfH3bMjysK2YTbqF1ao3zI/+vEQ2iUl9xNYONrX
	 djD+7/ecvxu7A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4912837813E4;
	Wed, 10 Jan 2024 13:38:40 +0000 (UTC)
Message-ID: <7d8b39bf-5453-4e74-bfee-6f35a504eb37@collabora.com>
Date: Wed, 10 Jan 2024 14:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi
 AX3000T
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240110095118.25598-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240110095118.25598-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_053845_994499_26B688D5 
X-CRM114-Status: UNSURE (   6.40  )
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

Il 10/01/24 10:51, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981B (AKA Filogic 820) is MediaTek's dual-core ARM Cortex-A53 SoC.
> One of market devices using this SoC is Xiaomi AX3000T.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



