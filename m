Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB311C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHtQXoO3gkfXq9fecupWc54bImQ5r1jPbo1pnWk/lX0=; b=nK4L40uyEjpj/z+Lr5a6TRw92c
	PD82ypKFNC6v4wMJ8yhYuwiESTFD5TVPsjULeX0Ly5qEd5tSnM65UH20K2TaXXr9CvxaaLJh7tiBo
	hEqadPvKfE2eaFmfGZVoPU3gtfvEBkP9qxkenaPpftQWPkqkQVS5n2+8wk1MhdlIeDR4R7vU3Ug3r
	2CnDyrnSW1n0HHSIqdmCVB5apuqMYIa4yYpSFNOrQQNkmpskztvmakxNFGrg/UX7AQLdwlrcb6nLE
	3eUEoQb61TW+h/lUX1sNXKB8glpIDfldKkcubex2Cu3u8wYRewl34+A1l6oYob7RQsMhGSjg8El/P
	j4fDWqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe8Z-0000000FFrW-0udi;
	Fri, 05 Jul 2024 08:17:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe8W-0000000FFpj-1421;
	Fri, 05 Jul 2024 08:17:45 +0000
X-UUID: 0a1930e83aa711ef9daba96ee3f3cc8c-20240705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gHtQXoO3gkfXq9fecupWc54bImQ5r1jPbo1pnWk/lX0=;
	b=pDeUOnfX4wQ0qI9P5tV2NfM/sRga4RJT+vx3MZIeMxT63woIuRHs3Ftylr1EojqWc3PQq2yxKvqxgjDCGSvmVoXEAzUWRtFJp1c83n57IK/IVAsA5eLKR6ofTkvSo13ixtpghYgYrPB7fY98+uqnJMa1hj4Ol11vOOYF6lUts6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:5cdf8404-bbe0-4912-9e74-089580acb183,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:674d1a0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0a1930e83aa711ef9daba96ee3f3cc8c-20240705
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 609333196; Fri, 05 Jul 2024 01:17:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Jul 2024 01:17:34 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Jul 2024 16:17:34 +0800
From: <ed.tsai@mediatek.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
	<brauner@kernel.org>, Jan Kara <jack@suse.cz>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<casper.li@mediatek.com>, Ed Tsai <ed.tsai@mediatek.com>,
	<linux-fsdevel@vger.kernel.org>, <linux-unionfs@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] backing-file: covert to using fops->splice_write
Date: Fri, 5 Jul 2024 16:16:39 +0800
Message-ID: <20240705081642.12032-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_011744_321844_66DA3F74 
X-CRM114-Status: GOOD (  11.61  )
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

Filesystems may define their own splice write. Therefore, use file
fops instead of invoking iter_file_splice_write() directly.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 fs/backing-file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/backing-file.c b/fs/backing-file.c
index 740185198db3..687a7fae7d25 100644
--- a/fs/backing-file.c
+++ b/fs/backing-file.c
@@ -280,13 +280,16 @@ ssize_t backing_file_splice_write(struct pipe_inode_info *pipe,
 	if (WARN_ON_ONCE(!(out->f_mode & FMODE_BACKING)))
 		return -EIO;
 
+	if (out->f_op->splice_write)
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


