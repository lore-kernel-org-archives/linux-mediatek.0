Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A474C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF899604AC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF899604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNx8L3ZNU1YF9d8QtM78841wCXA40TzS4PI8V53C8+U=; b=sEKjDa1Nt+KNzlP2ApCJjZ+7OO
	3hskEsN873YDb0GZJYyUmoWXhgVc2A++X5+qDbCcs4szs7t+gOhgXESjgNrLOQYSDV2sIf6Qkk6KF
	Z8JvBMA8oGY47QXcBzIy1jPTgmUjBIc+RZ2FwvTcYxWa1yBagBtZeJxwqjZyR7eNWC7MV87IdMcPz
	8+LQx3uDg7Re23d66oISaRMjQsnR2ObyDTXJbOfq049V0viEvt3su8xtu+RdtM009yhymWoJwtJrI
	s7bRZk9ozAyhD47LBaHBmGc7HwtALQhAm8NDBkvR6Nm09gN0MqugJyVDXP0rY5dvlBL6sghRjZYmj
	4ih/fcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZsBJ-008kfy-1s; Mon, 11 Oct 2021 10:05:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZs7G-008ivY-Bn; Mon, 11 Oct 2021 10:01:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k7so54168569wrd.13;
 Mon, 11 Oct 2021 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=cAbwwP952kvEacD7RSRVQ9sh3+q9Zl9oRrHXxMZniwU=;
 b=GNxzCTvCIEL2Gcxa3laYCUc+2xuZunUIs3EoXxKX6bbXaPrNVgbIOwMQiLc5nQczAc
 05wqwKgMXz3rn8OeUUoX/sLp52giLbc11Vj9B8fe0iVHUS+Qf0z7ctOWDBpY0PyNju6p
 JzI/vRhWE+FxQt/1nojQJ7UBTytcJHr6nOUYmSzadvzVF3g7/bRoFhUNOh3ViHZ4g1QY
 S4FqJemOVm98IGv8Pxcghaz3cCqOrdm0EnDzhuZkRq+9gYplsj6isnOMlCIchfHotQC+
 aZenjcLG5J2TroxIzESc/YOFOFW5OvYz/t4ZAfu81rD/XLeJhXmE038hyEn1lRmpoQwA
 AiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=cAbwwP952kvEacD7RSRVQ9sh3+q9Zl9oRrHXxMZniwU=;
 b=PCEoB6J7x4UpwM8ZvNq3dwP/MPxcClXNWh7ax8yqWWTX9WmXyTrmj/1s2GhAHodYbe
 LFBGcy0U1Bsm8fxYUHUvC8g9xJuu9Z5R5xDu0JccEi2/AA4VltW8TQn3ZNzUVQ84PoPV
 /eQbtOWSB8EYQuNyJMf/tCGK5ijAZ/FvR3pycuEKfGzpmiEEAle0/8R4mtB+Kt1OacPy
 2+GOWyeTeUIllwjtJLI4lXumnTf3yHUxygUzz+QQG7ltx/S05gEd4ux53UjxdEJLhkX8
 A4+Vyi85JREuJQvDy/ZZpLozVrwHcGIheYHuU4hCQ1F0P6EbjLmGyzKm1/EAxq3TdkZf
 2R3w==
X-Gm-Message-State: AOAM533aQ4v+dCa473yV37t44O7lbyCYyycc8/obVYRCgeORiGFa3KhH
 Y8WOS+dsK6kK3oXOfhULgO4=
X-Google-Smtp-Source: ABdhPJyx09uv+MZu7rOOt5ALrnktKXdNkG9ZPmLVW2L+frJE4bGjcZWdZOYErVuqKN7LbsYlYB3ryg==
X-Received: by 2002:a1c:a712:: with SMTP id q18mr19874986wme.23.1633946464987; 
 Mon, 11 Oct 2021 03:01:04 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id o7sm7658739wro.45.2021.10.11.03.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 03:01:04 -0700 (PDT)
Message-ID: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
Date: Mon, 11 Oct 2021 12:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek updates for v5.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_030106_518448_86D9FE50 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd,

Please have a look on the changes for this round.
We have support for mt8192 in the mmsys and mutex driver. Apart mmsys now 
enables it's integrated reset controller.

Thanks,
Matthias

---

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.15-next-soc

for you to fetch changes up to 605c83753d97946aab176735020a33ebfb0b4615:

   drm/mediatek: mtk_dsi: Reset the dsi0 hardware (2021-10-08 15:15:26 +0200)

----------------------------------------------------------------
- mt8192: add mutex support
- mmsys:
   add more components
   add routing table for mt8192
   add reset controller support

----------------------------------------------------------------
Enric Balletbo i Serra (2):
       soc: mediatek: mmsys: Add reset controller support
       drm/mediatek: mtk_dsi: Reset the dsi0 hardware

Yongqiang Niu (3):
       soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
       soc: mediatek: mmsys: Add mt8192 mmsys routing table
       soc: mediatek: add mtk mutex support for MT8192

  drivers/gpu/drm/mediatek/mtk_dsi.c     |  5 ++-
  drivers/soc/mediatek/mt8192-mmsys.h    | 76 ++++++++++++++++++++++++++++++++
  drivers/soc/mediatek/mtk-mmsys.c       | 79 ++++++++++++++++++++++++++++++++++
  drivers/soc/mediatek/mtk-mmsys.h       |  2 +
  drivers/soc/mediatek/mtk-mutex.c       | 35 +++++++++++++++
  include/linux/soc/mediatek/mtk-mmsys.h |  3 ++
  6 files changed, 199 insertions(+), 1 deletion(-)
  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
