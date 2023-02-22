Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0FC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/ELBQfN+/3lXdDB7LXB4Z2052sqoav27oBRvmxfX5Y=; b=Q39zQi/XIiXiOxR+aWtyklScKl
	V3T4CPIQjiuByTCqgaszaBMOp8eXaRxO+ZCB3Hyt39qpZHD0vqtegdmfg5oOFtX6HNHgMrNpNluWv
	Sv5K9FuPhITJOqsCdPRFHaiy/ZPkjRM3LX/ZgSkSFSVDinIFFy5llsYijvnJeoPrzEB8HVPuNbkiU
	NfBTP1iBBVCDGC2cm0XotWoFygAeC/Zk/7p+Tppbq7puzlv1N9CmVcNgjAM8JDPEe1s5506qsbp00
	VXb5eW3qkE2GWn4i/KnxHZNahUSwxSwod9/EtgvePpkYbRlTCMKdhxv5ddiQUy3KN3aoziCu45b+d
	NIdoqaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk3N-00B9PZ-Nl; Wed, 22 Feb 2023 08:00:41 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk3I-00B9Np-Am
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 08:00:37 +0000
Received: by mail-ua1-x931.google.com with SMTP id f20so2311369uam.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 00:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/ELBQfN+/3lXdDB7LXB4Z2052sqoav27oBRvmxfX5Y=;
        b=AT+IRCu07svzL8m3gIIkCn+JEKk2W/8SCpGDCVA+oSKuwo58MRo4ZcEhc6RxVyyV5h
         SH4xpigfLJChb7OmNwlbmVHd/ccstGcS85QW1xb9r0cVu1WFt+Nf9hV2DweSdhHYdjPX
         0Ij/WbhQi5RvciOPshvUX0SJhh8dn1E+l2nQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/ELBQfN+/3lXdDB7LXB4Z2052sqoav27oBRvmxfX5Y=;
        b=hAFzkh2gOh4ziR2z1JHF/QYIytn4+NMZe6WUl1kQR8C5EB/sB2juieTPBf/QOAGQlV
         BBv32Lbg3rDcUk9Xc36pnoAZXty9oBWW4tsuMi8ozcc45oF2DUptOC4w1HxVdeUP5nYX
         4WxJ7dYwUECPZ4sJhavDuDBjSuabvF9+RMl3VL8pP1VtJGg0vCfFCYIfz94m2vRMw+sc
         SW2u9iZTDhkhCtPrt/ifZAY6Vg0WIyfVchkjhmbZ3B4QnYZp2L0/vaWdedGg5IDBbPEq
         jGN6DCr3RT4z5yVq4+UuOfW75KeHAMzL0q0ggLk9upnJQKqE6KZTDmILWX3ec3+E2KFn
         3yFg==
X-Gm-Message-State: AO0yUKUvXs4qF6rV4NQS2r8eLDjA422ZOHhq6rT0XsWoNJMXVoCLilFa
	9CWqik4JhGNRi7vutsNab0QTaJnOiwdU06o8YMCqbA==
X-Google-Smtp-Source: AK7set9gHg9xT1t3caYU+/EH6XDWBjScNBL58kOvjAujH1+xQR8y6JHp+iLrLSPt9BTYSv2avB7S3b74hbnrFiwCMsk=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1301210vkg.2.1677052835469; Wed, 22
 Feb 2023 00:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:00:24 +0800
Message-ID: <CAGXv+5EhuZ4oqEc-gK+F8fktFra+0MD5pMi_qzDwnFXxgjUsAg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: gpu: mali-bifrost: Allow up to 5
 power domains for MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_000036_388606_34B8C697 
X-CRM114-Status: UNSURE (   8.27  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
>
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

