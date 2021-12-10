Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18858C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 02:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUTJPhMuCeOjI/rsL2LiyZ0VLgM2tQbdD4IQ8a6pmIc=; b=MxpSMMi1Vj59aa
	44CggzPLRKkhaEkj3o4mKsO4vMvO3YXKoLnWWwQqK0C1c9Hfspn/w2IEMAQhCVrS+24fnrkNI0qwm
	ZdRO+LsouXVbenX+a+rmTM/8YcAXv/MhJ6BzNoIhAyw6F2c59DDKXI97snf1hQLoeDk6NQHX8edcD
	kfdqydCnIus038D8XpTAeKh2FXGU4lJJy/4AHsZM47f/+m8DWOQ1rS6ZzzrQs+XlgeEG/rlFXnkWy
	o4KOJjjiF2u6zk6S/a9/3gfFKuay7ddPYINB0YwwYtaOKwE+669mbT1qqnoqvkOF5cOBmB8b3vWbH
	peqjpowa1wVXoxA2rUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvVOg-000evH-Jv; Fri, 10 Dec 2021 02:12:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvVOU-000euF-JZ; Fri, 10 Dec 2021 02:12:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DC9FDCE2832;
 Fri, 10 Dec 2021 02:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE19C004DD;
 Fri, 10 Dec 2021 02:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639102335;
 bh=0tqoAYcVsMV4yoz2DptTe40PGDGwUzmdYpssOWCmJZ8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Lc02yxYh8yVztBMSpXcmOQkmurXdIXFIdmhtWNg7IQcoXQf2o7/s7uaQagTirX8Tm
 Qag65LTxZ/r/9QGSQ6AYnTzuKrN9/fxiKXYj/9sJnueRWEidB65qfYU/mu2jxGQXff
 Hk2wZPC4sFRSTOfm1YSIqHVuOwFQ7tWHN75hSr06EslVpuwLjDmXizmBt8Lh2gk3LD
 sL1DGqGoCDkfChN9LKG5TTrCtc3seb3zzfl5d4obtwJJc3xvY0nVLMasqLHqZQnrQJ
 /KHoRvrEE3bOOL0dTFX6aTkeMo+ALb1paP2xkyI/npf3EI0iWOM75tdp4Swk0lXI3m
 5q1Ejn5eqNixw==
MIME-Version: 1.0
In-Reply-To: <20211119034613.32489-1-james.lo@mediatek.com>
References: <20211119034613.32489-1-james.lo@mediatek.com>
Subject: Re: [PATCH v16 0/4] Add SPMI support for Mediatek SoC IC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 James Lo <james.lo@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
To: James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 09 Dec 2021 18:12:13 -0800
User-Agent: alot/0.9.1
Message-Id: <20211210021215.0EE19C004DD@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_181218_859015_C0C4F2C3 
X-CRM114-Status: UNSURE (   8.46  )
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

Quoting James Lo (2021-11-18 19:46:09)
> This series adds support for new SoC MT6873/MT8192/MT8195 to the spmi driver.
> This series is based on Chun-Jie's patches[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655

This isn't needed though right? I've picked these four patches up into
spmi-next.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
