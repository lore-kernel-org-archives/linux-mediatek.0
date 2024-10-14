Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DACACFC53F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZuPLQiW5zkfyXtTFHI/qCQp/z581/4ApQruLQwFa4Q=; b=LZm657xBC2IrhSnYFVf/LWG/xN
	9224t4ePxCpBjn51DiU3te6ZTT0lKZYeLYMrQyQoN6K+LdoZlOn9smj9DMCxdzWSdK6hfodbPfvbJ
	DB50e7vf30hJJRLtx9Snl+7/RJjhaV8iu8AF1eesk8/VOtxVwdYkNkRL7nsMp1gjuRJPTDB6UBJSD
	ofT30ArOufKjezVK6uUywBMejQG2zhpetr1ejE51H/P2tR/87ojpuYKdIs1Dog/KT77qq7jjgPjhS
	sHoIkkd7x0iXu+G8Hj06uw5ruTEDzuwoGZR+ZP+A3h+ohCom3kYgMsEXqBobBIU6/SDE3sVTEUeF1
	66Yrcqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IXI-00000004iyi-2wxg;
	Mon, 14 Oct 2024 10:42:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IVq-00000004iov-3Dbs;
	Mon, 14 Oct 2024 10:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728902477;
	bh=XmwBEieipqI98EXzozIfgzSqZkvtvNI1ertavm/6D7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DuC3PmScZZNXT0jjO3PVBPdoaDsbC4eXLWd0JvfIR9FrSRyDD+LerT8n67kCflzgx
	 zdQv+ta5yjdbZZ0ufqSQ8f1c8Q5q3/zfWBshOfVhisrBTBwv1MSOXSe+mxZRMinfF6
	 +GYMsnIbTF9lQvErGnF2muaoAXVUu2a+Pa00ey/A7l/FGxWK2HS5msza5nTqXlQ+wO
	 FEu69GRl08tqL1FMWuAwkmPUaNLr7JRAopCQe3pNwh7/+XRMlqjvkRdwEAdvGt3AE4
	 co5/ztMsPAbErIcfV9+DiiFdO+avy9bJZ2z8Cz62F5+pxEEH98rwOLck/6qRhdfjk/
	 wpmSe9QV1a6PQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3043417E1394;
	Mon, 14 Oct 2024 12:41:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Jieyy Yang <jieyy.yang@mediatek.com>, 
 Jian Yang <jian.yang@mediatek.com>, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241007100749.6657-1-macpaul.lin@mediatek.com>
References: <20241007100749.6657-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-700-evk: enable
 pcie
Message-Id: <172890247611.118422.12613533040969688519.b4-ty@collabora.com>
Date: Mon, 14 Oct 2024 12:41:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_034118_993784_4497BB18 
X-CRM114-Status: UNSURE (   5.38  )
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

On Mon, 07 Oct 2024 18:07:49 +0800, Macpaul Lin wrote:
> Enable PCIE, PCIEPHY and related Pinctrls for mt8390-genio-700-evk
> board.
> 
> 

Applied to mediatek-next, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-700-evk: enable pcie
      (no commit info)

Cheers,
Angelo



