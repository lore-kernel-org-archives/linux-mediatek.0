Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF42C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPPMg3PRamF1jAKZwUwGlqsGYxlh91mVVXE6o4NQgM0=; b=FL3A3gpHPqOh7ALv5IPwy0ZFhU
	CXOvKZAiIvqs2nOamJSWVC3+r65FJuHb8ZlAh3dp9Ol8fTTKNTq3EpLaKgQCxTa/CXlPZHprbk/x6
	awHIqlSGDDKLiQlABNiPm8n0moWO06jvXFBjXuw0z8vhDnohn+pg5QZd1aqssMrRR7gwU3NeBGtpm
	DeuaERpFOjCJMQPG9/nY7fjW7yHZZFfWxyk9203NyK5W1gTl5Vd9x5Enail26yacJuFFUr9yn9Oqs
	gJa5nwtMzmC7SUOrB8GHPliiawmISlz7IFf31rij70iNQCJD9fxZYlOeMv6WyT10G6MTl+nYK8y/5
	kgtsvaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyWT-006bbl-1V;
	Thu, 10 Aug 2023 05:47:49 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyWR-006bZO-1r
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:47:48 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6bca6c06e56so540688a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691646456; x=1692251256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPPMg3PRamF1jAKZwUwGlqsGYxlh91mVVXE6o4NQgM0=;
        b=emKQ9KZhNfyU+K4CBqvUrz3AXX4YkK9LDAd2qJOM1QcnF9UPBNRN5DIozvO34DYvhs
         kOpHSiVjUdQuYCmJlGNhaVnwlBeVHvwmI2X3m/eY6jQURCQfFZfuzX5SNA0gPQwk1y5n
         HUZuq4idUu/KOto06WHnl3qxBTm7cRrAh6FU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691646456; x=1692251256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPPMg3PRamF1jAKZwUwGlqsGYxlh91mVVXE6o4NQgM0=;
        b=Fhz8oMgJP8G+I9fjwMEhU8JjSm3gOx5+hI4cjDXAhXzytw2dsyC6q0IkfPFz23EerD
         +5iClryB6VMUssL+RpahctINW89n1xYmYO24IafWIN9HbVWMQtm2LPVaxt1SwrhVZSv/
         fUzdoGgz9b/DMLbl0puDXImHhHZzIteUschFPObeDr/0PuhY3EQWvP6UVS5BTRm4rO9y
         Ii3D6KPSLpcQXJvYpal9ZYHH2YkYlKWEOdVa2xk584EZWyY88j7LzDEk+2O0VteHdztH
         Mp6PeDttj7WnkyKdKTh6R62XVG8UjxoQtl6p1l12kEXe9SWgKWFw3QMnK4TnRzc3H3tI
         3cvg==
X-Gm-Message-State: AOJu0YxtBNsVHvBUArhL3KXs4YTXRLZAElfajWmhbu9XGtu+PKvukqnJ
	3mUq6qryqTg4OLswXAaTeNhUI2qohUgk6M9Hiak=
X-Google-Smtp-Source: AGHT+IGh23zX8Ek9zy2YTs4419PYVIdkdZvxiAUYuCYjeuBBxymQXhx7ljUzhwQSCYZEUUTyRW+dwg==
X-Received: by 2002:a05:6870:8910:b0:1c0:5f7a:896f with SMTP id i16-20020a056870891000b001c05f7a896fmr2005445oao.8.1691646456679;
        Wed, 09 Aug 2023 22:47:36 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id em6-20020a0566384da600b0042b0a6d899fsm204202jab.60.2023.08.09.22.47.35
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:47:35 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-78666f06691so18372439f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:47:35 -0700 (PDT)
X-Received: by 2002:a05:6602:2085:b0:790:bb3e:78e9 with SMTP id
 a5-20020a056602208500b00790bb3e78e9mr2150940ioa.16.1691646455213; Wed, 09 Aug
 2023 22:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-8-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:46:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1ninuuuD7LEG=ST5bWX=tDYbfA6Xzf0d3o5XGSnFd_v19w@mail.gmail.com>
Message-ID: <CAC=S1ninuuuD7LEG=ST5bWX=tDYbfA6Xzf0d3o5XGSnFd_v19w@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] drm/mediatek: Support DSI on MT8188 VDOSYS0
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Nathan Lu <nathan.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_224747_609647_A84B65FA 
X-CRM114-Status: UNSURE (   7.14  )
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

On Thu, Aug 10, 2023 at 2:15=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add DSI as a main display output selection on MT8188 VDOSYS0.
>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

