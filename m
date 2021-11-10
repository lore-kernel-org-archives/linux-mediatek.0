Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:27:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D454261159
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D454261159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CBYGo5+SgiWjHvCzScaWfvKMEn2ipUancDdQgBsJCxo=; b=3Hi7x+Sm7vzaBS
	HRBPGqM3Ui4Bzm18fazagc0KKWqZL9YVdAaa50C1cYceENM1K82uWeX3BNjyXVF+u5o6bTaYoppXN
	UlQvM6o6hCxCDFPctFKrh2bDMtrG5FoiOQiKgbmvbKfbtLtm641NIT2OYRNSnyr12tcmukzwBa51Q
	5gJdIz8hqwoVw58J4OEKVfHBbPMH6QvqS09a6wQlIwP1TgJBFtHX6BYQVc+FNycvgF44NQGledhc3
	AiBxLriZI1KxXav0Lrk9nED0WD0QSYSlmaYNYedEBphXZA456fVt0cqQst6WXQKjxK4R/UNVxY0WX
	OdJ/8X/OpiuaNoByw8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktFG-00695m-P8; Wed, 10 Nov 2021 19:26:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktF0-0068zO-JQ
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:26:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id c4so5820539wrd.9
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67RflP8EMvWl3pms6qSQzXgIsULKMBC3q9PmqMFeHNI=;
 b=6Z+nm+/nqAhDht1rZGlH/mNfNev5GGs2XCS2grf4aCItbDCNfifaUAIHKy9l8+BQyj
 uhI5IDMkB24u5Qi++8U15ZgIa0ko5Gk8cXFmcZKIJJ4d8qzjA3Bw84qnik4R4seqk5NJ
 YV6ZCg8YWAoLspbhtwdWPjGtqTGSQ6g849jommWhtF6Q5VINSclLpCYLG9241Db6Ou3x
 sx2cvLka6b4WicRbGJsP1RmCistSuGKqaEPK8N7rU/itSFmuxm92sU3RqxNwCK6DsumG
 faG76Avn4/z2ySDBa0X/xgWlEPbL2Voq2dAkzqnNSa6hTLXjgMiLNP8D+KHz/qSQfheM
 1qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67RflP8EMvWl3pms6qSQzXgIsULKMBC3q9PmqMFeHNI=;
 b=F1IRCw7oq+FwbCM1mqiroJJ09y1Aa/HAdhMc+50FtDS6BwAJuXxottmsc+OjBAFI7v
 cThdSbSMELGEqgKVZNA0I3LIbHnBk1Q4ise4JZqHBngdmq7VejNK7bcrjg5ifOf3Ja+q
 6qLDdZYKEEuzhFhMDsXik3xZS7194M0BLsLZd2tSOwNWDPAgaezdkoIm1C3XhmblVOgF
 xxpak4pyzNVQ9zOFShoDoE9J/nTdtU17F24Q2XvTeoHhOsIw9WcoT8qxfpfnJwwmjggr
 2pxjVO8ZPLO2poJXtztAy1Gyy0ch64rOeEOfnSVbvUEvnBnTD431MGwYggy+UPDF+/Oj
 ULxw==
X-Gm-Message-State: AOAM533cOefuHfVj/VMzZe+M6eTjUWLPwsTtaXNCxY/beOUn20ydaUk7
 tqBlIzqxxfiS6PXKbcBTUZOX8w==
X-Google-Smtp-Source: ABdhPJz6hgMMPdrdO/rkxLRSJQ8E+hfok+dIssCwkfCmuwTnnaVIj/RzSyF9FTfspETklUhTNBXD7w==
X-Received: by 2002:a5d:604a:: with SMTP id j10mr1781746wrt.93.1636572397342; 
 Wed, 10 Nov 2021 11:26:37 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id m14sm1282370wrp.28.2021.11.10.11.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:26:36 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-evb: Add node for thermistor
Date: Wed, 10 Nov 2021 20:26:31 +0100
Message-Id: <20211110192631.4182485-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_112638_671474_2D844E51 
X-CRM114-Status: UNSURE (   9.77  )
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

Add node to be able to read the temperature for the thermistor
connected to AUXIN0.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 7bc0a6a7fadf..f3fd3cca23e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -36,6 +36,14 @@ scp_mem_reserved: scp_mem_region {
 			no-map;
 		};
 	};
+
+	ntc@0 {
+		compatible = "murata,ncp03wf104";
+		pullup-uv = <1800000>;
+		pullup-ohm = <390000>;
+		pulldown-ohm = <0>;
+		io-channels = <&auxadc 0>;
+	};
 };
 
 &auxadc {
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
