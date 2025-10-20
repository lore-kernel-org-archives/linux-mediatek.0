Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9BECCD199
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPfvxEzNIuzPmBVYOhGMigY2X6JN3VwicggJ8JUp7B4=; b=b4+NmfLzpSnfxJ
	YLXDiwvGLBAgyG/7AoWx35B0f9+aG6yrcJy9NjYQhX3KdCRUmo/ijIQE7e5tUCV5l98l/AZ5GKzo2
	xiJ0vhsx60GCunfBd/Xsz66ba2twooYcwNx0Brr7MbXVmQMduRxFRW3EesxwBSgWUh8hCEvTxTfI+
	bqWQ7X71oHwkUKX9tA8bZ1iQ/Ap5cUMiIhWBsNENZtb4sVZTR7LNw5vb5eyJoy69VcTSW2FPYWubt
	Sh1lbdIQAmg7PJDJqXkfSktueTIbwmQodAUCAM41rX37OT2e4+lXUVmUQ79VSz4kstm0mexRMe9+l
	mgxPBMRq5kEJ8Au2FEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkl-0000000CieG-0STc;
	Mon, 20 Oct 2025 10:04:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkf-0000000CiWz-1946;
	Mon, 20 Oct 2025 10:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954665;
	bh=dvZ8bfGnbZO2NRCAIBX8BuUMCdu45We+toYTCgYJlU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UIJLHvH2ugD4Q5kVNdA3RiMXkg9uBwJ9IRPs6Y/M/cDPN1L8vfpoGlhRM+jwoZwRm
	 qc8Nf8dlC4pceHHMz7UGg7dtgeBwPv3tEpiuulq/PW+N+RdqFi4GLHeDOtwDr5APcm
	 o446RXh0kM4lZfV+NgjemI7zu0H446cZBZwsq/dn2baQzudIlfzzOR/sSeiVN8vmVH
	 +sb4hG9PjV2S6FW8WWRolfkvpqkfpExqhFsR9oUPXztISVqWgBkzPONrkF7lkAjzmM
	 3jGLJvg6iDNidNQL8KHHn8uN7WQt9rkxZI5stGvKaNzOp6mfw7BzE7fz5tLAauh333
	 vyWlaK3zTmcUg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B534517E108C;
	Mon, 20 Oct 2025 12:04:24 +0200 (CEST)
Message-ID: <a624e724-4f29-4d9b-ac13-eca387867805@collabora.com>
Date: Mon, 20 Oct 2025 12:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 19/20] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write()
 and cmdq_pkt_write_mask()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-20-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-20-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030429_474940_59961980 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> The original cmdq_pkt_write() and cmdq_pkt_write_mask() only supported
> generating GCE instructions with subsys ID. They have been replaced by
> cmdq_pkt_write_pa(), cmdq_pkt_write_subsys(), cmdq_pkt_write_mask_pa()
> and cmdq_pkt_write_mask_subsys().
> 
> These 2 functions can now be removed as they are no longer in use.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


