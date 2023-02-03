Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6C2C05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbYumVFQdJh3v4fpXui6V//NHCF9KnW//5BymNroE+c=; b=IfDFMz7nZE7GLKseE4mqsXY4RM
	PmGnn/AAjJ/+UsaT5PngxlnoxOtU75ba5OXefh9j4pxhyo59fJbzJdwjDFKA9Nwkhu9ZTEzKAGlYM
	s/s7Iw58uigi+Nzj8jrjylpik1UouVHGkswdt+wmOuPy/cjsF81NlgmInHL19hPsqK9mzePPxlbUF
	URlWTy+z3QCgd8xhZzFSH0/vc+QTvUfGl+W2J3n2A8V0sStfxOdto4z3CIbJyOiAYj3pfGXTI6WN+
	/JzjcdfNJjALApg7rITSelh0rW2mMCIGx9zW6vmgRsQw8JjGCHqD1uxyvGyrwofWeupgylW4IvJ9M
	nr7E+IjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WZ-003C7w-V6; Fri, 03 Feb 2023 18:11:00 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WF-003BxX-Fo; Fri, 03 Feb 2023 18:10:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C38B51BF209;
	Fri,  3 Feb 2023 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675447836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbYumVFQdJh3v4fpXui6V//NHCF9KnW//5BymNroE+c=;
	b=oEx1mUdEZl5FKCBVldVayd0oQ0H5/H9+z8uGrsUCmhPyW6n0YrsXOic5QDcSHIWzDpLmoQ
	zGMnr15odXUtaSzN9bmtFR6mFXrRUOmALzUA0jsQIyAEj7uP9c95mhjyVGh7Popk4XwaXU
	Cw9dsCdKD7pzbHu97GL4Hn9Qgp0xy2KbDc4QVK7btd2WYa+L9QKgwAJaxJDpx0ODPEjXzN
	lTpV74hiVp7zL8TQocpGEWVYuIDVlainssRVTBHsa+wqZlHhojxlAg0Q9Jy+WPQ0Cd/qn1
	pEAd6vmJyi5n6CwcIAzvP4AzEKn5WoGDm4CbiC3HIvUibDShVLkyiuCCjx8auw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 4/5] dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986
Date: Fri,  3 Feb 2023 19:10:34 +0100
Message-Id: <20230203181034.436317-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201021500.26769-5-xiangsheng.hou@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'70d3cf76f937fbef9c55eaffe1c848208e1372e2'
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_101039_886848_5055E41C 
X-CRM114-Status: UNSURE (   5.34  )
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

On Wed, 2023-02-01 at 02:14:59 UTC, Xiangsheng Hou wrote:
> Add dt-bindings documentation of ECC for MediaTek MT7986 SoC
> platform.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

