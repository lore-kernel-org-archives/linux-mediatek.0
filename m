Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341FCC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:27:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1EF60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B1EF60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nmgJS5WGEiZxvRBTj5UkdsAzOMuqVPN6mtBrzniOYrI=; b=VPPkBOYSRL3Xo/
	wQKU/BuZB2qn5n1T+7cWMZMJoKQRmw7a2vYioddUqL7IP6j1YBGACIgPPbbXdzw5YXHT87zIxLii1
	qf9COu9+rM/NfIfft4NNZWIs6ZtP2gf2EcXEDYnevhyeCN4uyKEG3dyN2ei1QtXvdoVxZ/4OdfiaB
	E9TvwqbdNriWcDrv7e6wcP8dBeePHTpYo7Raew1N+BgxNW95dopb3c5kHwHHtQ4Dqt0EBT/CAKRA1
	p4nLstHZT+QmzukVHgsrip3eEPO/b88XBN/kAzLAbEGLeij0lbFcwz++YbRho0DVD1WbRjp7vh3tG
	e8UqUmC23qTW57TaJE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz3p-00FZ2O-Ke; Mon, 08 Nov 2021 07:27:21 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3m-00FZ1B-OI
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:19 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 188so2025497pgb.7
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLjicxNmNpYNSdlDLoBw1hRqse8yPujz3RAWyTpfEac=;
 b=ABDhVBoJRsbyso7STgkt2+X30CgJnQ/d99iSXLLZO1gs2qeFL7BsZSKMviiRjrSt5h
 dbp4KcrvpoL3BQDhp46BsxZ+b00vpcLTx2TtUa2T/RN7G4khXEwLkFdQK7yb3lbgn25Z
 Jm165XB0AGWijHaotMiS4DDjHK1d4a+LSyC+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLjicxNmNpYNSdlDLoBw1hRqse8yPujz3RAWyTpfEac=;
 b=nesU5Qh7ecSq7jH5igM8rLAoaU/6gU7RoBk412A3j5+uugsZmtF5AB7a5JTS7g3qab
 SKNgnMBFiPE+limmeCT42YmxhyS1PTyGWzojNsbuCGRsWK1GC1fNul28FxWWsKqGTr4l
 5/gMQQ4X/A3z5j88eUEPIeF2sfjt33359Yim/+ukn3gp44tRr5BIjJdmYzW+I2idQDNC
 fxeDNrUCyN/thB2KYDdwspS9E+qaYI6ZJmlGARBP/MC0pU/hbA8XHTyntqzfUP7rKVDs
 ra21vEgm2ixasz+i10JaqyafNhjGprhVn7mfteYJpbDTUnrki1hGQESiSZROjcb4E1VJ
 3a0w==
X-Gm-Message-State: AOAM533vZK/ek8VrKczFUWDTpADWawKj+lTREfwxBqwe1F8aSP0T7785
 yHDfk2MUaVAIfPLSWpZNzXrwa3S3UEiZnQ==
X-Google-Smtp-Source: ABdhPJw21lXJshz/mAt6AiSaY5BS2Jjuxb/tgp9XVgQFp/b0HW4hLLC6R3JC3TGth5tlFtvm7q26WA==
X-Received: by 2002:a05:6a00:140c:b0:447:96be:2ade with SMTP id
 l12-20020a056a00140c00b0044796be2ademr77871119pfu.26.1636356436963; 
 Sun, 07 Nov 2021 23:27:16 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: mt8183: jacuzzi: remove unused ddc-i2c-bus
Date: Mon,  8 Nov 2021 15:27:05 +0800
Message-Id: <20211108072711.1628566-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232718_812610_518B366E 
X-CRM114-Status: UNSURE (   9.47  )
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

EDID is read from bridge, so the ddc-i2c-bus is unused.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index d8826c82bcda29..8f7bf33f607da2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -9,7 +9,6 @@ / {
 	panel: panel {
 		compatible = "auo,b116xw03";
 		power-supply = <&pp3300_panel>;
-		ddc-i2c-bus = <&i2c4>;
 		backlight = <&backlight_lcd0>;
 
 		port {
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
