Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A7DC25B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGxWPF9sEEKkGr8JSIfZLE2v4EtsarCDguHKtCGvL8Y=; b=mAyZkbAty15lE9jKl8C41q9opl
	ANJrQlSXC1Y4MXBBzmlrC8eiXeQ/ufi1qb5yQCQ81YwiBfdrp+GX9Mq16b0664KhkIlYPmbII0gLB
	fNro/YZhEzr253wb0WsjUEk1Ne02kGg+embYxKNEkzDpxkwejhVq1c+kp1/7H3I7ugjN/iidaAjXW
	TXNP3do5ndWgl43iDVdQu+E+4hSBuivpmFkdA7qiGtd6MlHznerjrD54J8LtuTRqnvn2u+Gpd2NYM
	pGJ+Q529b7hn+9D+ufLWL4fzuUh2zVrSxIiDqrjSoQFTNqM8RA9cKJgMeiBVOHmdQ1TqepI51SwFr
	lEgoqtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0E4-00000001UvY-00Z1;
	Tue, 28 May 2024 17:03:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0E0-00000001UuM-1qgt;
	Tue, 28 May 2024 17:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A491622A7;
	Tue, 28 May 2024 17:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9B0C3277B;
	Tue, 28 May 2024 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716915776;
	bh=0Mvw/6Wc1O1BPPHSRjs2WkILTJox9HoSkCs8QZhCOjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PM+8IakjwYHQ9srlOP4rkHQfZVP7dJYcPU0AVdiwwmIPhYfvPcmrlglgLBmmSSmgJ
	 KFxLElgpRTtufgZJbDoW6EqCvbhP97YIxmQtRjc/SMOY7lsOiRVwqwID+DtvXu8hbn
	 T+E0Dy/ktB2wN3ngQwhPkyClU4UIuFYUirPUQ5YU7EDkUc1CQt7i29CWHjFov8+pEw
	 TwSC0J1UOxplwh30+ZBwlOInYaHAVoVtsQjEW3Qqd+dvCWKE6VQ1gzLGaFQcciSTH7
	 /y0va56M/f3qh5L4IvZq7DSde0huw0Y4fFaXn5v3OWhJ1b7SKM9XvpsFp6nh8QFUo0
	 vO6Xzsm55CC3w==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] Fix msm8974 apcs syscon compatible
Date: Tue, 28 May 2024 12:02:52 -0500
Message-ID: <171691576754.544020.4186119267546429168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
References: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_100300_555319_29A2FEA2 
X-CRM114-Status: UNSURE (   7.70  )
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


On Mon, 08 Apr 2024 21:32:02 +0200, Luca Weiss wrote:
> Finally fix a warning about the apcs-global syscon used on msm8974 that
> has been around forever.
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: msm8974: Use proper compatible for APCS syscon
      commit: c133cfc12cd717b72ce534477415446e1c33de47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

