Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD62C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA1ac5uvP0jL3b2/bdbOjZZsTK7eMBU+AUDAOCTSHWg=; b=2eRZHHNmPLYDYZi6EG3ZuRE3Gj
	5mTt1O0M6RRQQpQuYLKWCcKPBjAKibvHhBfXgU5HNgq3WxH7hhM3k+GOjOTwEGGqdbyV6MpGU/c+S
	fLmgXRfHkATn08WWHhtnIIBETozAyFltREUa5p33SdO4YRtf3azybDwLAl9X35LXACuPzjxjh7hbE
	HZXZIvkW2SBDw/Hp8+Y2xfYRxeCKJmRfDwhbqxCTgEWB5ugzWwuLmrZit/I/f31LErDbNQRMIlUOm
	m2soE1A8vyIOQwxDOn6eMQ+mZZI3qkAguQ0WbIf+Jv3ZSo6OOOq3X7upNRROQnqdN4/61pM0edSW4
	ZwCm9JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDQuN-00DnVZ-1m; Mon, 18 Jul 2022 13:35:35 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDQuB-00DnNJ-CS
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 13:35:24 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31dfe25bd49so69774727b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VA1ac5uvP0jL3b2/bdbOjZZsTK7eMBU+AUDAOCTSHWg=;
        b=GtcPSLBiM6uVu28CNcQ+3gFgolNxS+e7LoXMuTaGY+9J3FqlSMN48zcb+YRmQqN+oN
         8yg2vjgbFJKXZ6ARwY73Oev38+VSNgvVRd5/hHVF6BBwkx9yT1SeLXKStgbIr3gPN2Xz
         329Xjx+XXN34JXZ4nUnpv7f81QlqlZ3+duKUtDY5zEeILHRzEah+jGnZ4C/nF1g8KW0X
         8dfv0KtzwpORo7etwbhg7PIM+SQIJumTQmvhkQlv0bsTmDWWdi+8YsFl4ZSf+S8qqMHZ
         AdUiiI+ruf9YNMJSHKhu+wtddFY2l4MTFFuhoop5K9MhCNPKbyPmshgN2KioHUdtM7BC
         rzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VA1ac5uvP0jL3b2/bdbOjZZsTK7eMBU+AUDAOCTSHWg=;
        b=6m3PzFfYnZ0Bjwf6dzTtODtg0b13WfLn0ioBSAQnYO7VR9RzPEy8UEwR+Max7W7uki
         jW6PCKEjWAw3rrhCK+YS6/b7NN9Xzb0gtqkg2wR5kSIC/pzRjYtyMnjoTCV8MDh5o45f
         74Is6sA5v9UuSz3KdbdBAVcNt/VT1xbWQqOxwcdtFIZ9ag0A70aHsFZkBrIQcb6V4AJ2
         E4111OKt1Z7A7b2GGSoeWa8PxwKkF9R3Hpoc/ESzjqy3hDMMUec17LtSLe8OWrO+Jsdj
         A8hyB/7cLw/BX9RLBeNKXAZNynQ5rs7d+0ULW+UGM+Bd2sbN0J3Xfsyr8h1dV3Z/RBdi
         XnAg==
X-Gm-Message-State: AJIora8u+lAUCQKawUYJBl4joz5PTe9z82jv0Ty27J0dCN1J6Gb0FMYs
	r4nyzgzZiiX0dhO8Tx0ncjQOCZM/lBg7iVfdmJBPDw==
X-Google-Smtp-Source: AGRyM1sdYeiYVniKDN529cobMS4DD4f3Xk3cadvZzaf7otckgKV39IsVAGQFnrI/rZGNsEA726QcYYC4tiBj2zgCRpQ=
X-Received: by 2002:a81:548a:0:b0:31c:b7d6:b3ca with SMTP id
 i132-20020a81548a000000b0031cb7d6b3camr30351662ywb.500.1658151320156; Mon, 18
 Jul 2022 06:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jul 2022 15:35:07 +0200
Message-ID: <CACRpkdYagmVAim68q=AOzrQfPw=fk5Q1z+B7X3nRDa-X4XukOw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use drive-strength-microamp
 in examples
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, nfraprado@collabora.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_063523_819734_C01ECF50 
X-CRM114-Status: UNSURE (   7.58  )
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

On Fri, Jul 15, 2022 at 12:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> The property mediatek,drive-strength-adv was deprecated: change the
> example for i2c0-pins to use drive-strength-microamp.
>
> Fixes: b6d9af2c6b69 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

After finding this in my Inbox, drop my own uglyfix and apply this instead.

Yours,
Linus Walleij

