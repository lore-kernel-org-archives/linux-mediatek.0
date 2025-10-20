Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2506ECCD1AA
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAyg5qsh9DMXhep1JUIW+PD0CGcTEKqEYiDFerCjvtE=; b=jzUheF7wrNamjM
	cdvUvDxmUbZigkNnKY5c5kJR4/sCJMmP0cy/fuGawyaNGNVNTAdZUkQX0ouGE1U46ImphwxNAOxuA
	i4WrMtNUQQPCMGJl3zRJkQyZYgwm1me+zRUo6gWLFrftp/KBW6ucDKodk0ts7eOamf0HldLR+2DDx
	a1GkKl04wyhCh5u+EUeoUplAjDhkoAQNW5wrtuCuY8NeNEz25aX027rSQVoS/4EpWlMAM1x3N/TNz
	S+0vrzDrDIyXuE1ihwtBnZUKums7HHVfPaWGxFxa09/FpUu3mfCAvKH3gYu6vI/FR+HRzIaoQIA/l
	TXkwgxMvvr1rxGReeLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkm-0000000CigK-1mG4;
	Mon, 20 Oct 2025 10:04:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmki-0000000CiZd-2Zbe;
	Mon, 20 Oct 2025 10:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954668;
	bh=L1rux84uqgx/z11sRLkzA6t6Db5oXXI6MffF6eUjKHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRhdYVbrEghPgLy5Qcqa1koh1Qni8U62cjyXqlP4zHLE1ILf7rnxPpwQjAUw4juEo
	 nh++ADgODNcbf3NB0UiAU3avqnYn5OTwRZCzNIhSiJLXgehnwMzvZ/Xof2OxLm5w0b
	 0UDf8QiP7Xe+KGG9CLfHwXS/TIdZxl1VQdpRPytPuixPJ9NFaPzMNhYxRy1lvMZzmB
	 4X/3xgZ9WEs9pkPJpE3IPSQrBJz9aVZWwNTWKi5QHMZ2qXNopcdNtzm8V1ul55Xw0l
	 KghISDNQZZHriuQaTI+p+WbSr+HiQz4k6ZBuBb1Wo/NrMlXs1bpR79iLB+TXId978T
	 MvXlpTXrmVBSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67B0017E127F;
	Mon, 20 Oct 2025 12:04:27 +0200 (CEST)
Message-ID: <a30a7076-9c27-4e78-b57e-cdf2a14dc5c8@collabora.com>
Date: Mon, 20 Oct 2025 12:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030432_847123_C89679BB 
X-CRM114-Status: UNSURE (   7.18  )
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
> Since shift_pa will be stored in the cmdq_mbox_priv structure within
> cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.
> 
> Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
> and cmdq_pkt_jump_rel().
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



