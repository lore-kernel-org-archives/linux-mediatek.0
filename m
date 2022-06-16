Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMOT4fNM9EtPSen/0ajnw5VdG22IoOCLKi4ywBvuMjc=; b=JGbhm66HidAg4NCFLkZlpLCOtE
	nNYg/D5mQV1+Jqp0bFTycRAPxq5//7LG/iOJJGGtGEe9pGYbWnSpeP82FhASV2rr7aVJgijXXW8At
	kaFvITUM7WxXALSWkEBSMbE1g8YxxWuGiPjE5wH0+Vgt9YdhSdX2m0Dkd99KplSAOZCMriydPNMK0
	kS87X8h013heg0ak41XoNOUGDkjoysf2kPym4ZsWrWepyTdfe0SYpHDvOl1qwBPp727Pj51Z2Pq8k
	36K2r4loRUAOtlZrdP/B1Q4T8S3dVQqhlTnX10h1ewIug6Biyb8OCzxtTMUvxQPw7xdEwsKrqDQz/
	VMM71EdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eiu-00HUMm-Tc; Thu, 16 Jun 2022 01:55:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1egM-00HSsk-GA; Thu, 16 Jun 2022 01:52:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E741161D0B;
	Thu, 16 Jun 2022 01:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4057EC3411A;
	Thu, 16 Jun 2022 01:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344345;
	bh=oMOT4fNM9EtPSen/0ajnw5VdG22IoOCLKi4ywBvuMjc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ptG+xUeC9J2/gQhUmVdBMq8POvO4UGjm3NI3uofTPZrBtRdm+4rd8xyjLNlTPJbGy
	 /mydvsG1A6QFaG3rEUqu7Iw4D/DZnQa0+d8n4nLmstWL40EmiO5bf8d5bCj8PNV5qZ
	 MkyI7IDffnwqW27GK4FcToD4dGvQ3GV2yMO5gg/4W4h5d9ky34uPR8BHV6zqbhdMCt
	 GN2t+eKI56jsVns0QEQ6XLzCCABggP8QIl2pL+sUpAWod5TQE7be5bdKxy1a6JFNkz
	 X6WmgM7G2Z9m8nJQC24bPzExAPbn8hSznx+C4SgXvUK/lAW3qrT33U0ZmHEjqnj4iJ
	 6a6vaKPNuAOcA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-11-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-11-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 10/19] clk: mediatek: reset: Add new register reset function with device
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:52:22 -0700
User-Agent: alot/0.10
Message-Id: <20220616015225.4057EC3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185226_645724_D6C7AD77 
X-CRM114-Status: UNSURE (   9.23  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:37)
> Using device to register reset controller is a better implementation in
> current drivers. Howerver, some clock drviers of MediaTek only provide
> device_node.
>=20
> Therefore, we still remain the register reset function with device_node
> and add a new function with device to register reset controller.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

