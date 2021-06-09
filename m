Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3CAC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 03:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F1B61059
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 03:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F1B61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIxBgyZVVlrS9TaLgtJWFbSzxAe54DIgTgnNGHGtMSU=; b=k33MbnjC9pzMuw
	BgzV1VaSbNUlrNupbPTzNv5b8rSPLVcgKcFwwVawblAA1davQNoxHOCR//CjB2PYmcPkWL1vv5WHW
	IYEI8BXpynbzsRXK+IaSS2YyQ5RkYellF/i/kM+LM9CTB4bjDOdIUi74cIKEYM9ENCnXZV1AbOjMq
	whk/yXIMYZYysrl7RXEp3+vJWkAPTblQKWeRb+4TZwlU9mY110thduXbOkca1w9OXiY03swXzZE5w
	HnrKT25j8ZYk0VL7+uEO/sf+M/3RqAdOvINO50u6LdcERQImLUE3bVXMM4CERafGqRVO/J9e0Przc
	BByV8Wv2boQoeOrmHHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqouM-00BYbu-8H; Wed, 09 Jun 2021 03:29:34 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqou8-00BYUX-Gl
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 03:29:21 +0000
Received: by mail-pl1-f178.google.com with SMTP id v11so3329452ply.6
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Jun 2021 20:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MdYrW81rTRXOyPwwkBxz8oEi4fq6qdyXtGkz0juieDI=;
 b=oM5dWCghrtGmRy3vXH0k82IRuHsl9PMV9Y87AV1Zaz54x7HGdVWxu43tLv4fncOx0J
 xLZ2H3DhJKC69qT80S/baQirsqtrhIndxLA426DhYtYAxf6Mw1FHtoSedK8wbZGiucvj
 o9YaaLtkJFPA5CY8pD1jmQzI5pRtzS+CiRFVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MdYrW81rTRXOyPwwkBxz8oEi4fq6qdyXtGkz0juieDI=;
 b=MFVl01bt1LOFGnOITf3Rh+VmYB7FfZ2qTlSOQeis6AiPDW1R+L1jVClVmGC/CGuCLG
 YwhXvlpMdBGXBYaVHgpLLq1SJ3/kI4vL513eKAjW8omZd5Qpv78TZinfUHppBfK1ptmG
 ztaCAfcbpHuexH0pm+Xya6JNCGeufxK0VHK+CqCjGXlc0w4niFNJs9oRkK24rRjDRHXs
 mSdv6EfDLwL6GSU9DTePq4Qqfz31lYol/mBlUFHXLw4Er8BxSXVlNEsW83Jzewk1yTPA
 KFFPlT3cujz84G8938pCYljI5EnkNrAwDUp0OVpz9PcpsgvfixYEkoS6zjI9KUdPqGVJ
 iEcA==
X-Gm-Message-State: AOAM532EPLyTt1wmypuU+vNFavTZ/+1jLxyR54dhcH7gc2+w5ScYxIkb
 v3AMtHQCKXQ3TLjng8YHSsgi1Q==
X-Google-Smtp-Source: ABdhPJxU3TRagjuWEF2Gz3E1Ucyrx55ygzxfYieVj3D0ExyoJPKDqzOCd2hmUMkedHakii/hod69Hw==
X-Received: by 2002:a17:90a:a41:: with SMTP id
 o59mr8087029pjo.203.1623209177949; 
 Tue, 08 Jun 2021 20:26:17 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:2585:de55:d6c4:950c])
 by smtp.gmail.com with ESMTPSA id 125sm11728635pfg.52.2021.06.08.20.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 20:26:17 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
Date: Wed,  9 Jun 2021 11:25:54 +0800
Message-Id: <20210609032554.2443675-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_202920_576967_705D274C 
X-CRM114-Status: UNSURE (   9.94  )
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

Add a 'cbas' device node for supporting tablet mode switch in
kukui devices.

Kukui platforms with detacheable base have an additional input
device under cros-ec, which reports SW_TABLET_MODE regarding
its base state (e.g. base flipped or detached).

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

---
Resend this as a spin-off, other patches for dt-binding and
hid driver were applied.

Link: https://lore.kernel.org/r/20210514122051.266169-1-ikjn@chromium.org/
Link: https://lore.kernel.org/r/20210415032958.740233-1-ikjn@chromium.org/

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
2.32.0.rc1.229.g3e70b5a671-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
