Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5F0C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 19:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FC4E221E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 19:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jRXBZB2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3kHvXqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FC4E221E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NuFBQb2kVRhzV2L22+js2CEah7XGcPpKWPLcxEU14sY=; b=jRXBZB2+XOMBMLJJ3kn5WARJK
	oGSyzUHanU8ixBX0mTh1KQiX07XrwT62QnfURemlJGDfZYOnxN6OTyttsgPszxjg9eKd2+fYzz6Q0
	FZrQxJFE3R4yA5TwoAhW7kCF3k+GX1FhsAgdWn58jfuVnTBzoI1j0NpKUkj2t7zy7erFma2na6K9m
	RhNBJ9WHCEkzPZKq/xB54PM1ahMTF0E0SGqQeOY7lFVIgpo/Qm/RtkkpLmb3Nm9X5uAq0b2RnTdPw
	VVZhJGkysj4s6HP1zKO4aZ2d/z1G0phC93onTR71vbxF+Fw88jtZ4bUpm6bt83r9WBdbnSnGzP8G0
	f1zxel1zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKoPc-0008BI-OX; Tue, 22 Sep 2020 19:57:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKoPV-00088R-D5; Tue, 22 Sep 2020 19:57:10 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77496221E8;
 Tue, 22 Sep 2020 19:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600804628;
 bh=XXd2h3wB38PGVUGUPCBsXi/5UpWQML7l88sLCFM7a3A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=K3kHvXqmXqgKsT9v5t/y/wUmFEdLIudY9nza/LYDYJ7VN3asVt0AVEqeQXlwH6IYf
 LFVzg1GE21S4q625QAfCT5m1TpVa+O9jlvTGRBw+za2iR5z0cpwTNnVcygnkRuPKtq
 A2Ik5zoSDCZPlDMs9tXmPSarecpsIQLMjZC/K7Wo=
MIME-Version: 1.0
In-Reply-To: <1600761065-71353-1-git-send-email-zou_wei@huawei.com>
References: <1600761065-71353-1-git-send-email-zou_wei@huawei.com>
Subject: Re: [PATCH -next] clk: mediatek: fix platform_no_drv_owner.cocci
 warnings
From: Stephen Boyd <sboyd@kernel.org>
To: Zou Wei <zou_wei@huawei.com>, matthias.bgg@gmail.com,
 mturquette@baylibre.com
Date: Tue, 22 Sep 2020 12:57:07 -0700
Message-ID: <160080462714.310579.6457832964568996507@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_155709_564972_3D3635FD 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Zou Wei <zou_wei@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Zou Wei (2020-09-22 00:51:05)
> ./drivers/clk/mediatek/clk-mt6765.c:912:3-8: No need to set .owner here. The core will do it.
> 
>  Remove .owner field if calls are used which set it automatically
> 
> Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci
> 
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
