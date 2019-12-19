Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59644C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 06:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F4B82146E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 06:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jB/MezZS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NoQTv/Fj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F4B82146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:To:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuT2SFKlNxc/S8FguVq/pxhiZY149qUxLbhdc0XHOxg=; b=jB/MezZSvw1+2r
	KLhO6p62QSJONufg87MsK9S8CsZ3Kdj/GfRLc9sZUETr3Oq/encX9z29I8znSlLpxc1f9YVx7hDib
	meebk1riq0o4WDz0y41PmRHz2vcEVpnwyZuhgcZPsR53jo1hnVkbBppEXVtWakiDgInrvy1NjQB+t
	nuNjvVXqfRJUisPohKa+cN3V1PW68EPkjYD3g1oQNtk3Zs4A49gzoR//pvV2z4X5nZMMEh0Wu9tJh
	9AuvY7vQVwFsrelSk+wtR0QjRH7xXt0GouSd8OPWKPt2EqUu9YESEnRCv5wxhbXO3vZiucXrhxLbR
	/g0Yww9gFmk6x31k9mqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihorf-0003Jj-EV; Thu, 19 Dec 2019 06:00:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihor7-0002Df-Cv; Thu, 19 Dec 2019 06:00:14 +0000
X-UUID: 7b7d1793262b45c5b15ffc874cdd0f69-20191218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7fCn/ztl4AlC39YFUcLA1Fd5PU/Oyw3txLJ3UdHhRJ8=; 
 b=NoQTv/Fj9uM+eKVXU2ao/khA+tzVXC9AfhLOO8YqZTj9djH6MOrPHtiFabCbn8vvXL3+Bxb9BfpcX5twykeJ2qjY6Bu1x33ye4/SDJYJk4T8r+3e+RNx75nVQqoMnWSHIo1joAzhX60RsQ67qFw56DfDK8Uzx673i77sLc8UjsU=;
X-UUID: 7b7d1793262b45c5b15ffc874cdd0f69-20191218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jungo.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1436894052; Wed, 18 Dec 2019 22:00:12 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 21:50:25 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 13:49:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 19 Dec 2019 13:50:12 +0800
From: Jungo Lin <jungo.lin@mediatek.com>
To: <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
 <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [v6, 3/5] media: videodev2.h: Add new boottime timestamp type
Date: Thu, 19 Dec 2019 13:49:28 +0800
Message-ID: <20191219054930.29513-4-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191219054930.29513-1-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_220013_451618_E4408C82 
X-CRM114-Status: UNSURE (   8.29  )
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
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 suleiman@chromium.org, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com,
 robh@kernel.org, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com,
 frankie.chiu@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 ddavenport@chromium.org, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For Camera AR(Augmented Reality) application requires camera timestamps
to be reported with CLOCK_BOOTTIME to sync timestamp with other sensor
sources.

The boottime timestamp is identical to monotonic timestamp,
except it also includes any time that the system is suspended.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
Changes from v6:
 - No change.
---
 Documentation/media/uapi/v4l/buffer.rst | 11 ++++++++++-
 include/uapi/linux/videodev2.h          |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 9149b57728e5..f45bfce7fddd 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -662,13 +662,22 @@ Buffer Flags
       - 0x00002000
       - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
 	clock. To access the same clock outside V4L2, use
-	:c:func:`clock_gettime`.
+	:c:func:`clock_gettime` using clock IDs ``CLOCK_MONOTONIC``.
     * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
 
       - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
       - 0x00004000
       - The CAPTURE buffer timestamp has been taken from the corresponding
 	OUTPUT buffer. This flag applies only to mem2mem devices.
+    * .. _`V4L2_BUF_FLAG_TIMESTAMP_BOOTIME`:
+
+      - ``V4L2_BUF_FLAG_TIMESTAMP_BOOTIME``
+      - 0x00008000
+      - The buffer timestamp has been taken from the ``CLOCK_BOOTTIME``
+	clock. To access the same clock outside V4L2, use
+	:c:func:`clock_gettime` using clock IDs ``CLOCK_BOOTTIME``.
+	Identical to CLOCK_MONOTONIC, except it also includes any time that
+	the system is suspended.
     * .. _`V4L2-BUF-FLAG-TSTAMP-SRC-MASK`:
 
       - ``V4L2_BUF_FLAG_TSTAMP_SRC_MASK``
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 04481c717fee..74ef9472e702 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1060,6 +1060,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
 #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
 #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
+#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000
+
 /* Timestamp sources. */
 #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
 #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
