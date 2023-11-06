Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5654FC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhaNPZ5ALKGhgIwmnk7EA8sPdVUBa/gDuKElje8KGZk=; b=KOY8RIXV3zNK40R8CayduzbXAi
	tbmDgT7lzxxGCw8UAqBnlbnY2HQ/tVoW0YZngWnPqivXm8ZKaaEyu2uX679uMlKabYak5/F/+VFS8
	0QWt5lk2GReqkKVUlKp2b3NZTDEeCBflWofAtsZ+RuIS55v3fQiR1IWB/1wahPUITZBJNokFClwNI
	agmdz24oksLD7mFRGwZTRYeBZatKT4eLJBcxvm8zqyc9art1Nwlwxhwcnf+3VM39VN3tFYgo+6CRV
	1CYqJVyeeK3iFS7V0j5ahXpeOZ6QtH1LI5BEEtSSWp8DNd0gyaLOCQudElHSx+oUWmOzJdKdGYBUW
	OXbBb+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvRD-00G7Y9-0e;
	Mon, 06 Nov 2023 08:58:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvRA-00G7XE-3A
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 08:58:26 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507962561adso5488353e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 00:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699261101; x=1699865901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhaNPZ5ALKGhgIwmnk7EA8sPdVUBa/gDuKElje8KGZk=;
        b=llgBs7AQSS/0RWEJFpZRiiYXvRKXbbUNyJcRAHeEEYaLAN6zpqF8w//ydSThbMTH11
         ty9Y2IgCdHFItih5NC1YjObp6G7+hJesVfqJb0Nqh93yAbJYFp3lBUaWJ/ETGBQL+Sjs
         JS+qNIuidQz19AFvYvgq98q3FsLt+UACjhKfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699261101; x=1699865901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhaNPZ5ALKGhgIwmnk7EA8sPdVUBa/gDuKElje8KGZk=;
        b=Kt7dFtNzqkL4YxNm+yumZz7W2mi7oPq4sioYfqo2T3Im9AQb3TU9bC6wxp+ZA5+zsF
         d25U5kuHMaQr1HPRJyejAbhdH+bCzh68ni0Zh6uMFHqsjDmgF5peSbFEOCg5IuvIcU6Q
         JxH0ER6klzLTVGzm7JncSEezniRni+MuYwqqQJMQM5kY583vWll18XTWRPNlENoENAYV
         De1ZJHoevJwncH+ki4Tc5u1J2vQQmOhL/WxH6FTrbATh4udhxcmDu5yWZlw7BmqOcQtN
         7tk11jGcLg5o7CXdJv1uQT/UTbjzqE/o0mdgkjWRo9tOfaPyb54Yl8b3NvEFBZf3O53v
         mJFg==
X-Gm-Message-State: AOJu0Yyag3sgo8pdY1YMZGlMJPmW+qUcmK0+Uc0G23f0p+xt+LAhH1Xe
	Fs58+/lpA+fN1UrD1fxCTWKEZTrst+6L+RbbyUe1JQ==
X-Google-Smtp-Source: AGHT+IFkEVvTTQVRt+p9CHlozj8K2Y8M2HQgxYsSM7s84s2T7tu9AUMdVItvQURRV6ZxtQMxORH9/2hymWtojECviag=
X-Received: by 2002:a05:6512:3245:b0:509:49fc:c25c with SMTP id
 c5-20020a056512324500b0050949fcc25cmr8787028lfr.28.1699261101126; Mon, 06 Nov
 2023 00:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Nov 2023 16:58:09 +0800
Message-ID: <CAGXv+5Hjj1=5Tii1-Pt01oVdPE2qCc8E0DVjzm7UeA_m5cMW=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents
 for top_dp/edp muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com, 
	u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_005825_058091_A9C3CDDF 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, Nov 3, 2023 at 6:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>  - top_dp is switched to TVDPLL1
>  - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>  - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

