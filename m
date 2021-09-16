Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139DB61185
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 139DB61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FanM8EET+3o1P0+SorJnXOS/O5XGiACdGtpjD2bDrek=; b=hL43knb3RZqkGW
	WLMSwmbQYWj7c4w9GRwSpiCFrLoclxtDF+O18bnLwSmLU1QC9Gjhfowa1awguWCAeulnIPOZMCKs8
	7TTysuWrpthLxaM03VYsE+CwWxhzHq3eKLTJD59hsHxRihJVLVKoypAqedu+o/BhAFfAo0Fe9CID6
	cpDty8e1kV9t2P7Km+fup1td/nRgO5RnaIZF2aZRLb9kAlAcRFFZjMAvpXhejmySsEHaoUo3gLHQ6
	dyaFnrapDNEtWetX43g3MfpW7oXu0mTT0HKEzYINXkl3NG1UuQTO/jNg9zJKjkf2sicc1dTwAJyPy
	7P/QDm2ZaayC1rOeKZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQo7X-00An3P-Al; Thu, 16 Sep 2021 09:55:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQo75-00AmoG-B6; Thu, 16 Sep 2021 09:55:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D6596120F;
 Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631786126;
 bh=75WrKbSFBKg3yzGt07IbXwPNTFQ0wIIFH/Or+OVz1tk=;
 h=From:To:Cc:Subject:Date:From;
 b=uF5yJPv/qiKbXXEFvin6OmfsjMRrph3HNOgVM4VP8l98VyCCn6ZiDH4Vz9ThIa3nO
 /R3BLqZrexnLqAhaLqqje35cJvGT4N3rzjw+tJcda+Ho3iJSy3WwY5wVLASpoPMaG0
 BdVfOxuhSoKonDNgYiYNAV5b+jhnTDG3G0iRsZjuDNsSqouJPu1+uSll78aJKox5Ns
 KwHB376rUBOCM9pslwyGU8l8WVSDWBaAmSdRQHZs7Vn9W0IUzd/0QWauFDPCMtQEHo
 PeyD1wssHY2MBiz2gKKjgNgw/LEq0+KlatdR8BlJsvdBjXO7hPlAu8a1uYbkmb9sPv
 1LdRPeVp9uZAg==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQo72-001vTH-32; Thu, 16 Sep 2021 11:55:24 +0200
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
Subject: [PATCH v2 00/23] Fix some issues at documentation
Date: Thu, 16 Sep 2021 11:54:59 +0200
Message-Id: <cover.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_025527_431538_E8CBBD32 
X-CRM114-Status: GOOD (  12.65  )
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

Please ignore the previous series I sent today [1].  I forgot that I had
already submitted a first version of this series.

[1]  https://lore.kernel.org/all/cover.1631783482.git.mchehab+huawei@kernel.org/


The first patch in this series fix a bad character used instead of
a "(c)" UTF-8 symbol.

The remaining ones fix several broken references to files
under Documentation/, several due to DT schema conversions
from .txt to .yaml.

---

v2:
   - Added a couple of extra fixes;
   - merged two patches touching mtd-physmap.yaml;
   - added missing tags (acked-by/reviewed-by) received after v1.
v1: https://lore.kernel.org/all/cover.1626947923.git.mchehab+huawei@kernel.org/



Mauro Carvalho Chehab (23):
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
  MAINTAINERS: update arm,vic.yaml reference
  MAINTAINERS: update aspeed,i2c.yaml reference
  MAINTAINERS: update faraday,ftrtc010.yaml reference
  MAINTAINERS: update fsl,fec.yaml reference
  MAINTAINERS: update ti,sci.yaml reference
  MAINTAINERS: update intel,ixp46x-rng.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update gemini.yaml reference
  MAINTAINERS: update brcm,unimac-mdio.yaml reference
  MAINTAINERS: update chipone,icn8318.yaml reference
  MAINTAINERS: update silergy,sy8106a.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update ti,am654-hbmc.yaml reference

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
