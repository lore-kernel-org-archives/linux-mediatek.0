Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E17C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 00:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C3tbjV/TyYn8pSSI0GfC0ZqnoGjeXerxANCMhBy2Og0=; b=HNa
	OzW/v8sg5LyRijKWnBmdvlUvAqJ0c6P5FO4hpbou2zQRCJfrCzBRcEnMUtRAHJzSCu8rzGqgODw15
	e0I8SlMI16qs9hqKSJXxgyaqn6N4QSPvpjXLHdTWbWwK2P8vujq15o3UxHPY8iOX0T8VRSX+gHgDF
	pynZD5jKUOJVuklMiP0oVPiQFlNx8hAaJc85Iv6clvzGu36wJ7O958kTYj02rST8U0UeVr8Jer4If
	414yFKBNQ6Zd1ZUfR/EvuHTdiJj9tQZ4I/2UHhS/U/6bSNlPnaeXVSiUtW6R64kLY2HIR74xfMa4B
	8lF8Fogu8y2Ln8xIn7gAj0Z4P1zwaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKqkI-00CWSt-2r; Fri, 18 Feb 2022 00:03:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKqk4-00CWO8-Hy; Fri, 18 Feb 2022 00:03:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C962B82383;
 Fri, 18 Feb 2022 00:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4376FC340E8;
 Fri, 18 Feb 2022 00:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645142597;
 bh=TVaSrkJvLy7TFoNV4CssmzeUAhYCDnKsG1B3A3MW1yE=;
 h=From:Date:Subject:To:From;
 b=d2PwHMtCXem5dIu4ltTfG6WeXsJ0lLq3x5A2tlKIojESePUW7j4YjOcPH8oZT155+
 J61DLQQK2RGFIXEU6CM9mpEBAWeqnOPDEDaVIXKhue+qWoWOX7NMcgtXNAbLf+HPQF
 R5b6rDmVkwTb8kdhymeu4LbCBkWMTHuRnWsQgmTvz+HJNtERQBLXN57BcnRknz+gbb
 WNvOM4QKaB/Vd3KQJbgYNPmX3D/yclVXWbPgr1j4ZsIuOZnvJhGtiSxW6y9ndq48C9
 pf3DbifNd4J7E1hHFfHvL8ulD+AdlBQjjUja0/AZ1+Jk8PZRWVZWu9dNQeOiMPbNxq
 pTL2wW6ob/PtA==
Received: by mail-ej1-f44.google.com with SMTP id k25so10984842ejp.5;
 Thu, 17 Feb 2022 16:03:17 -0800 (PST)
X-Gm-Message-State: AOAM531rBc0kHQ5VDxddERAOulI0QBXL1dhnub560OrUfYgi2RCNS7lc
 HiTCvS1QH+3ib9sBRG6cb+Y6rsjiiAZnu4b6/A==
X-Google-Smtp-Source: ABdhPJwNZ8Gn1YzBJjLxrrtfN6LP5bOLGy7kXwLb+nDLgvmnbNet1LrNDkydOaJaHID5iSh0Q6ERc5ApacS/LXwChqg=
X-Received: by 2002:a17:906:a20c:b0:6ce:a87e:5013 with SMTP id
 r12-20020a170906a20c00b006cea87e5013mr4165604ejy.379.1645142595567; Thu, 17
 Feb 2022 16:03:15 -0800 (PST)
MIME-Version: 1.0
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 18 Feb 2022 08:03:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY__wJw2QmathuWe9fJsNb=evUbGEFHAZzv9VuzXyL5GK3w@mail.gmail.com>
Message-ID: <CAAOTY__wJw2QmathuWe9fJsNb=evUbGEFHAZzv9VuzXyL5GK3w@mail.gmail.com>
Subject: Share the maintain loading of Mediatek SoC driver (the display
 related part)
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_160320_783874_84BD5B2B 
X-CRM114-Status: UNSURE (   7.98  )
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

Hi, Matthias:

It seems that you are so busy that you do not frequently review
patches. I would like to share the maintain loading of Mediatek SoC
driver (the display related part). I list some choices:

1. I would be the sub-maintainer of Mediatek display related SoC
driver: I pick patches and send pull request to you. This would mostly
share your loading.
2. I would be the reviewer of Mediatek display related SoC driver:
After I reviewed these patches, you could take less effort to review
these patches.

How do you think about this sharing idea?

Regards,
Chun-Kuang.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
