Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97898C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6558261029
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6558261029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e/axqzhvq0hOHdSlc+fd3Dt9PpgfEEZeiqhIL+yhYlo=; b=gqQ5aN7ihM/2bo
	CXcO1dlnPTanuNH2W0al9gM12Gme2Q9FD1rO6LaAmu3GiT/alDfhHDlYMQrv92t68O1uFPhswHrXB
	C1I4hPHueGg9ArMBqAGYdXI18kQFJpfoNeChuzqI12nM5aebZmODFrhkaE3s8WejXF1x3ihtK0tGK
	crVf9mbbHW5vWCH6j2KNSfRLdN5WJw/RyZJ3+Hp8GBRmsj9+XmK1ozOgV126ahRYZfse++ITSnr2z
	ftgCEUtMBeyI+x6hQUMwu17VXXfKb1avTybV4WlJvhe4i+Qy629U3NA8dBwGD/lnEfGPi3WZnc032
	UXsBwgp/yR6We5YKVd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1Ee-003KxM-8P; Thu, 14 Oct 2021 13:57:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1EQ-003KtJ-0c
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 13:57:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id o20so19860731wro.3
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PdtaPAjwY1HbFARxyeJr4Hhcr2WETWAgftpSE/ylQY=;
 b=LgYQr3bQkU/3FijQiZD5jUA0UY1jel7vEtTgG9l0/Ccio2VJFVPyJW9aEtroy9bpqS
 F/GWkYggAHgvd7gNhpSX208+aQ6rqEKPoyCPZDb8EUdwa3dBCiKBgGJd98GK249gBeQN
 mIhoH5HAuVqgfwNiCH70Q2d30qxBXPxIxpp5vEQQvBj8wqvMdkY6RTcO3zTXyEf8ULXg
 CMVdejZALtV1dugFT/aCeag19rm3dlRW3rIfTdDCa6g/7sYfxue1UtketluBnyxi82yQ
 3j+ZpZkbSkedGp6oSTefFIVGDLH3QtaLi1UnkVGB2mp8PTR87VRoKHuGXu2TrTnrNdq6
 HpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PdtaPAjwY1HbFARxyeJr4Hhcr2WETWAgftpSE/ylQY=;
 b=k0viCyKo5Grz+hhLCAaaOQ6Vr4jTtgjiwQNUx2VByAllc/5ORBypmMx7eRi0uU4Nq0
 ACrgetgrwPoIAskbdDdKYGgj4gXZTL4qmY0O2HPnR5v6lp4O2zOUclu3G17zetbwfr5p
 +pjrjmdsliKAVSvw1Gkw4egX1/7QLuu7OENE8en2t5qHKjBc4CrZJo2ed+7ipQ/ApcCa
 9JYxnzHaObIN1ju5hzLLwziOl+EZqvHsnUoTJOqGqoPWfPPk9sWLjC+j2Y6TnO+k7dyR
 6CjTuXF2eL31nNheRrlwIUYUEcXuoSWKSttQZ0eOsd584yP7073vQqxWR3ZmFrWtBQYC
 dncg==
X-Gm-Message-State: AOAM530z90F1nan6WOSc/q8lHp+B0KUcxJyNoUqp8flmSwTgqj+6th3o
 7qH+8X8ckR6voPckSg3KXJ5VSQ==
X-Google-Smtp-Source: ABdhPJxyk5nP1wBaYxGhuedyLU+0SDeCtC5cBN2hBIiu4CoLUTvAvG4FILymFzOyfeFDfCmElUbCag==
X-Received: by 2002:a1c:808e:: with SMTP id
 b136mr19498987wmd.178.1634219831347; 
 Thu, 14 Oct 2021 06:57:11 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id d1sm2596480wrr.72.2021.10.14.06.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:57:11 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/3] thermal: mediatek: Add mt8365 support
Date: Thu, 14 Oct 2021 15:56:33 +0200
Message-Id: <20211014135636.3644166-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_065714_151274_F63BD333 
X-CRM114-Status: UNSURE (   8.06  )
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

Hi,

this series adds a compatible to the bindings and a specific part for
the thermal driver.

Thanks for any feedback or comments.

Best,
Markus


Fabien Parent (1):
  thermal: mediatek: add MT8365 thermal driver support

Markus Schneider-Pargmann (2):
  dt-bindings: thermal: mediatek: Add mt8365
  thermal: mediatek: Fix apmixed error message

 .../bindings/thermal/mediatek-thermal.txt     |  1 +
 drivers/thermal/mtk_thermal.c                 | 93 +++++++++++++++++--
 2 files changed, 87 insertions(+), 7 deletions(-)

-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
