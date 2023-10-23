Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A16CCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCtCjxd1RRZXLXKRsDJH4TVy7DQ5KsOabXJL+qFywbs=; b=dkQUj/cDePKRgSRdNc8yrpybhV
	JXx1xYdJPM2kyD9fxt9hDeRVUSyQ3POdrpQHOMkCiWM41nwB+53AsPPsKTcPouZPm+kjeDCaVHXGK
	1hWziGQ5IunS4QHA+XdRVl91T+OmPnVPHVN7p8uDiq7suegW/Xi6hDxjLgiuvW7wFJ/vt5EyiDmrC
	WzI44UrH5Zq3o3dnNcsalUFW2FHBcfkUmOFv1QZqSwvyZQm1YPNHxQq5w1uuG8btxvqhdBKvAA6tv
	DUXrvXLZKfzI6dw7ldGDzLJ+DD7QV0JaPNTHw9TMdqMMbm7ufhOCvEPU7qA9rQkUY0B2IMwt+u6Pq
	8Z11GYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qur1M-006rgG-2p;
	Mon, 23 Oct 2023 09:14:48 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qur1K-006rf2-0M
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:14:47 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49d0ae5eb7bso1195366e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698052483; x=1698657283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCtCjxd1RRZXLXKRsDJH4TVy7DQ5KsOabXJL+qFywbs=;
        b=O08+9AJfF2e1BQidmhLEh2MkxxdTS1hZkxdbfIQDSF43NfXdjKuhQXTAxDIc/G9vkb
         A2/6sEpJDYkV87nQ+aU6sivslH8bJTrSxdJskChedV3mWbwscgnkcOT/CESM792xJHwu
         yS7WfWPlWZZuY+o3EYjd7eN49FHRGT+xasGv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698052483; x=1698657283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCtCjxd1RRZXLXKRsDJH4TVy7DQ5KsOabXJL+qFywbs=;
        b=d35Nhx+XKMaywk1FrpnEApJLehNlxG9es05WylOdwHhpTcoKC8FO+eFo3/mSRvow1Q
         2b8YsaV3m61quWkw/h+3xikRbbZpvGt8DEZuOaDhUAPZVYx9gVCboVjasjX7rULvNjso
         QS9UEDxHKDw4vBxhVLAlEzZg9LSBGYhTSkunpvWm4Y5uehmri08vl9uKYGAI/KI8rxEu
         B0Ju7k9A5ly6dUeoxRxivIDG/iggYCQCbY7GEqvaUS41aFFTPCLalMT3jMwOT6HdhLSL
         vbIv64uFhUXZb0rT/xGkyTgPcHeKAnjlEzIbQfpUHb7WB0eQvavH1L1JTVQLnGCKE3TV
         yn1w==
X-Gm-Message-State: AOJu0YxQsN4uhCyDLRzAWjztxB1pk9LrS7haFjWzLMTFTrZ5q4eYwdPL
	7E9ZxFEGW6n5IY2nV/Q7u9CvQa0RQwvhiji3too=
X-Google-Smtp-Source: AGHT+IFYV/YUS4w3b9ltje32W8oPbwC56SOcSHejR+zTSWX+0bgGqhOqbhHZ3axf99cudsK1VFiVwQ==
X-Received: by 2002:a05:6122:2a0c:b0:48f:8533:3cda with SMTP id fw12-20020a0561222a0c00b0048f85333cdamr7698256vkb.11.1698052482899;
        Mon, 23 Oct 2023 02:14:42 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id g62-20020a1fb641000000b0048663717dd5sm919773vkf.12.2023.10.23.02.14.42
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 02:14:42 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-49d0ae5eb7bso1195362e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:14:42 -0700 (PDT)
X-Received: by 2002:a05:6122:3114:b0:48f:8891:296b with SMTP id
 cg20-20020a056122311400b0048f8891296bmr8084999vkb.0.1698052482441; Mon, 23
 Oct 2023 02:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
 <20231023043751.17114-4-jason-jh.lin@mediatek.com> <CAC=S1njjd+-oEgmBeWJGQC0PsbOdJ5eLLw0Mf35HOjA8UHStTw@mail.gmail.com>
In-Reply-To: <CAC=S1njjd+-oEgmBeWJGQC0PsbOdJ5eLLw0Mf35HOjA8UHStTw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Oct 2023 17:14:05 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhuuztiA5bixa5BEsPL46-pR0Sz-rPfTu2_NNCCvZozcQ@mail.gmail.com>
Message-ID: <CAC=S1nhuuztiA5bixa5BEsPL46-pR0Sz-rPfTu2_NNCCvZozcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] soc: mailbox: Add cmdq_pkt_logic_command to
 support math operation
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jeffrey Kardatzke <jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_021446_148608_424616A2 
X-CRM114-Status: GOOD (  11.30  )
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

On Mon, Oct 23, 2023 at 4:26=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi Jason,
>
> On Mon, Oct 23, 2023 at 12:39=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@media=
tek.com> wrote:
<snip>

> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/=
mediatek/mtk-cmdq.h
> > index a253c001c861..ea4fadfb5443 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -26,6 +26,30 @@
> >
> >  struct cmdq_pkt;
> >
> > +enum CMDQ_LOGIC_ENUM {
> Use lower case, and perhaps use `cmdq_logic_type` or `cmdq_operator_type`=
.
I overlooked the CMDQ_CODE_LOGIC line, so cmdq_logic_type makes more sense.

Regards,
Fei

