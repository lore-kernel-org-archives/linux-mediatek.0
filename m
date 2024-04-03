Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8BACD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hS5UplfUtDczldDd6P81mUIgeG7ho53YOenQRsIQLw=; b=AR3JI8wAcq1A9WOQRrL1zbu/N0
	7WydL1QSAJNInSz0m99PJgOs05A/59hf4oiKSYWKQf74ngra3hJxBguwADDjs/R3luBLu18UzyejA
	DtxKG7T68e5C2wLcTxBOl9T2GsPHe8b/VTQFcf8EMrfb4jraA1SS4+qBKQ51rM/3UR3ThZss6ZYZZ
	IKqZHge6wjdHtOgVwFSiK3e1lTVrnSHuJVpHYjmIIesajVIDvYRnQnM6Veb+PXmOEcGX155STxR3U
	xbljrJngcEkjDKlc85BRu9uHyl81qLojqozE3+RLYiMyVUKPaz6ckq2PlNmmv993QSDd8N1VfDJU8
	Valwzzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuw-0000000FXWU-3ZC8;
	Wed, 03 Apr 2024 10:32:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuX-0000000FX8a-0mxj;
	Wed, 03 Apr 2024 10:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140324;
	bh=g339Nfakmy10N8LmQYjcsqMkACofjFVwJwlCIJNtuNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ULOAWaDlnGej6ZoXI94u56QiKae1+eyLqorV0zT1tS0I+JDbK45OP+5yqAKDN4BbX
	 oh8c7chaZV7h40n/QhFLhlCkkucfVBhCFX2iPOgaeoThYsRhKbrKcanWRQc4fowgHN
	 r0OIeRrmHxmZw50tFaKcBbWoxXh8wIrBTnMIT9cQ9NRFsRItJy733BXL2o/D/0jQNj
	 l9nZfJCQd3hgsrk3ZIcCDVv/UL1JzLBKQ9sSaPjvAylJmm8TCuM+reIfSOEcQP8N4g
	 lZE7sBpkjzBfSRRbRlOisH9c5LFNlvZX/p3GDiThLwiT9WybtY6mY10F30KUFFxHcV
	 3oZDAIDKfyICw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 19CFE37820EF;
	Wed,  3 Apr 2024 10:32:03 +0000 (UTC)
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
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com
Subject: Re: [PATCH v2] soc: mediatek: cmdq: Don't log an error when gce-client-reg is not found
Date: Wed,  3 Apr 2024 12:31:58 +0200
Message-ID: <171214017002.130010.3184925664722710524.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
References: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033205_742791_603F0E72 
X-CRM114-Status: UNSURE (   9.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 29 Feb 2024 14:51:08 -0500, Nícolas F. R. A. Prado wrote:
> Most of the callers to this function do not require CMDQ support, it is
> optional, so the missing property shouldn't cause an error message.
> However, it could result on degraded performance, so the fact that it's
> missing should still be alerted. Furthermore, the callers that do
> require CMDQ support already log at the error level when an error is
> returned.
> 
> [...]

Applied to v6.9-next/soc, thanks!

[1/1] soc: mediatek: cmdq: Don't log an error when gce-client-reg is not found
      commit: ef964918d42b9d9cf534754f82ccdaa402783ecd

Cheers,
Angelo


