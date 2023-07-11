Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4192BEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTygFm/Zke5yY/PZkRFL7is+JVnlMUrI80jgc46Y82k=; b=dbLA59aml5Kc9j08uLzfNS2ixa
	JumCjuYQmv/r56jIYP2WWkwgFnwGP11q3HedvKcR3ImRmiUP9D2cimbPa2nANYhSiQX+rbzHpmjm/
	Gw6A4aIK3CAKXWhOI3UGuPmQK7G7HqCxFvVhm8X7RBRRUd1bdZNA6KKTM2OIwtwFsFpH0Jr8SGpaP
	EGu0gNotL+IYAFRCdYFIS74Rw5tMcijrSrK83OH1oOydRolq96JJcxFwh1rv4Najn2DHnftFpNtXx
	saqNxTsOg+mGYPOeFkQl9nhtcsxQK5FkhELcsGx/Lnw0+csFRDQDZpbvxyB+eWdWLPB24/Eygy68V
	AFjZ6Dzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGTI-00FQll-2y;
	Tue, 11 Jul 2023 16:44:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGTG-00FQkh-0m;
	Tue, 11 Jul 2023 16:44:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7326A61591;
	Tue, 11 Jul 2023 16:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF95DC433C7;
	Tue, 11 Jul 2023 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689093852;
	bh=M25TVuQW3nc5OBxJ1n81TAeulJBKRe5upKcf+dcdqfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e1SXmZ8fiV2JfgyljoRStvsFgPDCa4Ya6Iz5RNppPUYPfGJYoeh+cj7vVD6pmlanU
	 41YtOYRQ3Txzm6ZJFd2cLfzPWrFEyb166UlubpAn1PhcZ9sIkG8BhEjCN8qq01f0U6
	 +jhMrjRsDyZ4zWMZUACKbchEpAf9UjmLddau4gZVpZ79Rfy7ulE2WmUQHbvw0fUCHX
	 Tok29S79mfckTeEXa44DpkgONcikcHxSK0VRni2tfcZKeAuQAENKTzC3Tti81KuwFi
	 jGQxxdCX15qZHGkxL+l4ubUStu6BBANC3NOGekEUHlXowToyvucYnr274pcKjdjnHG
	 05R6XYD6O84TQ==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230622075150.885-1-johan+linaro@kernel.org>
References: <20230622075150.885-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] dmaengine: mediatek: drop bogus
 pm_runtime_set_active()
Message-Id: <168909384943.208679.9917048623209270134.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 22:14:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_094414_316307_5692D8CF 
X-CRM114-Status: UNSURE (   9.35  )
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


On Thu, 22 Jun 2023 09:51:50 +0200, Johan Hovold wrote:
> The runtime PM state must be updated while runtime PM is disabled for
> the change to take effect.
> 
> Drop the bogus pm_runtime_set_active() which left the PM state set to
> suspended (as it should be or the clock would not be enabled when the
> device is resumed).
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mediatek: drop bogus pm_runtime_set_active()
      commit: 1775a0d9f021739a69e4cf12c049801c9cf1a072

Best regards,
-- 
~Vinod



