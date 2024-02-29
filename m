Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E938BC5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 03:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=; b=S1oGD6xpcXX7aQBa+2+r5WLn30
	M4k/mxx6ThFomqeOCW7se8Ms13q+HF6O8Q7zBFnHolYeiCKN8ZAtRh+0XJpndRqfqEtPy9Bu6XV9j
	6LLca+T5anryb8wd+lSPexoEfdPHxxZsxuBwnOQBXP3AMyCOrn1szYbHH2hgBcq63rXgWigtr6hga
	Tq2yXT3czpSlvANylK9eNzlDjxlpuK4F8dmr/ZeAKiXOa5LujUvdQI0DvOB8R6jwGgINIic08BEVX
	ML3yWsQdlDtocnNMq1vmuoMSMe93h9705KtcCmIB1CJ752jVFVw8jXRxyBAZjylhO5/LUgLGnFV3p
	CWlVVxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX3L-0000000Bsl8-2Lte;
	Thu, 29 Feb 2024 03:25:47 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX3I-0000000BskB-3bw5
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 03:25:46 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d2305589a2so4758711fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 19:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709177142; x=1709781942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
        b=Kkxh8+rZKYo/GOYPb+rnFH0fTJMxJMVR7N8fgKDs2vkbzthtCP8cLnTUaNIVMqis9S
         p7mery8qQNPUN/pdpxVHbnVpX+IjNvWm7AVprUJ3DPIS3NKaCV0szYmhn5b8pjZxcxgI
         PE9aUJzmSyQIoS+Ej8pCQgjoj98aCWOY3XPUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709177142; x=1709781942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
        b=P/NVdEke8UYoX+jgWnm9HNdOjHJUMEmS1MZh5zpOPzDFo8xHqU61+4SyzxUEjhKNVu
         jVWl0NO04NEadoaiizHy5bLzziyLb22nM5Jj9aZekgiro1vtHL1UQTQZBxrf/vsTz+Se
         eDQ9MsJ74JU6TJ7NR6xHgkN6aYfPkrBIe8OoqLiP2NbnvIckzwpZSjcUCjgZ8TOgNyp1
         gdOMJfoCmQaJCeh6ih99SZK+XNUi9rBakvtA2Q07h1nvZ9usegpvi8qEml6Yxp9RaILB
         J7jlTa7PzfUeFQRBIYjZEhPvne2CBgkuQhEHspfW9hs5tt1LhohzyB5rifdBRkUAJXNA
         1Hkw==
X-Forwarded-Encrypted: i=1; AJvYcCUgRjykXOyytiOgeisf17V9JKzlOuP2nbpwRFnyrCEVLADqTs1Sxv6LkXquO8T3Qz59FSH2Y3IjxjqftYV23NVYWsPRzhTIJ6bHZXHlA/zNkvfF
X-Gm-Message-State: AOJu0YxJiyVrAfYEZ/qC3LZrF97mrNBA/HYJTLNWr1BjG2dtSLRxq5f8
	G0aecTsnzpjeA9gvrZLehpNVfBey90SRL1/KyB6kGLELR1pH718/lUF8CU/FomSv56WZC+gvbl1
	doZ+xoCP+mlmzDqwBdtFVZg/0NOaG5bqnP8xs
X-Google-Smtp-Source: AGHT+IF6HtrFqiF4ILXIhOeoglLnKyYMIt97o4GxwpCNIyH7ScABce8rbUiq2DMajV+r4BPBHpxVsoL7H4u3odSmJ9Q=
X-Received: by 2002:ac2:597b:0:b0:512:ba41:51f with SMTP id
 h27-20020ac2597b000000b00512ba41051fmr425568lfp.50.1709177142115; Wed, 28 Feb
 2024 19:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com> <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 11:25:31 +0800
Message-ID: <CAGXv+5Hpv323oGAr_t6C=akNybypPUYO31ez2rFD2oCRs3O8GQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com, 
	trevor.wu@mediatek.com, maso.huang@mediatek.com, 
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de, 
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com, 
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com, 
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev, 
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com, 
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com, 
	nfraprado@collabora.com, alsa-devel@alsa-project.org, 
	shane.chien@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_192544_939945_3689130F 
X-CRM114-Status: UNSURE (   8.03  )
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

On Tue, Feb 27, 2024 at 8:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Simplify the probe function by switching error prints to return
> dev_err_probe(), lowering the lines count; while at it, also
> beautify some messages and change some others' level from warn
> to error.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

