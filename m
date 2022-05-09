Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j1/TAfr2VH3bU381xbAC7YAQamM5PKGMI0AaGfbC03k=; b=GL1Qdwp4NobCFI
	H8pw1w0nMECpf/wGqtftdBg3FcFd7UD74SoX3gDL2elp8kYUYcFTww9rGcvsLM4ef8UMAs7W2uG21
	kJt8pX4M0x2UgVAp4w9FBcc+EoVLq00OsFnqDmFO7McBSRojD7C360XxUEW0BE6XMocIrnkx7KDCk
	cSkYRpfQ3LxngiF5zMBBqUvNJ1h8XDiEM+vqx6Fdq5j0tYQQnINVd1fwPcT1Hsb+URwPk8LtyI6VW
	n/n9Bn2HAj3f28nyFbrRVA9Jde7vAupEinSnbHBiTgFVj+BWvaNOj3tM8TYPHrskV/9ymUZed48MJ
	ueO7YZpsnOEBa95axDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnyNf-00D2e3-CL; Mon, 09 May 2022 08:04:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnyNc-00D2cu-IV
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 08:04:34 +0000
X-UUID: 3d723470156f40e9b224e34121ccfcb8-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cae88e76-78f6-475d-87ce-19c62ccf726c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:3a80b816-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3d723470156f40e9b224e34121ccfcb8-20220509
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1617719051; Mon, 09 May 2022 01:04:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 May 2022 01:04:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 May 2022 16:04:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 9 May 2022 16:04:19 +0800
Message-ID: <4a46f800702c33bd9c2b0c2069179572a3eb1044.camel@mediatek.com>
Subject: [PULL] mediatek: Update mt8183 firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <rongchang@google.com>,
 <yunfei.dong@mediatek.com>, <shawnku@google.com>, <hsinyi@google.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 9 May 2022 16:04:19 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_010432_664377_A450C5E0 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi linux-firmware maintainers,

Update the MediaTek mt8183 firmware is to v2.0.2745.


Thanks,
TingHan

---

The following changes since commit d4b75516c46b22d17b8654c65f2ea2730875bf14:

  Merge branch 'dg2_dmc_v2.06_rebase' of git://anongit.freedesktop.org/drm/drm-firmware into main
(2022-05-03 08:20:28 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp 8183-v2.0.2745

for you to fetch changes up to bdc8ff9f974d541c296212f208ac23bdbdd076d1:

  mediatek: Update mt8183 SCP firmware (2022-05-09 14:54:43 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Update mt8183 SCP firmware

 WHENCE                  |   2 +-
 mediatek/mt8183/scp.img | Bin 1027104 -> 1032064 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
