Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC153C47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ITLUw3/wwzNbCgnrBc39myl7J+F3NZ5Z7SwgjR2fQQ=; b=Sf5QL68dKtNOCq03qKzbZ04Wwg
	UnB86MiPrJL4fPeZujrkWwH71SbGm/NtDTqt6k4f1ZYQ82+Y+ez6C2248S3VUKAlqa/d8Sln3vnPk
	msU7m+leSPo0KwrPW9EE8qzlq93ZUeGzz6YxVqC2GWX6ysEeiQgnP6wf0RA9C7zMT9m6Xyh6KXxX8
	Uy1vZ8UPIxrIRjuXuC6/yUzT6ACO/57G7aoO4CunVD6FBsr/vLxb12aVaPc2gtJ8ANQf4iAEFXG0g
	4BVys7T0xek4N4+wlWfMylDssENAeTFTYQqydM4HP9L3EgriVMm5Cf0F0f9xnCvFFaUt6PdqHiEbw
	qccnTtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMXwh-003NRk-2L;
	Sun, 07 Jan 2024 18:32:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMXwe-003NQ8-08;
	Sun, 07 Jan 2024 18:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3ITLUw3/wwzNbCgnrBc39myl7J+F3NZ5Z7SwgjR2fQQ=; b=CNd4uLQZPqShcuU+wNi7F7AamO
	TJ50Wk/4AoY4GAayKb6qKIen+J3kf1sMDWzFNwkEiTJncIBb/JBcjnKAnMRoZkQWH/6cs+Y8TSZQg
	IV/+I6GhLRGCUGX8AnZjObGq5zVrHF/XnzKDlkQUIhq6Mqk6i93h+NO30OHI3hpohq2w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rMXwB-004aDT-G4; Sun, 07 Jan 2024 19:31:55 +0100
Date: Sun, 7 Jan 2024 19:31:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <1437d9df-2868-43f5-aebd-e0c57fe4d905@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_103224_082883_2DB7B8CE 
X-CRM114-Status: GOOD (  14.03  )
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

> And I would like to ask you about another issue raised by Vladimir [1].
> These phy chips become SoC with all these built-in PHYs, PCSs, clocks,
> interrupt controllers, etc. Should we address this now? Or should we go with
> the proposed solution for now and postpone modeling of other peripherals
> until we get a real hardware, as Andrew suggested?
> 
> I'm asking because it looks like we have got a real hardware. Luo currently
> trying to push QCA8084 (multi-phy/switch chip) support, and this chip
> exactly contains a huge clock/reset controller [2,3].

Ideally the reset controller is modelled as a Linux reset
controller. The clock part of it is modelled using the common clock
framework. When done correctly, the PHY should not really care. All it
does is ask for its clock to be enabled, and its reset to be disabled.

Also, given how difficult it is proving to be to make any progress at
all, i want to get one little part correctly described, the pure
PHY. Once we have that, we can start on the next little part. So long
as we keep to the Linux architecture of blocks or hardware with
standard Linux drivers, and DT to glue them together, a small step by
step approach should work out.

     Andrew

