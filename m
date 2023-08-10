Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43FCC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixxcqOL2uF7LCUOvdRaIHgyC4OBsJP5mDbm84ewIiXU=; b=FsYPpQNnQ19nY0SQ5Om1/eJ9W2
	QBiE3OlwHOwiAqszw74k9RSyS3Kg2Gk8hfYO4gfYY6U5snkG2YH8CP8cwEnC8riAOlrvx2NZI1qWu
	2txOh+IrgzC5cAGHtN9Nbucaw65+8YEQBCD9aNfY//SjzA+E91dlptjU6tznJrXjnk1M/fEZJLi55
	xWeugIf1mevKzBVh46wkkK5sIJnVoDqrlePc8oLO3trxt2GEBW4LmAto/lqt/Pbwa4bnLeEbHtf6z
	7MgSdDK9pJ7EngIP96WeiigJh363e1FfJh1qwkx1X1vXD3U3k+xnilSkXyX+WBeGh83j2jyuU5KtS
	bGjJ3w3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyVL-006bSX-2D;
	Thu, 10 Aug 2023 05:46:39 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyVI-006bR1-28
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:46:37 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7909307ecd1so17117939f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691646393; x=1692251193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixxcqOL2uF7LCUOvdRaIHgyC4OBsJP5mDbm84ewIiXU=;
        b=J3xt0LVj1pw5iNGkEIJbtmS6xeG0Jt3D0ppBilRXCdcNVBqd0x1HvuIjC7I6Me4X3+
         L6X0UrZr9G+BDZ4yqFMa8SwqHQooruQcMTkECAa8Zst4CMlSbwgN5I2w1x+IPdpW2KVd
         TlMadz2OSQ6AlEqdjlFcBQWHPb6HzOKTaRMhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691646393; x=1692251193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixxcqOL2uF7LCUOvdRaIHgyC4OBsJP5mDbm84ewIiXU=;
        b=ZuHJAPuGXLoJqgD7sWeGOwI+L2OGFstcX8hLT1hMEhn5UP8poz5tcSCTrusKJWZfne
         OpgHy4TjmKwAE/xi52VrTumAnqKb6H1z1svKabBTGc7A4cco/oiZgriofL30D9JAxV5F
         oo4btluRyr59uk+WbccRQ6Dg8ph3ZYGzGEygm5XQNmqSIrQE+ZGhaSBO4D5fmRD9xzAj
         NSuD3WwnJy8ikvkWRAczdHAEEovRkz9tlx0U6IhJoAhg5n0YKTN3f7rxmITYaUTfm9Jc
         IunVNtG4pJAWK9akUNRpPUzgaNnZRh7v8/6KUVjf/GyLAY8HkjQZ8gza7dCtFsWNY7k9
         EeSg==
X-Gm-Message-State: AOJu0YyDl7ioyJ7dRZ25FDiVDUpFO56FMFgo6izhpJU89Of1xpZJAURR
	cqQHT4TAr/LweSZTv0lL9jFT479cKttWb41JUC0=
X-Google-Smtp-Source: AGHT+IErB6CKsZbTYgtReZhO3sBhMs1//mk0N5lDwBzl8fBx9NhAb+IS5a/jHStWyAnFTi/DCZR2CQ==
X-Received: by 2002:a05:6602:1805:b0:787:ff98:c38c with SMTP id t5-20020a056602180500b00787ff98c38cmr2085161ioh.10.1691646393488;
        Wed, 09 Aug 2023 22:46:33 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id w25-20020a029699000000b0042b6940b793sm201521jai.17.2023.08.09.22.46.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:46:32 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-790976d86a1so16863339f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:46:32 -0700 (PDT)
X-Received: by 2002:a6b:7301:0:b0:791:60c:4b4f with SMTP id
 e1-20020a6b7301000000b00791060c4b4fmr1873165ioh.17.1691646392647; Wed, 09 Aug
 2023 22:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-7-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:45:56 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj2Z2Lqf9se1EJZx6P3LvyMamb_iCjeRokL2qD7ij-fsw@mail.gmail.com>
Message-ID: <CAC=S1nj2Z2Lqf9se1EJZx6P3LvyMamb_iCjeRokL2qD7ij-fsw@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] drm/mediatek: dsi: Support dynamic connector selection
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
X-CRM114-CacheID: sfid-20230809_224636_696530_F1A8FE26 
X-CRM114-Status: UNSURE (   6.99  )
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

On Thu, Aug 10, 2023 at 2:16=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add implementation of mtk_dsi_encoder_index to mtk_ddp_comp_func
> to make mtk_dsi support dynamic connector selection.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

