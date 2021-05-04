Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F19C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 13:57:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE40861027
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 13:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE40861027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Tm9fYEkkJwNE4ox9iKROuZUmII5Sbp6RV3eg4b8dlA=; b=mVru2QRYhC9+Tki5pIPLFfMN1
	oAeBLr2aEAoovN/soxcxSTK9wjm0odY4GYt5sSnnb4B9DmrfH3VpPSD4uMv47IULEKlExWFSMAkal
	ECfYLw6zcTtcEi9Va3xGRUdcWC1qJgM3GwAdwSsR+fMIfSwBPp07iApCYg5ndXsbpr3nwe2XX/mzt
	lEDkERRIX/pmcbwWBok7XlDKCvl3pbqDczaFO0SxCQ4kmjWU/OnEz9mGlCpGAFWMn0EpjGgohtHOD
	X/j59AzOpym98DhzzowHVAQ1M1mLw7Sl7NWDC9g8JMQL27kKvfiq1cBNWOnq39hJlTbd2bQstyw7q
	A48THoyOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvXo-00GK46-8F; Tue, 04 May 2021 13:57:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvXm-00GK3u-Sr
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 13:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GfObCui0DNH8ZR0/I1fHume4Rr+O0CCZkfpjxN4kucY=; b=GYIm0dPF8eYVLDDKAP8AxhBxi9
 1Qgr964Hbw1Uojug93qa0rd3l1tuEJSwrc7myy3ra1ClH447NoEc2Brzw7NElU6pNez4HMLXVZU9b
 nPWBCZzMv7awKDM0rRyYzg9hV73qnrlELQTcJeNYY+AsfuVmi1U9drAGnkVIlPW/1omre3ki200lv
 Dc85IiScrAO12Te5FqlUkjBXAFR82zIAruOKx+epHlWUe5/hlffcTDCiGQMc1hVdyb+f4fp/CfIyn
 rfPaEZEMPA2pRPcP0dyMw/a9qVTGrd2cmBlt57NwhaJ9k8cqW+E0wtCL34yf4sKSLMuNwLB8yFHM/
 ou+UHMlA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvXk-0041DG-9T
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 13:56:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32FD2610FB
 for <linux-mediatek@lists.infradead.org>; Tue,  4 May 2021 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620136615;
 bh=b2AeokgYv9BBNOB9kdU8IH5+Ru9PhpBrRTY6A59eIxw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EvejC2252e2Zl+OmgVpDTt2QniEI2j/aZi0nxrm5tVAKnUdDBiChcy3beCRGx854k
 AyfcApo0828t1WAq2RsjmIWG05msuLQJ72QkaqzrgSPG9tLRccEE8kfvmrbiecN4xe
 EXHni88bKs2i3y4hqa0nSy7OjN8FisMDGbNIO3NoAXD7or5xFJqbj4cwZYgzCzOUNF
 xLJf5sG1OXztno2rLSpoFKlqCzZQ+Qxe3wXTH3pyQUVtYjJFQBNdLr39aESK/oyAjj
 bhyAMz98EXmblhaKp7ApVLFjpak1kJXeR8b2vmp7i+mcAVXIt6tcCSDac2vW+D1QSi
 TmIs5QFZ0sLgQ==
Received: by mail-ed1-f43.google.com with SMTP id b17so7529262ede.0
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 06:56:55 -0700 (PDT)
X-Gm-Message-State: AOAM533Gyhj7JkLCB8GU8OpPm0XwTPijopqJF6gz02SQOo3cd5KCMA7U
 zT82g0Z6myb4QsK+DS7I/BNlBKn/SWk3Gr8cd7k=
X-Google-Smtp-Source: ABdhPJxj2ZxVi8v0/3asz2FqD9vZBl4BAkavlevVxCat2TqvVFsZdO9hzV3Jap0mmoo+TMnsiVtcLhdsWKFzrcWhkGw=
X-Received: by 2002:a05:6402:441:: with SMTP id
 p1mr26213488edw.298.1620136613729; 
 Tue, 04 May 2021 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
In-Reply-To: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 4 May 2021 09:56:41 -0400
X-Gmail-Original-Message-ID: <CAJKOXPdpBjmHgcE1=vox9YbdtR82LT5F8anx0dKP_fp1JstTpg@mail.gmail.com>
Message-ID: <CAJKOXPdpBjmHgcE1=vox9YbdtR82LT5F8anx0dKP_fp1JstTpg@mail.gmail.com>
Subject: Re: [PATCH v2] memory: mediatek: add DRAM controller driver
To: Po-Kai Chi <pk.chi@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com, 
 CC Hwang <cc.hwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_065656_379717_F508440F 
X-CRM114-Status: GOOD (  13.35  )
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

On Fri, 16 Apr 2021 at 06:30, Po-Kai Chi <pk.chi@mediatek.com> wrote:
>
> These patch series introduces the MediaTek DRAM controller driver (DRAMC)
> on MT6779 SoC, and enables to be built as a module by default for the
> ARM64 builds.
>
> MediaTek DRAMC driver provides cross-platform features as below:
>   - API provided to other kernel modules for querying DRAM type,
>     rank count, rank size, channel count and mode register settings.
>   - Sysfs interface used to pass DRAM mode register settings and current
>     DRAM data rate to user-space for MediaTek ecosystem.
>
> The API user includes MediaTek External Memory Interface (EMI) and
> DVFS Resource Control (DVFSRC), which will be sent to mainline later.
>
> Changes since v1:
> - add prefix to vendor properties in device tree, dt-binding and drivers
> - fix dt-binding check fail
>
> Po-Kai Chi (4):
>   dt-bindings: memory: Add binding for MediaTek DRAM Controller
>   memory: mediatek: add DRAM controller driver
>   arm64: dts: add DRAMC node for MT6779
>   arm64: defconfig: Enable MediaTek DRAMC common driver
>
>  .../memory-controllers/mediatek,dramc.yaml    | 162 ++++
>  arch/arm64/boot/dts/mediatek/mt6779-evb.dts   |   9 +
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi      |  18 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/memory/Kconfig                        |   1 +
>  drivers/memory/Makefile                       |   1 +
>  drivers/memory/mediatek/Kconfig               |   9 +
>  drivers/memory/mediatek/Makefile              |   3 +
>  drivers/memory/mediatek/mtk-dramc.c           | 711 ++++++++++++++++++
>  include/memory/mediatek/dramc.h               |  18 +

I found this patchset by coincidence as you never cc-ed me. Please use
scripts/get_maintainer.pl to get the list of people you need to Cc.

All this should go via memory drivers tree.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
