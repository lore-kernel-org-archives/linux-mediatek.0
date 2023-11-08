Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE84FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9ruozlZcJ9W7XfjD43HwmJJmYF5qn3W6PNn40gqkVI=; b=2Fl6cT0jMUxnm7a7lde2DZnlyg
	/FYY33Buz2eaXx/VSB8pztZPjFfD+95f5CzI/R708Azlc6zTEfHfj/lJaXzbQAaI9qUn2Mm+PvdqM
	3KZ26z69zLe66dHAsFPg4qICCLnXiIChoPRRcLMsKdgPvLZT/bjGEzs1TiseHU0wjzQrcUhap5wWm
	0rwJai6GiV08M7IaLcJ9JDSZJ/Vev8HBDhrWR7q8P1wn27Cw6X4ARVNyaURzWC7J+RUYEN3eo49nD
	ZH5sb1vIu7G3pysv+mmnG7c5uYamOrJRDDHHj5zma5GgKC/tb9ktWcPNtmxjpv84iPTJxO7WMYIw0
	tEz77i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0cCm-00367E-25;
	Wed, 08 Nov 2023 06:38:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0cCj-00365O-2Y
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 06:38:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6be0277c05bso5627528b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 22:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699425492; x=1700030292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9ruozlZcJ9W7XfjD43HwmJJmYF5qn3W6PNn40gqkVI=;
        b=E7CYIs+Fo6lCbxoYOYbB3QT0AbucB6XlWAJt8ESvqxH8gGqZHcrkUjjWI/3mO+scNQ
         czjyggJcJkFwfffqcueb/iKlnio9X9gq9/L3K/h7vZEqehxN3M/43W72wZ/YXWGyM1KT
         yiANH7HznRNzBg33ZTJVX8Crv/BxkA9O8bf1uO0+lM9OavDpr7MlHQEiChZS8np1YLXS
         czwWBAeXrtf55CDAoB3ITAvH2sgk59Sj7L4Sdu8PaFBZm3cfyZiCtlaME/Ckc7tOrjxS
         HxOypU4GnZEByKTMEkDNkB+uKAsqOhyFY/OVEszX5epMSsaXVxllMagOt19CshTghR5K
         ozWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699425492; x=1700030292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9ruozlZcJ9W7XfjD43HwmJJmYF5qn3W6PNn40gqkVI=;
        b=QS4O1w/w3n7FUEmKnfBuhHvZ0SGOyBDyqrHIRWnvUdJJnyXgk8iSEYEPmSgNraET+j
         92Wcgt4AbJwTrKGSWEg92x/oijD7FD7dG/bgK+aqCXVxjEEQfx35iCNsC+VtH3ICAfbL
         L1QAP6D5nOiB1kbwwM/z1MG6uem4SD3zeMjQFzO641RXds37szKF7reNHjh2lSUy1cmX
         sJ+YPcRf2/ttzkadoBzmT1PpJadHKE2kd+rsxN189GH1WTJSRXQ6sUqE5sRngNyLAaCt
         6XyaiHKQeKme268zc7BnW41CFbjnJtthmBCrui5DfQk2ap05SkHy6fzHG9C922MDfxED
         Q2Ng==
X-Gm-Message-State: AOJu0YxMJXTNXNhMM0NwSG2CBTad1as91owVBiysXja7Vm0dPEbPREAa
	Muf+ZykSmI19/QNYNu8+EZZOVg==
X-Google-Smtp-Source: AGHT+IFJX3dNbNeTFLWQqoxknRUqWVbj4BUsY0UL4Q7DlWtYfJTTnsD28L2GH4pQtRnMrwlK1Evz3Q==
X-Received: by 2002:a05:6a00:1a8b:b0:68e:46d2:e331 with SMTP id e11-20020a056a001a8b00b0068e46d2e331mr779701pfv.23.1699425491746;
        Tue, 07 Nov 2023 22:38:11 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id u8-20020a627908000000b006baa1cf561dsm8588660pfc.0.2023.11.07.22.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 22:38:11 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
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
Subject: [PATCH v3 0/3] add es8326 dt-bindings, es8326 support and Enable dual amp for rt5682s
Date: Wed,  8 Nov 2023 14:38:01 +0800
Message-Id: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_223822_033833_C9FEDC37 
X-CRM114-Status: UNSURE (   8.00  )
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

Add dt-bindings for es8326 and codec es8326 support. 
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v3:
- PATCH 3/3: Change theme description
- Link to v2: https://lore.kernel.org/all/20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/

Rui Zhou (3):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 102 +++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.25.1


