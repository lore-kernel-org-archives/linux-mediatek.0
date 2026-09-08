Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CF8C79F9E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=; b=CmbcsiGD99hrh3At5ee77haz1s
	Jr/HnE3erdrLhcqSYGk0mQewrk6u1pm7adnFfpWd31NQf3lgPORUOXWBnzva3N4BOvY7iuQ75vhRk
	P7lZfUaJm74Fx+gd5ydDracitgiPEWJpaPXCre0xdTLwy9PqiUL3kYhETr60phdTLNfIRZiCj9C/N
	mRqFkZESd51SFFeECeroGJefPBdfkRM/yqNbpEu3LovX0+RZJDtkDul/Sv0sI1MRz0sE57eu/5Jz2
	7dPTbRrI1BJkbBneqOXUzteDMqbnlcbVOgSOjoAhhsSqoOLcuNP4zLK5fyTgstRAEAxDU6CiZSDpS
	pMvVIe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009rww-1PyF;
	Tue, 08 Sep 2026 17:44:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrw-00000009rol-3EkF
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso40453595e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889467; x=1789494267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=oBQswOJ36pYxPh203EQnX/9KLbN7l2Mzpqg13ABDEJ0tvmgrY2ktbyxXT1xJ64iZDo
         MOPYtkjU8e6YJ4vvXKklX041nyPPvQ14GuFL7X3g1orhHIv1WOVNx6reSfrcMuJ41mu7
         JYMaDHhCi66cBMn48GLvO0J+meIbwxKwD4rLWm0U3eJw0+JLjIrHqVbXR1FKMB4z9kS9
         FSzHFz0MLV8bE8kcxfzYpwbCxnvmNDukEXeBrikoRsiKecs17XynR4yyUms3lkGFwyeu
         M61LoFbu/i2mtXANNGGvX6UTd5rLQq/Ly0kXyo+8umLEpDPgAyP+CSVKbfwA3GDXwckw
         igMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889467; x=1789494267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=afgP/ZpBr9SABSW3u6lR8bdvAWjK611FO9EfdbKLYQt5grxMzqHSc/+YfLrir1AJ5k
         NJx2p9ethTRX8TDpKqEHjLzvIcn0/uuY2XX45KTEhKLRKH7W5GPpldrX+P3u+qk/K1BY
         Sf/0jLuNkNxxEvjVskX9MYcvdxrX8FUBBcvSvzTdLGxM3lG0FmcXQp/mBU2t1aDD2XMP
         JjnPGL0IBL9gFgSsn+hvpS/93LqwwCO4Sky0qkyA+gh6/IDsboPuI/+6ALTlm98o8/Fd
         4V4b4EaMzxrRgg2mEyiceZI29rEJ0D/s6TfkTdxk3AWYwfGwrGcyGahnZ+PnukYEcNez
         OvPw==
X-Gm-Message-State: AFuF++nEEbUfN/PEBDlbfHcvMmI9XJcPx6qj8WWECLcXpZo0wYZtUkZJ
	CzATnk6jw4AlQAFIzVmHTjE74ir82rNd3gb+Zrd/sowBodq7zpveSoQU7cvE2wDW
X-Gm-Gg: AYBFou3zrnGaCMt8VyUZwc33M7NxEPZn4UTmw7D+hSChhOVGIt7DnjKUZyq0wgepuft
	K5S4cVNtZMq8sMj3HMb+7mJ1h/W4N7AkKqFZhs+udlmldjFHRakA8TAiSeGClZpHYwz1WdIsVXf
	wovQY68f/gT5372ssUuhffClmEhQvohAMfQIa6RpI6xGXy1SkHf8bMvcYoUYAK2HNJNIXGvJ4E6
	OE4VhSwM177FXc3mdS6w/3MlaZ/GA+CHburQ31/vxMxhuyOg1LhN2yTxfZmf0agJKbuQj24ao+I
	KnZ/CHxHvMCrHSGlp5XbBwJTSOWOkPV5nCtciR+BxF3T0lZkELephmbnT9+F57kdfSBdp/+My62
	rn378WPZRjUSCZnREh6LayJhj8a4nMW2MNtcDHqcOD5Y2Py98tSmCXHGXtdlj9Z1qAAj7GV7t7n
	RuvNatm6BBiekojp8IMN4Vwbzh+10RbaeZ0azcZgxuiaQXE58xRu82HpIV
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr290969905e9.2.1788889466528;
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Tue,  8 Sep 2026 19:38:29 +0200
Message-ID: <20260908174259.9009-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104428_841035_D09C3A62 
X-CRM114-Status: UNSURE (   9.67  )
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


