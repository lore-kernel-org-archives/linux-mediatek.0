Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5914FC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2499020899
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0H/VrUd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Is5MmiOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2499020899
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=04vYR9zmGfHtLmsqqPQanhqoqVVXUXhakNR22ZwJ4ho=; b=l0H/VrUd3Q7RlBfOh496QZ0paM
	ShH4nikcOguEQXf4u4E/EZh5DH+bjc7tU8GnCYvisitkqBMpFY8aFcxL6iqQGj03wyt5tFou7ExI7
	auuQj+ApCu0q58JyJKUDQVxbrhGIyBrFaUM+lEexeyrm1GKTXvYqjoI6pbcp6pUzjhLBfNpnwsG4Z
	Wg/W0dUlwIsV0J5gYuDd37mHVSWx+VLzVODfhpLNMTQ+e86goNWfnkywoVRM9+AjrJz0ia+tHeK9c
	Vtl3e0/5/YP/qkVAOE+iXpThdHsoKR300Kgi3YuBtEqtllaoYcnd3TAEGhVYxjJgEUIGxnfymtALm
	UvVCd8lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jryHX-0005md-FE; Sun, 05 Jul 2020 06:37:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jryHM-0005hl-Tj; Sun, 05 Jul 2020 06:37:34 +0000
X-UUID: 57a24db741594961a35ad3fc0f151369-20200704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gqm4OZfUhki8WU2CVF1hQN+tokRx4Gt+FcA3Q1zvhc8=; 
 b=Is5MmiOAN5MSw/wPkUkzCcZzAe4Mad2TW4ATm7e0Zy7aQGHVbDbWQNHieNrSSG3ARTK1YRwlYSlRmhCaJh9H3NaBLOAXNR67AA/KYwAWE1JiBYrP+vyYSMBOCrzlTqrCW85haMswZAuFm4cemVn4QpA8LLykrfskeKzthTr2Pzo=;
X-UUID: 57a24db741594961a35ad3fc0f151369-20200704
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1869201525; Sat, 04 Jul 2020 22:37:11 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Jul 2020 23:37:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 14:37:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 5 Jul 2020 14:37:17 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 0/4] support gce on mt6779 platform
Date: Sun, 5 Jul 2020 14:37:12 +0800
Message-ID: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_023733_120470_8CA68620 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch support gce on mt6779 platform.

Change since v7:
- Rename cmdq_mbox_shift() to cmdq_get_shift_pa().

Change since v6:
- Separate all helper function to another patchset.

Change since v5:
- spearate address shift code in client helper and mailbox controller
- separate write_s/write_s_mask and write_s_value/write_s_mask_value so that
  client can decide use mask or not
- fix typo in header

[... snip ...]


Dennis YC Hsieh (4):
  dt-binding: gce: add gce header file for mt6779
  mailbox: cmdq: variablize address shift in platform
  mailbox: cmdq: support mt6779 gce platform definition
  mailbox: mediatek: cmdq: clear task in channel before shutdown

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  97 +++++++-
 include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   2 +
 4 files changed, 313 insertions(+), 16 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt6779-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
