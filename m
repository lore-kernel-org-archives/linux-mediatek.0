Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F366FC7619A
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHoyjTxQNsIixkHB5UoenspL4I5fGKVvNYeLFs2CchU=; b=U3jxSXPB4iT5uUeIc/OE6TksCH
	mHRBl8l8I5g9y2rUHDPUjohpgdhNUYG8jTKHXnbHEFKHAp5uzRw4cMZ0rmd3oxW1eEn641ycLIVc7
	Do0iD8dVIc8rGTo1JWwEowHxBSSjx1GHbKOTYFS+D6/gxKEHClYyd7B3tsn1b6bSDLJgLXHbq2po6
	9HbF8ZDHNvtjLgSXxKT3FYOrQHYtUYBtD+KTQwyR2196JkHYmORLJCDoPN5RlkioTqWrHbcUNBWcT
	+tLImLa2xUluR1T9U3Dt7IxpBuNJn6LZ+lTUvCpC+4Esn+Aa5QyKo+2vP8AHmaWT9ieG1V/nOqWv0
	AQ4lCLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkE8L-0060za-2I;
	Thu, 06 Apr 2023 01:09:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkE8H-0060yg-2L
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 01:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680743381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gHoyjTxQNsIixkHB5UoenspL4I5fGKVvNYeLFs2CchU=;
	b=YkPSSff9ohIB9n+mdb3q85tuvq4RhqgPA27IUxmt6Ei8Xl82q/E7w2tsMKCDz+qiq25K+o
	dMGfXoZJa7IqQhqNaCYneUEtMCAq5Ll1ldMZJBd+ldDuZRYu/rT3s9hVnPumMDzG+a4r1Y
	tshMum7GUpXpJiqSW7WaZyXZ5ZyukqM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-4t12d4PzPRKeHFemfJLVtw-1; Wed, 05 Apr 2023 21:09:39 -0400
X-MC-Unique: 4t12d4PzPRKeHFemfJLVtw-1
Received: by mail-qt1-f200.google.com with SMTP id f36-20020a05622a1a2400b003deb2fa544bso25800277qtb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 18:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680743379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHoyjTxQNsIixkHB5UoenspL4I5fGKVvNYeLFs2CchU=;
        b=TEcyVmoAZ0SJa3DZ30Ho3xp7PUBakVczi4JOHaNvg+Sp+A5SaCzybR227B9Nim/yR2
         MGAV5Oah18NXQ+CsV6EGAs+x0hhrNfl7n9VTjk79tG5dIm+MGETI9bTQwTK8mA2MQzgv
         ISBY5tc41bDHfid+1MXI8W0gAk8f3tH82Q5M3DsVZ6oby9KGvpBra6NiW9XVyQAfG15u
         Ffr4mVqavn2XgZkenlClSUV2ppyj1a5AFkKisVwiKkEfvvhLAkFwTq66QdNPExirfoea
         m3ZWGBbm0vUe5aHpyzuw6VdNqNbUnSueQL1ok2c+c1t60ZTyOd/vFcgVn1yJBfXlE5J0
         4VQQ==
X-Gm-Message-State: AAQBX9f4/BS5fiOnt+ip/OJGMF/o/UJOg3SgiIQWdq4mwAAZLSSdwu6Y
	Vfnf2yvF+UbURGki2pJXeTEJw4ab9Rr3oXWAGzTFpQ2yR0J3yEbyqk1KyxcGayF8ynWVnMnmw1M
	y8+4JEB729aVS+z7Tvlv51eqeOlBk8lhl
X-Received: by 2002:ac8:5f10:0:b0:3db:7f42:ab0f with SMTP id x16-20020ac85f10000000b003db7f42ab0fmr8396464qta.67.1680743379422;
        Wed, 05 Apr 2023 18:09:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZIbqKuhrrAyaCl1AzzFxLvOp0zEgA8xN+j2J99j+/2qw3uGQfHd57fnQTzqA2s828Rsp3zMQ==
X-Received: by 2002:ac8:5f10:0:b0:3db:7f42:ab0f with SMTP id x16-20020ac85f10000000b003db7f42ab0fmr8396435qta.67.1680743379073;
        Wed, 05 Apr 2023 18:09:39 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f9-20020ac84989000000b003defe5ab4aesm56174qtq.94.2023.04.05.18.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 18:09:38 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: mediatek: fhctl: set varaiables fhctl_offset_v1,2 storage-class-specifier to static
Date: Wed,  5 Apr 2023 21:09:35 -0400
Message-Id: <20230406010935.1944976-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_180945_842503_3FDF889A 
X-CRM114-Status: GOOD (  10.54  )
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

smatch reports
drivers/clk/mediatek/clk-fhctl.c:17:27: warning: symbol
  'fhctl_offset_v1' was not declared. Should it be static?
drivers/clk/mediatek/clk-fhctl.c:30:27: warning: symbol
  'fhctl_offset_v2' was not declared. Should it be static?

These variables are only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/mediatek/clk-fhctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-fhctl.c b/drivers/clk/mediatek/clk-fhctl.c
index 45e4842cbf04..33b6ad8fdc2e 100644
--- a/drivers/clk/mediatek/clk-fhctl.c
+++ b/drivers/clk/mediatek/clk-fhctl.c
@@ -14,7 +14,7 @@
 #define PERCENT_TO_DDSLMT(dds, percent_m10) \
 	((((dds) * (percent_m10)) >> 5) / 100)
 
-const struct fhctl_offset fhctl_offset_v1 = {
+static const struct fhctl_offset fhctl_offset_v1 = {
 	.offset_hp_en = 0x0,
 	.offset_clk_con = 0x4,
 	.offset_rst_con = 0x8,
@@ -27,7 +27,7 @@ const struct fhctl_offset fhctl_offset_v1 = {
 	.offset_mon = 0x10,
 };
 
-const struct fhctl_offset fhctl_offset_v2 = {
+static const struct fhctl_offset fhctl_offset_v2 = {
 	.offset_hp_en = 0x0,
 	.offset_clk_con = 0x8,
 	.offset_rst_con = 0xc,
-- 
2.27.0


