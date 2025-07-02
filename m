Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F3C8303C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 21:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QkGp+3Fu5XVnyvQn7eeIzbmUQEGbR66f9BykQ6InEVE=; b=nOmA9jqtalviBvX3t1ioCpCcWw
	GJwTX3wHaeF3kjzxTC6KM1FMR6JBEKusVGxOjdzue5ae9A+AiCHIw9rEDnkx6eKMrh9apXchix0K/
	SVHSiUR4eN1DsRG8sZk3v2lRLKI9vjdv075xY9VzLNOPQg+HMczXiDcS4sIRWDDCCsud6Am3nojHw
	2W/CBM5CyQxFnB8zGFnSEJLyu424kEnq4Plp6Gg/ejcbtr5ntvrcDbsitpN1LF5YfAavNEKbGkGH1
	gruiRjBz9rI8IbopEWnhrGEiQcgVAH1VAOZHlMT4GRIQ/2e2m/nI4Snq/Lv1QLZlxOmkx7aWlpS91
	kMpbanrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5UW-00000009eDj-1crX;
	Wed, 02 Jul 2025 21:59:44 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5QC-00000009dqB-1EkC
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 21:55:18 +0000
Received: (wp-smtpd smtp.wp.pl 32088 invoked from network); 2 Jul 2025 23:48:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751492912; bh=QkGp+3Fu5XVnyvQn7eeIzbmUQEGbR66f9BykQ6InEVE=;
          h=From:To:Subject;
          b=FGUQmwg25MZJfDyKf2+cF2PhiPOB+37g3E5FT3rMQcQydFO54zwxuDyzU7uFrAztD
           KvvuhPyeVWkqZpy2WqHUOW8EmjsXDdAjanDvF3k2NyWHTW7glIr5pY3S1Tfi0JdVEH
           TJ9M8cfvKFWzm8uCEwEt5ujFQbvww9T7IOokBRnKoNMHgy3MDdUfUXOZbJD7uIaTOi
           PmUYxv7Cn4alRfUlRTF5PIHSzvbn13coAP+RvxvjjILw0T/QXhUCVpITLyMmrZyvSy
           NzntldPX6C+4buYcZrfHm2Xj/WJqTDTtpi5sMLKAJC9ijQdOWUcMwo6jBXDK9tNKRl
           bD4EBh6RsiXHw==
Received: from 83.5.239.54.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.239.54])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jic23@kernel.org>; 2 Jul 2025 23:48:32 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] Add thermal sensors support for MT7981
Date: Wed,  2 Jul 2025 23:48:28 +0200
Message-Id: <20250702214830.255898-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: de0d4fa9d5cfaba10f7407784c50ddb1
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [UYPk]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_145516_503048_2EC07DF8 
X-CRM114-Status: UNSURE (   8.89  )
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

This patch adds support for the temperature sensor in the MT7981 SoC.
This sensor is exactly the same as the one in the MT7986.

Changes in v2:
 - added fallback to an existing compatible string
 - removed second patch as obsolete

Aleksander Jan Bajkowski (2):
  dt-bindings: iio: adc: Add support for MT7981
  arm64: dts: mediatek: add thermal sensor support on mt7981

 .../iio/adc/mediatek,mt2701-auxadc.yaml       |  1 +
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 32 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.39.5


