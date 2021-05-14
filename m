Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51F6C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:05:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543B0613F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543B0613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dXG2VlZCJBwt2nq+rntlmTtuMuQ7ZorNILa0y2JFzyY=; b=pxnhm2lZ5rroRuSOcTiix729+
	kJA4cy1an3/PjWlApeEQMfcUESs+hhwdFgfPI6BedhV1qGdIetcEz/rrp1EegwB0YySPcs5bwKCMx
	SkH/d6aleVQFCj+ahZEpvr50jymzrf3w1vv7Zz25TmVZX+vSzyj/IvrODMPAN2J8jBLoD0XIRu9Ia
	XoOJhsZTW7/u2VrWzGBVisXosQLGXfojA45YVXhsXMapJ/zHHhwerKJW3LsB2Qio21gmG2XPRTdI2
	SRf7+DVzAUHVrOhuuCNrozW4W8BULKU/VnhF+DEMU4QqD3gnB/LDygxv41OPU7stue669FLm/1M+W
	zebuMy+MQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhWZO-007zEX-Jt; Fri, 14 May 2021 12:05:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWZE-007zE6-Ps
 for linux-mediatek@desiato.infradead.org; Fri, 14 May 2021 12:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LQYcCupFxg8InoP1/2l4FLzi8zH3ZsXDMqBqASZIVVw=; b=Vk5PvGdSZ/DEAGn0SSGUCbjpEd
 DNK7ypMDVsirMjl3zAQX05M+fQqqla7qOFHeo1QGBw9yEfWmAK9pq06422akvFBpyp2wbM/AQxggs
 Pz2zBRq28+CtaT1UqNTyy+9Pdv6G/pZXl7qiy/vfAJvWZrE6OSAilLmMb1xhIHF9KhcgPGBhpM8iE
 a8owyhfZfdTm02VqAYcFlRU/zNnnkeZAP04T+u0eSwODeiQ4ByeQ1x8HJ5hng6uEHkYL6KOafN3W8
 Qw6dZIlKvyptFoPVyAbfl+swrEjsqUtBHCGnq9PpwHPE7SGJmybj8TjZOXYY1Wgxn/eaY0bYClKzu
 duxM13jw==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWZC-00BxU4-25
 for linux-mediatek@lists.infradead.org; Fri, 14 May 2021 12:05:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so1250835pjo.0
 for <linux-mediatek@lists.infradead.org>; Fri, 14 May 2021 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQYcCupFxg8InoP1/2l4FLzi8zH3ZsXDMqBqASZIVVw=;
 b=h+oc/D3mYJDcntABEZ7Xencts0Pcq4IP1wsAn22ViNoE8u10MaXUcYFxtvJdiEfiV9
 XrKR63MUl98qE31wy4jHiZXJQ9su4mubotYfQ8BdnhRvX2w546zD6PISKWPSNJypKdDd
 o5pPKzmyociU/gI83QN42ywVCdKDNG6V50DYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQYcCupFxg8InoP1/2l4FLzi8zH3ZsXDMqBqASZIVVw=;
 b=cn/KvvT44NUuwLlazp1aQiyz7OTPfx6uLXP+lLys6GaYDWXudVUKqRrmjOidt48M3K
 8xgkUdg+8t0wmVIADHV5naxW4gqfDp0YiwI2+hlFJY6FxViJYcqUk2i9v3Dh6ICqn+d1
 Mp38OoMjHxQVK9KtrEcjoIsfNFsW9reWjaO1aUJ+kbt9QppR2ribLx1fboSaamzkgrFh
 X9GGInesgJh+2iRbSn/N1rwcPydJYvjuCOgf4prwIkDQTCN0K39xGAUY75R7SlUjt50D
 r7EwUm9P/hu4dskBG43LnNVjUe1Mq5f378nYnvMcJ/691TPflqRM3JFXmsi+Zg8JndFE
 421g==
X-Gm-Message-State: AOAM532N10//dYC+TzN4WTcf9FH/RU5JQirLYu74MQcLCJoiZhPnwAQS
 7dPIfUOfRoOjvJWisP71KCVL+Q==
X-Google-Smtp-Source: ABdhPJxTGEutiLz4dIZ95IKEFr/dFQx3NVMgYvn0N6sOU8DscXO53wP3u6K6hMm1/3zSOWBZprpNdQ==
X-Received: by 2002:a17:902:d508:b029:ef:b008:f4ad with SMTP id
 b8-20020a170902d508b02900efb008f4admr4040933plg.8.1620993916755; 
 Fri, 14 May 2021 05:05:16 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
 by smtp.gmail.com with ESMTPSA id q24sm4117786pgb.19.2021.05.14.05.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:05:16 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: devicetree@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Cc: Stephen Boyd <sboyd@chromium.org>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v7 2/2] arm64: dts: mt8183: add cbas node under cros_ec
Date: Fri, 14 May 2021 20:05:06 +0800
Message-Id: <20210514120506.264838-2-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210514120506.264838-1-ikjn@chromium.org>
References: <20210514120506.264838-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_050518_146558_878B744D 
X-CRM114-Status: GOOD (  11.67  )
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

Add a 'cbas' device node for supporting tablet mode switch in
kukui devices.

Kukui platforms with detacheable base have an additional input
device under cros-ec, which reports SW_TABLET_MODE regarding
its base state (e.g. base flipped or detached).

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v7:
- remove a label from cbas node
- fix an erratum in commit message (table --> tablet)
- dt-binding patchess merged altogether with mt8183 dts

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..1512605a438e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
 			compatible = "google,extcon-usbc-cros-ec";
 			google,usb-port-id = <0>;
 		};
+
+		cbas {
+			compatible = "google,cros-cbas";
+		};
 	};
 };
 
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
