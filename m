Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 18:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C95D610C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 18:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C95D610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdR87B1uAIwQUyEMOiYMYeFDgq2QJpt/rr6vYSdbBWw=; b=SnAVdziwb6w96m
	g8JL7CIVPaq4oDwpil5Ttldzpe4QuHKnsydB55khwe7/VH2DxPHoYq1joVlxNZta8GAB0/wD3jhNA
	nnJWagf2Y0nkctnvqIF63r3nlIzSo0ahURDLJzLOyjSV9jO7vaCyk20fIBn7qjSdrYToXaTrwPL48
	xPilNEUXVgN3MuDHuIz38pPosPk3LQHEPzMpXGmhPVJpaCe1yuEuxxFgsIapccmTLwi7hPeruJzUM
	DQ9a/8b8FE/j5zfKWL+DHp26mzXPia1jfmMB9l3emTYuWJbq2rkL81xpX9ABR9InUx/dxkj3ykwCE
	YUQvPQBtNYwiIKBZlFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maM9I-00DgUq-78; Tue, 12 Oct 2021 18:05:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maM94-00DgPe-8Y; Tue, 12 Oct 2021 18:04:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6025D6109E;
 Tue, 12 Oct 2021 18:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634061897;
 bh=TOIZ/lPFpgW5s2Q1ZJj0S3XD3XwX6DCR2QMtHMh5HnI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lSrOSqOZZCP+H7YGOynlMHxLFlORNDK1/ZLMvLOK2rugUv8G5e6i567su/tntefoJ
 UwMWrAxnW3WClWMisGlFUtxhS4IStUZRCtqeNIk9tE7N6swnPFSWhYxtj6h6uNne3y
 y+4RNpyg9Sl/bPbx6T9jE7xhAhdu/o4J9sBL9x2T70uTeOz0YwBmBRcAXEVfD8hVz+
 88kXQZyK6KPZrzV9o9Xe5JVVQUQYGdEyMUKoE99mE7+0EFYfB5UGMfEcIeuicTyYZZ
 nAOEJySasmDku2hwG0UAvlzEZiTcWMNJbKDsiX/90Tr+i+ZnJZ78wcnURS/bH/FsWa
 O0/kkpnOH4doQ==
MIME-Version: 1.0
In-Reply-To: <20210914090338.5945-1-hsin-hsiung.wang@mediatek.com>
References: <20210914090338.5945-1-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 0/5] Add SPMI support for Mediatek SoC IC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 12 Oct 2021 11:04:56 -0700
Message-ID: <163406189612.936959.767305130802405261@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_110458_334398_E85B5F11 
X-CRM114-Status: GOOD (  10.12  )
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

Quoting Hsin-Hsiung Wang (2021-09-14 02:03:33)
> This series adds support for new SoC MT6873/MT8192/MT8195 to the spmi driver.
> This series is based on Chun-Jie's patches[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655
> 
> changes since v11:
> - rebase to v5.15-rc1.
> 
> Henry Chen (1):
>   spmi: mediatek: Add support for MT8195
> 
> Hsin-Hsiung Wang (4):
>   dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
>   dt-bindings: spmi: document binding for the Mediatek SPMI controller
>   spmi: mediatek: Add support for MT6873/8192
>   arm64: dts: mt8192: add spmi node

Please drop the dts patch from the series so I can easily pick up the
whole lot. Also fix the binding problem reported by Rob. Otherwise the
patches look OK to me.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
