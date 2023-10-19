Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A492CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 01:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1TklU9qUL66rgk0DGUbyrm6spkuXcGIBxohjbWjYzk=; b=2MXJohvcb3bctUxzTQKWIEjDcf
	EAW6Fv8ey1q5Qe7t+dGmLKjSpJh3YXb1B91eRSbYS/b+hlDHsGL0/WPj4jeOn5HkH6p5Bd/2+B4rU
	/oZVVNdOj+KZyPyFpLbQZPmOHeKBsqUDBXy6lsdrlB1XuCVjm+/fHoOWgYKptNVYiyCjM57Qx+w9e
	Wtd2dL/hZCKLauOiIy0+m0YY587YEG/qXxg6PG/THqXJ6jE6ayOjxAJKspz28Ra/Z3ATCSdjgcJLT
	OrO9ctSGJ+3iKVuxCN1k4daxI++UUEc1w5lhfTM1p+Vaepzq6yuHBZTlWBRMDwRGoxExnNg1619qi
	cesuYyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHeq-00G38H-1u;
	Thu, 19 Oct 2023 01:17:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHel-00G36m-1z;
	Thu, 19 Oct 2023 01:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96D3C619F1;
	Thu, 19 Oct 2023 01:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A68C433C8;
	Thu, 19 Oct 2023 01:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697678217;
	bh=t1TklU9qUL66rgk0DGUbyrm6spkuXcGIBxohjbWjYzk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=o4veyHpA0PGtgf1yjNmv1t+x3rl/W3WjM0vivvwxZXCxdsGUPzJmmRlBdjmFmfMQK
	 6lF4AFZQ3m5wNmOGOAQ7bvcUsaG6CfdaeKyO43nkNv6NBiaM1hMX+AlESKCB9N4mJT
	 7vUJBtKiBPcFzGihnQhy+Gx2VFPinxheROltw+QjBApmttRcYEebjh/5hCx4Gz5xam
	 N/GhP/UUf5/fcTKFaHvppyK9VyK2YIt3JpJl9HvkZcSnrLHF7Con4qkjhHLBxtjCQO
	 +D3Es6qXHqSJchxfmpHIZSvPBgIK6mZj42cz9ZSvdcnNVb3ScKDIkH5dvYcbtHgd/A
	 T+0lOABVLwAUw==
Message-ID: <ecd552b9cb8d56dcf86a382385f39ef4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
References: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, angelogioacchino.delregno@collabora.com, erin.lo@mediatek.com, frank.li@vivo.com, jamesjj.liao@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, robh@kernel.org, shunli.wang@mediatek.com, wenst@chromium.org
Date: Wed, 18 Oct 2023 18:16:55 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181659_695546_2AF7D357 
X-CRM114-Status: UNSURE (   6.93  )
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

Quoting Jiasheng Jiang (2023-08-31 19:46:58)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next

