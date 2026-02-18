Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E03DE9A047
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Feb 2026 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jKuAPYZ/JZGvQmdHEX4tiWa9hyrjfj4BEDrLa5wlwU=; b=q+oQIl8IeU1cXZiinFOxpykHgj
	wu2dF2enbl5Ilrwk+Tw+9wDoasUFjvlm5AXKFKv13mDOodwD2B+KtUC2E0JO7a7eSH7xUQ+ZsVLrm
	JYi+52sFQapItumQnO1tgsj1Em+LkGCjqn6LadiG/Ke+6KBIPjH/dm5bG9h4bDWkr8EM32q/2GWIK
	EYoegtUbpMIMDjmK0myXjvaYBu3+CfkUGxqsQF3j4ynMHiEJrYt12pvjOUuzbXxztwSEx+yGJZtuz
	yvfWwfxmZ2iosXmoHCauc0ZuUSkLsjeD8ku3D4wi3G5X9aZPM+THbxHgOcFnbi4bU2O2vYtx36nnn
	WWP4qiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseeE-00000009css-0lgw;
	Wed, 18 Feb 2026 10:19:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseeB-00000009crK-30D8;
	Wed, 18 Feb 2026 10:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771409945;
	bh=2coN9jW71FYXIRiPrOpZ5PPRf8y8jTjKFd2PO6U15is=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ELYwlYbwvYuEeyCRJa6Cbo1oxczDp7T7m7cu48avxC3nno4XuXzlL1dIfeB7uCYFh
	 al0JsyEa3GpaPicOo1u9zyqWHHlDeUmZn3GmEcTvUghobbbT2c5jp6SfxY7rQ38KKr
	 dYvyhx/Mu68AFRovpLWUZh3Owy0BkgsVezHtG273HRjYIuGSm6DCys9aaRv3MtRmdT
	 Lmpz77dt7aFU5GUnl0SoxFJlJh0XOS4hQk0LJIAGCukjNB2XLKcddLPwo14tKsOakF
	 mqd+rtvgNyZDJYDb/CKLWyssHnP0Nd5FQ+ym5Ne2DMurYtBEpmLImLf16Uiezen5bi
	 X8tbH5LNvMh9w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B719E17E13CB;
	Wed, 18 Feb 2026 11:19:04 +0100 (CET)
Message-ID: <d08b312d-0b40-48c0-ac4f-47fa9924f629@collabora.com>
Date: Wed, 18 Feb 2026 11:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add mmc aliases for Mediatek Genio boards
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_021907_905425_1D362E45 
X-CRM114-Status: UNSURE (   8.38  )
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

Il 18/02/26 10:23, Louis-Alexis Eyraud ha scritto:
> This series adds mmc for the Mediatek Genio boards mmc aliases in the
> board devicetrees that do not have them, so that mmc host controllers
> get enumerated in a consistent order.
> 
> This series is based on linux-next next-20260217 tag.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



