Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59776C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6sG2A/Yz4/JiJ2aVjv0vrpakjIqWzMsZcN4s/hOe6Y=; b=c3J5RZynfHJzvj3OdhTLUy9277
	2OkHu9tvtm6JR7d+Kojy7ggatmGkwAxIc1PRo1X8H/etrVzgd06gJWCGGnDUKbvZQv+jGVUwMn9Ky
	Us0jNq/QB1Rb518Y5SkkuPlMDmqECq9JHZFRPUvCqeJPkW/A+EdjNqT9NZMXxB55gyA7rhUTmyADR
	L+vr7dteC4napv4xiqkz/cfSu45JBhyhMRzDYteSZJ0IMxgtFzGIQ2+HTAvzLUG9o/EzBBNYdfE/I
	cdpkbymKKVNLt7dnnouGGRP0X6ApnB4hdcjngM0vII5UxMwlm1NoTZlgoYYv3mxeLMB0BfqsLZbYw
	SEhNOy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shSBm-0000000GTsi-3gop;
	Fri, 23 Aug 2024 11:10:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shSB1-0000000GTk2-043o;
	Fri, 23 Aug 2024 11:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FFA4A42659;
	Fri, 23 Aug 2024 11:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBE4C32786;
	Fri, 23 Aug 2024 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724411394;
	bh=i3XiKwNhL8s8yH0uXi1l3GBXpjICg9YEFS0VirpaIWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HaSeGMCS8WAEFoV+ahKG0fH+ulGXDB9KvjfmftDRF1LvZTvGARJriRIbR+HyR3Zi2
	 4EQm6FqKKxgsu2gTi9P2VGR3IEm9nWsiHh8Vq50PCxd8wfA9Mrvr2WsIdothhpBgcC
	 xXioRwhDOV15WQraeOV0Y6U1pA7W7x0ZoRe3yGWubBveNk/WliYGsaMcWlXGw3I5CB
	 qliLMqH/El9nB6wO1Qn5fHMO+LvtMg1uyGNct2UXHpebp1LGPrszrBP4YhbxNSH93f
	 VDZnfsQMLCc8ewcnYsITWMzAT0iwd6nn9NF75WX+DSOR07U8unizRQyMv/lRXbcK0h
	 KarfHPLlU3VDA==
From: Christian Brauner <brauner@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>,
	ed.tsai@mediatek.com
Cc: Christian Brauner <brauner@kernel.org>,
	chun-hung.wu@mediatek.com,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthew Wilcox <willy@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] backing-file: convert to using fops->splice_write
Date: Fri, 23 Aug 2024 13:09:44 +0200
Message-ID: <20240823-abnimmt-projizieren-32c61f79b3ea@brauner>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708072208.25244-1-ed.tsai@mediatek.com>
References: <20240708072208.25244-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=brauner@kernel.org; h=from:subject:message-id; bh=i3XiKwNhL8s8yH0uXi1l3GBXpjICg9YEFS0VirpaIWQ=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSdyP15pvlfy9u4dQ8CwhMVP56Ou3Ej+fWf7HNvXWyOv ZSXN5E92VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCR7kBGhhf8EYUBB9fX8h70 2MtxMmnLr+oLXsnZzf8Xvfp+rTsjK4eRYY/H3ceLnM4/9l1zNGPbqp2bchom3du9N8HnReGF9h8 3FdkB
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_040955_136871_FCED5395 
X-CRM114-Status: GOOD (  10.81  )
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

On Mon, 08 Jul 2024 15:22:06 +0800, ed.tsai@mediatek.com wrote:
> Filesystems may define their own splice write. Therefore, use the file
> fops instead of invoking iter_file_splice_write() directly.
> 
> 

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] backing-file: convert to using fops->splice_write
      https://git.kernel.org/vfs/vfs/c/996b37da1e0f

