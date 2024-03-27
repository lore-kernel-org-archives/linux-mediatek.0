Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9DEC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mxElVZwgDSK1YSb8hGRkSJE7Hq+zmgPYXh8LPg2gT3Q=; b=xabHDSxVP1e8V3fTRJmIEPxJW+
	9leUFt/kAUoCIEgjafL7cf/AwFxj00Hu1bQs+8j6rPg4HkkbBWcbnWDAETuXF7sQViOaeU91R23dt
	dOheFeM6oCZaqHuVqEFQ/JVljrOJ6AzDp6PdKJFiUw1+2A3bw7nohNBPkRiAJpRE3Z/I9GHU4XJP9
	t6qoXaQKxl66/wdBHZI8FYW0zytxYy1a/jNcvZkFzpV6pRSIecI7US7WwOcX/0x+2uINZJ83+5zA8
	bbP1WLu0FhJb4ExYPbOmDccgZCNsr69nJC+nD9bNOdK/Y0anMPWku6ubdOQZqTGYeV0sFVFMQZdYO
	dyWsTEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPLs-00000008AWW-3QGW;
	Wed, 27 Mar 2024 09:13:44 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPLq-00000008AVl-2oYF
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 09:13:44 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e6e3eadec8so917728a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711530820; x=1712135620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxElVZwgDSK1YSb8hGRkSJE7Hq+zmgPYXh8LPg2gT3Q=;
        b=XQgZV1k6kyJwNod5/Rit4f5p8aM6KKECbYqG7PmeCLFcIWE4tjeSlcnNu7RZb6fyBy
         7VAN5s4m3s8eCfo6Sw3MmjVewjninPe+r601m/KqOs55K1KbWprxAPzBIJNI5qAhTEtH
         M7W7dcJVAA9uLp6wptRDrTQbc7hCvB46gBbKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530820; x=1712135620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxElVZwgDSK1YSb8hGRkSJE7Hq+zmgPYXh8LPg2gT3Q=;
        b=LTkuF1nul50JT8p1KcvCoa42VdXLDbqzts9OgNs7uPUpiilBulhyanHqLArXC0qZTJ
         CIyTJDEuzQe4mHEpVvrdgEL2IueVDnb0uqgLEHpSGIhOhlITilmSjROJJHvoMOYRE/sF
         yz6AY3hBJFN1JNcUvOxGATzW4f5FrO5nL0/ITSb/4HYsUDVItr97ng8COkkKrxaGxJFz
         8QQmT7NOlYnpD/lYr5suHYyWFuvnSwFa9/Dt6n+yvBoyYoTp82Mz3+ch5jUYiXgZoHM+
         RXG4m6bxbXcscSuQxQNPdz/Uqq64+TsPKOw8NGI6qHKCqWLpIRVGi28miizuCmWfS3to
         pGvw==
X-Forwarded-Encrypted: i=1; AJvYcCWBoXuR1+D/ybDepZ/I9gRjkIrq3sTx9pwI/ZBSYeCqJv7jmNAjOXMeiP6aO3vqX8uhhKjFQYJXxTTbPyryMTkR2xO/N9Nde67ifc2maV6XXh6Q
X-Gm-Message-State: AOJu0YyNPUuz070KSOarkSUh5TImhL/XufZjI4qzJkXsq4xocEVgOX3O
	zIDVbNpWuJm+dgvo3K83/vmN+dvUqhVpkY9l6Of85jSzrFKrdMrZW2UD650DZw==
X-Google-Smtp-Source: AGHT+IEb932ORwMZAWuJMDZYxzAxef8XwPiw/kk7kOZAgwvVteC2Tlm4yt0lNUvQ8BGf1TisMGWnlQ==
X-Received: by 2002:a05:6870:1c8:b0:229:f61d:7e52 with SMTP id n8-20020a05687001c800b00229f61d7e52mr6040680oad.34.1711530820771;
        Wed, 27 Mar 2024 02:13:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74c2:3606:170b:52f3])
        by smtp.gmail.com with ESMTPSA id fa31-20020a056a002d1f00b006e69cb93585sm7342911pfb.83.2024.03.27.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:13:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: mediatek: paris: More pin config cleanups
Date: Wed, 27 Mar 2024 17:13:32 +0800
Message-ID: <20240327091336.3434141-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_021342_744957_E21CD9FF 
X-CRM114-Status: UNSURE (   9.29  )
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

Hi,

Here are a couple more pin config cleanups for the MediaTek paris
pinctrl driver library.

Patch 1 fixes readback of PIN_CONFIG_INPUT_SCHMITT_ENABLE. The function
was passing back the disabled state incorrectly.

Patch 2 reworks support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE, following
discussions on the bcm2835/bcm2711 pinctrl drivers [1]. The driver is
made to follow the definitions of each option as described in the DT
bindings and pinctrl core.

Please have a look and merge if possible.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com/

Chen-Yu Tsai (2):
  pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
  pinctrl: mediatek: paris: Rework support for
    PIN_CONFIG_{INPUT,OUTPUT}_ENABLE

 drivers/pinctrl/mediatek/pinctrl-paris.c | 40 ++++++++----------------
 1 file changed, 13 insertions(+), 27 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog


