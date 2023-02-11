Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36865C05027
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mX7Xi4Tbx04ZlDGgD+em1tWKltogSuS9Jeq2iIpszHg=; b=hnvO2SlDhkBt+pH9ztWIp8z/MC
	jPcMCKtWwBU8JkqMVy8q0eHmQtNyWLhIIymGhvQoJeCUZ9DvFMLjZO6thP4L/pMyOzME9nEDfh7BY
	rTDfzDw1IRTyMyuUUDkCuPxaUBPGGZVNOFx1t4RX7ygRwrZ5iWB1yeCPmGjNNrJVDq00w2w9mTxnN
	ar2xCVXECQq7mvQlfqb02D1cHDGSL7RB1c7wp0Kaw8ioAVRqV5z8er+jokz7kbG5HS3SbYN/bTbgZ
	K269HRs+ACYXpnkBQHYmqjAFVLtb3aQXqJEZmW4h8e1ZCjj7ILe61nNdtjyzJrRiBAWGn4uMC2UZo
	WAXzPggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdMB-0083UO-G1; Sat, 11 Feb 2023 00:03:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdM0-0083Sz-J2; Sat, 11 Feb 2023 00:02:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8D8961EE4;
	Sat, 11 Feb 2023 00:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA4CC433EF;
	Sat, 11 Feb 2023 00:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676073775;
	bh=mX7Xi4Tbx04ZlDGgD+em1tWKltogSuS9Jeq2iIpszHg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sJ1ieGPT2mdbx65r/IQfbdK7MRvjEcD1bocaPXIxSXy4z3lIQZzQ689hbkyhd8fjw
	 PFFJWqpZ17D2/jtKfUvVd+32Uc55BE7GC98pGoM3Ai3nHbI+lkmDoF+fWyauFAOEh2
	 WUWV8cyvPiRsN6BBSNzm5jC15MqxiK9+pb8I41Ehxb5NlOWdOMPAlytuPVJ/aWZX2C
	 8S0attDu1GatXrxP+YwHfoUWzfWlUzoxlrU8cvmKeYJtmaLRdA06Jn3WNwi5QhUN31
	 CvBbl1B50SB8Kb5tY825MiCCzQBaWCD+T1uTi6CpgDu0u/gJDam3/u+cbkHSkc4h7Y
	 cEuLLl1iR/IOA==
Message-ID: <1a8a708ac51009110f403ac7ad5fb2ab.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230202010750.79515-1-yang.lee@linux.alibaba.com>
References: <20230202010750.79515-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] clk: mediatek: clk-mtk: Remove unneeded semicolon
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Date: Fri, 10 Feb 2023 16:02:52 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_160256_700826_1D0F3168 
X-CRM114-Status: UNSURE (   7.01  )
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

Quoting Yang Li (2023-02-01 17:07:50)
> ./drivers/clk/mediatek/clk-mtk.c:518:2-3: Unneeded semicolon
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D3926
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Applied to clk-next

