Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2757ACCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=; b=2u5thQMWDycbuJYQD0g9qduDL/
	L1/kIHmAtmvF/i9/3U8wxkZUbgeUnEqnl8Ry39S+z8RyK+aPfoIPJzSIQ1gcIMjNa2jYZ/+hvtXCh
	pDFcyVZYPdkBXrSlYSZEtnzEtAqP/hvOjuF1HDlQsMD+6vIWd6kHYH1pEIuxWwpkx9UfLet8sejDS
	LN9sNUeqnU8tsMntcinZGNrzVp0BPLgVR95ILtDfR36qz04ScoFbUlfvMW0G/rwlPZorvwIPAIsAT
	cAT7mMIMTJocUKA1SBsOtbfoTxbKwySw31/74QNSQWOosqT0naqIbc6kRtmWwXW9Z9XwivNS4295L
	HsRXPxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GPh-0000000CyxN-3jeK;
	Mon, 13 Oct 2025 11:08:25 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GPe-0000000Cywg-2yFx
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 11:08:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-36c0b946cb5so33513701fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353700; x=1760958500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
        b=Vc0NXzqtyK35G3NRnETv/xKg4KuQVbCA6593BbP3rqhP95EiKyWOVUazfUN0N//MCP
         0Klox/fbdVpMjbfLKcaCIIDKPWzzXTR6L2taN97dnlCacDgYrgYSNQukqTqmOdPJ35zA
         dcnrzYs8OT5nTIhrad+gOFfrUqv1iFxENLdz/oYfKTX3eY34+30xSszv6MQVSCXagZpT
         2ccq0WOAbdnt3yybG7AT7lg/mOv9kYLP+H8KBNbqCHMgKYFBe2oS495ecRtehOhK1ITP
         KqRZ1uGKvskKX2lsBfpmE1FAg0d2DDLWHrLbMbiXlWQkBM5QOjoPygfVvF5k755GAo6t
         PdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353700; x=1760958500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
        b=Yt5Nx7lN8OB65mPGOCa0QqLB6X34YETEsA2dWtcdfIsnYn0FcrSijwm98Wmn4ohGv3
         yX5U6LtpU4Rpxy/bmXqkBprdV93kbb9HhFqpB687qwyKY8tL6GD4I7iWcM+kU3s8Yi+U
         QDI0P74mtE3wpL3+1HO96FIxAX2hp7DpKbl/1eARVh8v4TrT3PuRmRWFrjIGKnWWan9a
         qJEHGhp/g0aoyCGb3WS/lyMQyJUK9YEzkZrwGu1HN6t0QrtzAOsj9rr/vxoLfLr2ZIkv
         bJcJTg5Eqs2CMgg8gVOJSXB/BOwLVb8c7lJJyQwTSxFwlx2suDJcG6HPFm4sb362ZLUr
         hYGA==
X-Forwarded-Encrypted: i=1; AJvYcCVBwdGJfa6GKL7jOo2yOdkMPphtvuAhx/PJPM6b4fvZsRsttfVa72I5aTjZGInSwufZ0Vf4v5pWIE/k0jnWJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsgjsUxa48pMz7Z8fzFhDRrSbI/cZXjOB2Ut1e2WNtDyXkyT+n
	AgK2HBvsPzyPYeIX5Vk1wubc8ZBO6OUCS8FQZVR9dNMx5/2gqdjfF+URxW9R/TQQZikTt1AVQbV
	y08VNp+PDPumID8DW1bw3vwZoR7Q0B9a/I+lWglOFWQ==
X-Gm-Gg: ASbGnctsYzUQkRExGjrC81/reNIbKNd29tZGknyoQePmw22evv4+QGJ2bvJLPydLWQn
	MGrnwfrS9+oyWUWpcoPcdDIkAXAGZtnWGZCRptj/8oSYIHX9J57uAKR5MywTh+1EY/MY4RhYrid
	iqJcw2MQk6f6M1x+Yo9VOFauGZBhKT8OgxaGgX3y3OTJXbgrgt7S5ODWx4m/oT6jYBauMPAHl5s
	luG2lXSYVJ3mtZntyAjLFhM1S7sZQ==
X-Google-Smtp-Source: AGHT+IHtdCLd+4uJh0pbUlnFA7Qzu/sxrXL4iOF6wbwTfZv7XTlOSlg+VqyDSfbt690MZKi6vF6Z3aq6/nvgRVaOgQc=
X-Received: by 2002:a05:651c:546:b0:372:9f0c:2158 with SMTP id
 38308e7fff4ca-37609d927d0mr46661901fa.16.1760353700507; Mon, 13 Oct 2025
 04:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
In-Reply-To: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:08:09 +0200
X-Gm-Features: AS18NWCm49dSzl3HawLMJssUJLSTrG4CpecVW6MUgTtkI6_u-J70Cy8bMmd9g7s
Message-ID: <CACRpkdZvJ3jvoxi4H-PL307up1nrvL5hNAtWTrwZGwNW+i8Lyg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_040822_755505_CAD9E923 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 3, 2025 at 4:01=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> The mt8196-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8196_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
> issues.
> So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
> ones.
>
> Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch applied for fixes.

Yours,
Linus Walleij

