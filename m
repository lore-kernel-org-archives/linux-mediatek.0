Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00595C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9pZIoMU+KjvMZ5XhhXGXYLSbf1wV+UI/2wKuhw0jGE=; b=Z10ZgBmL2UyqxWGawzjHiwgYgr
	jtLqXptd4/As/xV0ecTdf4lRJL4y2+0Na4JReNwBseMY5JXeomkVKCvVsdY7s/LeesIBTBljcrSTP
	31yU3Bg0DVyvBG9zsOVohP8nDLqsfOWqADtpu6pnifAsm327r2RwZ3WZKw92FKr+9uh5M/2q391PU
	BWKKkVrhAXITg8Dhuw5on3rAvAtO1DBMUtKO4xzzPkytYqd0fQe8M6wa0oem8/KIsCYmWETALuh/w
	ahIQoKnz2jkVF4z7HPY0WiyCZm8Hq6p8vom/FHtsUgQdh3lavtaHwK5Ev+vWnAEm1AYdoFEjm6T8m
	pbQSZdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1vy-00000002BNN-2NqN;
	Tue, 25 Jun 2024 08:53:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1vs-00000002BMZ-0ggg;
	Tue, 25 Jun 2024 08:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719305622;
	bh=YOcm1zlwyhTPzTPr2aOMlF90PGWT5yQusFLpand5ZQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M8EM7sP0e1l+Ih25lsmcb4ouFivJMXzeUEW+DSQOY7uLm1GtNaMD2V8zEwThXHwKC
	 g7FCPFDClmDki5YldWeBeA/F7tlsiBqP/fG0Zcrx2qlYZ327Uki2Kp3CWAUN3fb199
	 C5dbJBvN/Upofbnz5tZMSjKc/D2xdfo/Z9cm1UUo0tIMHvamGjwkZfK1Wldgo5YmGY
	 gcb1SpFEK1oNIhVPEqrYiPsyurixYKFhj9KwbhvPPShRxW5IJvjiZNOlozp8WaveED
	 4cZYL4BvTnE+8Jl7MFtUsNmYakWlcooa0ZFI0mfMHqD0MhnMFPRtPXlg5gf7/xcmGf
	 BeadAbRL4a9gQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA357378045F;
	Tue, 25 Jun 2024 08:53:41 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Jason-ch Chen <jason-ch.chen@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
In-Reply-To: <20240625083957.3540-1-jason-jh.lin@mediatek.com>
References: <20240625083957.3540-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH] soc: mtk-cmdq: Add cmdq_pkt_logic_command to support
 math operation
Message-Id: <171930562162.73186.3438008106670002170.b4-ty@collabora.com>
Date: Tue, 25 Jun 2024 10:53:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_015344_367449_CA503527 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, 25 Jun 2024 16:39:57 +0800, Jason-JH.Lin wrote:
> Add cmdq_pkt_logic_command to support math operation.
> 
> cmdq_pkt_logic_command can append logic command to the CMDQ packet,
> ask GCE to execute a arithmetic calculate instruction,
> such as add, subtract, multiply, AND, OR and NOT, etc.
> 
> Note that all arithmetic instructions are unsigned calculations.
> If there are any overflows, GCE will sent the invalid IRQ to notify
> CMDQ driver.
> 
> [...]

Applied to v6.10-next/soc, thanks!

[1/1] soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math operation
      commit: c1c028b8d5e6ef00a13bfc340fc60a9c27135017

Cheers,
Angelo



