Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB53060E09
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB53060E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbERXAXYavK6WCS3lYpOH8dkZuPL9YxNUVO2NH/6PbA=; b=wdoTJzrAUhc/4u
	Qc3wKiAP4L5cQ8AHWLNMX28Ehh5ej7J4Tu05CfLVorb3OzzGWbMIZW7JOfMHkT5zPRJ6qi1nlhNq/
	Im/2wthnGU+XE04aks4fArzmB3RTmNJlRl1wCmbzwc1zyS4ErJ+EZobmDSRFGGKtC4ClKiQSX3rbZ
	BO+BJnojT2MCvqUMskMV+Rah+z9zNqzGS4qiJQTi4aMtVq7Yj6BqF68ittWRRlr2u3Za+ZMmS4WUz
	gEDS23YNmsOghOHNpsvdAfo8m58a15g6hpvBXwBqhw0/ctBrcjSp2qiV8UkBVRTTKh9MXK696CHb1
	mcI9ce1/jGiRn+vKMcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mayGa-002fUc-Fu; Thu, 14 Oct 2021 10:47:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mayGY-002fSq-Af
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 10:47:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id om14so4414688pjb.5
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDHFPubGokMv610+PS+/OMv3n5xorR0TmYr48ehh8fQ=;
 b=bjDwtXzpCqnuSRQZD6MOVaavAzBjpwMAnFWtZemyDCR5/A9nCz9VyYcMaO+PuwyUB2
 2tMBe1RcEWt5Q03VT9my7r6i2EBdY/5bAlqbKH7PY/2jLvuX2tFXomJGmStjyAq9i6bu
 8JcfH5f5qePcEyBTZgoN65wnmQFirKACUFYTIGeTRf+XUSNoH4GTJ+qDf/As69ADE09P
 Wi5DqwNT7QiiANRIgoWexPCgUXWG6FJUAkuqEKtPyl8aRkeJjfeRONBZvF/9H4egUOm4
 HRpezQZy5paMRwQKhA2Zu/774G3QklrNqWJ9+OdMPfUhucGS9lhOeUdDoOtq5IeyJqIW
 yuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDHFPubGokMv610+PS+/OMv3n5xorR0TmYr48ehh8fQ=;
 b=cgvGwdCDmGm9th/wsOFYzE86vh0mCR5sLvBogeyI2A28sB7DrEHhIcKYr+zrvClxuS
 9isjAQ1Q6dnt9kWuSTU88Qy6X2jx82Vkwn0iFRp6aY9OxuOFJixgSG718Nb7eNdezcNA
 0cygbu0RBcgD77TyrXvGnTNK7kkfM3JZGk/Pa3XetjCMEhiC7l6rcUk4ywcxB2ESZXnR
 ZOjqnx3xhPQyK2lG1adWUu/MxGkoJvPvigXFX4wYAmTVEZi4w+IztgnTyjXSTWrhzsO4
 4nYt/6X/lqkpvKqG7fyCIf2PZiBS0+VifMJDseuUYjOmu3g2QWBO1FBloUFlQonnIEsW
 IsKw==
X-Gm-Message-State: AOAM530Qo0qO0giOW1UbXye0pX/bCSR4P6jOSiYspcwdovmB3nU8ASOb
 PxsNmAdly1a9N4uhA9Qw5NA9oFspitHP5rGTcqDUzg==
X-Google-Smtp-Source: ABdhPJxwuVgL0hLnQm/+FBBbUWdUYrXi04zMewbUDkI/oq8PjXnSCIfrj6K4/4AjuAL3jlBthIZKDoiJlwAu858FLkU=
X-Received: by 2002:a17:902:6b01:b0:13e:50bb:790f with SMTP id
 o1-20020a1709026b0100b0013e50bb790fmr4251618plk.42.1634208432237; Thu, 14 Oct
 2021 03:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211014093112.3852491-1-fshao@chromium.org>
In-Reply-To: <20211014093112.3852491-1-fshao@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 14 Oct 2021 18:47:01 +0800
Message-ID: <CA+Px+wXWS4hteE-o_uLi8DxgLK3TKkWzGmHGEE02ALzA1GRDoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: mtk-cmdq: Validate alias_id on probe
To: Fei Shao <fshao@chromium.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_034714_422899_5EFA62C1 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 14, 2021 at 05:31:10PM +0800, Fei Shao wrote:
> of_alias_get_id() may return -ENODEV which leads to illegal access to
> the cmdq->clocks array.
> Adding a check over alias_id to prevent the unexpected behavior.
>
> Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for
> mt8195")
> Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
