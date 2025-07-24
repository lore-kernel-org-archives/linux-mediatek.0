Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7B2C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=; b=henSokr9zxDuZ1
	Akjfj1aLveCJEx9RQ5dy6jgqZ5tORNgI6xHxPULJIvorOZmte9wLEOmqGw2MxECvQZ4iy5bYXPRaR
	KQqkZzMULab1WpZA31vJ/htfa4/MoHgRpqVI2Fv5eyR1wFAyXwk4N0DnH8QkCAvZBUUNVVETdSXq4
	42mdjbMVAUXMpil4KVw2RpATG03oJsm8eAxBEZ9mNMUzzzyzhqtFQkLia1H7fiAaUz/RQgVkJC512
	N0F2Xp9Eno7I0EFc9AvOudPXwupITmcrMdfblNlesoHHqrlZy4mJcdfWW4PgBCJ8vdokllj0j0vCQ
	7R8T1O0ckkoWiarqCOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uessu-00000007AU6-3kEa;
	Thu, 24 Jul 2025 10:09:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ues4W-000000070eM-1PLb
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:17:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so605314e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753348623; x=1753953423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
        b=APxndZadbKvZaYe6jldkZ5Ckq5P4Tnm2fM0y5loQmieM6evmM+qrnxVDHWiRZlCTA8
         hqUtT5S/VmiCUDCNagUDLRrteT5xs58BtjumhC4c0DG/T/V/7lAKKwojG1aDg6mFc645
         5YK9VXeFuli7v+0fWCrhlAfOXljlGZH7zvZKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348623; x=1753953423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
        b=dAxSkmnU+DJZifljJ7CBdyaGePtFyCWWx7/6GkmR/+o082HHcB13UCK9bpg2BYUtdk
         vS+ok3uq+zuR31SRutrg2sktV1E2HAw/T64F3YFHZvzA+5dxHXzlCwsSBD5s3RQlGeXi
         eUGifoF3vP6K6SthWn62PETAxu7NBQCImCKW6aXodL6BVsjabQPOnNevQBHhdwoXXvN+
         1hDLGzJeC3Wm6fcWRNguojxSeh8xmBCezrnpItrYXHkzZUF/kzb0awOSI5JbkF96I2xz
         IUs1Lc9GnxRPdQGpc7jWi7y8SZvbF2gCqOniDsZeO+zOzOuDFT3428g6gBY+Cc8ZkQna
         kL3Q==
X-Gm-Message-State: AOJu0YyYYrJBiuiLrFakwpxM3nonf/rp0KyfqcFh8P0f/olYYJniu3W7
	w00ZZo6FHrDl4P3Bo9HcIhKPQduJt7jj1r1fTQb1ayB4uACY4emC1CsAjZIVoFGDwo0LkMEXfDS
	0nQtkar5PKAmeBw+r8Vh+D27EIi3GLErJaOoX/luG
X-Gm-Gg: ASbGncv7+KV1V40JLmt0whl78BDvJLsL8u+ky9uqOBiEbZ8kcIKbPpMw8+9Vmzl2CF0
	uq7PDp11rNZ6EuIWrFFf/WtwOEB7cdpKxVAEYX7uvqfZK+FxHnYj73ywgafQdElFxJ+/d1LaQmf
	SlZcX7DedzEK7YTqZ7XDVg0sWhLetn/DZC1IcWeXBJzQfx7FH+rTb6su4Y6G6Uq23vdxWaYTQ4x
	wl5JZZH3HNxLoZ1lPLB9Yb+0Xjp17PJn4fmQXEpRUzf2g==
X-Google-Smtp-Source: AGHT+IGEMdfa/7pI/vtQhZpE9t+GCiAKzWTtoHMGXUrvfqlTr4xGM3G4p6O55TyjazqugJ0Dpoksr/xy8ncvPcXnu9I=
X-Received: by 2002:a05:6512:3a84:b0:55b:57e8:16a5 with SMTP id
 2adb3069b0e04-55b57e81981mr94240e87.32.1753348622453; Thu, 24 Jul 2025
 02:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:51 +0800
X-Gm-Features: Ac12FXxEOfXERpbm54RTrpt_sFAe6oyRhPRCsENRyO12HQ_K_abqIUXAGxmi264
Message-ID: <CAGXv+5Exb0X-6V=bdJefaz+m=eXSrrw6_SgWY6vDF3rF1RmVBg@mail.gmail.com>
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek, dp: Allow
 DisplayPort AUX bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_021704_379089_923477C0 
X-CRM114-Status: UNSURE (   5.76  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, kishon@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

