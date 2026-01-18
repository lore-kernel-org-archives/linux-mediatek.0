Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE1C9830C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jan 2026 20:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=; b=J5lEOlTpSNFgHgvpPPgwVYQowO
	/91Q5wnKxkW5t/8K3yfy5a3i6KtMa7OPXpbu0emv0Dgmk459liI1Q1fxOdBIN06OfLvOGGIMv3Lp+
	XrXVoto9ZqyA6lCWIqsv617yc0Bgm8HiBJmRvWXl9oOT4Ciypi3DMhWzk7kmh2O3hQkNA9Iun9o/S
	418SaVeN5alw/3DBVTMqJwNS2xux+VXaYpZnKVNObfrI+/FId0ezMxTpARVbdf8VdZYgf5qxAkrqS
	KrkiwaGPoEfOuSk+98ny17bwH6UipqJhpxDP2CPaAecAjK9vWNG2FeOMNzMvVEQgTchqmaimKBAlb
	+fcSaayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZka-00000000xI3-2zEi;
	Sun, 18 Jan 2026 20:51:56 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZkV-00000000xGK-48GC
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Jan 2026 20:51:55 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-45c7f550f46so2262474b6e.3
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Jan 2026 12:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768769511; cv=none;
        d=google.com; s=arc-20240605;
        b=dO3f3U3wNBqPHJvZ8MOJLw5kCeT8FiZ71SguymmpeQ6O4iW5iQqB1tKqP2FJz8/SfM
         bMiwI0Vga169FGTq5MGdrLl72/jQceLAYQkhZ0xOdyKaYt4vegKyU70GcjRP5NxpfbsA
         QKNFskRvUf1dV7SE09xj/p1kvQ5JdI/O6SZUJCEVLXFQkJEOYhU879wXwxPI0iThDwKO
         grv71VaqrMOFBWrBaP8OrWo6AcIkLkR6sg+OQGD6k8kENTRQNCdUPbTGbBaG/l25KDQO
         JypvCL+HLaHi9Ai/swEnIQ6xLV6HkNr8wRIgx4yskyClvMsyIdroHiv5mkFW8NUReAY1
         gpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=;
        fh=GcNeDytTQKaOTlK44RXCTwKRJbvu7o4tTqDfoU3WxfM=;
        b=Sl/P4p4nLiBOWit09FFLxMXfDhwwQ0V9pHeBs5TS5uNeKg8+G1gRRHUB++MbByIkQM
         5yONAI0nZEvdadGcGAYJTtiqOTImlQoowKL6MBks4HbhPJocgin7e1YbDE2PV6IaWpw1
         BAnSFaCw7+itOB1ZWTsQHSlDHFtfo/HCnlR8a6o72V+uqO6jfTq1IAEww0at4NiPLM0M
         q96UWatAF+mSd8XOPSvRh2FBZZH0J1Udvez1JbVrORVxTIwUpZcfmZ9/9HB2kXwnPXhA
         L3qbUsGJ8Vvn4YY5hUk8CcqJvr3LULThUH5f6V95eMhEzBRtaArdwNUpiaJoCWgpFgXg
         QcTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769511; x=1769374311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=;
        b=PKljx3GZhnEph6nqaMIwnyRnEPz/5jOyg3jUdPMpeHrsH0dO1aGSGNxNfk18qWzKij
         EAmd90xircvBEjN66VOw0oKiJN82UGcfD2W1YHkd4WCxgs3h9an6BfdMegedelYIS9J4
         VfNYffxcjegixeM22feKQHlPh9/G+R9UV+vFitHtr5Xd6LawIZBVpXcD6UjB89FgG/CO
         Dj8I3hvoIltwjahtnl11JJ2BooqU7WV+T8Y6Pzsvpljn2me9Lz3WdnlvxKGhrEdu8qle
         RhQemmIFGLZAlufU5EViiaimusx41Kg0NXrG7ReVSb4Y/hsmT7YqfxHShnvx+8M3jim4
         GZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769511; x=1769374311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=;
        b=NF3V0IDv5ZhLr6MXx60B6cotgYpbL+qbfmO67RAb/cw05KfE4re33VvePRq5+8obui
         wBrReUa0qgnoPD3tCYQXc3DxP87s+5kcS/PQiuEC1tHp0BwjZg85ckpe7Eo1MUZdJfXu
         LkspZCezpj1yR6dDsfZO/sx/VHNQmIFVoJaxRV8zc5aLznHaX+U0gYy3P5fU/r3KNMCx
         oQlKPNjH+JkrHVTx+0jMCZdv9MNXvEJ9k26FrcDAJGlZ5U+5okYpc/bLq7rnDR/f0Dtv
         1VHxeM5k9B+SceWZ/pqVZUSJ3jPimE70gFmO2GlskdIOYsTSMNCmR/zVJFGCFOztV9kD
         EIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVluVTbS7Kml4IzQuumZ2jidc5LJB3hG03HGRMmVdkWS8zV4n9fwY7V6GuWs7ekVl5x24pniA8aGuWJk9TSTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywko3o69F2GJNsk1P5FUN+kWEJYs1KE8xEFUSU2fm3aiyfqt0gH
	HmR9f0WQRPT7eaWMy3gb35nrfQoTBHXBW023zcoJsHGrnest94j4LCsfgXSAdBJxwHxgLmPLDsm
	VhKnw1ivkWh7Pm2i1rcUScJiXDW4DPxs=
