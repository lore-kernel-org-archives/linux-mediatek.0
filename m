Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F560C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95F860FC2
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D95F860FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUYkY6NTWCCGwiOG6jqPnD9UK6dPo6JSY+/04bC6ieg=; b=bZWzDiOFXPR1E0
	7/Y7eXEcaaM5hIdZhBzj1B6nmbbwM88T6YmF09oIgOJkciUOroLmZxNsTce9NJd0WQ5SJD28svxKJ
	HC2yhmYNpjLyZNWY7oXSFkynv/woQdeNAQU8BoYB6F0/GSnmJPfEud4Ci0eKkRk8A1FMTs8Pxz8J7
	BoCehBK0eqoJRjKdf3JCEsq2jzpH4rnKwvnAz4VA++kJaaVa3VzjpoodxjhNDUQpWWHZ/TRIWOUkb
	83YH5+PQHrpAtLwtV9c6bNivZ8uuoFVSsNsxCN/qhsDXU//anuHU89iUyvWGkdg1vQLb9eTgfR6bz
	yVZj1HS2Qp19wmVjz7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCvta-00H1VX-FF; Mon, 09 Aug 2021 03:24:10 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCvtN-00H1SY-5m
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 03:23:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id h2so9411656lji.6
 for <linux-mediatek@lists.infradead.org>; Sun, 08 Aug 2021 20:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DeHqVi50CBdFqd2+LMixauUxIiHfce3Yzl/5XSJiGW4=;
 b=udwP6An1CopsSJoND9TlRMg9C+2um44ZaVmKGf2a64xc4zfU4B+ba9JQrNJi7MAs8M
 TYEk25w2jsN0FflqKdIu+nBRbjdZX+LZiiFcR+9C+rPscQrfWRvUbTHVO73bRfAtJgCy
 xy3oLjEh4rLObEK2Lh+uFTsJBKhqqcJzPmrWpmjkjL8Ut9li5azzrDc9cYodoVsM9r1l
 61bL4/j+xEgq3dG5qbFQuOy+c2KRplm2ID2KeD3hrVxRWz5+6coq92wN9tfRVx1ktKCH
 TSA4/f1IBPIOMagR2QvkrAo5oXxfJKHihMqLSfevR2stW/TMZFnJuoxCdMvlBPrlhMnC
 1dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DeHqVi50CBdFqd2+LMixauUxIiHfce3Yzl/5XSJiGW4=;
 b=HRuZnUJSrGa8alA20H5Ub3llLNZetm672efY32Ce0QZ3Pk6nOfieOTJzwOIickDxzU
 N8LtjqRfPjKZM3r2aHsyYQwSrjd2lA8icG91Z1aZeeDDgyNTv5XKkqywRrOiuruW1Pwt
 HllBycT8WbkuVxkvj9xxi33Z/ErtDZ1XhKfaOO0POx7Dqk4UUwgSunvlLK7LrnvxAXt+
 pzEzUcibbvdUYI3WxDAUOJbeObcVwuFFbxysz3Owu/+mrXU+Dld/DL6t/Jv3QxA8G36t
 aSEua+cebjL+aSZ/65zxw/5CsUeM7AGa6ZSpzoKkMhy5JdL1rxeEm5748a+bwoZWVN3I
 iUtg==
X-Gm-Message-State: AOAM533dRMwpm1/Jt8iEWdUbg4aD6ZkCE2y3BGwNt1Ez+U6U6R7+n4t+
 Oph0d2q76wPDA010aSodU+lekOFDI8Ho1U1Jz6Uc8w==
X-Google-Smtp-Source: ABdhPJzWrze6pAE8SouLNWKvQSYVzPjq/X4MfGn/t6RZQRfJMwb3DGCw0Pw2Pt5DPOfM3ZweoUmSdCNVONUnlfB2Cpo=
X-Received: by 2002:a2e:9e0b:: with SMTP id e11mr14181716ljk.423.1628479435239; 
 Sun, 08 Aug 2021 20:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <0aff1abb-734f-c714-6ecc-c906862255c3@collabora.com>
In-Reply-To: <0aff1abb-734f-c714-6ecc-c906862255c3@collabora.com>
From: Eizan Miyamoto <eizan@google.com>
Date: Mon, 9 Aug 2021 13:23:37 +1000
Message-ID: <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-kernel@vger.kernel.org, wenst@chromium.org, houlong.wei@mediatek.com,
 yong.wu@mediatek.com, enric.balletbo@collabora.com, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_202357_298509_889E9AE3 
X-CRM114-Status: GOOD (  14.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dafna,

On Thu, Aug 5, 2021 at 4:40 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> > +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>
> This function can be static

If it's all the same to you, are you okay for me to make this change either:
- If upstream requests changes be made to this series, I will include
this suggestion
- If the series is accepted as-is, I will make a follow-up patch

This is to reduce workload on reviewers having to re-ack changes for
(what I hope you agree is) a nit.

If you don't agree, I will happily oblige and make the change and
upload a new version of the series.

> >       for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> >               comp->clk[i] = of_clk_get(node, i);
>
> that iteration can be replaced with clk_bulk_get

As per Enric's suggestion in response to "propagate errors from
clock_on" in this series, are you okay for me to make the change in a
follow-up patch?

Thanks again for your review,

Eizan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
