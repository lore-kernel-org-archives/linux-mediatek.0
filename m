Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672B4C9830C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jan 2026 20:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ebu4LnVWsggvJ0VMBMc6Smge/3FP4WVsi5XQ/uYo0k=; b=C4AUJlDkxAnwWiM9ptcd+k5Akk
	cI++6ta9aOcaqAvSZtVZreSOfFTf3vWCPGmwiElgun5kN0Aal+l5A9S1ZPfHBl1jyUtNeoVMl21ip
	z8A3BWSS079Muv1K+5cb03PfthPM6DYrt+cNQsQ+rNTzDSMG+Ok9YRuvkMnXK2yaRulBahktgHTef
	egHsumt/fSa9q+yHlh091lhPKwJ0EL7jUbbBOcMNPm9nomXT18c195tSkxlO2zpbg21dAnHkBCee7
	dN2xiZaJtBTNV98mFzA+ocA2lc5i9v58x/AoaBH31K6sr7vmh6Z5YtVYT2p2cFqWZ7mfmXHMz4Og3
	d0v2oAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZk0-00000000xBF-0eWm;
	Sun, 18 Jan 2026 20:51:20 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZjx-00000000xAD-2hob
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Jan 2026 20:51:18 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7cfd2be567bso2296879a34.2
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Jan 2026 12:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769476; x=1769374276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ebu4LnVWsggvJ0VMBMc6Smge/3FP4WVsi5XQ/uYo0k=;
        b=HQYzFeJ1UpG9iOWfLP8lT9Li+Dy5zirngsMqZrSi19T+zzfaiJtHVgtxrKVUpxjnaF
         3mNPboaRv4Jm7fG7jJw+w382S7rreuqUySKmtdg0MEpG4zZCRUPmmhRS3ng9wOBAjbqS
         /GG5TopBuCRVQUKGLjD7ISOJFEKj7uQvMx+I1JCSzvVWnvbRMVdCSL4gB6uL3L7hTaK7
         BuGIBuYF/JN3oWwNrrUueMKDPyMKmSfqMBvAaNacrBV8KmOvdhbsZZ97ShZc4sOpBwiA
         DghpkUY9jwuBq9oF6agbSh7Kt0L+N4B7n+NEQIZhfN+1lLKkgLLSvuPpXOAaAWaS3xRY
         O8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769476; x=1769374276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ebu4LnVWsggvJ0VMBMc6Smge/3FP4WVsi5XQ/uYo0k=;
        b=J/mtodNnVrvNhb0BGyHqzhzn0FVidrDTwVNYuXJR9TNtBAbVoOhU5A2+ILa+wRixmG
         axh1OuwA0klIHO0t9Cr/D4y1SkDSr25PTMRRZhRNcKo7R/j7kieQwfisNizuXUhXKkVt
         1+Qd8Libd2v1SeP8ndkl6Dn2HN0G4CJEYygT9CyAICk9UKfQi2ITHEwsrLWyCxTkG60k
         3UYSstuihGyZ5dP6YKT7VomG315PhHA5102xDxCS1vc0EfcSJcSH+0d0TqTdbxeM16Zd
         7iYv+/fJNNF3wbgf0mCyF+st4sZs6moSL4vtr7OkkXgbq8FhxzHZ5nBcQ8bp9aDxtTlX
         ywMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0dH9NDPzvwUY2rc19LdVa1iumwZl9w2fnzl/gykOb9rrIa8WyVezQiX7SOh60App1Dlg2GzHXmXUQJC5ufQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBYCKmIW9forJEnU/vdUzWDfh+3wBeUX6K8z48ayBIGPzdLU71
	57IGeNtpC/22VHc8KUGQGcd+ZzByvh2RYm5Jy6pRbFrx2+wellkVBL7GabPuKzCbVgS3o1r4ny2
	QPgrAGjHRPwmyZ4khXbf64szhdBrHG/c=
X-Gm-Gg: AY/fxX7mHnjdpFjFjRSlnEN3PwiKsK4D3tkJYJgJbelTx7o3gZu318v4BdxGExdaGrh
	rgzA95+iWJ9vspl0PCGuDE7F2UyV4COyYr1spEkUhGeB6zSLNQdCPa0v2dfmOEFB7G7On8c9UKs
	kylT5fIWvzDFalazSZyro+mDritWP3DxuQVh0z0Z8EKT1BSMAP5F+kpl6iksUstRZmKlBasdiGF
	RVE09CMFbWV+S2uelFmtr0X7YZGvCBTShyTvjly1qT/WQenH3GBV6ZFxzt6fngZxSPYaCe5ja9o
	h7XV8kA=
X-Received: by 2002:a05:6808:4a48:10b0:45c:a919:4281 with SMTP id
 5614622812f47-45ca9194a13mr2871401b6e.55.1768769471670; Sun, 18 Jan 2026
 12:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:51:00 -0600
X-Gm-Features: AZwV_QiKHuV9-iLza1ZNjEP5Pn_YvHBwe0eaKo1Fuq0mka0rXUyl6A0C8nMcMM0
Message-ID: <CABb+yY3vehi0wAtfLh=LL6QtXmcW3zo9-CyjfLeT3wYtNHB=sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: mtk-cmdq: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125117_688643_3AB6EDCA 
X-CRM114-Status: GOOD (  17.77  )
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
>  drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 1bf6984948ef..9da16b30eb41 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -636,7 +636,7 @@ static struct mbox_chan *cmdq_xlate(struct mbox_contr=
oller *mbox,
>  static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
>  {
>         static const char * const gce_name =3D "gce";
> -       struct device_node *node, *parent =3D dev->of_node->parent;
> +       struct device_node *parent =3D dev->of_node->parent;
>         struct clk_bulk_data *clks;
>
>         cmdq->clocks =3D devm_kcalloc(dev, cmdq->pdata->gce_num,
> @@ -661,7 +661,7 @@ static int cmdq_get_clocks(struct device *dev, struct=
 cmdq *cmdq)
>          * as the clock of the main GCE must be enabled for additional IP=
s
>          * to be reachable.
>          */
> -       for_each_child_of_node(parent, node) {
> +       for_each_child_of_node_scoped(parent, node) {
>                 int alias_id =3D of_alias_get_id(node, gce_name);
>
>                 if (alias_id < 0 || alias_id >=3D cmdq->pdata->gce_num)
> @@ -670,17 +670,13 @@ static int cmdq_get_clocks(struct device *dev, stru=
ct cmdq *cmdq)
>                 clks =3D &cmdq->clocks[alias_id];
>
>                 clks->id =3D devm_kasprintf(dev, GFP_KERNEL, "gce%d", ali=
as_id);
> -               if (!clks->id) {
> -                       of_node_put(node);
> +               if (!clks->id)
>                         return -ENOMEM;
> -               }
>
>                 clks->clk =3D of_clk_get(node, 0);
> -               if (IS_ERR(clks->clk)) {
> -                       of_node_put(node);
> +               if (IS_ERR(clks->clk))
>                         return dev_err_probe(dev, PTR_ERR(clks->clk),
>                                              "failed to get gce%d clock\n=
", alias_id);
> -               }
>         }
>
>         return 0;
> --
> 2.51.0
>
Applied to mailbox/for-next.
Thanks.

