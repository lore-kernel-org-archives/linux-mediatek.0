Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E050C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 02:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSVrEV56v0/RduE+AoeoH3psbEoh5W4uv0f1wDgvNg4=; b=TbJixvS1J8IOAG
	X7x4Vvm3DHChFG+1MwtdPYziTPgYqhqqeuZgvxslUa8GyxDRO3Z2rKcFNaUlyGMRn0jlfZyJEX2gg
	KMWmvSbalXe0RRllegEj5IJsqFaMJ6PhESP57ln8SVL8yGrtEieKuYEBx3hu5dUBVtogUc67gCZYj
	ec+eXHu7+8xVfOmDaJOeMQtEOjpGFmPF+IGki9lUxu2WtEF6e52Xwp88zFl2EKficzdiALG1Lyvth
	vDIpqBss+fOubse7VMBS1qnjEG5OOWfybOSO24yH38N3cy0iiVDSI/hyI+hH55nsa19ki+jjwoClj
	HGxCf+m3YxAn72ia+eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni5Gd-003Exn-IU; Sat, 23 Apr 2022 02:12:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni5GS-003EwT-J9; Sat, 23 Apr 2022 02:12:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25789B83271;
 Sat, 23 Apr 2022 02:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5396C385A4;
 Sat, 23 Apr 2022 02:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650679965;
 bh=0mZcFv+cRQ4VZIM6ClyxlxECJ+MKeArL4pFBDpsbp7A=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=D/vPFn6Eq4RPIDTLnz5gri+nEvjffXB0ICWPE1ofW9S/80v3faJiWFb6k8ciD8ofI
 7FGVxT5t9yeG6r8wQyvrEVx/z0MoZ49CLrc5rzGvsCNpCDGGuum8ZmoHVj/uSQyx2O
 x8R4gIhZa6Hr6vZDhrQ1AchTaBN2wANN3T3NwYXZhhiCuipDQ8itM/6rQ8gXdAAz0u
 zPrHJw45bjvZAGD6cSzK6tvCNSKZpY3rhqH6sL3GueC/JsCe/TplwMU/ufGANsR7SX
 kslIw8k3TNgTShxUagVc6sVaF1U6/9XRqG/g77N9zyXyBtSgk5Lk8vv82V7rHyl8Hi
 6CbtcBGt84hZQ==
MIME-Version: 1.0
In-Reply-To: <20220314084409.84394-2-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
 <20220314084409.84394-2-nbd@nbd.name>
Subject: Re: [PATCH v10 1/6] dt-bindings: Add en7523-scu device tree binding
 documentation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org
Date: Fri, 22 Apr 2022 19:12:42 -0700
User-Agent: alot/0.10
Message-Id: <20220423021245.A5396C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_191248_826013_53510937 
X-CRM114-Status: UNSURE (   6.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Felix Fietkau (2022-03-14 01:44:03)
> From: John Crispin <john@phrozen.org>
> 
> Adds device tree binding documentation for clocks in the EN7523 SOC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
