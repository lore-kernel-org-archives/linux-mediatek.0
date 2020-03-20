Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26982C4332B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10E020777
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ebkWvitC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iQ5dSost"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10E020777
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LG/ihj1KVu4ysOt0ado2gAwdb19HZDwUnGLhfSPCPFA=; b=ebkWvitCOq4eV5
	MXGcoA4Xw3QGhQeD9BhtqDagJZ7e5PiM3wwqMQYA6h3kQp8hzm7iErlpQ4bfD7hGKS3y1JbTF0sIG
	RzV3uiEVV0lPOsUFsHK1X/lI7meWNgoEJBblfJX7pYnPRwyNSwYQeO1eP9fRsQcOMC3LH3HjBCmBA
	BVEJOfljsTRDlTyEO7VwRNnIxd35tJZ/twLIL41Hhtawzsn5nuJuWSk+lipl2yIhrpLACM9nUgn20
	zpX8i4/siJasgYh6bhU3eGlst+U0Q0a1lmrSLv1IrG4phtM9iCzi+fh0vNCC6Fr49VxU+ShYimoIl
	I5Y0hYDkRvgvyWYc8aWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFBql-0004cZ-Af; Fri, 20 Mar 2020 07:13:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFBqi-0004c2-Dv; Fri, 20 Mar 2020 07:13:46 +0000
X-UUID: ed32d557a3d94f8b99cceb813e0b93a4-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=k58APG24uidmU5v8KtptUOGOeNfiLEWeS+xyzZ6fKUI=; 
 b=iQ5dSost9Wnho3MFg3aDcFx5NtUWxkTmfe3IuhR1yUa6k0WtBY+nXG7GX5BeU5nqaHFKmoUCyHUvm5qfWIoPRi6Ayw4aRQg2fHtOnaLwGJw78oH138t61PAQw76pjuIrUwPwEJBqWH2T5pm2Qk3uliHu0jroGLlC6n+EcPX4ZDg=;
X-UUID: ed32d557a3d94f8b99cceb813e0b93a4-20200319
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <erin.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 617265054; Thu, 19 Mar 2020 23:13:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 00:14:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:12:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Mar 2020 15:13:37 +0800
From: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request v2: linux-firmware: Create Mediatek MT8183 SCP firmware 
Date: Fri, 20 Mar 2020 15:11:42 +0800
Message-ID: <20200320071143.4225-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_001344_479601_63261857 
X-CRM114-Status: UNSURE (   6.82  )
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
Cc: menghui.lin@mediatek.com, maoguang.meng@mediatek.com,
 srv_heupstream@mediatek.com, drinkcat@google.com, yunfei.dong@mediatek.com,
 erin.lo@mediatek.com, linux-remoteproc@vger.kernel.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, shawnku@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, maintainers,
Changes since v1:
 - Add information to WHENCE

The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:

  Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)

are available in the Git repository at:

  https://github.com/erinlo/linux_fw_scp v12573.77

for you to fetch changes up to 3c213aa59661c4641f0c2166a315140ac0445230:

  mediatek: Add mt8183 SCP firmware (2020-03-20 14:37:49 +0800)

----------------------------------------------------------------
Erin Lo (1):
      mediatek: Add mt8183 SCP firmware

 WHENCE                  |  18 ++++++++++++++++++
 mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
 2 files changed, 18 insertions(+)
 create mode 100644 mediatek/mt8183/scp.img

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
