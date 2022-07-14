Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319BFC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbkN+Hdvhi6Kmret/r3qCsqgayE09nkDMn2hAXN/rmw=; b=U2XCJCR5I/bKMB+/8t+AqbsY2l
	8BUyw8ZtP53wNNKK2E2pm7hFttFd9+EZc/OXyXfEgRA/KF9eFsjyqNpsnRxzISYLP+03O7a9lD3eK
	3yCnDR//r5jA4b73/H979lV+BXC4q5XbxWJkjQy+J3fPlnwuzyKoksaBTOQ37Ql5nC8ZYCDUn+n5D
	L+Mmb6eL60KiaemSnfmfLQaVv/qm5JObQ1DUbmDmLGA9JXkMlblRWYocV1E0Z7bG2JPOApE7qUqWk
	SiGHXgVa1eZIQ+oUv8dDKVo3INnB2W9NwuTxqxYMPEGHZQVV2Kf1y2/7hU+4F3mmRDmiXsJRA3lYa
	JMvyJ8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC11G-00Frr8-SC; Thu, 14 Jul 2022 15:44:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0tK-00FmP2-9q; Thu, 14 Jul 2022 15:36:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C70261F42;
	Thu, 14 Jul 2022 15:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAC1C34114;
	Thu, 14 Jul 2022 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812996;
	bh=S7Jli/0UK5A2I2p584ejk2DES5r7heDw/0CBHXfrl+k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdK2vqf1TObNCH3C7RKPrF9hKYqVm3SneBLvYWIr9cR6Rl5baakjnzKjAKCRMRRLw
	 JXrB7F34lmzZQezh2ULIM/71g9cE2GsCTmB/sgQ8weJWNwkoM4VS4VMCYKCheVofWE
	 0uXZxHaNJLFL959PudOhr2rj051hVSVF118M1DT+aADCzt5jt2IUO2+fSFpEf0P6qb
	 ejcWuEVUsFIL1tHG6AQk8866bQWtVUAD/YMQ+1/+SOQ9rkW46xtBV6D08WmEZVOIY6
	 YloOrAWulolgM2MCYsfFn+cspXkhl8ZVOoQPHLV3dc9u1IdRulo98wWdnD3rwBR8m+
	 xZkKA/Y4eHOcA==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Nick Hainke <vincent@systemli.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Roger Lu <roger.lu@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: dts: MediaTek updates for v5.20
Date: Thu, 14 Jul 2022 17:36:13 +0200
Message-Id: <165781284952.3193627.17270894211710599808.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b0d5b584-2693-73b3-79f6-3e2292f006ea@gmail.com>
References: <b0d5b584-2693-73b3-79f6-3e2292f006ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_083638_417843_7D50DEF8 
X-CRM114-Status: GOOD (  12.86  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 19:44:15 +0200, Matthias Brugger wrote:
> Please have a look on the updates for 64 bit MediaTek boards.
> 
> We have some good news here. We have gained support for Acer Chromebook 514
> (MT8192) and Acer Chromebook Spin 513 (MT8195). Support is not complete, but
> things progress. Apart from that there is still updates to the MT8183 based
> boards and a few for MT8173.
> 
> Another highlight is Angelos great work on the older MT6795, which got a few new
> nodes in this release. I want to mention that there are many more drivers in the
> pipeline, which I hope will get part of v5.21.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 5a75c2951af71cf04eff2fcce8bfe7684a5ba293

       Arnd

