Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECD9C678DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 04:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcE3GqJXQUb3n8r8Cf9DeCZohIcMVrjYDJopDIgXigE=; b=Z1V4dG+GBBLyHYsPs4gtsRkkqF
	IbHtVYzKnd+O0WRlSUvZK0QNSLOjQv/5mABqHtNvGMGqMztE/W6bXBf0N1dlogK1oLnk573GmLxDl
	tt0dutJ52ls53Fx5jq+D3mNe55ewVB1zWC2Qmqah4jIdGvMKU1dyjyTRwnsEl3WNghk4JDJZqUo4z
	21l9kG8xKJIA5EdFvofszdM8dEWRheAppyuxVO4wDimJs/v6uE6U0Q5QxdGfhxVVrZBmDl68DphhU
	8sno/2xOchj23snOu+VXM9yZNCf2z+WJbByFbQHaxQcgz5/GFivHmGi00VVPYb7gSqb0MFf9yOPCC
	SUgpUsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZPKX-00GDJz-An; Tue, 07 Mar 2023 04:53:41 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZPKU-00GDJ8-RW
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 04:53:40 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id f23so11260118vsa.13
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 20:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678164817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcE3GqJXQUb3n8r8Cf9DeCZohIcMVrjYDJopDIgXigE=;
        b=Vzrk9J5moRnykRY4cC9oel+ani17/mQT1hS7fW5bTqtqAd7jAs6j9dMN+vet4QAbiR
         wLn/UcC5dzKOaSIlo8lpjPkkrFOXTgdUN74fa4OM2opvZio84DqY/cRDreHz/DoYvVWg
         0qsmUVy/K8rXM1y8XCrhGaMupA3V/0nQMDoC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678164817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcE3GqJXQUb3n8r8Cf9DeCZohIcMVrjYDJopDIgXigE=;
        b=JdIMSwbgQBdrC8IIwXS1AQ2hsiD3uigfvy3Ids23WafVwC9FRXNpZjtuVP0vpCApvM
         UiX1Hqk2cWS7tiAXDYsxHxI5zDP5/hteMfsIXo0JjdlEnE4FD5tgSF3cGYgQWdSnB3Wx
         Hw2TZ0t48Gd60/Y6bxlLHhjAIBeGLh9KXy4GObF+Gpm5q7Xxv+53Qgz/jV1wAkQkMQcN
         5YKQpurcqcqDXvwJtWALQrKh4MDY+8vgBccmmWfmIlm16Dl4zRW6K5keJpOThENKVz/F
         AsXr1au8Ilj3RAPtwcgyZB6Xpn5GWQ5mCc2IE5+R6+cUcIBWihiPNkogvlZp1EGns46m
         0Q1A==
X-Gm-Message-State: AO0yUKUD2JoGlGqXHC+VlQsoSjJLjiHsnNB+f4wy+zha8cZuggtSfJwz
	M5N46WPXN62i4uOSCHYUDX9rmW4+39+G9aadsKZ7bA==
X-Google-Smtp-Source: AK7set/aeUCT0y/ttIIfAOxj05+op6eB8+wnmmD5urpBf0dNju9inYFodFHO4EvDUnuOZnaNy9rangMDYNzBR51J9rg=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr8785312vsk.3.1678164817397; Mon, 06 Mar
 2023 20:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 12:53:26 +0800
Message-ID: <CAGXv+5EFtex3YCqkD91XbXura+e1gOWL6uerX5YMw-1=akW7Ew@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] clk: mediatek: clk-pllfh: Export
 register/unregister/parse functions
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, 
	miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, 
	jose.exposito89@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_205338_924981_EF4D1137 
X-CRM114-Status: UNSURE (   6.65  )
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

On Mon, Feb 6, 2023 at 6:01=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> These functions are used by the various MediaTek apmixed clock drivers
> that may be built as modules: export the common functions used to parse
> related devicetree properties, register and unregister the PLLFH clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

