Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D774BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 01:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t2nydiqwlSk0hjlkkqRXzyzSl4ckbypcVdbCKMFupeI=; b=0n2dnVaYWyyfiu8yoDBd7qHyD3
	KiZQSC2Onn9xSaqdSEEKOp0aEdtolbPvd4bIMOq4EZhfZKPLwjpyWJL5YSdHvOq4wxyJ1lMjVbuf3
	ElVRRbY2DzCfpnoOWgGMhqSmQT/CcGtbv0mHCkNgjKgAl07pdtjw3OhLRCJUzhSeYVE6lLffgBTc4
	uxAk0+Et9JY7sQZe9n03EA5yH0XJeNRLAcXD/x6/N6IuiTlUQnmlWseYWCp6dAfov2xZu4N+D34yj
	8+lU9zrLCbVCbKlBBqlO8AUc8jgXwrEPCLOayAD/SMPoyc9I5oiaeIl8Azjyg+l9rOrsI/4KO0N8q
	Gy/HocrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0XKw-002lG8-02;
	Wed, 08 Nov 2023 01:26:30 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0XKs-002lFe-0Z
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 01:26:28 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b5ff072fc4so1200776b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 17:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699406784; x=1700011584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2nydiqwlSk0hjlkkqRXzyzSl4ckbypcVdbCKMFupeI=;
        b=RtQ6frXfPrRNKZkduuTHaqA2XTzlvjRTW6sAXeM3TH2bWZ9ZvmgUrTfDtamsXyQlg5
         LbxUwwEg3dh0dKQc2m/1V1JbFYS60Z0nsBrAXjVUCe0JpcBTzRcDaN0zTgFtQxbI7ope
         WdR8JDMyH3lSWr6x6S9MkiFIAf/RTruu1z1jWLiCQUxwu/Mhrm/VzlLVa6UsEofntLjy
         GChBqRQ13nI8+e1/lowXuXNX0xfDKOZXvkjXOT+kHk0mFBg6yNur2RIKaAviUZheZjpl
         LrCjEZnLyr5og9xmOpweUcSY5r8SKucWwalc9YfuTdyxpvrQVsBNrJCesnRKXVaeIxNV
         qF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699406784; x=1700011584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2nydiqwlSk0hjlkkqRXzyzSl4ckbypcVdbCKMFupeI=;
        b=o75aNIc44pC6xZAoMH8KC3LBmD91H7eXMAHmuMuGy7hki6Z/8kWbxkJIqSlUYXVyUK
         PDptE6dUYK54SXPWoMn3nb/6VPJn/4huzIZX8lPXxlpu2sggdNuez9bWloITMnHIIRXN
         yhnmul+4TgyMELndE5PpKu1GTTsqaDcTi/u1buP6gHVwRDw5g783oKSZhaxyjfrNPHZ9
         DA/wky9u5S8iXYkZZc2XIp4WSGuPXlK+FHvTeV3H7l+1q0XpF9Se3K904ES9FzZ9ums5
         48+IhdNk5/sQOTLsiiyl9zDfYlERBgYthbtd+iklR29B2TLOj8uqO0CAlf34gxoVVYt4
         5Q4Q==
X-Gm-Message-State: AOJu0YyD9JcEgwJ8FzHEXQ0qK4c7BflZozsvrjUDVLXsTR5CfYrCAljj
	YM8eIYnkrCXXa4Knfq9TaxXCOQ==
X-Google-Smtp-Source: AGHT+IE9BN58cpaCcs4V22Hl+0wKn0qSOaIaMaeiuHRBhwPdTq6RKCK/yNbDpoM7HO5b7A9d+DRe6A==
X-Received: by 2002:a05:6808:138b:b0:3ae:1b21:fab1 with SMTP id c11-20020a056808138b00b003ae1b21fab1mr887640oiw.31.1699406784011;
        Tue, 07 Nov 2023 17:26:24 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id h7-20020a62b407000000b0069323619f69sm7966778pfn.143.2023.11.07.17.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 17:26:23 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] add es8326 dt-bindings and es8326 support
Date: Wed,  8 Nov 2023 09:26:14 +0800
Message-Id: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_172626_570837_FDDCE0DD 
X-CRM114-Status: GOOD (  10.18  )
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

Add dt-bindings for es8326 and codec es8326 support. 
At the same time, it's necessary to add support for the driver 
to connect to the i2s dual-channel amp.

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/

Rui Zhou (3):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Limit RT5682s to only supports dual
    channels

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 102 +++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.25.1


