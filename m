Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1D0CD98E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=; b=dYEPkKy0oEO24mlANhpj0ss+Qu
	o83Qz8laVe/a4HEk/NreUcMdAGY68jXyQzAaug78PicsmAakYBV9x2fFJ6fIXx/za6TMhkOQOi91h
	bpvnlyHQGCRZEra5Z9MMvHrrVyOJlmi9hN/7IodhcXiSHjrp7PDIEoI2B2FtNm1I1pmQ9jn6f+iU6
	QpFWwp1/W4RCmr+ne9MRIzk/H0mim5n0jPADY+obLtWjiJy3ekZDELn9sQR+nt1Pv6cGtLpJAf4q/
	GFrknNixg98l5pbA+G/PBNhpLQNoElIGINuFVyTAjU5LObrYBF/nfqm9f3ITDiBfyX3xVQwzyafQu
	Dx8L40+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1wb-00000000VA8-1lKq;
	Thu, 18 Jun 2026 01:53:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1wZ-00000000V9P-121y
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 01:53:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-beeba001887so43698266b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 18:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781747600; cv=none;
        d=google.com; s=arc-20240605;
        b=ACPwDH5q3PuhVkuDkJgOvDFAgfqJZaQl5dB0TaRRRfv8K1FRGGnDcG0FhD7n2MxVu6
         V5UclKLeqdVAO/+akbeWLFMCXFCAYM3QkwQuAt3uGScnuLFAq+rqcXbd1VVpMcf5tNVh
         TtdZQOjz0cjLpnOTolcA8Vsvkq/p0R8sYmtjYsl87amfcL8ByQUFFaDKvIn/eU1GHV2w
         8MMx13O9lvPTRkyf8hnGE3sevaKLMRs5mViNqVn5Ghkk9hCCwrjEp/oT/H82JvqIOaUr
         FlL0IQASoJtX2EZj0QuWdmv9b/Hhdjo9dFJmNVtFzua0ywS5L63DyfRWDBphRi/sNBcm
         Z7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=;
        fh=dckWqCpfPX/8lCgzsAvFv3+YhS4HQzDyroL9sfQIT70=;
        b=eu969N3d62w4Ta0fWfNhKHXgI8GXMEmGXC2ZxEykVIUXyJxO6wPWI6ZjW6jX/kTo1p
         SI5brN6FfZPoQQlDuYxrFjuE1HxocIgtiqrVa0gdrOVUpv1YkjyccPifjVrrUXPgkMt7
         9D+Lr4MRY9P6TKDGVOh7tvvWmnKdYs02QA41b2xmtJMXcRfSV78pGaTGeJEuKtKHtYqw
         her2D1OTRqVNhcL+IR2T5D/84GPccqUxJFVWbPNyMqe8TDNK0rWtTeWe2lfA3weIW4T1
         2oi73Tv9pMvADTh6PIc8x1GzxpwepnSIVsOtT4lt8KxldPri4a/cbWub9SYquNR9amU6
         0pvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781747600; x=1782352400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=;
        b=rXNbOv1velHaskNlgiWDUH2uhOg1onVRs+PS6H7TsOuwsAd2QO7GZaTkmASVz3pNFU
         fQfW+wop3TPXllxuye5MIPJCazSzANJ206f67ddk69Tw27njmiJUiF3I4drPpTtzM3Kj
         ZMt+NrsYwe5mu+oUiloanXXa7M+nrUs1KgQ+W1kYcslGgYSqnbgSrwe7LZjwGLcxiPwz
         DetmpuEgoTaKGXhMZTDExUI8mP/VFZR+DOKxw3cdUYcXdYIfMgNVG/UA6Cyvb33kGFvB
         VewnO6EfDEZjmLX8AtW1I6vVvuXgXu4M9d/93FsDaLIfCpMMEWM4qWZks/+urnduTvwz
         Jggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781747600; x=1782352400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=;
        b=kMrX+KUuM20FTZq0FBqfsPD/r1Xh2H26aL1q/azZ8ZHxBs7A3M5kaPBdQAUtrTaMUV
         sBVwSgVUciajVkvO3iT084/1/QY9zAgJiOzCGnq+OAI/hBkw8JOfPKWVbJXynupuz7sg
         FW98rSs6UT5DhOD5fkEUJtjCYy/QEB+oZeLkFBPVoMuxrf5dZb0gG4kGFfYbU0HeKGtE
         9fWzVRAAu81ITYssFnEJ3amX1YtppGJVCHq+0ADRywzCkaBgQIs//oP8ib2dR5JSysKw
         Fc5cFZe3OTxc9rZLBWSagxr4JSaScECb0r963w3qVA45Ant+wA8+HiceuAiTdE6/UBoe
         1YTA==
X-Forwarded-Encrypted: i=1; AFNElJ+hIUJW78R9ZgIqu6p5pkCyA4mgfpEnkySKAcJT+ntWHXZRw1w4x7R52nfsjHHC+pjSrtWuFjS/w0hWb7oOaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZXBqy9EIKsW4cczyXor4uWEwBCePaFdb/dJZvH/+mju62Q9Xu
	bdmwEmlI5pKldT2soz+tbN3jm+XHRYbNcm+NRAAir9PeWEKH7xRdT8qG8NF3Eu+0oF60ucMz00M
	YFzdag+jPuKmbRxzXM7uKy+hs6FZDmIg=
X-Gm-Gg: AfdE7clOAqUewaw2N/6X7gW5NyAe/l9afMfocqMlt9Xi14pMAaVJseW+LrF0V40G6ri
	cmETl+4mlMGM+XsFG9PkFyVOf0HlBWul89I238h8ssc4QzStk2BA1J9FwcNKXHFXje7XdCXmKVT
	Vz7qUpn3mgUbs77ib3rTSUSEY35+UO8psV9iZpgfjgY4+PqrqLaYdFApxs05cfJU9RK9XR+ciQg
	Gf2rv+7E9tOv2QVP1DNvDvZsNmuD33ldjmDmkYx8VffwGTfxB4t9s38KMUfgPMH9AGPBnw=
X-Received: by 2002:a17:907:c50e:b0:bef:d3a1:5065 with SMTP id
 a640c23a62f3a-c0749f7991bmr72270866b.18.1781747600035; Wed, 17 Jun 2026
 18:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260608021048.2577577-1-dbgh9129@gmail.com> <20260617152615.GO10056@google.com>
In-Reply-To: <20260617152615.GO10056@google.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 17 Jun 2026 21:53:08 -0400
X-Gm-Features: AVVi8Cdlr_Qe6ahvFQ5QtKi7fzQZ_9bCMLj4ZxCwFjjGj2iWMUbd3Sm13KClPNs
Message-ID: <CACrCO_V24P9LqGu7M2M9b_1Y34rMh7t4=2-LjyR7ZVJcP7gn0Q@mail.gmail.com>
Subject: Re: [PATCH v1] mfd: mt6397-irq: Fix PM notifier use-after-free
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_185323_292952_CDD8751D 
X-CRM114-Status: GOOD (  11.82  )
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

On Wed, 17 Jun 2026 at 11:26, Lee Jones <lee@kernel.org> wrote:

> [Severity: High]
> Is it safe to explicitly remove the IRQ domain here while the devm-managed
> parent threaded IRQ remains active?
>
> The parent IRQ was requested earlier via devm_request_threaded_irq(). Because
> devres cleanup does not run until the probe function completely fails and
> returns, the parent IRQ remains active and enabled during this window.
>
> If an interrupt triggers during this error path, the active IRQ handler
> mt6397_irq_thread() will execute and call mt6397_irq_handle_reg(). This in
> turn calls irq_find_mapping(), which will dereference the freed irq_domain,
> resulting in a use-after-free.

Thanks for pointing this out. Findings 1 and 3 look like pre-existing
issues. Finding 2, however, appears to be related to the error-path cleanup
I added.

I will rework the patch so the notifier and irq_domain cleanup ordering is
handled consistently.

