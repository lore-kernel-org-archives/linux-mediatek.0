Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F08C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 22:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32kOpc7jmHfTKnUipGkgywWo/WFBVKADG1CFjMO63QA=; b=X6CJuRN895Q1v3Lm/4ueBMFpmu
	TJSIwXdPsocVJceI9fhSRdri7NORg3kQVZrLJBNAAQgTjatVeB2Ddn0NyMwxKrV+nJszwR2zrXA6E
	euVCzy7xYOQRjs1o3e1jfSoOqtzPirqnpFNON5aHz/N/JUlpw3PEnsuvyD8StCewJDpOmRCTLFsPD
	f0USeoL510lG3wnjQHYAkfQHscDVUT2vG8WP8wwU64r4YN2d1YheFtWavK2InXTT773W7p2o4RXUB
	JYOjH1nrg2ncSaDb9hCFu7DLDImfOCSpzi3xxaxK7TGErbZ8RPN6fneOhvs1owfChXxFPDXR11qbQ
	Z400BhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOQCc-00494r-1k;
	Fri, 12 Jan 2024 22:40:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOQCZ-00494H-1z
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 22:40:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e72e3d435so6814292e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 14:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705099230; x=1705704030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32kOpc7jmHfTKnUipGkgywWo/WFBVKADG1CFjMO63QA=;
        b=gdwTtDRB/PeortI+rpya1iWGZ2DjCLszQoy6d6rORmN/SHXpRVIfa/ustLAnA91+a8
         8+67HZj0xakAvPZkgjfjeF5Rj8xGYAAfBjRUSorY2Tj+QS3I8na+mxYaUo68x7Ml3Qga
         YAAXig7TDAa6aYh2Emcm1JuNOwbwHh4P2YMXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705099230; x=1705704030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32kOpc7jmHfTKnUipGkgywWo/WFBVKADG1CFjMO63QA=;
        b=FyewS4Mx+CjQ1HnTXA89W1vQrRv92Y2s7IBKGvVpmRs5wAlI4JPrQhICNVL5TIO1Kg
         oWdHDaTkkbVvSmo1KcdnlkmfVTauntcSCHH9rBCys68vQ0QcEdeiiySR4qkyn+CPAQo/
         b1qLLsgwOkuQKyf8LAsbf48WIaFBPrhIZDxg4rnogLp6YU8F9U5iaufy5xQh6EZsolzD
         MSQSKLFRJphuufpPC97bPs54QLT0xh3QPcqrA6LokiuGPMmL2q73szoZE/qCyhZNReMg
         rsAnxdpE1TldZ4Fvnhf6wWmxYlyyvx3lO+9FNuO1XNyffzXQ/N6N9WIoOciTQaLoFKIw
         PssQ==
X-Gm-Message-State: AOJu0YxEatMJFeC7GllvSFEYoEvFkbAVUlhnPqQe4bN3Wp1OWzSSfIJk
	OyueAF6ZLiGoODq65Tl38xXqJ9FqcIMDyN8GxxM35flzuWeA
X-Google-Smtp-Source: AGHT+IFAGDRltzrOuwOjfQw3BbOLAGH99OOdLrJfIuQiRQpUY3N7PM2+1jOwKqS+5bXXF/pZCJmDPVeNB9k5DbXpKmQ=
X-Received: by 2002:a19:9116:0:b0:50e:ab9b:c1d with SMTP id
 t22-20020a199116000000b0050eab9b0c1dmr695685lfd.37.1705099230506; Fri, 12 Jan
 2024 14:40:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Jan 2024 14:40:29 -0800
MIME-Version: 1.0
In-Reply-To: <20240112142032.909736-1-nfraprado@collabora.com>
References: <20240112142032.909736-1-nfraprado@collabora.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 12 Jan 2024 14:40:29 -0800
Message-ID: <CAE-0n52sbshmkROspU4Hg=G_-RzhkG11q8ktc9uzHuo0JXn93w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183: jacuzzi: Remove CrosEC base
 detection node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ikjoon Jang <ikjn@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_144035_703791_31037300 
X-CRM114-Status: UNSURE (   7.93  )
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

Quoting N=C3=ADcolas F. R. A. Prado (2024-01-12 06:20:28)
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 7592e3b86037..8c9f7435cf4c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -484,3 +484,6 @@ volup-btn-odl {
>         };
>  };
>
> +&cros_ec {
> +       /delete-node/ cbas;
> +};

Usually we add nodes instead of delete them. Can you move the cbas node
addition to the other files that include mt8183-kukui.dtsi instead? It
will be a larger patch in number of lines but then we don't run into
problems where the node is moved later and this breaks because 'cbas'
doesn't exist.

