Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365E5C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 04:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B6160E98
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 04:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7B6160E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=41f+kyPITrZzSPfF8CLeNj20tErRqPP8wg2d3ZvWQ74=; b=sgzXHmFvWM0tL1
	cn2dXXzZ6bxMj1V6yraZzlrnRWe7DfzvDVeTunR8khwSzdG4bm8xaCwFhSZ4QfERKHcsjhKWyoiuY
	0thHV56q7zYbXefrF1ij7uQPOvcEXqfuWumScffct+ZVm1RyFGT4SUYikr3tzU1fJSzpAkmrm431F
	yjxGBSXS7zXhfiI1LLUhuxd4HFSdsKkNnH4n2EJgAPnblh63HbZ/RLau/wLmb+ZRrHYsGetZYoCZw
	BjlGhFjgt2Uw9ryK967oZxsXTxBOeGw5eRcTjjLbTDSxGy6au9iWv/KCQkcD84mhPvI61u9JIbXze
	zRLksctF+rUOk661Xn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m79Mq-006h52-NN; Sat, 24 Jul 2021 04:34:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m79Mc-006h4F-Fx; Sat, 24 Jul 2021 04:34:17 +0000
X-UUID: 0e5724e9439d4b7da7f8d6e3cc7019cb-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sMA+NIDOptqdgoK7wbBd+obz60ILm4YtnZ+cMnZqPxo=; 
 b=o5nnyM6KIXndt+vmMtNM+oKqav/205hpJT4y7PqNJEBNTziGSfETJSl9ONBYmUsZ3pWBxPc1wADkC383OOp6yyKjWIu+R8ExsEXZ4WKMU3iN7KMFWR/ejNNmbdRA48Wa4/qQpuG0o+HPPICY/QyJ/Lp5BInA5/DSONBstaRxxMg=;
X-UUID: 0e5724e9439d4b7da7f8d6e3cc7019cb-20210723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1935137124; Fri, 23 Jul 2021 21:34:10 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 21:24:08 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Jul 2021 12:24:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 24 Jul 2021 12:24:06 +0800
From: <chihhao.chen@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <damien@zamaudio.com>,
 <chihhao.chen@mediatek.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>
Subject: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
Date: Sat, 24 Jul 2021 12:23:41 +0800
Message-ID: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_213415_994194_BB84DBCE 
X-CRM114-Status: GOOD (  15.03  )
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

From: "chihhao.chen" <chihhao.chen@mediatek.com>

The following scenario describes an echo test for
Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051).

We first start a capture stream(USB IN transfer) in 96Khz/24bit/1ch mode.
In clock find source function, we get value 0x2 for clock selector
and 0x1 for clock source.

Kernel-4.14 behavior
Since clock source is valid so clock selector was not set again.
We pass through this function and start a playback stream(USB OUT transfer)
in 48Khz/32bit/2ch mode. This time we get value 0x1 for clock selector
and 0x1 for clock source. Finally clock id with this setting is 0x9.

Kernel-5.10 behavior
Clock selector was always set one more time even it is valid.
When we start a playback stream, we will get 0x2 for clock selector
and 0x1 for clock source. In this case clock id becomes 0xA.
This is an incorrect clock source setting and results in severe noises.
We see wrong data rate in USB IN transfer.
(From 288 bytes/ms becomes 144 bytes/ms) It should keep in 288 bytes/ms.

This earphone works fine on older kernel version load because
this is a newly-added behavior.

Signed-off-by: chihhao.chen <chihhao.chen@mediatek.com>
---
 sound/usb/clock.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 52de522..14456f6 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -324,6 +324,12 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 					      sources[ret - 1],
 					      visited, validate);
 		if (ret > 0) {
+			/*
+			 * For Samsung USBC Headset (AKG), setting clock selector again
+			 * will result in incorrect default clock setting problems
+			 */
+			if (chip->usb_id == USB_ID(0x04e8, 0xa051))
+				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
 				return err;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
