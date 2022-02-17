Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkqx2343BQw4zeZpsRYv1bQ4rqgIRJOF035zYDNPsPA=; b=HiQfIsXdLoRdzI
	iEtUjiUC306sdBwBu3WdHCUOm9xREfMSQQUgGy8jOF7Rg4p8SkGbTnk8G+CeuDVHJkjch+Czt0jUt
	cZPpUVFWKXkz+mFHlNnk4X4JCjaRvQm6TW3vRXLNQhzFYuAGCx1dXVFOLFzXE1K/5Xqxa/mOvlK6h
	W0C8gjUj4c+VW9vCsz7WeKR6EhU5VWevmbuMk+M+KlpQjtob4RQwrb2m9kcre5rzcQ36gCXHAXueR
	zvK4D9dyNfa0TyfOUpSKQpVGxiEYsYPNHIRWKCWDJ7TxqjCnLAt5xxg21NdHjfa1xj58i94OgTKBG
	LEi4veNQTeY6s2B3JYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdIm-009kaj-Ia; Thu, 17 Feb 2022 09:42:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdIK-009kM8-Ex; Thu, 17 Feb 2022 09:41:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D02991F45872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645090907;
 bh=2au26a2pUUKO9XqAr3U0rSJiLwbbAivsU5W+9bDSiT0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VMCg3wVBo5/cDjYCSAZaXU+iTi1rSSmSg0GY+5dmWH/sPjr7oHhFBuwVl8PwCGvra
 hZTn0pQzhKE1qe9AsqDiHXfS7TVv6eL9RM2UAMUIdyTjH8uCgsv98EHcCIhLWGhK9C
 4ybY4grpadFXTBsLr8p7EVNHtISarntW8d+dtEwejEmt8mShJv7rlGXkaO563J/DFc
 YCZ5+dJDp2nkREk1upnv5ZKIxbEcshWZfvxzBjkySJZ5SMzNxG9jvZ6L6ugHzkscNw
 u8V8SXn9pb2eOclaBeP/MKK4MvS+7DHa/LJDhN5X3ubQLQKQOCPgx8cbMjpjCd5cQO
 Nf/iRt2HZgDLQ==
Message-ID: <f510614b-8e64-52cb-7f7d-5cc07de7d5a6@collabora.com>
Date: Thu, 17 Feb 2022 10:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v6 1/3] dt-bindings: mediatek: convert mtk jpeg decoder/encoder
 to yaml
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yong.wu@mediatek.com
References: <20211206130425.184420-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20211206130425.184420-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_014148_717148_17E96FAD 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 06/12/21 14:04, Hsin-Yi Wang ha scritto:
> Convert mediatek jpeg decoder and encoder bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v5->v6: no change, rebase to latest linux-next
> ---
>   .../bindings/media/mediatek-jpeg-decoder.txt  | 38 --------
>   .../bindings/media/mediatek-jpeg-decoder.yaml | 89 +++++++++++++++++++
>   .../bindings/media/mediatek-jpeg-encoder.txt  | 35 --------
>   .../bindings/media/mediatek-jpeg-encoder.yaml | 80 +++++++++++++++++
>   4 files changed, 169 insertions(+), 73 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
