Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC81606A325
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUgm7l6L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKAlO+Ew
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=; b=SUgm7l6LPfFJTOifMfUVlPl2KA
	etm5ClStjZJkclIp50Z+5ar8D6u1VoY5zUxj4yuG8EwIx2xrEp5Y8MdDW2UP08MPoLfkCSylX6YB3
	PZKnlhIqZy6jvXYPkKaM5P/gyXWbA0IAKpCJqQvfh3lQ5RuwZ7aLxKne7w1N02uhSKemkLNhamP/a
	s0UhI44L8doPDvoa5zzx3n9BSc75Bos/RrLCt/fRKW8UWVNL4MWj0aoHScW54YfrK92Jr+yTQhNQy
	rkr/J4Bz2jA/E0B5hPkxEOMsg2jpSLaGz11KhX0ykSrXZ0n7suITuwWl2BLfCwhvOYl3eyc7AW/pg
	oYatyjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJDk-0000000EG76-1cpX;
	Fri, 20 Nov 2026 07:39:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJDY-0000000EG49-1KgT
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 07:39:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso3625665e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 23:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160370; x=1795765170; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
        b=jKAlO+EwBr3fVc0Zq8J0vTDRBjjyGUqy6ej2r2GMSI6b662aZhOYOVuZx+lhhWS0Hd
         nWYqz+TbxIO4RpN740GyIFUh+XNML/FLMLoEQx4q6AnFQI/uJ4F1b5E2ZFwLg7s48BNx
         F+nIkOssCK/B1bKNUKQp73YMH9StSy0iOba6GU87HKzS8yeik6rdtX9CiGnNYr/FPLqV
         qRaJDUPFWekvspdplhrTy8RYCO/i6jMceQxY+k6sjk6mzSAj/L5WtcQTpYnwNgzBQ3Ft
         2U2HIKydKMFQH+Ntqt1QQw/32GFM1o2CpRQl3MC5m6IbX+0RWxAtUF08OZDvPhr5IuZ9
         mkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160370; x=1795765170;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
        b=SG9J/gzM9F8iCnLymYGOt2PrYBpD9FbrABtVvL34YpdI5FXkcXhq6u7GzmtsDZnXC4
         wSdzVcXeNzvB3Vppj2wPCwbzy9TJhdswr5RqRL0Mk7sNbgqDG31m1LTc/HuY0GfD1M0/
         /CCpZ2YHTW8mlYsnk95UNVEDdBpwuWZtw/Wbsjn//5yXPUmcMqGrcFuufRqj2/sLoqAq
         RD0HoLr3Z+1shEiRF5X4pguRQfl5rpMNWrqBxW/JeB8hrepvaQHl2Dn+51MNcPz0MI4L
         SN6jkOB9QX9RJyXV5Q2BLQfb6Q0bVToJSvL59Mja0OVWfRrbneFHAr49S1h1kgxLowZl
         fcWw==
X-Forwarded-Encrypted: i=1; AL+hErEnLRO/bVCHrtGXlcOd8okZbkxRLXHcVzTIdhFvkZIQ2NMcdPVGzJup6g9vztb/cbJcAwFQz3g3lLsOg2o2tQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+b3RjuKltdg7jrBTWEjMinazvVe+S7B74gHct9Y6ZqRbVtBT3/
	ImGGdhps1VNuTa8wweRLcc05EU1czn7qDPf7nvZt4eZQqAvC6kjsf5+c
X-Gm-Gg: AYBFou3vOwVBpVjzKavPmzhpN9Iu05YGuxBSknPGa9iByQSvMem4PUuwI+eyvH07l16
	AZu72d9OB1p+dNA0zV3GMi9rRCu4b5dkMO9hNRcTNTNAV/sDiaq/kRgPES6P9J/xx6vcYL/XlWb
	n8bYRu+vW97uKOnBm15TEp8RHlum6k0M1gwNsVf+6ew9LF1teBpCR15rocE8tgEwJKIq4CNcFoo
	7RSf8rmeBhi2D4N9K6grixC2BU3+GB9j3R8DF2UwdcdZIEyaigHAX9t/yAtIgSKj5Xnd2bM2BPG
	fQYl42VNlY242D7VDYQmwEEIXYZaciWygQqTmvOoratJoYhyuqFCvulsqrd34hfvnSp7IMDDHAd
	0eg1ZgSQE1hlAeQjNZ646ElCDsmlYhcT6+T+VX9y4Gee+ksX6+kDt1K7ipBR5yQk1DQ7wU4nh1L
	8nfOrs4PAr7DY0SO9gnxcoGFBpabrg2081VQmXydJ9Rwzr3qiGzD0dCeSA/qKXzfpsTKYnbXKRH
	sBkb4XY0gsP+NtB3wLL7Vk1lOQyIfMGSIRX/t/wdTLHNJBeOBKiZJmyQXmeHbPZx+YaOxuLAxc5
	E+WnH7mQSKMdavhjpNzPyBSpl7161at2Grsc3GjPqJbkQJ539mTeBr0bMNZvPRU=
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr47439815e9.2.1795160369880;
        Thu, 19 Nov 2026 23:39:29 -0800 (PST)