X-Gm-Gg: AY/fxX4QmXaIiHlkETbGS+WV0rUcLJWH72mU5MO6LQOW4xpLzzTIEyXQdSr2zuxJ5HQ
	jzlrr4Gi5yuzDHSnrXNW0FuiJ/zKOz3S7xzAApNl6AMoFMgzwZQJRFcnqwwzIwAyGCNnXab2fql
	bagAAKm2mjNPWaJ1j4BDVb9I5SA80TAgk+PttEHkMHQorzMj1szVh/FK4SoBPOOQlynZw50lNS1
	qoH2WTGZtBXK+sfyLHf8oRmP4IbG7NhHrNbWTtRs1/BBg09cPlqjBGVuFoqcHZUpKdNx/Aa
X-Received: by 2002:a05:6808:3008:b0:45c:8045:89a5 with SMTP id
 5614622812f47-45c9bf6af97mr4658298b6e.21.1768769511004; Sun, 18 Jan 2026
 12:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com> <20251224114452.141689-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224114452.141689-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:51:39 -0600
X-Gm-Features: AZwV_QinxiGf_fn13PxcUNz6VuDVYig5FVOqXyYeBIQ5vuPNPU2n6zlYdxCF0h4
Message-ID: <CABb+yY3O7pqswS16qJx-Ud_HHxdkboRDWy4qBitd59wM_O31tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: zynqmp-ipi: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125152_020065_CFA3AD26 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, Dec 24, 2025 at 5:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqm=
p-ipi-mailbox.c
> index 967967b2b8a9..42d2583e44ca 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -904,7 +904,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_=
pdata *pdata)
>  static int zynqmp_ipi_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *nc, *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D pdev->dev.of_node;
>         struct zynqmp_ipi_pdata *pdata;
>         struct of_phandle_args out_irq;
>         struct zynqmp_ipi_mbox *mbox;
> @@ -940,13 +940,12 @@ static int zynqmp_ipi_probe(struct platform_device =
*pdev)
>         pdata->num_mboxes =3D num_mboxes;
>
>         mbox =3D pdata->ipi_mboxes;
> -       for_each_available_child_of_node(np, nc) {
> +       for_each_available_child_of_node_scoped(np, nc) {
>                 mbox->pdata =3D pdata;
>                 mbox->setup_ipi_fn =3D ipi_fn;
>
>                 ret =3D zynqmp_ipi_mbox_probe(mbox, nc);
>                 if (ret) {
> -                       of_node_put(nc);
>                         dev_err(dev, "failed to probe subdev.\n");
>                         ret =3D -EINVAL;
>                         goto free_mbox_dev;
> --
> 2.51.0
>
Applied to mailbox/for-next.
Thanks.

