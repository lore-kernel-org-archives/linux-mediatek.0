Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0CDC04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP2WNJmHGIojwtQNcqjJWegFiViuW7cigU9WfO1EE3Q=; b=R2mpHQERm7UUzzAW277yLDbcEF
	uf3YbG3YGDbb0H/5oKxtxu5enRvEMrvditOa9biZt+E/FZKSo7akyMOjkOmppQWqfQ96VicZ3uCgO
	Rk/7cUytN272OuEog60ouRGKn2Iigrm2mHWKmXEioiE0WVqbdfBiyMbEuEggf3t4w0MfUpMSUvQE2
	GBC/7+NsCxi2T6kec5ytgcqyz2WUmD4WFdQq9mGmeyxU0iwOVedwIr6gt6e0zs4TxfOALM/1LHkbu
	Cth4103hyvWCs6SsNIctiFGLyFbcTgfYz5DcCTvi8QOuFBoB7O/CQld1+Mw1gl5nM6RTjsQdXdm1A
	98LsriGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyS9-006b7I-1a;
	Thu, 10 Aug 2023 05:43:21 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyS6-006b6i-3D
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:43:20 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-790cadee81bso18016439f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691646198; x=1692250998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sP2WNJmHGIojwtQNcqjJWegFiViuW7cigU9WfO1EE3Q=;
        b=XDPlCSvXNdC1Uc99mIlXSmz71F3v/V/zESK+iQUSPmzqoMqPkRwRSflFvtn4pAbP2v
         2moHfNZOzsLpCpGhrlrj+MpgiMLytsJEAHrW0rE0JrAsAduYPwVa6rDe/gw8bMaK1ESq
         SVQm00Y07Wqm9/dni8+vUIWqZL6h2a84cJ9qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691646198; x=1692250998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sP2WNJmHGIojwtQNcqjJWegFiViuW7cigU9WfO1EE3Q=;
        b=G2dV8eK4e90mVlw8/QRQg8ec4BobfTPYtxsRux1Whj9N4Jj/SnaWOLIHqcePqic/au
         6/8XkMRIUdUCR5YvU9QCtsbDK6c8BskLdRWP/w6SLRekik/sPIcjngabhFREQKUtILh9
         FukOhC+9ozqXPZvBQAmxOYrNTQwVabqcVcv+8QByjeUDzl+Um25BsWI0rWM5rZN1me+G
         mjtOXamAUsjC7Gxo95sF9X9mheuhhUAr0kNgr/6Vo9SlD2CYpUwsV0wiwmsKxf6a7DtF
         cVZ7h95sm0Uqw7iGb8oaRuMLZBff32PqL0tNvmxYWrRaoZQ3ZiZFJ8YBMwMViPkfckIc
         fONw==
X-Gm-Message-State: AOJu0YyiAQiGKNrgXcKIrV6ZE8m/PmRQyZyaMDc+GHxZy8E7uhjAKCeD
	S4kjT9Ko+d0tK5YCondCRhpxL+QpRAfzCndKmPQ=
X-Google-Smtp-Source: AGHT+IF+DP72iTFFMSLgNpktdZDaNiDAjYTq3BvLf1tdKeLuQq+32jgAZThpB8OdI7P05lxW/leZkg==
X-Received: by 2002:a92:c56c:0:b0:345:8373:bf68 with SMTP id b12-20020a92c56c000000b003458373bf68mr1461602ilj.25.1691646197801;
        Wed, 09 Aug 2023 22:43:17 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id a4-20020a02ac04000000b004231ee0fed4sm201074jao.78.2023.08.09.22.43.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:43:17 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-790aeee9928so17664839f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:43:16 -0700 (PDT)
X-Received: by 2002:a05:6602:20c2:b0:787:1c51:ff99 with SMTP id
 2-20020a05660220c200b007871c51ff99mr2004510ioz.11.1691646196046; Wed, 09 Aug
 2023 22:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-5-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:42:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngxyACUvMXTu5ZDwiLJ=ZzDXMMiVVhNr_Kjv3rxsX5gGQ@mail.gmail.com>
Message-ID: <CAC=S1ngxyACUvMXTu5ZDwiLJ=ZzDXMMiVVhNr_Kjv3rxsX5gGQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/7] drm/mediatek: Add encoder_index function to
 mtk_ddp_comp_funcs for dpi
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_224319_059855_36590FAF 
X-CRM114-Status: UNSURE (   8.61  )
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
> To support dynamic connector selection function, each ddp_comp need to
> get their encoder_index to identify which connector should be selected.
>
> Add encoder_index function to mtk_ddp_comp_funcs and the implementation
> of mtk_dpi_encoder_index to get its encoder_index.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

