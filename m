Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64195FC6172
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e56nDrFieiCTBDgxXmT/FytGRRsnLD6iRgK6+csFd+4=; b=K+/QQkn2k9mRj8VR/Fv6KgxbhH
	IVFBZ14M3NjxO8V29+Gf7FOAmaAJBWXymke1RTIONEPgKnkN7FJW5082hSh8pgnyVaqieYZ3ndYUy
	q/wybIbPZ4OSz9UwBYnwACQEOHzZKj47SVArP1W92k3Qae62kX/kyaK34EA+zLF1Cfma/sttesOtL
	MI0jhecHdfPOoCye1cYEmGZ6CwTGEz+Nd4mlCoaxmKMIjsV9SerLMWj/fiM+GxrQeZNPSXErZhGbH
	EDQ57W47KQLznon2j46b62VCvbxz3aL6kR9CscZt2z3Kz2bAAgn8AqML4DqLUF+b5Bbc8e6HMxq08
	sITs48cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spE1r-0000000HBWY-3sWb;
	Fri, 13 Sep 2024 21:40:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spE0i-0000000HBJa-3sFV;
	Fri, 13 Sep 2024 21:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56241A416FF;
	Fri, 13 Sep 2024 21:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20D4C4AF09;
	Fri, 13 Sep 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726263563;
	bh=29lldcaIiks9/LfCKap1Yktuq2JC3H3MvPcdHX/euBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TnskXcutylpvBl9psxUrUfUCRPAzJGzmd8y9uJnn49340vS09VnNflnBAhFARrcMn
	 IeSpHw6/nWrPg1N6jtMkHHEJpBw96cHY8PioWhedzjHpsV3dwmsC2vTS8f9vlANP5p
	 +HoUS4oiP2V76PpFhUocCnKBbWUPVpSkWJAOgahqgRMzQ9pkJy/TUgljsiqiOHeWj/
	 fu6o5gKxrN51JtIBvAdl8ErSWEHkk/S9RiuQ6CZapIx8/DrqfSYzBAACLCSsdgblPm
	 6TFJvXE/t+34KGDYtsxzIHLLGK5ePjSCFibY6KWREM9KQP4r5wyoCIO35Q1RDacKa+
	 bfRvrVFijIrcg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53660856a21so1380995e87.2;
        Fri, 13 Sep 2024 14:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEf9yJv/OTMShbtL/i+I4WUB4QAJQ47jJ8yin3d4Yu86Byfygn09S5aqsIcvrCGFNfVSKfC6ensifq17eBV/g8@lists.infradead.org, AJvYcCXd0mGDjeFEwphDjOLxmecEcMPIcDrPsAQaSpUIwNeOFavUq+n6MuC4mMNd1Bmqaq3TpcMFc6Vlne0h8dQwABo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDoyXaHlCUmvD2EGfkC4XukMsUP2EFo7bVL+fKGbTAv2/IRu9N
	hGTZeJ3GHTqkwmal074QY8q9aA6uaMqzap/GSX1GAobAPjcdcDqN+KxoW1Dlm174nj2HNdseg3f
	nv94Hep4x3NSPweY2yu4+rRNFlA==
X-Google-Smtp-Source: AGHT+IHja0EdX+FTr55htGcN7Jpd0i8VmeMa2FJm1kpulhqYl5C0BU8PCxBt6UcQdsqHXvue4VOMzQdKb8SnPRakjGM=
X-Received: by 2002:a05:6512:2393:b0:52e:98f6:c21f with SMTP id
 2adb3069b0e04-5367fec3915mr2947015e87.16.1726263562116; Fri, 13 Sep 2024
 14:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240912144430.3161717-1-treapking@chromium.org> <20240912144430.3161717-2-treapking@chromium.org>
In-Reply-To: <20240912144430.3161717-2-treapking@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Sep 2024 16:39:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLhnuqASgOab7RjdrUxGs4ags8CutL0K9Vr_57HmL+TpQ@mail.gmail.com>
Message-ID: <CAL_JsqLhnuqASgOab7RjdrUxGs4ags8CutL0K9Vr_57HmL+TpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: dpi: Add
 power-domains to the bindings
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_143925_119844_4858F333 
X-CRM114-Status: GOOD (  14.61  )
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

On Thu, Sep 12, 2024 at 9:44=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The power-domains property is used by most DT nodes using mediatek,dpi
> bindings. Add this to the bindings to fix the schema check error.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  .../bindings/display/mediatek/mediatek,dpi.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 5ca7679d5427..7e0bb88f5856 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -42,6 +42,12 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.

power-domains was already added recently, but mt8183 was not included.
So you'll need to adjust the if/then schema for it.

Rob

