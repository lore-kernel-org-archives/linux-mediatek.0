Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F997CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7rbauSvwHuIXCDkVEi2kpfzA62UFWFPrOulviX5FSg=; b=wmf+8LHTCarUU79geeKUkTvCZr
	ZsOk7achf01m9b6vk0gn6uXHpqynmsDlDtSgDS5LJvNSFyP3mkyp6pxYGLz3EoAbUG9j7JQW3MjG6
	A5kS6ND+io2MGwVtzr2f25kYa7oTa6sx1ulXUvPLHlRriVyNzWWzuRjHkFLh2kRSRUYPCte8kQZG5
	qL7MCjKdkSf+EnQcAB5/P+1vSvnjs8nn9JVA7/Yl7THjkMFgpzXy8a/wvR6Z1tZCAjyasdXXOncrr
	Q0ieZwnD4Mktp6dSt1JtUubdHW9gojmO1Gd7GMOdUseLQnYhbO5qPSG0DyW4ftpqOr+BRh/p+tAbc
	iQsoFGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7TV-0000000BfSo-2xmq;
	Mon, 01 Jun 2026 18:34:57 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7TS-0000000BfSH-3lQf
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 18:34:56 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-137e75bcb5eso1603030c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2026 11:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780338893; cv=none;
        d=google.com; s=arc-20240605;
        b=kT5jXqJJ1rFwLIVau5F5Ym+YFD5KQ72mAVTcK9y9hN00kZgxHUVoch4CJ/RBb6Tk6R
         MMaJ034zAasuR9r+g7zXFw6Kq6Pr52UlP8X+gRohyq1Y+0ELjz7iukPvumg4GuWMRKjk
         pXTsH79Ok5ietP+gcIBBP8wb4oeYnvwMt/tw/K+fyk3ucniKB9kIrhNWwJYUNYa8PAJQ
         dH4lS6+gk9qQMyLVCF0bl0L/O/ZGXL47x3h4x9WOnH4axblUM/g8T6KIcOpIqQXJMEIU
         hQ791wkm3uFdKrVnM0N9w0BUoq1POafxuw9X5zR4Tit8em7r+QDGqzsAaxC9DyJDUdkl
         Ry7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y7rbauSvwHuIXCDkVEi2kpfzA62UFWFPrOulviX5FSg=;
        fh=sFQhhH2a8iPzL6HvTjBuO3gm5sq53M02ULY+dP4DEzk=;
        b=KzyRlMU07QXhn3zr7RABaMVAgwF1ZNM5694YDwhy7l8+OU24gaOAUs4cyIJzcBYfE+
         h1QD73Id8780IR5t9j8VK4wrq2NpPbh3q3WrBte3dbPeeiyE+EaJ+PvG5whmrGaDIvWm
         FvB8diAv96mankqXdDRtKJFYvf/+/Vl7U5RBPrqPTbDEloLzjFvJf2NdOSP/ljZJXSzj
         EyMQr4oG8Lq48OG7u94lCKXQ/5q19RK1iXgZ6UtzH14Ej/yewiQV4Vqymb45HTQVZQFS
         I+tFdNNYuuIzkDRQSOxzru3WRUw+AFOjMhioAzFRwOTGZynQQamTIzF+WVknMOHnf+41
         +k9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780338893; x=1780943693; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7rbauSvwHuIXCDkVEi2kpfzA62UFWFPrOulviX5FSg=;
        b=tiIlsw6CM6ZJhs2Sv1K61V5J7pPQD3WtE7mLQwxtotwZEMaKnvgQwi2ekdxQZmm4l7
         fnBmt7AikyhluIh89VCOMMo9JrIPjNaxcDG3VUIn29ftjOi9cgxyvlzQIl1iDJpZ6W4c
         ncwAnyoO7+X6ODPXjnfU/GZi/gGysbQVXRtZmzY5kAu+XQJtNzdxZ/MyBWqGagfJcROE
         ZV4fUIhF6OpvTHVqO2If4M4PvLlQD4MXPn4h/NenfEwcTg2DRdXahA+rU3C5zXHskdXw
         Q1D+wa9njKfq+l20FdYvcu9QenCMABqytOx/i5VYjVO2/VDi4vHbc2HK0E7Ru9SNvu5a
         MDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338893; x=1780943693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y7rbauSvwHuIXCDkVEi2kpfzA62UFWFPrOulviX5FSg=;
        b=Df5Rm+As7KfyR81Oh622zs+t0BTRFoqcqiXHL2qDyQfTx9iurO5I4kpbVGbgK8CWqH
         Durr0hEjixjGdXJWaByf2EF2wMJisGOdUMtNmHBY+NyvEYg8Mesqqu/5oFxAFukQB9j7
         gGE/rvwg9ZXGEMdQ69fe2w9s9FHDuyTfHoNZynDGctkl/Zgf1dE9ijVAHpzcYFQadWVV
         kfYrUTFW+QQja3Cl72mGzDBDoZGAz1JvwFSrbmNoyCYwYFrnD00ZuLZqQHGWOx/cbg8Y
         /Il+q6jzK5zXn9AFH8QeNIl9NAUJ04+VvDg5w/xO2hpU+roUTyZLUnvaMx/FbC1gQ0Jp
         9I0g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZTXsyInEPg7kiVVqD7e7pm6hukQwtjn32kh8RIHW5I2188536Igoyie6Sx9q8y+MhYX4iLPRBQeoSAzV6Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtrm5BQYXP+SoDEYUyWy5/fYZuRUsPx+9F/D950Ilksn/6bt77
	sTJPNsp3HiD9G6YTMFb2ksi8E8UXZFrbyCT2EK+wmeD7jNW+744mvJnt1Rtij9DAjPw2HzP7n5F
	BArXdI5GYhIsFmMblTDPHuDvakvM5PjTkFC0wmo7O
