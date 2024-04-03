Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E0ECD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVVZgdfrVNiPvmtZvP+8BSDLhxGZ06iaT+H+vJWOwFw=; b=0+GdWXvcpspdhdpVGLZfpsChvp
	NnWNWtCebzow89Qw/3/4sGWlsm8CsK/TGY7/VH0GcNa0BXW+c+5IFWS1HbeLCVdFLxyKEmGfQ5TXd
	QfimcE64w1izk/WSmRAaZLBrtIAaA9tWzeEW/Jbb7ROQTKYLmeFT8qWoi4p8yhkF8GBnyovCsE9qw
	F7vitcg3DONaoFkm15tKVGP8OxVUmi7xoqGUN8qiq62dGCuRlxTw3jSjNp2aXblLl9g9pLGOqRSmD
	OU7yXNc60itZyXbK2UnklUkp3RBKrNRJ7Uk47zm9vwaXN1PNAoCxmGNnXT1eR5tiFvWuH9da20lGC
	CICd6hjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxus-0000000FXSW-1Wex;
	Wed, 03 Apr 2024 10:32:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuW-0000000FX7b-1VBK;
	Wed, 03 Apr 2024 10:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140322;
	bh=QCQv4SlWwu4pTHP3KZHi48pp2atYllgOS/M1veC+SRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+A7gdKsl4qbgkvz+dyY3uNMPiP+lPeH6p0M1oF1lRq1mpjO3WCmazIKjjkN6bhL/
	 5ERyifQx+RvukIa94tQyJAFDavIFOyWKyIxiJTtu5GrsuOrt7XuWPr/daII/5bNq77
	 Dhp/6VnS9KMKqpCYgdrk36d0R/mNDxsNPe7CxPGT4PCjTu0Gb2nCAJRMuR1+ksTn2q
	 tegKHEzdkez05aQPFbDvu+R9/rbTm5XE4M0oID3vsRN/YKxG2JAonOdVri52rO9p53
	 XsqFt1p3A6CXr+mKJyC+SQPg2WiTT7hxffUXtEejvOx/ajWKWCKTv39KA8BpTj1MAM
	 3KLcFDBfNWhQA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25BD93780624;
	Wed,  3 Apr 2024 10:32:02 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v2 00/12] Remove cl in struct cmdq_pkt
Date: Wed,  3 Apr 2024 12:31:57 +0200
Message-ID: <171213938049.123698.15573779837703602591.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033204_944909_6F46975E 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, 22 Feb 2024 15:41:08 +0000, Chun-Kuang Hu wrote:
> cl in struct cmdq_pkt is used to store struct cmdq_client, but every client
> driver has the struct cmdq_client information, so it's not necessary to
> store struct cmdq_client in struct cmdq_pkt. Because mailbox maintainer
> do not like to mix mailbox patch with other patches in a series, so
> mailbox patch [1] would be sent independently.
> 
> Changes in v2:
> 1. Fix typo of CMDQ_JUMP_RELATIVE
> 2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
> 3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
> 4. Add cmdq_pkt_jump_rel() helper function
> 5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
> 6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
> 7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()
> 
> [...]

Applied to v6.9-next/soc, thanks!

[01/12] soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
        commit: 7349d4bdee457715308e6229a674f4cebf42be92
[02/12] soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
        commit: e24e0ff0871b8e3287f258b76b82238b64714628
[03/12] soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
        commit: 8a8bcf23b3e0ab333bfc827ea7ed2f9bece9bea8
[04/12] soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper function
        commit: 78462e312e63c5bc0859934d9457155fb50da2e1
[05/12] soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
        commit: cad76fa0221c3f8e656b56b7673ae752a65108d8
[06/12] soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
        commit: 3e2b3be190ace43841011ec0bec950a28a012601
[07/12] soc: mediatek: cmdq: Refine cmdq_pkt_create() and cmdq_pkt_destroy()
        commit: 62d2fb402b132e52899f52b4d5f150fd1dfd1895

Cheers,
Angelo


