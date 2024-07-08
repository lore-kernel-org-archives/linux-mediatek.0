Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8928C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJkwzRahuAD6qT9OiVCPZe9NczY4Z6Ju4rXLGq9EF/Y=; b=L/862m5GSRyKb8Z+ty+9SFDYKP
	FajcJrNYAGzMRSwfeVVdyvageyXSKMgYQP3qiY/pa3m8eLozFDLfoAtYowq24B7wjGSF58cwxgtte
	10CvQ2H22rLeCTuyhBGVcQIDjS8F475BziciqgmZSIP3BEOTDA1Y5fAR66fcyA4qsWeOn/INNWtO0
	SqusrwwoWs1jnw8s2zbSY1ujTS3K5SvMJFVLsMNdxtkTjFePjYghHynE+DGPjWGGNpAeP8E7908FY
	KEPyXUHkg3TGRhBxtiQYjbM9InTYQWVZNiGR/pyzDpkr8wnVsKaLWWQglKRK7xwcVNk1H/5JQ8Twl
	YwTx43EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiiO-000000031Dq-2FAP;
	Mon, 08 Jul 2024 07:23:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiiM-000000031D6-27Wi;
	Mon, 08 Jul 2024 07:23:11 +0000
X-UUID: ebe1c08a3cfa11ef9daba96ee3f3cc8c-20240708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vJkwzRahuAD6qT9OiVCPZe9NczY4Z6Ju4rXLGq9EF/Y=;
	b=ldOEqU0z8WEFhFr6Kx78onUFlezztM/ASaiXmGGEEeGLTeqlNQncwoP5AlYJQR4jUvu9gLjwFF+sJ0ItH5RNpj/E6R2Ky7z+QzSv42ZTpDcb38nuDD2V5on2vrFGAER5NNKWKUVgSOgblk8NZ/VGF+HpNg8wwxPGyk6habUZkSI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:6bc4558b-240e-4f6c-90d4-59d7ac118f2b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:eb3e37d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ebe1c08a3cfa11ef9daba96ee3f3cc8c-20240708
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 886542876; Mon, 08 Jul 2024 00:23:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 Jul 2024 00:23:04 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 Jul 2024 15:23:04 +0800
From: <ed.tsai@mediatek.com>
To: Matthew Wilcox <willy@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>, Alexander Viro
	<viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
	<jack@suse.cz>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
CC: <chun-hung.wu@mediatek.com>, Ed Tsai <ed.tsai@mediatek.com>,
	<linux-fsdevel@vger.kernel.org>, <linux-unionfs@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] backing-file: convert to using fops->splice_write
Date: Mon, 8 Jul 2024 15:22:06 +0800
Message-ID: <20240708072208.25244-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_002310_573481_DA49E412 
X-CRM114-Status: GOOD (  12.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ed Tsai <ed.tsai@mediatek.com>

Filesystems may define their own splice write. Therefore, use the file
fops instead of invoking iter_file_splice_write() directly.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 fs/backing-file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/backing-file.c b/fs/backing-file.c
index afb557446c27..8860dac58c37 100644
--- a/fs/backing-file.c
+++ b/fs/backing-file.c
@@ -303,13 +303,16 @@ ssize_t backing_file_splice_write(struct pipe_inode_info *pipe,
 	if (WARN_ON_ONCE(!(out->f_mode & FMODE_BACKING)))
 		return -EIO;
 
+	if (!out->f_op->splice_write)
+		return -EINVAL;
+
 	ret = file_remove_privs(ctx->user_file);
 	if (ret)
 		return ret;
 
 	old_cred = override_creds(ctx->cred);
 	file_start_write(out);
-	ret = iter_file_splice_write(pipe, out, ppos, len, flags);
+	ret = out->f_op->splice_write(pipe, out, ppos, len, flags);
 	file_end_write(out);
 	revert_creds(old_cred);
 
-- 
2.18.0


