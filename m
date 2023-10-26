Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6C2C25B67
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 05:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v88cIuoMfKK/xscvmw4mP2AX4C1KpNxy9EGTFm/wXII=; b=aaU9s0XBEZCrbjE4EIoRWS/J71
	Wkzgi4m7qsZXlyzAuvS+kie0A0RNF/wmd7xj+lIeKLB1P2BYhWGQvJDTl1dJgX3KVeGgcIpyMT7us
	mBVREOFctCImOOra/3CepbkspGKfW/fs6eEcsJBJ+bgBPOU3RwKe8B11NRYv821J2qtVfdG/oJhTZ
	VJRHzIuZK1dLO2MjHoAinwj3+r65JVW/d79trkdL9tWYPTeiidgECuQnvYUZTMelCtzyj1DrCbL7H
	Cfd2zfyMNodWj9c6jzC4cN158AsmHraRKozebYdYCBkxD+FZkz/vMudSqEwH5rv52j/IQKZMelzfu
	mvs0puhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvt7x-00Digs-13;
	Thu, 26 Oct 2023 05:41:53 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvt7t-00Difw-35;
	Thu, 26 Oct 2023 05:41:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso674276a12.1;
        Wed, 25 Oct 2023 22:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698298907; x=1698903707; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v88cIuoMfKK/xscvmw4mP2AX4C1KpNxy9EGTFm/wXII=;
        b=RRlmYZiPLA4cnSnl0f6BSi0WZbRfeW/Jrz+LbyZOi3rL3fn7Sv7PtksTA9CvZUSlyb
         d/wqsNMcKieQuXTWRzwrnPyWukzYfrOci4Tck4XwXc2kPYiUby/tvf19JTEbuHbK1XhL
         oUNtun29EPbReIRHURvcC+PN2hey9OnmwAVBNSVa3/wvOMVYPrf78r/FfB+pui2dhbST
         SMflzJb7u78TAgX7U8cG2dgcndWxFaYYJif7vq6/HrcDGiPYuLjydmS4Y2XPnK5rtwTb
         G0nR8zpmGSfup2qEHAF4lvJsSM/r5qGQKjy3yt0+qi9eTurl0PLfznibGU3WvI6m8J7V
         sO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298907; x=1698903707;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v88cIuoMfKK/xscvmw4mP2AX4C1KpNxy9EGTFm/wXII=;
        b=khxibuoDPzkOQoTeiSqB6b58cVD8G/Ckk2DVGUmyiolgIhsdbY1sTYttegbCPhcosA
         txsHLz2zv9WO7obhGNblexYNMhz/xNLpJrT9oHXZBV/Ptbkp3Xj0IOU+hhEtMqDwvDmZ
         kW9NI4RnxTpK7oOlGhf90pMZQo8YIAuppzU73tIkgUcXGXRS2o4Q+XJ9Uc2KHwp6paO5
         K5btgs68eBBhRvC20SqrEakkKGv5YwTqT7yUEBxPOlhwLOudjEl1Z9R8Oqut9GbtgYIE
         4o1dIBR+HcW71AHx4ArKyelX2xfY/I3DgsSOkuIcXwi4J5/hS1N68LIWfEWDrlJvTsLH
         n96w==
X-Gm-Message-State: AOJu0YxJ6d+nQT7FYiJ5IjpzXyXlCQtomEIvEikXmxMGuOYj57b+fh61
	OzUuDPHhJ2u9L22M69ODUWiX7TIyhryUpsZ3nOw=
X-Google-Smtp-Source: AGHT+IE/n0OoxifurTDgldQZqpLM8AuCp+gQ7fUFj2/TTGB+7QsX1WZ+ulAcFK2YO66Nv03gm0DH7A==
X-Received: by 2002:a17:907:9286:b0:9b9:facb:d950 with SMTP id bw6-20020a170907928600b009b9facbd950mr13315954ejc.72.1698298907263;
        Wed, 25 Oct 2023 22:41:47 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id h11-20020a1709063b4b00b009b9aa8fffdasm10997701ejf.131.2023.10.25.22.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:41:46 -0700 (PDT)
Message-ID: <c44c8c13a91a695d758154335b38488c71de1d1c.camel@gmail.com>
Subject: Re: [RFT PATCH 02/17] ASoC: codecs: adau1373: Handle component name
 prefix
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,  alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,  patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
Date: Thu, 26 Oct 2023 07:41:45 +0200
In-Reply-To: <20231023095428.166563-3-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
	 <20231023095428.166563-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_224149_999954_14AAD66C 
X-CRM114-Status: GOOD (  12.18  )
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

On Mon, 2023-10-23 at 11:54 +0200, Krzysztof Kozlowski wrote:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0sound/soc/codecs/adau1373.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
> index b0ab0a69b207..3582c4b968a0 100644
> --- a/sound/soc/codecs/adau1373.c
> +++ b/sound/soc/codecs/adau1373.c
> @@ -834,7 +834,7 @@ static int adau1373_check_aif_clk(struct snd_soc_dapm=
_widget
> *source,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk =3D "SYSCLK2";
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return strcmp(source->name, cl=
k) =3D=3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return snd_soc_dapm_widget_nam=
e_cmp(source, clk) =3D=3D 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int adau1373_check_src(struct snd_soc_dapm_widget *source,


