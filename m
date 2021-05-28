Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8505C47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:12:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68755613DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68755613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PenQj1SBu9dpMAoaC0jAttbKhU+vBzxA0KdbDQlAMgc=; b=rQ78C8I7826QU2
	g7e9m8xi1m58LqtMvgtn99vftNqz6viMNWSlWV8SQevh9mcgFH7YWjPYr47Q55I6UanZ6vTrlETP1
	r71/P3+vepaIhza7A53LONnM+2PqwAEElZKF7TafTgD5oQOyjos6RX6LpfzjA9OKqrrrdBvTIE5SI
	6IlQMUy21Pw4fR2nFQdJ+gTIp85dYUgEDQw2SaiVNEsHSnSPzYr/R65GGY3iWqcTjpd3+nVrbPkHv
	wlgIhGfJAU7H/wDfOuwdNDivfnifUmegrq0k1Awmha9NECu+W77INuBvo1CTZtCEbVUUDX/cE8iU8
	wN7b6sz6dv0Bwdy3qlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYX7-00Dj3V-2H; Fri, 28 May 2021 09:11:57 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYWo-00DiuH-9H
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 09:11:40 +0000
Received: by mail-il1-x12b.google.com with SMTP id h15so2730130ilr.2
 for <linux-mediatek@lists.infradead.org>; Fri, 28 May 2021 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gIUXlVBGOqZPspzkSPyviaBDLyPSaDvhzeC44ewpxPM=;
 b=fi5Azr0qFURaRzo6mc6Hkid9uTMOG5gmKyG1OokAxJyeV9GDgDGWcDbPAzHwGhMCdN
 OSDz8xznB0MNPzPxAXvV7N90UC2NcBHagcJhMu10gZyG8aSekkerVqLScm+qbMKJ2UhE
 c5HlSWYrs4dWQv8MknJ+AWxiLPwRe35Wlk+jZfmwKV+XvZJmf6Yjwa4Nx+2VPIKh48oC
 C+c7+2ljHgtOyOufxWX9eY9GhZzuv0bfyJHXxqrraylx/u8M3sp7aoZ5DlT4QNWEuNWW
 64G270cl15PRefcyYTZa03mzWTETxgzhYIKmLM3Jn7QIf6SCRcqM7qtefKDFIb0PV8LW
 oTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gIUXlVBGOqZPspzkSPyviaBDLyPSaDvhzeC44ewpxPM=;
 b=uJDwungLF2+kQbLX9H2T0aOg6NAwmI3OylQIr0QertNPH70QqTeAVeqCTvQFSL4pcv
 9Ddw5oHFTvACmVc8XaTfs2DufsrL4xtuipef+tNgjKP8jYx3ogLeBYX8GvcSpbuYnCr4
 9FT/eT/531zrwd+Wy2AGsJl9oo8DViPqx+XKudXEQgLA16s58Nt8+XJhCjQjpV13hU8q
 LlxY41+veXNtLcphMadX0zT9tJm19nsDAykN30eVJmy8ae7vqRPPSSprwDqysXt0J3Iq
 TvcG6/am/CpgmiXpfdmCdE7A3F30Fw/HpmMqbCUxZ+QGcbUco/r27GK9mRt4qi6sIcaW
 0r7w==
X-Gm-Message-State: AOAM531iDobykZ9Kuyf5DsnvkhEtgTLXmvGsxxLgv7Gt/9g44l1cprBg
 eTN3wOiDXxB9jTonaqYA5wqLdFReXq1qLZ2/ZCKxVg==
X-Google-Smtp-Source: ABdhPJzz9rOUDpGPa2k1X+CT6JiP+65z+CY6LsrZEuqJFDmZI8kWeEM5cEjMXBWhdy7/LYK+vuehDuP9GrqspsnMOpk=
X-Received: by 2002:a92:260b:: with SMTP id n11mr6323557ile.134.1622193095281; 
 Fri, 28 May 2021 02:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
 <20210519162409.3755679-2-fparent@baylibre.com>
 <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
In-Reply-To: <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Fri, 28 May 2021 11:11:24 +0200
Message-ID: <CAOwMV_zin4ODuv8pA8_tfVyg3g9=Mrt2Txdk0O2wL8JqDefzog@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in
 common code
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_021138_342367_FAA818D3 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Linus,

> Patch applied.

I just noticed an error in my patch:
@@ -135,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct
mtk_pinctrl *pctl, unsigned pin,
                        pin, pctl->devdata->port_align, value, arg);
        }

-       bit = BIT(pin & 0xf);
+       bit = BIT(offset & pctl->devdata->mode_mask);

I should not have replaced 'pin' by 'offset' here. What do you
recommend me to do here, shall I send a V2 of this series and you will
drop my V1 from your tree, or do you want me to make a new patch that
fixes the error created by this patch?

Thanks,
Fabien

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
