Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB006C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB2B61108
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CB2B61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vL/ozqVlQY/RsSEDMlPVfYAAxN5jDxrOssAZJkzQ/v8=; b=CEesWDMHPHjfyC
	1vR9Nnjf5m0Is21I1CEm2Zm+AnLTNW0wYMbtuCQ9kkcfJwZnwHJHtFSl4nXL9b/cizxfa0YZNfUxE
	iXjA020/M8KVovcplyOZ7yJBRNFPbv+HRRUepSUWRvBTTuBL7eMeK/N+Ms5U+tWI/V+emM2Vjl5I4
	qLCpm+cVcebmCyubOnvS+hhBEmSRAeZoS7Hl/lJzflRxyVTL8QlFszWmHyh6YKlu0AnlzbONG5DMo
	8LU0q4GrYd58noZfFYVn8gbdiM6QLxxN1Rb+aGZE3XLVJn/Nsw4unw4D4Z8GWxIS/Vq9RcgNRILcz
	jqJFnu9CFyMCpksqJeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQnTa-00AeL3-Ou; Thu, 16 Sep 2021 09:14:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQnTK-00Ae9P-8Y; Thu, 16 Sep 2021 09:14:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E1A0611CA;
 Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631783661;
 bh=HpXVplz89oKyc+hivBPzxb/s0fvvid7dqIkLDoV0E8s=;
 h=From:To:Cc:Subject:Date:From;
 b=lRyC+Gl6hpA65PTmNoIvzIyVlFwS1vvgpOXA4IShHvXBxni2jYB5SiQUoU+fAPpe7
 MhnOfSEDpi0f8ZqYssR8CnOyMA/WbCzxSWt1mOakOCY8TqwNRCL3kQrQCKrB2zWRIB
 5G0n7Tz6Uoky9NsNn5NDTtSzpSpYgyGclzrBZA3Gs8NpLY4HEgX3PjaPn8FmThtKR2
 aBhvThsya5NVQoLmW1gxaxwHQwFF6ykyqS6fssrJvf8d7OLU9EwLMDYNfhy/Dw6CY7
 InDJMP3HNKwr3VvEbl2g/5QXYa9v7CBmkpGyauf133KiKGoSP98tRVlSt1Mjgaucod
 b9jsm+2PWf6gQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQnTH-001sKa-8R; Thu, 16 Sep 2021 11:14:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Evgeniy Polyakov <zbr@ioremap.net>,
 Jakub Kicinski <kuba@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, sparmaintainer@unisys.com
Subject: [PATCH 00/24] Fix some issues at documentation
Date: Thu, 16 Sep 2021 11:13:53 +0200
Message-Id: <cover.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_021422_376319_ADBB5DAE 
X-CRM114-Status: GOOD (  10.37  )
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

Hi John,

The first patch in this series fix a bad character used instead of
a "(c)" UTF-8 symbol.

The remaining ones fix several broken references to files
under Documentation/, several due to DT schema conversions
from .txt to .yaml.

Mauro Carvalho Chehab (24):
  visorbus: fix a copyright symbol that was bad encoded
  dt-bindings: net: dsa: sja1105: update nxp,sja1105.yaml reference
  dt-bindings: arm: mediatek: mmsys: update mediatek,mmsys.yaml
    reference
  dt-bindings: w1: update w1-gpio.yaml reference
  dt-bindings: mmc: update mmc-card.yaml reference
  libbpf: update index.rst reference
  docs: accounting: update delay-accounting.rst reference
  tools: bpftool: update bpftool-prog.rst reference
  tools: bpftool: update bpftool-map.rst reference
  bpftool: update bpftool-cgroup.rst reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update arm,vic.yaml reference
  MAINTAINERS: update aspeed,i2c.yaml reference
  MAINTAINERS: update faraday,ftrtc010.yaml reference
  MAINTAINERS: update fsl,fec.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update ti,am654-hbmc.yaml reference
  MAINTAINERS: update ti,sci.yaml reference
  MAINTAINERS: update intel,ixp46x-rng.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update gemini.yaml reference
  MAINTAINERS: update brcm,unimac-mdio.yaml reference
  MAINTAINERS: update chipone,icn8318.yaml reference
  MAINTAINERS: update silergy,sy8106a.yaml reference

 Documentation/admin-guide/sysctl/kernel.rst   |  2 +-
 Documentation/bpf/index.rst                   |  2 +-
 .../display/mediatek/mediatek,disp.txt        |  2 +-
 Documentation/networking/dsa/sja1105.rst      |  2 +-
 Documentation/w1/masters/w1-gpio.rst          |  2 +-
 MAINTAINERS                                   | 28 +++++++++----------
 drivers/mmc/host/omap_hsmmc.c                 |  2 +-
 drivers/visorbus/visorbus_main.c              |  2 +-
 .../selftests/bpf/test_bpftool_synctypes.py   |  6 ++--
 9 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.31.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
