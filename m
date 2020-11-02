Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A63C00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:40:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253C22084C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z+x6iqeZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hi1XUKTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253C22084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JyhwakgnwPHPZfAXwXYdkGmXUiQMBjsWN5LiFzG6uPo=; b=z+x6iqeZUZDWkwKBONV5OT4Eda
	yFvvB/5eJ68tguPLhOp94zSCnSyzwlUIhI0OLsRwKqLpu3NVpA7wF1LANKZaSdWL6ySDjqNThKAet
	rMUWMH6L1UMZF9cGAB8p/1kqX0fRjvOvJLTiyPSy+a3gIGrRQ62LNGV8fwuImUx7ArwUEd4hqFGeV
	lXmMIaLecDFMh1JU0qwpMeRqkSf33DFsJTkiZFt8COko8AiiZ4LtD10j6H49HtJYd+tLXe5pm4wf2
	4bN1mCQDCwrHuJaw7W7NatQm797BhH/cQ++UUI5QxgJfykNEY3IB/zdf9oNgP85z5vMlIFm36iVn9
	ZA4DjRQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUSA-0000yO-3N; Mon, 02 Nov 2020 07:40:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUS5-0000vK-Hm
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 07:40:31 +0000
Received: by mail-pf1-x442.google.com with SMTP id 10so10355058pfp.5
 for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2020 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZ7qWtE/JagD4wnKQ1Pjzyg8D2gT0S05CFs3Gnd0M1I=;
 b=hi1XUKTo5mfu6hDc7B9CbqJ1S5iHE0fm5BGunRQMa3lG9icp3Z1sq9R+s69NyjUNqM
 7NGV4ctg8GckjBBigieAWW2sJCYPnldsfSCQqY/UYuL/iev+iedpMwrqpikCA05GfOd8
 ATfY1ldEAekqWqV8uRcE1/iJfzP41XIuxe5SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZ7qWtE/JagD4wnKQ1Pjzyg8D2gT0S05CFs3Gnd0M1I=;
 b=OzxId9FCAUEg0Yi6qw26Py06D/ZMV7r5FOYLDI55rN4yy59HJ9us6Z+HsAyRkeHX9u
 mfw5YG4plV4D9Y1UM1v5Zdk8G3sVB8Cf6c6JtU+9RU1EFdsaqVKFwvLzIpJoYZWfzimq
 Sh2VGEhY/hy0OOnfCntcrpKNmGbA9Y3eA8N4T1sUFyz2ckAERjVipIUfyB/tQRcpduGw
 ibNeFtX3em0MG3OSf/cm3ESWWEs9OSh7tZKyQvL4PyqVCeX/z5VnP4foNMYpv7vIJmR3
 eJ7/2ZSelrV8h/wqtGM111egjCj8SdDqcFWP1HKPwKWW2dwuzSvjxX1lPFmey7SztmO/
 uqqw==
X-Gm-Message-State: AOAM532Nrl5TvVO0KrYE8qfZPNyU3DluGX63noQm/fxRF06ejeBisYUO
 lYlNCYIHbORXYuLflJ+Wwt76BQ==
X-Google-Smtp-Source: ABdhPJwqXHxJ0TlTc7zOsutpjcl3H9A0kwABgaJlyjOtRmUbEPz0lR96rFtEy+ZMSAM0kUJj3hfnQw==
X-Received: by 2002:a17:90a:f2c5:: with SMTP id
 gt5mr1001428pjb.66.1604302823903; 
 Sun, 01 Nov 2020 23:40:23 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id t20sm13067787pfe.123.2020.11.01.23.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 23:40:23 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
Date: Mon,  2 Nov 2020 16:40:07 +0900
Message-Id: <20201102074007.299222-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_024029_891578_2EE486CB 
X-CRM114-Status: GOOD (  12.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now that this driver can be compiled with COMPILE_TEST, we have no
guarantee that CONFIG_OF will also be defined. When that happens, a
warning about mtk_scp_of_match being defined but unused will be reported
so make sure this variable is only defined if of_match_ptr() actually
uses it.

Fixes: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COMPILE_TEST dependency
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/remoteproc/mtk_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 577cbd5d421e..f74f22d4d1ff 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -772,12 +772,14 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
 
+#if defined(CONFIG_OF)
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
+#endif
 
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
-- 
2.29.1.341.ge80a0c044ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