Received: from [100.64.0.149] ([2a11:fb80:10d:2500:b9c0:ca33:edf1:6b97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm4393117f8f.21.2026.11.19.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:39:29 -0800 (PST)
From: Stefan Raufhake <raufhakestefan@gmail.com>
Date: Fri, 20 Nov 2026 08:38:58 +0100
Subject: [PATCH] soc: mediatek: mt8188-mmsys: use the full mask for the
 RDMA0 output select
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-mask-rdma0-v1-1-170f6f51901d@beckhoff.com>
X-B4-Tracking: v=1; b=H4sIABH5/2oC/x3MQQqAIBBA0avErBO0IKqrRAvJMYewYiaiCO+et
 XyL/x8QZEKBvniA8SShbc0wZQFTsOuMilw2VLpqjDGtilYWxS5arbyvJ1d3LVqvIQc7o6frnw1
 jdiA5Nr6/d0rpBZuO/t9rAAAA
X-Change-ID: 20261118-mask-rdma0-ff3cd398eaf0
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Stefan Raufhake <s.raufhake@beckhoff.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160369; l=2771;
 i=s.raufhake@beckhoff.com; h=from:subject:message-id;
 bh=917zLlA++Sanueh0GAPM2hRLA0nHVXsoglSLue1xr/k=;
 b=KWWDeFTtUeDg/koXMiq8KfXRjG+nZnKIs9HHVv1JZS7XoEper97Kvd9dK/0zM2uBAJqNHfAj3
 dFYQBMjhfPWAK1R8W0jFBT7GP2+VugOSIyODKe6IOmX/0wPvl66eeUA
X-Developer-Key: i=s.raufhake@beckhoff.com; a=ed25519;
 pk=e21SBDwGlYjlZrk3u52tzwoMvH7vIYNoigghcul0uzw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_233932_377285_1DA071F4 
X-CRM114-Status: GOOD (  16.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Raufhake <s.raufhake@beckhoff.com>

The output select of DISP_RDMA0 in VDO0_DISP_RDMA_SEL is three bits wide
(MT8188_SOUT_DISP_RDMA0_TO_MASK, e.g. 5 selects DP_INTF0), but since the
migration to MMSYS_ROUTE() the RDMA0 -> COLOR0 route only uses
GENMASK(1, 0). Bit 2 is then not cleared: when the boot loader left
DISP_RDMA0 routed to DP_INTF0 (value 5), setting the COLOR0 route leaves
the field at 4 instead of 0, COLOR0 gets no pixels and the eDP output
stays dark with "vblank wait timed out".

Use MT8188_SOUT_DISP_RDMA0_TO_MASK again, as before the migration.

Fixes: 8a7b1efb2ae8 ("soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro")
Signed-off-by: Stefan Raufhake <s.raufhake@beckhoff.com>
---
Hello,

While developing the Embedded DisplayPort (eDP) driver for the MediaTek
MT8370 SoC in U-Boot, I encountered an issue where Linux fails to display
an image if U-Boot has already initialized and used the eDP interface to
show a splash screen. Conversely, if U-Boot leaves the eDP uninitialized,
Linux displays the image as expected.

This patch resolves the issue, allowing Linux to properly take over and
display an image even after U-Boot has already used the eDP.

I used an LLM coding assistant (OpenCode with claude-opus-5.5) while
investigating this; it helped identify that the MMSYS_ROUTE() migration
had narrowed the RDMA0 output select mask. I reviewed the change myself
and verified it on the hardware listed below.

This patch has been tested on our internal MediaTek MT8370 development
board as well as on the CP6600-0001-0030 [1] device.

Best regards,

Stefan

[1] https://www.beckhoff.com/de-de/produkte/ipc/panel-pcs/cp6xxx-cp7xxx-singletouch-panel-pcs/cp6600-0001-0030.html
---

---
 drivers/soc/mediatek/mt8188-mmsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index c70c4b462381240d06a85144b4494a4d9e58850e..ecf0fffef20ad7a042dc02e510a7d266fb979c0e 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -233,7 +233,7 @@ static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 		    MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
 		    MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT),
 	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
-		    MT8188_VDO0_DISP_RDMA_SEL, GENMASK(1, 0),
+		    MT8188_VDO0_DISP_RDMA_SEL, MT8188_SOUT_DISP_RDMA0_TO_MASK,
 		    MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0),
 	MMSYS_ROUTE(DITHER, 0, DSC, 0,
 		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-mask-rdma0-ff3cd398eaf0

Best regards,
-- 
Stefan Raufhake <s.raufhake@beckhoff.com>


