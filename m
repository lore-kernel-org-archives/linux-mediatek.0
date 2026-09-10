Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C2C79FB7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 03:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=; b=EaC1+8Or+Vw/YA23SBBSACsBNC
	4vhUIljZkG3Uz8qhiy2Umw3MxZSlhJQXLOt7RgxuP6Nox9fjlM4mvlj5Zvv8q//A6Bf5SyPpTY/Wi
	bzVOq/J5e6PAD89vtqKkpSKjo+VqcYh68sGNQpQ8CTJhSshwO0n1J9I5ViwGFdSi93cDYo2UVOzDh
	7II/TQAGKamq0Xb6ELh2ZtVk8Uqi9G2ky1FmrlYZzT0FhwnJVae1ZAH6rHVhTZAxswkPoz6jh5VSE
	aY2KguTQOq4TBYEDrWTq0YuAzPmYFdAvR5WHqyZZCK5Sx5RbuVY4hWKk19MP7qHCLUe5e5QeO47QI
	rLG8SdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vbu-0000000DJI3-1QvQ;
	Thu, 10 Sep 2026 03:38:02 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vbs-0000000DJHP-1ZGi
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 03:38:01 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66fcf87897fso6032928d50.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 20:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011478; cv=none;
        d=google.com; s=arc-20260327;
        b=EhAECDgLUJvqSWtXpH/5budGkYdSIRnT0J4OjyyuUcV1SBdhLurlhUu8G1C9BLRE6O
         H1vH9wnFuFdAxzki/lYc4H12gN0j5JXAArkHSySn7TRyjMpMlTweICB9rrrf2d6ZIXMz
         canESVLxXDCX6UP84qUN5zkzb1X+z9WnQKpgTbRyaXDGblGhuma38siLEzDsmKJo5Y42
         JKIvWDFOF50WfaZdAytnV+x771DRN1wRQvkFdpHJMqkFOJwTHd+W2hKlrZyAWxnL5LM+
         ZG8It4BK4p4q70CE9aMSqqGRLvKBjZaY9VdKrq3BmNwDDDkfyQtQtrcEy5zPBbOcwHle
         BzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        fh=nPU8TWIQ2m7uFlT08IJpP5Fwy3rHoeqp2N7orzlOKYw=;
        b=qUGHohu4dm8yJh4AAEZCrv+SGPDqJTGFfazghrnKn+gTLVg+AZGUBdMnc5gSKuRTaA
         cadSEJ7G/P39O1XaenrFJLL8Cce0QBiAEio5w2CnIumJKmVD8g5+9pWO2LoMrBGx4j3B
         BTijc/72DunXAO2jsqGuUZxGaSBvaNlyvwSEYOysUrJJE6TggpSuBoI7aSVIJbry+dvg
         bVAhS4WQtxHkjXjw8lK7L8qbwkM7OuCqkPrgZ6SzJT8aOEiqgXz9smIh5WCLogDpstjD
         0FhGYg+zzUWCdxXOE/IFm1mXk4zOVQGsEO1KjocsZXBOivKZe/YDFzniC8YzXBf7ScVk
         dZxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789011478; x=1789616278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=eC+ZgzkThB+Exaip8722RheQqzrkZHf6tRdi5CAN5wrkJrpaqMHdpGQsgSCtT791J6
         Fcts0k3Wa3JKw1rL65HYibglLQ0ILxkIJWkkocWlQIDhD7NqqMkp61OrLlfNKZsGPY+B
         wVxgc0iqBeunlv/Qxv3QWFzygdbKdKTHbpcA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011478; x=1789616278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=I37LDrOstINVBD0q7NXIOqzAxLRA1cwwyYT6TljAyFODd0NWyXyrTB32dj68/UC2e3
         pNZF/4YMyk3VvBePncaL+c5bCIWwDGK1C/Xsgsw+TAuvc1S8JjwD33Por04nZ9FgCHRJ
         rx1KUzmoV3WoeRpAaXszRk0XS40KSPA8Dg7nMVMVIf0ZkHnBupkypIhEhWiXyfwpd+bn
         ABwu67yBsVCHYdUuAlmJfjm33j3XTaVMJ+468iEmMEP53MkwS+8v/6TKFZo7ISIZdCb1
         PV+iiM127aojxcV9ZTXs8I1K+jkoRmi+VHDZUvfVvzx4D07zJRYqwAQu30gmk/Hp2ZA3
         lXyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZoCz3wt5pH2o7BA4WM0rs8688+cYQRXGpv6p5KXeSg/ZDH88Q7qz4C0+4ptYdIxykgbY6dGG5InJcud+lfA==@lists.infradead.org
X-Gm-Message-State: AFuF++ksYzzW6k0FYblSsx5V24EUROQs+ENNkEh8m7WJCzDwXo0jpZwG
	UZawOfWtkMHgAPJGl/qjiX1MhzJkXqoG5aPw0l/9vh3p7NnaOH59SREhhJ38vU25fkb08JNWh+U
	XjdpjQSiqNd6ghdF5UlkuywoZgXAOkbuohXW/XpNs
X-Gm-Gg: AYBFou1eXHKUe7dNsbi598vnYr004nfITEMxE3A9Aixq8bUqTiB8UYc04qCQ55L1mHf
	jO0BRaSg591amWjg2IHcbJltrrO4C1e7NKGVmljNQYwpBx/rWi7ECoGDnCb9oP4vutA0sdlQ/3R
	OvfO/0cZGGTn8Csj/Ts9/KS8UYygb1jd38f4fOmuX1kxW+uw43F2pechgITe0nrA+0N4Yi2JO/m
	B4SvTGwy/wt6BEozLU+FRZjP4qLxKhg3vjzXUx5LKppvzBBn9SvVYsqRortWtXjWSsT/DoQfF4A
	7vqQT5muKi0d2rI740seQZynhpWWG5zB7I+8BOmPd4PFX2xPPyq9AiSlUNRha8w5UePXc8/U4go
	px26UV3Lj
X-Received: by 2002:a53:ad06:0:b0:66f:c1bc:408a with SMTP id
 956f58d0204a3-66fc1bc4792mr7713835d50.77.1789011478612; Wed, 09 Sep 2026
 20:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260910033000.15926-1-kmehltretter@gmail.com>
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Sep 2026 11:37:47 +0800
X-Gm-Features: AcwNN1XQH0BdJFknR3BDHpgbH-5I3YT4kBpqbiKb-tpDhIaqt5ymHV136QVN-oI
Message-ID: <CAGXv+5E7AjJLxKeq3TetBJEsPyNuKjyn_bSsQccg4g2g6xR-pg@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203800_419905_135151C7 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, Sep 10, 2026 at 11:30=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>
> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
>
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
>
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset functi=
on with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/reset.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>  };
>
>  /**
> - * mtk_register_reset_controller - Register mediatek clock reset control=
ler with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset co=
ntroller
> + * @dev: Device used to manage the reset controller resources.
>   * @desc: Constant pointer to description of clock reset.
>   *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>                                            const struct mtk_clk_rst_desc =
*desc);
>
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> --
> 2.39.5 (Apple Git-154)
>
>

