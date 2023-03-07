Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15914C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWiG787S02DtKSWxIcqlG+KIKtzAOyTFykUvF4kfhVw=; b=4IOdhAlEICqbMFa6dUi0hF1ls4
	lgIle1J9XrFKj0aGtkSw3K5Rr5sZpZmwYXs/8yj7YBu9J70Ss7tUE1cNk30K2pE/BRlJhDbaZOfrU
	6xYjH6+YO1S8eEylaT2AP/8qkWfE2dqJdZxyQpZWORNHHKzUwzFtC5S1k5ywgS+Y69N0Ue9QE4NX2
	jR/MSwa8/YePHuD0I6NGSyWDjhEWlDr6yDkqJtSbjtdDqawwu7XtN/9fzIR7EYtiLg6A2pXL3w0iZ
	dSHM9sx2ya6HPOtnCJfdi/LRy8XB8x4LvFsJJ4o97uQ6iPabOb+OvSoMQIAe85pM+JTS1mwf5Kma0
	pjhqeZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUSh-00HDoy-BH; Tue, 07 Mar 2023 10:22:27 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUSe-00HDnZ-Tt
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:22:26 +0000
Received: by mail-ua1-x936.google.com with SMTP id f17so8492760uax.7
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678184544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWiG787S02DtKSWxIcqlG+KIKtzAOyTFykUvF4kfhVw=;
        b=N5qvRVjsAdwkNSwUwDqtgDHZU/0wk3LSCRFuNQsOm3JBDr3OBRtcxbyTkGmTGB/52F
         hW7VLvNTROUl3ArDgWOt6P6FY+tKgbL0RsdWv+WZGU7Ay6uQww5qFn720RswFnh0Miqf
         dw77/ZBUeewZwaqCkQrr9y8K3t8GEAEe9Cd4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWiG787S02DtKSWxIcqlG+KIKtzAOyTFykUvF4kfhVw=;
        b=2UwbF12n58WnoakkMfFFCAJogftPt5w8CFk4Pt6jbq/W/x55YyF3LL/79HlDbB7zDk
         q3B0CQ5M1N2YrZPnnpZ6BR5F5Xa3UMhR9Ywc4J+MUc0ck0vq3AbAMJLOnFOKcXEnXZpR
         hnWHI8pA6rEUHnG6327nYd03vpJ0wvde4zu3Dv/LHV8HN5QY8RXi8QZ9eLpFgWdVHAd6
         gQdKyWWzVAvEiqjABszn7BAvPHp6V4Y6FT8Y9egKVAzaLics0+W/jowOY+GkJvGfMPPZ
         F0aQOyv0Nu+PBO+QCcF7vxuQNvtyNXGlIWgM6mT3eVV+A17PZdVMu0ey7RPdhgBMh9bb
         oH5A==
X-Gm-Message-State: AO0yUKWzLF/Oq5IS4e+IkSbHkAKqiboID9cYNYsyDxQ3jN5017fBLCfW
	gyuTmHG4Wbc5PUfkCSHjqfBd4loDEg4MOfu+e7++6w==
X-Google-Smtp-Source: AK7set/cEE7A/fuEMWY6hxSLCJ3Mj28ipk4/B10pbN75eznTO0WQXN7YYB5vTg+N78zcYAoZyPErpNjf82NVfx6pFwM=
X-Received: by 2002:a1f:e584:0:b0:413:1498:e843 with SMTP id
 c126-20020a1fe584000000b004131498e843mr8568332vkh.0.1678184543768; Tue, 07
 Mar 2023 02:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:22:12 +0800
Message-ID: <CAGXv+5HDd-KuDEvPXCxwMtGTom+J=rOYHPrat7Pku7wPCU3zkQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
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
X-CRM114-CacheID: sfid-20230307_022224_998174_9C444F3C 
X-CRM114-Status: UNSURE (   8.37  )
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
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

