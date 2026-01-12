Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D158DD2503F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ph/Etg5Sr0NTZwxuYotbPw8N7SzYppkUoPjd6ftsrA=; b=Ek9hymYulI3GhP1QIywxVyVIsV
	cSTXcOH8auxcE5mt0/+6RwCsLwMB+PmUVNnk69cexyvMBrvGiZ14mFHq3+g4sRTg+eazZMEwewpyW
	SN/iN/41QhNV1VpEXWAYBTDNQS9svQ8XAYGeXwmIu8aLF/ecDAQy5ptqV/E42VtsSbSGxoi05HvR8
	Nl0ET6DqLImT1oXxi3Y1IlG3BH5gx+sbJcX+/+o8KtAcT/A+9Wqjqj7kn4I/ij2pQ3ywnr9cRh6Yu
	WVwOEt6rCWEAjK/KZPjUjbuZKQyPb+WUpkdzYTqJ/iE23PfesGsEHq954rHWNFR3jiE3BvyB8HNgf
	WwUUhO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCDX-00000004roo-2YXK;
	Mon, 12 Jan 2026 07:19:59 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCDU-00000004rnL-24WK
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:19:58 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59b67388c9cso7646562e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202394; x=1768807194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ph/Etg5Sr0NTZwxuYotbPw8N7SzYppkUoPjd6ftsrA=;
        b=ZJnN56CQKtAOWtoBsf0h6IIGScTeyNN+ByjI5IKHPAklu5AocR19tW9hu3aC3fvqv1
         Vp5jlP/+Ut16/oUiod4oMQb+X4tPk0QrcgwY969/5N0TwPwhnSi8ZBUKC6sFIgb5dK1W
         p7h/BR0/+M57XxzizRrPxq1OXHUns632sNVFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202394; x=1768807194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ph/Etg5Sr0NTZwxuYotbPw8N7SzYppkUoPjd6ftsrA=;
        b=KxBkFjGjPE1EWES7dEjjf0yC2oC86t+aNs5i+NQulcvmspFKBnV80qaAlkVQ7kyq9i
         lSuiaJzWtDy1hMvuO88OZjeDZlULcWqicSe8wuEuEHDkSt13IM6nXJWLiXuGkHieWzHj
         Nj00bHgTF+sVGeLJZ0Rx6aXWEIMV+ZUkC3Ln2vCNKiebXLTk/Yk9D+PKzPIMdAqZaw+n
         efVbkT9SLaFZkQlpX1NqfcO4pgfzvS08grHS3vgEFMgSI0WA7hKtmtV+wj8HDhdq43Oq
         Bt2uwptvVYft12CgahEcgLqKC5B+sdS9HkrJzeVMWhTN7fKuZDcgawRYx4KpDIP04rvw
         /0Rw==
X-Gm-Message-State: AOJu0YzFAmqkw/YuoMTR8bqPnIBNbj5+HcTpzUG2/PVPAPVoiXgeaqQT
	09XLaLgoH/tyLxV/5z9dxoyie27QEfWx7U1i3ly2/Mzq0cB0R7GqGt+fz3Ozf4TAaNDvQMTqrbP
	S3OQ/dnAYbuqGlxlZsU0b/bH6YAV4miacdi9z/In8
X-Gm-Gg: AY/fxX7njmTQlzP9UTNbZaoHv+DJZf7S+sjArUtfd558Hum3tF5t2UTvDcpH+Z+Crer
	1KOv49bWTxr0cdStgl3s/uxgXpC4LivvMN0zwpxElM4GWI11prqcqarWhGfKNnK2qhg5b8bsuc/
	NfP8SHGLNmsp1gJjA2lOvQnZgczsO+mgaDRaFmG1TJZWamviyVENkoZx7/SnwjpgPlKYwdtzDvA
	CdTahiDQ71SsHHI8HmMd//gtEUSlUZHzrGlGbbMSVlJJdRGc3xxFilj5YfFM3V6V+hOPaJC6t9m
	f7IAwv0MR1eqE/hVMUPnTFnY
X-Google-Smtp-Source: AGHT+IG5kl0ZwX10KZuxnttOREwQR6GL+Z0E9J2N56/uwpX3vjlGU2NciA+itFAj/Kp8QX6ABfil/wuy6GMvq1S6NvQ=
X-Received: by 2002:a05:6512:3d1e:b0:59b:85ea:5a6 with SMTP id
 2adb3069b0e04-59b85ea063emr2341817e87.49.1768202393448; Sun, 11 Jan 2026
 23:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:19:41 +0800
X-Gm-Features: AZwV_Qj1Q-eovEPEvCaFCrkejPJ97W98r-3qCY7fgi6Nqe05K80d4_P2-yj-wb0
Message-ID: <CAGXv+5GEdqgbr5yPJ4_7gBKsg8=PkBvFCvarp+=Qcsq8kqWR_A@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: mt8183: Fix dtb warnings in
 display graph
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_231956_597794_FC56C175 
X-CRM114-Status: GOOD (  11.81  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

No commit message?

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 119 +++++------------------
>  1 file changed, 23 insertions(+), 96 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8183.dtsi
> index db86e2bd0c7b..676f8ecd89e2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi

[...]

> @@ -1904,9 +1880,9 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> -                                       reg =3D <0>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <0>;

reg should be first or second (when the first property is "compatible")
property under a node.

Ref: "Order of Properties in Device Node" in
     Documentation/devicetree/bindings/dts-coding-style.rst

>
>                                         rdma1_in: endpoint@1 {
>                                                 reg =3D <1>;
> @@ -1915,9 +1891,9 @@ rdma1_in: endpoint@1 {
>                                 };
>
>                                 port@1 {
> -                                       reg =3D <1>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <1>;

Same here.

>
>                                         rdma1_out: endpoint@1 {
>                                                 reg =3D <1>;

[...]

> @@ -2165,9 +2092,9 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> -                                       reg =3D <0>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <0>;
>
>                                         dpi_in: endpoint@1 {
>                                                 reg =3D <1>;
> @@ -2176,11 +2103,11 @@ dpi_in: endpoint@1 {
>                                 };
>
>                                 port@1 {
> -                                       reg =3D <1>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <1>;
>
> -                                       dpi_out: endpoint@1 {
> +                                       dpi_out: endpoint@1  {
>                                                 reg =3D <1>;
>                                         };
>                                 };

Same for these two blocks.

So all the deletions are correct, but the simple reordering is wrong and
not needed.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

ChenYu

