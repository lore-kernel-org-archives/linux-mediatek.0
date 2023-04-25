Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC02C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB1vq96921s8Z+v7/sB5m0qpEYlp9sw0LsfZcq/pqeU=; b=sr9cCRjCUxEARh3Jlf/XsNC2BB
	1wcZiXf7Q8iVCDvSkN2tsJV69ekNa1SfxDwDEm5DTW7Dnn7cK0j1Z6llErI2zlkgoXm8/ohwUPbE1
	axlormeZq0PosA1d6w0T3ZZKCHzfpzTFmd4OQ387LHkVDsYsDFCKVmDLjz6RME7Ntrv9TSPki92Lz
	Hw7iHnoom39qmtnBK5f4btXu7XIY+ohnIvxRVFe341dgmt2dhvyx7Is6yLaWOwqUMsnEOJyEbQ0Hm
	24+/671tGTBsnZkNLH0VV5awWrdZ54YbRdZZsvOxx67yCmGVjWRVrlcxULE+9i6a2EOUpONOBPQmf
	yzuuKI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDww-000TLL-2d;
	Tue, 25 Apr 2023 08:22:58 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDwt-000TKU-17
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 08:22:56 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4404c674cefso1808350e0c.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682410973; x=1685002973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB1vq96921s8Z+v7/sB5m0qpEYlp9sw0LsfZcq/pqeU=;
        b=e0zftWCIDn7BTVxEmaVWy9Gyo3hq6Kgtm/4Abhf6x6VIHKKbOYbd9GfftVqodTX9Nk
         LOzm1akF5Z1CD3GiFNZqpjtwdwWTFZCGf7dkGtAfMCOOetpZIZtvKN/HOZdLnwgH03IA
         1KA9kNXv9xoVu3oNd7i2BRPKBknyO49QDYWaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682410973; x=1685002973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB1vq96921s8Z+v7/sB5m0qpEYlp9sw0LsfZcq/pqeU=;
        b=gg/SGATng6ht6ULglH8VdL6WNF204beNPhjJrHImpd1K7QWk3R/ReiWRDFwwleMnLZ
         5AiBOrLb1cToOvvAnGiIfkxKLfFMXLptiEYtH5oczv8MzaJOcHcX0IDNhmH/WasbhNNu
         xMMVzt3J+ABE7sqRYcQ8MunP+xwn/22Ukgqg+VJ+gXaY9JzamLNEFmKOhFwfXOiTEMVx
         IS+7AWmjQ06FFRE0J9Kj28U7jR0DZTCJBDUAgeptrLPVK4ZKNO7TRffMWvAXal3q1YYS
         9q8eDvgtMOa3576CkQVUxmFhDrDdziZmIPEqofHS7p6cav2HOkeT4FQ1mD6tw1+KiNfW
         Dpjw==
X-Gm-Message-State: AAQBX9fG4ilUOfcPmdp27uAYSkHRpWcSah+xXV5WwUu8HP5eHuxXZIWT
	EUoxyILhOXweTDfZttfz42Zbw8ss2Dc8GaJRAYDLzg==
X-Google-Smtp-Source: AKy350YjDblx2hofGVRmKM8ugsEwJq7JQoSpSEm4sX81GgzE8gg2Ged5AMI6wkWcpR4sjHKb4lCgfG+BkoeTdboZ6es=
X-Received: by 2002:a1f:5e81:0:b0:440:5f56:dcc7 with SMTP id
 s123-20020a1f5e81000000b004405f56dcc7mr4735250vkb.1.1682410972801; Tue, 25
 Apr 2023 01:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com> <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Apr 2023 16:22:41 +0800
Message-ID: <CAGXv+5Gr6_UnBhM8xq9vXcSJatZAq644P7SqN5byR44t3VqkwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: mt8195: Assign dp-intf aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_012255_422939_7058C70A 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Apr 24, 2023 at 7:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Assign aliases for the primary and secondary dp-intf IP to properly
> and reliably enable DisplayPort functionality.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index a44aae4ab953..b03a42fe27a6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -24,6 +24,8 @@ / {
>         #size-cells =3D <2>;
>
>         aliases {
> +               dp-intf0 =3D &dp_intf0;
> +               dp-intf1 =3D &dp_intf1;
>                 gce0 =3D &gce0;
>                 gce1 =3D &gce1;
>                 ethdr0 =3D &ethdr0;
> --
> 2.40.0
>
>

