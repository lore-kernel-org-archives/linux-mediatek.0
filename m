Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2163EC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3IFfZ13qRP77Th42gjrEoIf/Fv5yp9Te6g4rfCja/g=; b=bKOg9EcXJUIC8GLz5vWIGUmhEm
	ckNSawrlZv6wgr6LJuaEOG+VMQ9q/l7p3Kk9Q4WZtAgDs1tAb6ArXIRWWpq1vpUaKTBLCSICbaz/8
	zfQfUk4MYzONBDgSu5n5bnuS4O5LhfggTWDP/8jgU0+raFjk0PknS3McOrA6LErHLhU+wpeAsGOs7
	vH69zIvoyTqFTd92DS/E67yczLVMPYDPIiq9NjiJhIdabjG60TaVnr5CFknrsH74ROLrN1MZduIoZ
	u6X8QamqL14VcVDtSNOM6H4a62HtQnl2OJDfRH3kcIJImaRzO+wLHeB4XYpPc94W/klVzyPp9zuV/
	VEnEn7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUYU-00HGhV-Pa; Tue, 07 Mar 2023 10:28:26 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUY8-00HGSM-LL
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:28:07 +0000
Received: by mail-ua1-x931.google.com with SMTP id f17so8501234uax.7
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678184881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3IFfZ13qRP77Th42gjrEoIf/Fv5yp9Te6g4rfCja/g=;
        b=Eb1zByjEKOExnu+tNlf2T0VWXBDVQVZyWGR4wHcACaXrTYPFfwm+L3H+ouePH9SVw0
         nSm0EQDWkfocza6ZSKpr6gFmNHjWZyTGLQNSi3ncAmKH2Cw4exaWsf8lOIQAp1zC0zxm
         dRrSdXqOmbW8Zob+dovbN4ZHH3LmK8bLwoCfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3IFfZ13qRP77Th42gjrEoIf/Fv5yp9Te6g4rfCja/g=;
        b=vthUpF0PHwmM7MNWuLW7cRQwoBtEJCkBPhuL6wUDyfK+Rop5++uxsGvkU/JFmCdB25
         Gpvy8iDBrKcVuCUF0bn32HrYUXR9u5NVgPtY2gYy3d2aW5tbKfMC99AZvttm5EhcLhFg
         n7zGlheYx6ISgVv02lPfUAHpMwGGgrDCzQmviQQVotHNfTHLFO83oD/DkyCOKjzzEmSB
         osbUjK6UlXs7rkD2uOZ1HJiWdnunXu3Fdmjpi0Hwdl7gmjSWzbEYN01sgtcBg8r6jzOn
         kzx/MEPlbumycur/j9j8/1pq+qcE7Leu5heOndDkIzuqglFdyFvpfMAEK2VDy+4myMPh
         9gNw==
X-Gm-Message-State: AO0yUKVR710LgA4yaXmF9a9LrlvDBKBzMKumCRGWlFlqqMqK8xOU2aO7
	gcwVV5msQhmrhjpxe02caB/rQVtm5g6jKpEnx4ORHg==
X-Google-Smtp-Source: AK7set8/lmXFQ2Q8tP+xEm+sKmdCV9Kt/WO3yq7gKbFeKv90cNmH+N5U/jM1j+nH6ORz9vhUBxZNHa5P6CnunTtzeow=
X-Received: by 2002:a1f:c507:0:b0:401:2297:b2e0 with SMTP id
 v7-20020a1fc507000000b004012297b2e0mr8280600vkf.0.1678184881167; Tue, 07 Mar
 2023 02:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:27:50 +0800
Message-ID: <CAGXv+5FZSZiTw7RH_VZyT2buk_i0eVpz-rKo9ds1M4yNt3fboQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] dt-bindings: gpu: mali-bifrost: Set
 power-domains maxItems to 5
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_022804_778039_CDDD5A90 
X-CRM114-Status: UNSURE (   7.02  )
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

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding (and fixing) power-domain-names and MediaTek
> MT8192 bindings, allow up to five items for power-domains.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

