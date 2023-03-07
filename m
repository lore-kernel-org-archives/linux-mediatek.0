Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED33C678DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RP4oTBHTQfU+cSOnEmCaBzJhcvOEi+tlYyv1N22EK0=; b=k6JYczDzOThzoNJk4I0zD17WiK
	lsya0aIUNtvhAaKPoZlCsHa+gMmGeKitSPNJwGUQJTjVwUYgZDChlzR9jmRjFwHHo1XgFVi6Yu9uw
	tPTbqA7CXzutObQgc57ZL+iPnkGLSNFej9swWwS+RYIcw01Kfv1JnWSpE8loN9QpcToBIb42kQQMC
	tS7f0ca3U9CWCAmq99a7zlDdV9coYQpDte6MJaOJNLPtZmjUYcsA74c8fkxebUdnEuuBcx3f5aZTi
	0Tpt/MIbvLaOlNEXAHKT8tgdqCaR5npqwjB9QFi4zhAUeniCMjjO6WQCPp7j4Y5yefM42AyQGVJwG
	hf3oOMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU48-00H5Im-Hi; Tue, 07 Mar 2023 09:57:04 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU30-00H4fH-0s
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:55:55 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id o2so11768929vss.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RP4oTBHTQfU+cSOnEmCaBzJhcvOEi+tlYyv1N22EK0=;
        b=NHiNggQW7NfCAAvBD5ei7LCdwF00j9A7BOiqv3LttCcsdwo/weQ9LhfU9Nz3t9K0Fi
         e8StI7dy46pVfR2lKDF71AlvtMc8TJEB65CXOk8EKH/8P6OLO2iqz7I0gly94Gqxs964
         0aI9kk4tURcrj9YAdXnCi7av7TMDe/aaony7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RP4oTBHTQfU+cSOnEmCaBzJhcvOEi+tlYyv1N22EK0=;
        b=uNz2+uDoxtP1009gTpdH+vK5JpHOlOGfbx1Joc+5Wr4DFhnazri5f54j6IZK4Qmo8j
         R3YpJP2cp9ArF5UlJocnJipZ11Ags+NrvPHutjzc7F6nz4tFdsN40ucQWSiDRFpPKVMa
         acE0bumuQkghlnLzvawCT2XJv9I/cFDlN7giLMxfbOQWtxSNIFFCt2KYauJPStXPegOy
         cYCAxl8RtvHXa2pnd1Od9n0npW4k0tvPRC7pkapvIxPPxdKyD6b0tacHZq5Xrld8Cc+o
         uKWpgoDySl33QqOhNfornxiqGjrsPxXR4gPTDdl6GXdy73YymfbF57y2waEAEpR4Xpyt
         RzSA==
X-Gm-Message-State: AO0yUKXqkY/vUtV+pJgeyviQKgU0LW/M7cCk/Y1Omfdx1supFhP5W2Bm
	jkLJ0eU8GyZcehWod+IzuxvH4YVV+ij205priUIo0Q==
X-Google-Smtp-Source: AK7set8nGUBgc2L2PJPdJBoEOnCnChdp+HTmYAB9+1VzdkOjzou3mYdfP4Z3384VdFLyRn6Da7w1948dOB0dW551ajc=
X-Received: by 2002:a67:f349:0:b0:41f:641c:f775 with SMTP id
 p9-20020a67f349000000b0041f641cf775mr9639372vsm.3.1678182952854; Tue, 07 Mar
 2023 01:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:55:41 +0800
Message-ID: <CAGXv+5F_YQLPqJYUoLA=zSeJyPzPxBESt4GyjYE=fEFt-xxfRQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
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
X-CRM114-CacheID: sfid-20230307_015554_088319_06623C55 
X-CRM114-Status: UNSURE (   8.39  )
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
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

