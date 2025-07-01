Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6456C7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=; b=g7DcDFRfsEuXhgdQ5S1WyepIs1
	hCJtoHs2M3/8L7tTUa5hLm6A/us4cInySSalEOXDM6nVk5BPaj3mc+On7ChHl4rKfBt7I8trAu7PM
	P7bQKo2LxXGlwrwhBB21T4tagsvQibpEul4XIfHogIai76lX2sMmduOyEEq+zyCGxRbgd6V3RM2da
	UNcnIgWry8EFCVqSqIvVYU7pQkN0LyojeloVSMLrnazTXG06v2phW3Da3luBi/zamyyvLKHPQOZ6v
	9Vmmx2KQNYLi+kSZh8Fhe2YOCZLzsPvb/CcKGg+XSSfppSJjavMx5bb8eI75GIOEv2y/UcRN1sPoA
	/eKcKrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXWx-00000004d8r-0bCh;
	Tue, 01 Jul 2025 09:43:59 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWX62-00000004Zz7-1w3U
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Jul 2025 09:16:11 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553cf020383so6045783e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Jul 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751361368; x=1751966168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=;
        b=D/oiZY45nOtkjcP045jcL0HorCAXxY300sKHhldsYRf7D3naM2//zCFuyaL9YEMgU7
         UjfdYOklXGR+w8sWtHD3n/RtpTvAbZCIJX126ryH9RrQkpEiV9OPZ6g7dOfY0r+l2P6I
         hquMWJemry6wXwGfqECwQksz3c4RCW4qdmeRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361368; x=1751966168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=;
        b=V4UfHZdQj1A33iPELqBUEkM4DZvVxsmsEzoZBp6rxhvdyyzEAOypT4WgFicR2V2YL7
         usiJh76i8EtJPPkHFQBrGQk5DtaKEZJMz046q3LI7xxF1WkKT8aNd5tRGXiITxASpVZd
         3gA2sdw2yN7ytGMLR6KQXlZkh4OUwqR8QXU9iJWJu/vdrjG49IuzMcx1WGd6G0sWJvte
         20EFrDFNb+J0HXSTjD4k4z5AH8dLxcKgxvmWJJL/bbJB6Xl+HKuWgmvdWyyZxVYNXgHz
         pIeaaq9CfiCrs42BTW3tXhoI4qDR+YETLmHuXRj1fnuKjOV1fAxmYrT5/Ne6oPykd7g+
         oNIA==
X-Forwarded-Encrypted: i=1; AJvYcCX3DtV8WVKmxHhM7Bq7IToank/In88OsinZ+lS45tkEVk9OEehyAJEvZ1oFRi6iaGWqu52+LDpdudQkAsE0Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrqQi3m4skA1WTSvhcfIeJF2WqY3Vd438Kkd0IzVtV8q3TpEqL
	5IcC0fwDNE9QWb/zqupWUYpL1CkzMGUVuy8kPvwBPzeYYRIQ8br2g8D0icpZXkUUEE2O0kzGOI7
	2f07UdCahvjaNZ4bFR0tuSnlkcgORIkUB+Oo72GWM
X-Gm-Gg: ASbGncvLLatWHhJIvZmUJenElRSJrgltHKVpWq6FHB0hjXtldEmGNIKKJlcAI5fesyf
	IXNRfbrBJEnGD6oBigKOBIcoNltkTNiVqcuzeZjTv1rlJOVDNt5UGc7zM17vRgbmeZwb3ZMzw6D
	duuB8070a99pPBtaEN+AYmRHgVRHzbJIJchXzS3Q6hckfilX/rAFgG4Odbo2ADD0F0PcWLRMI=
X-Google-Smtp-Source: AGHT+IHBrDnDLJq/wJvKGLgxQgDrKBxEEuyZmoLKMExSbzXgm4RYBgKbsnJ/qHE5B5f1OiZ34CTPYU5ibJdkRjsWKOo=
X-Received: by 2002:a05:6512:3f1d:b0:553:aadd:1987 with SMTP id
 2adb3069b0e04-5550b9ee8a2mr5372873e87.30.1751361368119; Tue, 01 Jul 2025
 02:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250610063431.2955757-1-wenst@chromium.org>
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Jul 2025 17:15:57 +0800
X-Gm-Features: Ac12FXxeyUHnDez8Q8D4O-LF6jWdCG451UjT4Bbb2Ps3qaRoBzaVTLBPU9xxrc4
Message-ID: <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_021610_526252_77409085 
X-CRM114-Status: GOOD (  18.55  )
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

Hi Angelo,

On Tue, Jun 10, 2025 at 2:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
> patches. In v1 [1] the change was made to the driver. Angelo, the platfor=
m
> maintainer believes the change should be made to the DT binding instead
> [2]. v2 adopts Angelo's argument.
>
> Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
> with no fallback, and MT8188 falls back to MT8186.
>
> Patch 2 updates the MT8188 DT to follow the new binding.
>
> If possible I would like to see both patches merged through the soc
> tree once the DT binding maintainers give an ack. This avoids prolonged
> waiting for the binding changes to land and uncertainty about whether
> things have fully landed or not.
>
>
> Thanks
> ChenYu
>
> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.o=
rg/
> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@coll=
abora.com/
>
> Chen-Yu Tsai (2):
>   dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
>     version
>   arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
>     mt8186

Friendly ping. Please take a look and see if this scheme is to your liking.


Thanks
ChenYu

>  .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> --
> 2.50.0.rc0.604.gd4ff7b7c86-goog
>

