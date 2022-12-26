Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54CBC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1SnFH/lPjK8DkSzjFnZaeTI7PMR4Peim0SSBCAeoNI=; b=FVuHEf9K+iFixRe2+y5hdeR14A
	gLHSwg/gJFZeE6VL4s1aQ45kP6WaTYNdqz4H5oQs5t+wGMakTHPQy7RN0cEgxEy3TJGzdYmKy3Ws0
	FM8F2GVq+ROvejfcg8vFuutTgnp3WKFOsVamXQ5LqKipl77papVLy+dbDYbwL+7eJA3yT3Iuv38N0
	JpN9bjfFp6qAKHZbtlvOBMKls/+IrGjAFvznAQu74g4qUxG+sE6IVjZa83xfwGG+loVveIsIA5Nxm
	sb9IV4uBlbELvRNo9PHCI7pozVHDsew5CJM3aUHaLu81ROoRptCqWH0b4AwfyGKmyOS23DAkfUZQU
	dGecG9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hQB-002Pbb-0x; Mon, 26 Dec 2022 06:57:15 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hPl-002PVS-Ts
	for linux-mediatek@lists.infradead.org; Mon, 26 Dec 2022 06:56:51 +0000
Received: by mail-ua1-x935.google.com with SMTP id d14so757445uak.12
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Dec 2022 22:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M1SnFH/lPjK8DkSzjFnZaeTI7PMR4Peim0SSBCAeoNI=;
        b=gpVfONHwSnhvI+o4Oswm1KdRr3vFgOt5mgU6LHjiuvn3rzTBYjJzr0Gz85lS4d9YPd
         Kxbz999P5+w/OV2qnWUaenSzULCc+id7R/d8frAkCqbUxnsaPLKZqWUkxhlnQIqSsrkz
         W5JAOZXn7/EThGJgUqWOiZ5S2SW8YH0PXBNb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1SnFH/lPjK8DkSzjFnZaeTI7PMR4Peim0SSBCAeoNI=;
        b=LoLMlxrVcBh6XjdDY+WmQ5r8lKjYM6Sg+Mvg1DTcHBB9c2SpbcXTIRfryKq+HNleQK
         u1U7rRRH2sf82dkTZmwlb1QUuOx+d9ao14Q/ksObND+4G5egirnkV+jdF10ksEX7EIn9
         PuOfX807S16nisArKVHY6OC/X7IM5ASxGzbC4ly8Z0DVp+oUD+P9NUJk3zp9sRi7dwnh
         ASNMLiBZLnyBG7fVQIgKWdoCKNyuqX6pkreFUhl+GROBq4yu5HSbK6ksSTZBa6JtvhsX
         5KjiRMf0EtCYpRdH34pUhJz484NK0LfNlSSpkkkSjvHnEZJCAa3oFBv0pcKeJAMWNxzb
         wCHA==
X-Gm-Message-State: AFqh2kq10M9re8MHkmOCx2ks9BL+5hHNT++tMof+r2T2kQ4otVjgnOq7
	UGeX/1ZDYNOnBRug8EHquSMY5qoBG4ewD0CYOqmKYg==
X-Google-Smtp-Source: AMrXdXumnCdbt8Id7nVQr72ncvxGvcSqSPRDFYpUVKhiIspGshPFm1Id8SI1nyZQ+l8BnASdx7sBOZ9SXIDiFAYGgvU=
X-Received: by 2002:ab0:738b:0:b0:469:f0ea:c1f7 with SMTP id
 l11-20020ab0738b000000b00469f0eac1f7mr780278uap.0.1672037808572; Sun, 25 Dec
 2022 22:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Dec 2022 14:56:37 +0800
Message-ID: <CAGXv+5HTi14-AV38DAFKao+PBeMf3CpSgvD6OuNnzRygL2bvgw@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] clk: mediatek: mt8192: Propagate struct device
 for gate clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_225649_994006_7A7823F8 
X-CRM114-Status: UNSURE (   7.07  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert instances of mtk_clk_register_gates() to use the newer
> mtk_clk_register_gates_with_dev() to propagate struct device to
> the clk framework.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

