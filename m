Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C920AC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 05:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6073E22246
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 05:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LSQSCFJy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhG+3Qfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6073E22246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vz2gQTB3G5tTScpL1iK9vncPnQJd3AfwlCAYIhN0Tk0=; b=LSQSCFJy+yzUQJ28XA3H8CXuq
	08pjdVE7qEGfVJ1EIfOkitxy+KKnXjsDoTevQwfyypFXwDpw7SiFeBr5EzCSUgu1DE9Uw8QUPvcQr
	0v96Squy77yTrpkLfvx/KbQ6/57RcuWcJmicPGuiJhCYd59Z2LbVum0U4O8nGfMFB53Jc0d6fwf6r
	MfbeWs+ZEbiD8mLTZWqsTtk83vDn08tg6pTSB9QXitrKh/LQoUaDU89iWXn0Ai3tqJas+OeJLWiWv
	6N5yq/yeTIFZqtRbnBWnxNwEdhf4Ug37QV6eMqtbyl1MR2zdQ2lDhLfHQgRjf0S6lA+8KqdLBTegL
	INHMXiuaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZ64R-0006JY-0o; Sun, 01 Nov 2020 05:38:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZ64I-0006Hx-N4; Sun, 01 Nov 2020 05:38:24 +0000
Received: by mail-pg1-x541.google.com with SMTP id i26so8167567pgl.5;
 Sat, 31 Oct 2020 22:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0UPMaHl9sQ1QYtD72P2Gtya64wSdEwNqN6m40oRNsA=;
 b=WhG+3QfgIcd8FEd+xMfq2+PFDMbU3yKbbZSIlonfA1ApWGA4gU1bW0orKx/iLuiuD1
 Z+kjTIvH09Gw9KTvvDBtEec3691SQzjLUZBGw/M87/jtqzjNrPdDEfygAnZqXqa+v8Fm
 L7pfJ7kdI04aA4mKAmUbHrzVV86KOwkiAlsUM6WlcfNYb5IRDkdaLEJjiiOcLbwQMT2C
 DLiMRmRu9mGbcexKK2oVWj8TCW3xfQPpDQpKqu0niH8PeGQLJV/jz2M9KyX7rx6jSk7d
 K1cCNXqPI4WtOBwKxTBf5wFldIH2LoDdnC7I2C7CC7thtXwRrIXcPiBFAmC9+lxcXOht
 uUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0UPMaHl9sQ1QYtD72P2Gtya64wSdEwNqN6m40oRNsA=;
 b=A3EbJnfooQstSVonUJmH2435RDjLwy18ZETOpgUiSxl4VlCHDmg0+JP20xPJD7UBXT
 EHptwh8s+0brSxj3r82XjROgiHE+m8BlqcoXsEyc/RFyJwCQ4Th61oXwrmoF+tvyWAAv
 X9H1aBl/mS/eCrKsHAG4BezUGpS/ztvZHUfOY7GTXnCK+5ABDe6GQ/IOR8vaqyKgBOa/
 x4wWpU9L2v6q0VB7yBZojwDhNG2cO8+BZQzBNWZ1ROWe1/fvtDmg8txXXDEXAIsRucIJ
 XDvAJlMTr9e6dsBB2y8L03Tm7MGi4IZ4sFl5xhCkANav+nH7YJJIMP3/6IzHZlxB0ol9
 Lkxw==
X-Gm-Message-State: AOAM5314keYD2f/7dsM5nXz0U9znF6oNl6AcxdCltWch01IcSGpPUqgB
 lynx6/YyWfpmO5omKC0UDdg=
X-Google-Smtp-Source: ABdhPJz8JY5kc/jUUwoCuti7DG3VKLSeM35nguxL7NxmueK5tY+OX9jYzu40IOaFEDMs65Fuk77CtQ==
X-Received: by 2002:a62:aa0f:0:b029:162:ecc2:4d44 with SMTP id
 e15-20020a62aa0f0000b0290162ecc24d44mr16564428pff.52.1604209093832; 
 Sat, 31 Oct 2020 22:38:13 -0700 (PDT)
Received: from clanlab.dyndns.org ([140.119.175.157])
 by smtp.gmail.com with ESMTPSA id e5sm8486972pjd.0.2020.10.31.22.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 22:38:13 -0700 (PDT)
From: Macpaul Lin <macpaul@gmail.com>
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [RESEND PATCH v2] usb: gadget: configfs: Fix use-after-free issue
 with udc_name
Date: Sun,  1 Nov 2020 13:37:28 +0800
Message-Id: <20201101053728.2387434-1-macpaul@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
References: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_013818_879061_778CD519 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Eddie Hung <eddie.hung@mediatek.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Eddie Hung <eddie.hung@mediatek.com>

There is a use-after-free issue, if access udc_name
in function gadget_dev_desc_UDC_store after another context
free udc_name in function unregister_gadget.

Context 1:
gadget_dev_desc_UDC_store()->unregister_gadget()->
free udc_name->set udc_name to NULL

Context 2:
gadget_dev_desc_UDC_show()-> access udc_name

Call trace:
dump_backtrace+0x0/0x340
show_stack+0x14/0x1c
dump_stack+0xe4/0x134
print_address_description+0x78/0x478
__kasan_report+0x270/0x2ec
kasan_report+0x10/0x18
__asan_report_load1_noabort+0x18/0x20
string+0xf4/0x138
vsnprintf+0x428/0x14d0
sprintf+0xe4/0x12c
gadget_dev_desc_UDC_show+0x54/0x64
configfs_read_file+0x210/0x3a0
__vfs_read+0xf0/0x49c
vfs_read+0x130/0x2b4
SyS_read+0x114/0x208
el0_svc_naked+0x34/0x38

Add mutex_lock to protect this kind of scenario.

Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Peter Chen <peter.chen@nxp.com>
Cc: stable@vger.kernel.org
---
Changes for v2:
  - Fix typo %s/contex/context, Thanks Peter.

 drivers/usb/gadget/configfs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index cbff3b02840d..8501b27f3c95 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -230,9 +230,16 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 
 static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
 {
-	char *udc_name = to_gadget_info(item)->composite.gadget_driver.udc_name;
+	struct gadget_info *gi = to_gadget_info(item);
+	char *udc_name;
+	int ret;
+
+	mutex_lock(&gi->lock);
+	udc_name = gi->composite.gadget_driver.udc_name;
+	ret = sprintf(page, "%s\n", udc_name ?: "");
+	mutex_unlock(&gi->lock);
 
-	return sprintf(page, "%s\n", udc_name ?: "");
+	return ret;
 }
 
 static int unregister_gadget(struct gadget_info *gi)
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
