Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0F8C32771
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 10:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22D92073A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 10:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csecJeVj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e7tdu/FM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22D92073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=21yjo002w5QCkdftwXURkLR3c9nlnQRkzGIwju4i7VE=; b=csecJeVj1YVNVf
	OpoYSQxVik087qmseUHYzzjCYTzYgHgVZbd5aKXmfjv/DcwgJKY72Yk74ViHU10etBdwUZkbFoKFX
	lpheDV6Qa9JHzOK1WEwS55k264A2UO3VJxF0zfUNBS6ZT235g5OcLtiBEGzmeg8NnyoW7yzP39LH4
	qgKns6UjDatMilWD7JXiUNuWXsxQAK+jk3v4wx+5eS3eaxgVBqG0elZelzPgWAQ/oQr7OvdV0L6uE
	cT++m+vZlouysPOS2SWP0dNE9hmQN0ts/i/o0JjM/1OHOJoCRwJNWaGkP+GDjNod5H0lahnyVxtzx
	HmN8uBMiyQuvxsdYQOYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipUmL-0005Uv-Ra; Thu, 09 Jan 2020 10:11:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipUmD-0005MG-DR
 for linux-mediatek@lists.infradead.org; Thu, 09 Jan 2020 10:10:54 +0000
Received: by mail-pg1-x52f.google.com with SMTP id k25so2992697pgt.7
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2020 02:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oYLObm1EH6YdnVAuxH4HhWVzCuwo//V40I0Zoh1cRWA=;
 b=e7tdu/FMMGGPPVjoNEmiQCT1rQIRQsa/DcyBNt3Kcufdm6iA+2yEHtlK700c7XSip5
 29foJIQjO1Ux894Sx6t0T47Q++Fb59S2z9PWL0iPs5xFkNi6dt0Nz2HifhwCl5N6cPLo
 pjodAHyNp6UXTwVz31UGyLFgqRpjy0RIlSYPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oYLObm1EH6YdnVAuxH4HhWVzCuwo//V40I0Zoh1cRWA=;
 b=ry5YG6ZyJQeJqJsxXsjacre7pXM/5dsmch75HGgNtedUEk+Hy8CJnmYj+sn2DwRHLd
 ZFf/nNlPSRb77vZNK2Dzfaf1MPfcsBAbnuTX8DuhV+FdLbt/eubriigDznQ4q3L7jv+W
 9qjHcsvlq1WF+GkiS0rlL1ZlEDHKyJN6PI8xs7es8hctJWK0kh87Y/alT81+yp1TDR06
 xjwgFaoO9mrX6g2yxTj59qRx4QEhQMXbp6JW26V2Sr52zhCwnGXfvQ23G21Jo3fWiuB3
 LbXspxWbPwgnz+P5srbuTHtugSuSBwnRBcblIJ85UUHVD8St5cgfRFrIRqRC/WYBmnSD
 t0Kw==
X-Gm-Message-State: APjAAAXH+oS0zJ7KMDPHQCN5acmac/E1lVi3u3V5YMrKHGvwLqQtI9mD
 ktI/Up4YlsTjjz1eFxttk78Q1g==
X-Google-Smtp-Source: APXvYqwebhIZMzghd1qDG5V69TQUhXnikGS2NCAn7B1nL1eqOptwbKauGF29YAc5NlySDTXQg5M0/w==
X-Received: by 2002:a63:358a:: with SMTP id
 c132mr10552106pga.286.1578564651804; 
 Thu, 09 Jan 2020 02:10:51 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id s11sm6518713pgp.1.2020.01.09.02.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 02:10:51 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add mt8173 elm and hana board
Date: Thu,  9 Jan 2020 18:10:40 +0800
Message-Id: <20200109101042.201500-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_021053_478921_20BBA414 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.


Hsin-Yi Wang (2):
  dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
  arm64: dts: mediatek: add mt8173 elm and hana board

 .../devicetree/bindings/arm/mediatek.yaml     |   18 +
 arch/arm64/boot/dts/mediatek/Makefile         |    3 +
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
 .../boot/dts/mediatek/mt8173-elm-hana.dts     |   16 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   53 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   15 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1069 +++++++++++++++++
 7 files changed, 1201 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
