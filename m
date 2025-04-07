Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59119C369A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnGHcrER9YDxAyPU3nkvZnlbQptjLRPQDQ+T4cQt70g=; b=FAtw2N8kH6RfREmDMruKRXeaAM
	6z+fbFSE91b4QRLN61XlBthPUVQpvqrL4Bx8gEY5vr+0j3L1z/ONDZBc2HRS/K2EpYnV4Qvu+6e9y
	BMDZbryokgTAjWFrI9466rPeM0HvSkoSmLenNgu37orUF3S8cbbZc2FRrrBxC490pzKVKm9upA2Fl
	/sfXGRLlxJJVyjqY0urdQMzUIO4TpTEijAgx6XOJLEsOn2w00LY6qJXSbPzVxafxr+WmTnmbEMmO+
	P2+CZl1sIuzp54q63UQpyINy3m34WfwFDl5Gej623gddkpjskPw5Fv0rSlG2lfasIB7f5FWaH+0Ii
	/ZsfMlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mVf-00000000VdS-1z0W;
	Mon, 07 Apr 2025 13:27:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mT3-00000000UnF-1mlk;
	Mon, 07 Apr 2025 13:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33B7C61129;
	Mon,  7 Apr 2025 13:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6D7C4CEDD;
	Mon,  7 Apr 2025 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744032288;
	bh=phz+W/y/P98TEbJzgV0y5Ve9zvJ2zXTVkoIK4Sd0Rz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cMPH9s83obHD/J4Ik3GrucvSZ1HvxqMFUaVBhBsE3ECURdL3gO0LMM+1wzfO+2Nl0
	 msMJIbdgl6bqFjf9LW3gMuy/IdtAhjyZabrVLFlZP9ni28+XAA2QvxaqEsuZbwu6qU
	 eT1wYu2AUHehWodKeTcx0yvWhAd0qboDezG4HVQZyX0cB8jvIsxj6QMjDrbrCbRpjw
	 h5WhU5otun52iDmd2aWnsBjuFFxu5uTJB4foYrIEUONew7GP5GyLPHyfZJgju/mkWH
	 Yn0EQegdKgTzPqRbxD2OWXVcQUdNqLPClwq+U7FTKQByobcUnrY+T9m7Nt7pdFDvB0
	 5UbxZyrOEIvPw==
From: Christian Brauner <brauner@kernel.org>
To: Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	eperezma@redhat.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Christian Brauner <brauner@kernel.org>,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com
Subject: Re: [RESEND] virtiofs: add filesystem context source name check
Date: Mon,  7 Apr 2025 15:24:32 +0200
Message-ID: <20250407-erzeugen-granit-5fdd39986bfd@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
References: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=brauner@kernel.org; h=from:subject:message-id; bh=phz+W/y/P98TEbJzgV0y5Ve9zvJ2zXTVkoIK4Sd0Rz0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaR/viR+uDh1wTkdg2mVAqyb9F9PjM/5EuUp+WuDsM4ji +1hxcsKOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYS9prhn9mM5ufHhQ6aZO9W Sj5W8KfH77Dxml8ORjnFaRM6rnde3s7wV2rV5Dd+oj93p21bwVGiemdh7qntsfvfRakuDHkSuq9 lJhcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
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

On Mon, 07 Apr 2025 19:50:49 +0800, Xiangsheng Hou wrote:
> In certain scenarios, for example, during fuzz testing, the source
> name may be NULL, which could lead to a kernel panic. Therefore, an
> extra check for the source name should be added.
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

[1/1] virtiofs: add filesystem context source name check
      https://git.kernel.org/vfs/vfs/c/a94fd938df2b

