Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C2EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:00:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D588233FD
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D588233FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOLqWg6R4k3kVQWa8Kubx2IwkQMonRADabx1dpRLQuc=; b=UllGxpTLqVPopcxj0NjlgBDyWZ
	U5/SytPO/e2cqxO0zT6B5n2z+WtPwwqODuLmv6wgeGr4V0L8tqP4aYa6J1nM65XrCphwrrJvit7l0
	JdyivRbK0s+wRo/gGgF3WKuhRc/hzhtr07Z1MH2TDwOBtt6VllW0ux2mg8r8cqmrjEQsXzIy5JpCS
	1/MuX9CnFptZhF7PGuPWc4O1hBUbH7pmFp0m30O1XsWWO+qBe7Rrg04Z/ntz/sITgndl0R7O4hGnd
	HCLDV9Qn1R8tW7Txck6Tk0V7k3IXm1seGKzLuqKoM/PGnc942wzza/jJoegifLtk1JndSGsNxyuXY
	9o3fQ+sQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdsL-0003dA-0L; Wed, 13 Jan 2021 10:59:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdsB-0003U1-Te; Wed, 13 Jan 2021 10:59:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96C0123383;
 Wed, 13 Jan 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610535569;
 bh=UsiaJ5TeFRIuOKIuSBE3ueTDIjqdP8/ojUP8xNThLiU=;
 h=From:To:Cc:Subject:Date:From;
 b=JwQBO8e3swkxbw4v0qYoQuzfOutZcHgnI0MSHLSa7aQYUqKKz9xGmdslvbE+6X+pl
 iQOsreIaYUaopfrnoALMeRcoV8b2ewED6qoB6VZAohTV2XoiM/Ugq8CdhsTDpkpFSC
 sHsApbyrBjWJlSbUXBv7tLCy1UNX3cGrSSAD7j++4HLesIzeEjFZVPQJn2J5oLmjON
 LO6JcKkXMZsrXk8YpCGzlX782pac1zAqJFB7uHTlnn9sXRcGD3zlcwAV7Mf5VR7pFG
 iH9Nqr9o9EuUz7C11onQCo1Sg/vfJIRxblyM1+yeUPdfpo0R+ivUmKOYdf8WcgHtgm
 MAEc9cWWKa5YQ==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzds7-00DpFo-1W; Wed, 13 Jan 2021 11:59:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/24] Fix broken file docs cross-references
Date: Wed, 13 Jan 2021 11:59:01 +0100
Message-Id: <cover.1610535349.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_055932_104074_DA89A793 
X-CRM114-Status: GOOD (  10.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-iio@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 dri-devel@lists.freedesktop.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Joel Fernandes <joel@joelfernandes.org>, linux-arch@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Airlie <airlied@linux.ie>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Daniel Lustig <dlustig@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

File renames and yaml conversions broke file references for several files,
as reported by:

	./scripts/documentation-file-ref-check

Fix most of them.

Please notice that this series was generated against  linux-next
(next-20210113).  So, it is better if the fixup patch could be added
at the same tree that received the patch renaming the filename.

Regards,
Mauro

Mauro Carvalho Chehab (24):
  MAINTAINERS: update adi,ad5758.yaml reference
  MAINTAINERS: update fsl,dpaa2-console.yaml reference
  MAINTAINERS: update st,hts221.yaml reference
  MAINTAINERS: update dpot-dac.yaml reference
  MAINTAINERS: update envelope-detector.yaml reference
  MAINTAINERS: update current-sense-amplifier.yaml reference
  MAINTAINERS: update current-sense-shunt.yaml reference
  MAINTAINERS: update voltage-divider.yaml reference
  MAINTAINERS: update mtk-sd.yaml reference
  MAINTAINERS: update atmel,sama5d2-adc.yaml reference
  MAINTAINERS: update pni,rm3100.yaml reference
  MAINTAINERS: update renesas,rcar-gyroadc.yaml reference
  MAINTAINERS: update st,lsm6dsx.yaml reference
  MAINTAINERS: update st,vl53l0x.yaml reference
  MAINTAINERS: update ti,dac7612.yaml reference
  Documentation/hwmon/ina2xx.rst: update ti,ina2xx.yaml reference
  arch/Kconfig: update unaligned-memory-access.rst reference
  include/linux/iio/dac/mcp4725.h: update a microchip,mcp4725.yaml ref
  doc: update rcu_dereference.rst reference
  ASoC: audio-graph-card: update audio-graph-card.yaml reference
  dt-bindings: display: mediatek: update mediatek,dpi.yaml reference
  dt-bindings: memory: mediatek: update mediatek,smi-larb.yaml
    references
  dt-bindings:iio:adc: update adc.yaml reference
  dt-bindings: phy: update phy-cadence-sierra.yaml reference

 .../bindings/display/bridge/sii902x.txt       |  2 +-
 .../display/mediatek/mediatek,disp.txt        |  4 +--
 .../bindings/iio/adc/adi,ad7192.yaml          |  2 +-
 .../bindings/media/mediatek-jpeg-decoder.txt  |  2 +-
 .../bindings/media/mediatek-jpeg-encoder.txt  |  2 +-
 .../bindings/media/mediatek-mdp.txt           |  2 +-
 .../bindings/phy/ti,phy-j721e-wiz.yaml        |  2 +-
 Documentation/hwmon/ina2xx.rst                |  2 +-
 MAINTAINERS                                   | 30 +++++++++----------
 arch/Kconfig                                  |  2 +-
 include/linux/iio/dac/mcp4725.h               |  2 +-
 tools/memory-model/Documentation/glossary.txt |  2 +-
 12 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.29.2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
