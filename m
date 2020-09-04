Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FAAC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DED7206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PppNZse8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Er2cu9Oz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DED7206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p20Z+/XH82vLvgA9RcaV2hQRN5iAV9JLcaweEaABLJk=; b=PppNZse8zTnHZ7+ZlyCPsi5Xo1
	gby+GQ8QB8E+g6fCKSU3skm9vdz/OHRsDxe+JunvCUtoFhgNGjdzDFPpBXc0y95fbQIfcC4XSGYdy
	vg/+qavUHMS/SMeliD8vF2zjCR6y6TDhy/7icorD/j4vobN0J9eV3d9D83LMFZOISzBXG0d0iSyHy
	R9cDMXFzXw0lVoX2SUED0v5PDVysOWdKGIx5t7zrdw654vi8vNnqgI0o0G/+Me1nwA+WCSGyzEIja
	EQALNJn3wK9AW3PsqsCJtK7cQns2h4YwkTfiV32tbvAl20YN0rNIgbPhkZVGhqyW9VanbyWzWtVkv
	Dyq2cVrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5TJ-0002zZ-0q; Fri, 04 Sep 2020 06:45:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5TA-0002w4-3O; Fri, 04 Sep 2020 06:45:09 +0000
X-UUID: fda48155aff743f28e15f6ba869e6c4b-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OQecg9cZ8/g9Z/4uGEw+tFX+Ft+eJHlpTokpoBrahJE=; 
 b=Er2cu9Ozehb91VvYji9Sv7KR8XFY2lVsbSXnuN3sxOfdv+Fo5jfgIdk9QmoEBtOEkWQqQ3xVngs7sB9zvN42t+XlTTb26xfbwp6tAqSj9NyWjXZGteeOFZZed9sEEpiEjASWwzK0eep+6o5B+ocF5pC89j/6r0z/lloLIoJUSvg=;
X-UUID: fda48155aff743f28e15f6ba869e6c4b-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2129140577; Thu, 03 Sep 2020 22:44:59 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 23:44:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 14:44:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 14:44:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH 0/3] Mediatek MT8192 scpsys support  
Date: Fri, 4 Sep 2020 14:44:52 +0800
Message-ID: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_024508_287256_758B677A 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.9-rc1, MT8192 clock v3[1] and MT8183 scpsys v17[2].

[1] https://patchwork.kernel.org/cover/11752231/
[2] https://patchwork.kernel.org/cover/11703253/


Weiyi Lu (3):
  dt-bindings: soc: Add MT8192 power dt-bindings
  soc: mediatek: Add MT8192 scpsys support
  arm64: dts: Add power controller device node of MT8192

 .../bindings/soc/mediatek/scpsys.txt          |   5 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 148 +++++++++
 drivers/soc/mediatek/mtk-scpsys.c             | 297 ++++++++++++++++++
 include/dt-bindings/power/mt8192-power.h      |  32 ++
 4 files changed, 482 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8192-power.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
