Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7583C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOBWwqnNtZ38dDVIIzLfaocfRAGUVvDLs14+wanTT94=; b=XSYyjq2ylXf8T5hPGUN+SavrsK
	qGG5Z8BaFG5VY4hDjr4vKpcANQU4/9vxtBL4YlmEZgML83QyOlqIy7JFJtY4etBkEm1UOuFqHPNLW
	sYKAxKfQu3niFu946HCOAPRdwVcLM0SEfuJ6OoKr6pnm8BB1NdwSo+2hfNLAFUsA0rOxVDWiFEsAs
	fktB0OeuBG6xiMPfrF6RvnskEfwTpfkaZ14GEhFDQTrEKtESZ9Rp9thxtBhwOPG4GaD23CZIbTK/c
	P4avHFR5jBwWB6jHE+1CCaa5pRt7+oXtmQ2V6/gqtetjFhdhd0Ufbv+purIkcE/Gmz8uzNE5ATDfm
	g16W/BFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EHB-004D4P-Lc; Fri, 01 Jul 2022 10:53:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EH0-004CvI-VE
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id l2so2283216pjf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NOBWwqnNtZ38dDVIIzLfaocfRAGUVvDLs14+wanTT94=;
        b=dz2Le1USQnBFFoW4ejZ1CuEd017eDMuliW3CFPa3lyAyzu0tUApEEcCNgYik7mPZ83
         WGRUIz00iiW2jbnOEIdxoTZy7nqyK3vTpCsj5KGuCZ39yIdmfqMQ+HB3xw2UNMldOBef
         vKItRQ0qyTzxsLBAQjWSCRidIpo/X+sh85qfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NOBWwqnNtZ38dDVIIzLfaocfRAGUVvDLs14+wanTT94=;
        b=g91GkccWBI6dvTsqRjl5NnSNX5GYM4bkaahpaDfeSfonyTDLz1koKk/0/PDGnsmI8v
         FdGekqbil50gC8Kwqjd1CCO6BNNxOAntpfiW9GFBNpKj/L4Q4ufWnDtYzia1zdnz2W7O
         tmGq7tW6j3LbBQ/Y1koqrdqt7VyJt+wsxNNeX3PECo2m8mc+KwrhIamktPYjLo5nOPiI
         6Onodx+2W1l3nOfxe5NtaSxZLzpbDGAnRa4Xka2BO4ZSjmIht3ylqModmUD68Yd8hjaE
         cNqzUVJV7wm1jj9Vind1kjbIkS0cvGL0ztAnPhfG+eXZ56mAY9QBB/kMgHUOVO8UTk1y
         dGVg==
X-Gm-Message-State: AJIora9DTRbA7fTx8Wdz6IQiP4vHSu8+zNK9hlZ6Vh7kl5Kb9c1HeSXq
	Nz5CSfPgokbSmcrwxDHl+OSrIA==
X-Google-Smtp-Source: AGRyM1uljxxSPIi8WxVPeVlccyqJ5E8bRD7D8dokyrQyOuYTXJYQrh07tl8mekQZDh2EtQzXh3M3vQ==
X-Received: by 2002:a17:90b:4ac9:b0:1ec:9bd1:92ff with SMTP id mh9-20020a17090b4ac900b001ec9bd192ffmr15545625pjb.178.1656672796441;
        Fri, 01 Jul 2022 03:53:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 5/6] media: mediatek: vcodec: Use meaningful encoder card name including chip name
Date: Fri,  1 Jul 2022 18:52:36 +0800
Message-Id: <20220701105237.932332-6-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035319_028162_C281F14F 
X-CRM114-Status: GOOD (  12.71  )
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

The card name for the video encoder previously held a static platform
name that was fixed to match MT8173. This obviously doesn't make sense
for newer chips. Since commit fd9f8050e355 ("media: mediatek: vcodec:
Change encoder v4l2 capability value"), this field was changed to hold
the driver's name, or "mtk-vcodec-dec". This doesn't make much sense
either, since this still doesn't reflect what chip this is.

Instead, fill in the card name with "MTxxxx video encoder" with the
proper chip number.

Fixes: fd9f8050e355 ("media: mediatek: vcodec: Change encoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index 30aac54d97fa..cc286e59021e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -238,7 +238,7 @@ static int vidioc_venc_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
-	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
+	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog


