Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF19BC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbOiyQOMX+TqFsBXvvTuwLbevCEJ/uL3jQq7x7SrPOg=; b=Kt7mdRzJ+qrwZfa1E4ITDZ1DBE
	IIgNB/5XJHqrI+aYs1LMycUxnlqBDSOD3npe+84fqhD5GS50bJvDnz/sJxennqIIy9uwtinnOFBsX
	npKpKvhx4pyjTR84vJYwV7JlAZY8d8MSLQu6kZM3qV2BbjmWK3QVYK3fJRRKBn61DzfxMWmcovqrc
	TI34N5w+j8iwUmoclxlrN7rJLn5E8bfV5l4gf0rG2mI1KuOA1LjabO6l0XXHuCrbWrXK1bpmTb87h
	H8jec4ifWq7rEllI44o1HIwZNu9WYSxXMcFyKk2C76C8Xpmpk7804fS3IpzQX5Cn/Z08TjQes3J6w
	aOxvs6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHEH-001ktq-SO; Fri, 13 Jan 2023 10:24:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHE5-001km8-H8
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 10:23:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A77E760F33;
	Fri, 13 Jan 2023 10:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B47C43392;
	Fri, 13 Jan 2023 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673605426;
	bh=DUPv7WIfv9352Q9UfMwcmiH4ujbFGhwE4utd9cuo8jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bcgdx/KP1w7WzRjn2rre8FUZpCFhjqm2bBTdL3dG3UyVzN+U+maa8bc1nIKwER43u
	 nK+48Ni1FuBPJIuv7SDjoeVuonq/2QqBjk23Mz5TiamwTNGev5G13cPOZBBbEkfLtX
	 HiNWB/tpvJAxdkRrtYMPZAeoacvtUeD7I7xGMZoVWrCxqgBwO0BJny/thap7FZMFQv
	 Swq9lF8ErmAHjighV036dHa+E3ATtQ3KpgJDoJqA9Y/9WMwLKKFZEAnkLfqqpsu+f9
	 J4/9EKFh5lBaEXMB6UxWTI2WrExn/WN8daQmd8xghM1O6TIVjNgz5c9YAilwusMlce
	 Ti1a54/wXEPUg==
Message-ID: <656ab366-05c9-64fa-651b-12597251d116@kernel.org>
Date: Fri, 13 Jan 2023 11:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/13] dt-binding: mediatek: add bindings for MediaTek
 mt8195 MDP3 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113090321.25128-1-moudy.ho@mediatek.com>
 <20230113090321.25128-2-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230113090321.25128-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_022357_643613_857BB57F 
X-CRM114-Status: GOOD (  11.25  )
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

On 13/01/2023 10:03, Moudy Ho wrote:
> This patch adds support for MT8195 MDP3 RDMA, and introduce more
> MDP3 components present in MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed several entries, so please resend.

Best regards,
Krzysztof


