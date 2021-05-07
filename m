Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5B2C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:54:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C43561177
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C43561177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pyrQl/VzYvu9UZd6KSNkv5pwVgITlLG9grREe0tANOA=; b=Cdnt0VztQdME9ax1dPmKDoJSCD
	KaoGIdsarW4A6vvn3XizAGmwCnKE771QOR6wyoJuCoReLnVyAy/24of5J3KAGmuoCPVsAXfP5pLfJ
	cOUJlaJ9sF/PTfqthjfbD6Bb6CZT9/TATPLQDR79Ps+F7xdcjLNZs/UIpBLKPDYc243kcdWuinv1b
	EoBRUfB/wwqVYN27+KURmd3rz97NR870Llkjgj7garf3b6W81hNfmpQ275W3/KXhCVNwsNDTmuxEM
	9t7cq5NrgIE3x3PRCZ+/v7VYOJoLZ/PPE3WJNvGEri+H9b9383NlRcTH5yIiVJMUrIQ+5Idp5/g4i
	3eqk0YkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leqcu-005unx-M2; Fri, 07 May 2021 02:54:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqcn-005unK-Ct; Fri, 07 May 2021 02:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=JiN/MiXefRDk9SXOY2/gstlWVbgWl3/rhFDYVlL4bso=; b=vtF2ornM0dfAYl7zvSAfPD68d9
 UlNN9n4i1WMPEuGQZ9fbSOhPa3ljbwsEv3RFb7lTepK6auL1nIfm7+x9QxZKeFvUsokftYD/IsIpr
 yD/x1KRfoxVxjA14/IubGj/qqlrpwvJez31ExKUBdODaOvI+yodAO+lK2ELYgfT4TWZgwFkdGDS6v
 r8xltNv7uuMZYYfwbutDPaCD615SafVeynrjwHuOwg0u8Wm4oIqdZsvaUrz9c7QsEdbNQyRmXAu5b
 KiqNCvLqVg5087Jw32KzyOIWvzhs+5ApSaATntMml5ww3MuhkPvSbr5MHnDQTEAG0iXahy39b+hwu
 A0XbSGJQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqcj-006XOR-CP; Fri, 07 May 2021 02:53:55 +0000
X-UUID: 1a7b479dcb2a4dfb83d49d210c82c627-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JiN/MiXefRDk9SXOY2/gstlWVbgWl3/rhFDYVlL4bso=; 
 b=G+MQB8J9sCSwvwK5Mhw+gb8kbkbTUJyqoRSfboooXuQg5ZZgB1pxCi2Pfv0cI0DU1BjGj5+x5sBnH90ln7rQfQ7rpRYDF6I9B8QijyqqkpTCzqrih5fNs9lY+ZxJch4kb9+S4rrz4GfCXKxEC0XPprng/AK+l8K4s1z6sZ4zsWM=;
X-UUID: 1a7b479dcb2a4dfb83d49d210c82c627-20210506
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <john.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2119194679; Thu, 06 May 2021 19:53:47 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 19:53:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:53:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 10:53:44 +0800
From: <john.wei@mediatek.com>
To: <john.wei@mediatek.com>, <louis.kuo@mediak.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>
Subject: [RFC PATCH V0 0/2] media: v4l2: extend framework to support advanced
 feature of Mediatek Camsys driver
Date: Fri, 7 May 2021 10:53:35 +0800
Message-ID: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_195353_450133_C54DDC84 
X-CRM114-Status: GOOD (  11.01  )
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

Hello,

This is the first version of the RFC patch series to v4l2 and media framework
to support virtual channel (an advanced feature of MIPI CSI). Virtual channel
was used commonly among modern image sensor. It was used to transfer
metadata of an image such as statistical data of AE or AF.Some advanced
features of camera such as HDR (High dynamic range), PDAF (Phase Detection
Auto Focus) were achieved by virtual channel. Medaitek made some modification
to frame descriptor based on https://patchwork.kernel.org/patch/10875875/ and
https://patchwork.kernel.org/patch/10875875/.We extend the struct
v4l2_mbus_frame_desc_entry by add enable, hsize, vsize and user_data_desc.
With this modification, frame descriptor are now more powerful to meet all
kinds of need among different applications. Here is an example that we use
frame descriptor to describe all data streams in a frame output by a
 stagger sensor.

static struct v4l2_mbus_frame_desc_entry frame_desc_cus1[] = {
        {
                .bus.csi2 = {
                        .channel = 0,
                        .data_type = 0x2b,
                        .enable = 1,
                        .hsize = 0xF00,
                        .vsize = 0x870,
                        .user_data_desc = V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_LE,
                },
        },
        {
                .bus.csi2 = {
                        .channel = 1,
                        .data_type = 0x2b,
                        .enable = 1,
                        .hsize = 0xF00,
                        .vsize = 0x870,
                        .user_data_desc = V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SE,
                },
        },
};

The first data stream, data for long exposure was transfer by channel 0 with
data type 0x2b and the resolution was 0xF00 by horizontal and 0x870 by vertical.
The second data stream, data for short exposure was transfer by channel 1
with data type 0x2b and the resolution was also 0xF00 by horizontal and 0x870
by vertical. Both long exposure and short exposure data will be fused in ISP
stage to output a HDR image.

  media: v4l2: Add fields to frame descriptors
  media: v4l2-ctrl: Add user defined base for ISP user control

 include/media/v4l2-subdev.h        |   25 ++++++++++++++++++++++++-
 include/uapi/linux/v4l2-controls.h |   10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
