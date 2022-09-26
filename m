Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E76C04A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=; b=QpI4rIku+WrV89Kb5ZNVyLcs3Z
	lBNAvPgJQco9CZTajIb5RXuXaxHhMoUpISSTe2lqdLFQpA21J640m/N8tHHmBhRE4JnSFcDzcnXPc
	WrXPOyvaSlEGXWu3v3jsverIjgzeI6q5qt87UgYFXd256RGZt3O5szIgBZ8lQp9rjc8NSHbI1cOgG
	1XForshFIGRkYo+CG/ttJw/hYJTJvFYccKqB+x5ZmgUsLlg0baO/cl6h3vixI8JO7EUmJiYM2h9p1
	zlsfG2fL/nbuyohNvSA2PALiKaUEKAH/1mAnnT+e2U4SoyLnYBPv74acowrxLEbt0/zVONHXuu4hd
	oPNLWRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceNl-001FsK-Fd; Mon, 26 Sep 2022 03:02:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceNa-001Foe-Qn
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 03:02:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a26so11284550ejc.4
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=;
        b=fMDjGMFeZ+MEZfjBLeXyZXO+5QURbDxXo1FUsSS2j688UXbghiFGIb5sDWVtiLfaTu
         HifASisiYD84FYcN4xahhmp+HSp/Fjyzm68aXl8cTDtA67mLClwfSSukEs6aYvvKicqJ
         DUEZqyaPDMlZkZcP8+NrKcf+0HixlqbnoQch0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=;
        b=sbmGWbEAKjLMplGSTCML5Izwr81IVXIWMNwAa4laWNpB6wi1u0oATmLgN1Q+cQ6Cwr
         fYn1qrrevNmJefW5qFiZ9+9Vr7rcDqWaWcrjjF/yXCZRe14ASZeX6qj3Mb94QEMgcMUK
         VvWixEboNbHxtKbQ7mJxbB5IAmcai7xuMfI6i7SSZDdPqlR1ch1H6gpqYHt/3lvvrgf0
         BI/0kh3rE9rkfsWJ0DySyu6obsPDO9WW35sg9N8TL5uX1DJ62MN7PcAf5KJxcmY53u8D
         kBsRQ9T3PMj0JRGoiBsunqWxltVOfSRp9SDVw0vkAWaD2HCigNmKgf+UuNeVEyMz40fc
         h9pw==
X-Gm-Message-State: ACrzQf0nMf1+iun5ppUxprprVM8B+CGiN8SpSN5IZRA3ykNYAutFeHt7
	wXrvaLqIF/EoS3Q/zJ901cBl4LzsNx+Hd1fI0/PJiw==
X-Google-Smtp-Source: AMsMyM7o8MwQQBDwguXkozM6n/umhwviFw/Nfd+rhMxsOtT2UejSuJCqg8qOL0/MW/9zxPZApsONr4Gwd23XXRSuZkU=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr16459188ejc.323.1664161315561; Sun, 25
 Sep 2022 20:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com> <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 11:01:44 +0800
Message-ID: <CAGXv+5Hr6LYEZ8_3Z07XAVPbbSHZiwjR2QTrv9LdhwpYn35TFw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 7/8] clk: mediatek: clk-apmixed: Add helper
 function to unregister ref2usb_tx
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, 
	ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com, 
	tinghan.shen@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com, 
	sam.shih@mediatek.com, bgolaszewski@baylibre.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	konrad.dybcio@somainline.org, marijn.suijten@somainline.org, 
	martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_200158_904898_4DD7A592 
X-CRM114-Status: UNSURE (   9.77  )
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

On Wed, Sep 21, 2022 at 5:15 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The ref2usb_tx clock was introduced a long time ago and, at that time,
> the MediaTek clock drivers were using CLK_OF_DECLARE, so they would
> never unregister.
>
> Nowadays, unregistering clock drivers is a thing, as we're registering
> them as platform_driver and allowing them to be kernel modules: add a
> helper function to cleanup the ref2usb_tx clock during error handling
> and upon module removal.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