X-Gm-Gg: Acq92OGDFmMm6LnvmbnvFhAL6UexKRtlRkDbDrocI1Hx4ebxSoox70E43UjC1TZJ+9a
	K8fzJrJAfDf3IpB54n+RJtiROFjcQmGM3Y2nIrR7YOsDyXR23JyM9oWuQLgG5RH+pwoD0iVpjrJ
	8BwuZTTVEy8UFPPABPMYEWCllD8e1/Dp2pLmKslC+ZurJ6D6yv6LI/SccZtqj672gSIK/VClxCR
	uMPhNJfmCi9G4wvHaYOwsC7uQULbEOZ6UaBV0mu4NpfeQ7swx7HBfkImS0QQys3oaxuTm2bEO/Q
	sLMRvfcHeuXuHFDyMRjmiGc2Lm6SjqF1H5MT51zwftntE3u0l12D2Z+MlGd113Q5dpP6EU4nZ9m
	jU7qE77bGRCoG2v6S56ykl1bZKigLsdr/iN9/q9TwKzNAEMDD1MTUzYphmj05
X-Received: by 2002:a05:7022:f8f:b0:136:777a:1dfa with SMTP id
 a92af1059eb24-137d413308dmr5412050c88.10.1780338892494; Mon, 01 Jun 2026
 11:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260601113640.231897-1-jianyu.li@mediatek.com> <20260601113640.231897-2-jianyu.li@mediatek.com>
In-Reply-To: <20260601113640.231897-2-jianyu.li@mediatek.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 1 Jun 2026 11:34:41 -0700
X-Gm-Features: AVHnY4KRn1ya_dpCxrGptmMZXiQNsfE9yQOH9C6V_CTgbsPugUKkRnBB6wNVBvk
Message-ID: <CAAVpQUCbKQFvz6wj_REoRvWx89r4x7=9YE1nim0XuVxMzWpOKg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] af_unix: Fix inq_len update problem in partial read
To: jianyu.li@mediatek.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, black-ch.chen@mediatek.com, 
	ivan.tseng@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_113454_938715_CBF80CFE 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, Jun 1, 2026 at 4:37=E2=80=AFAM <jianyu.li@mediatek.com> wrote:
>
> From: Jianyu Li <jianyu.li@mediatek.com>
>
> Currently inq_len is updated only when the whole skb is consumed.
> If only part of the data is read, following SIOCINQ query would
> get value greater than what actually left.
>
> This change update inq_len timely in unix_stream_read_generic(),
> and adjust unix_stream_read_skb() accordingly to prevent
> repetitive update.
>
> Fixes: f4e1fb04c123 ("af_unix: Use cached value for SOCK_STREAM in unix_i=
nq_len().")
> Signed-off-by: Jianyu Li <jianyu.li@mediatek.com>
> ---
> v2: Improve lock usage in unix_stream_read_generic()

For future submissions, since this patch has no change
since v2, you could carry my tag from v2.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks !

