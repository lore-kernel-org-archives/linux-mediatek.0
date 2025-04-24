Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03189C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPbn3E5rk/85EJB4nz6HGJEWex7LLTjASkhyzjq35G0=; b=PY7hlxpyoe660aF4uCtZkX6uqa
	cS4Zc2P1+oSV28lesC91Mv+SAu4IZgRXyVlLNF5l1kEnAWwlqP9dooR0VzoTteR8+PcrNmh76VwcB
	pt2xWijfyTRqikhzmv8lOJ0IXSGzyEVGRs+6y42y0FWLR/pNNd0cIM5pqKkUVqy3jWoj0vpghBv1p
	Mq9j/THe6mbb2bK0qkgyZQVBumoBvNi62mJvsc/fvwxglzvT+6EFB6YOy10aloMfrlHGsE61u6qqt
	6qKfs9kEmn6Vyrz9Fd7M3pzkqwBzBSsnE+LrouPk/AOMtkLxlUQeH10KUo8DC/UQz7QG4DKEpAXB2
	JS0W6nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rUs-0000000DGiC-3vvc;
	Thu, 24 Apr 2025 07:59:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rUD-0000000DGds-12fG
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 07:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745481547;
	bh=EkRGMXV61mxS1Jr+5BweoZLfS5HQIMfM2iHDQZfDtgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iR53X055QzTaG7CuxiPOpdr/6nFMLEZ9Um8oMTyaTdS5eibjpOq0Ol+tKricl9S1F
	 uqncnA0BBgwBns1Dcwl61zFvyjPHwMAj3OCc/5QMFAGKoFgCmlY9G+R/n7FOdfGrO7
	 SaMIJWYEGJdCILI7NQb/WTbQjjFA9jkvGp5Vkmo3Q9I4W0wTIR/+7sbuPwz3OrgrpV
	 Jq++GRuR6cyfv9zfbabX2h479qabjzFxZMy78tLqqPwFoo2UpVYmvLnb+0lbnYCtXe
	 6VFj0Kb2v8qjpDn63hzB+UMn8sPBDWdOO5sK4k6kfUc4tVPldTIg3GapwCpphg33OS
	 4O2lGkPLCNMAA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA15217E0C96;
	Thu, 24 Apr 2025 09:59:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, dianders@google.com, 
 hsinyi@google.com, matthias.bgg@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v11 0/2]
Message-Id: <174548154674.22041.7217055615854393236.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:59:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_005909_444064_5A8E2139 
X-CRM114-Status: UNSURE (   3.80  )
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

On Thu, 24 Apr 2025 09:08:48 +0800, Jianeng Ceng wrote:
> This is v11 of the MT8186 Chromebook device tree series.
> 

Applied to v6.15-next/dts64, thanks!

[1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
      commit: ce8ec1f8c8b363c2511332c909d06df7ae01f1b3
[2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
      commit: ed34944cc3bc5602c1151effdb6aced9f2f992a6

Cheers,
Angelo



