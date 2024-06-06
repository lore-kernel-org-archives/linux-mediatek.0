Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEB6C25B76
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 02:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NrSqWGK3tAVNbQ7MCEbg/HiiMed83/n7DWHMNxzJNY=; b=av9Cy0Su3ihCpsd/1zmMj9+Xl/
	d169bTeNJvvxCWDSWxrzOJZSBINS8RLl/UoR4EiOFAe/mAjiB+PKTtDC6u+Sv8Iw3U9PGjn4A2RTt
	+YrLk5rEPTCveyFqcqNWs9s541MgN38PMWPAhTI38dUs+fl435sqRe5vKInLmMw17MAXSOA/Je7Of
	HJUPVLsWmqk8sHBBeJuYs7PZ/rZnOG2HK7m9gCYRzzA16LBAqWmhv87ZpZfqff27tRT3qu/FG7YYm
	fO03YxMbTwDJBwASrsyjTkmrKWChMzX3x9jsQV/Yjj+XyJaA/JCme3wh2OeyH3LHXnRAQ0vnB2meh
	MfhNY+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF35u-00000008AIk-3RWT;
	Thu, 06 Jun 2024 02:43:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF35q-00000008AGZ-14UO;
	Thu, 06 Jun 2024 02:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4AEF614A9;
	Thu,  6 Jun 2024 02:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADB7C3277B;
	Thu,  6 Jun 2024 02:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717641787;
	bh=NdLs97+ZjaEORCCIcuQq9rHIORg2yS+bwbRGKnoymKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rQAT13a6ueu56deIrs4ByfqUJjpP5YCQBI/8Ih/Oa2fMwVQUYUfXQxDt8mVTbn9IJ
	 pl2uK3hFfIzpwa1IcL/VNGhpue8pG06ve1T93QO97++9WNlo1VOaZ8LVb3Dhs6aW8n
	 3K/ZuyxzXkw4RcaByMECjN3Oe+/U0Z6xCxgLrgzzhIY0gz0RDBu15Sd4gdHdVAvvvE
	 6NkPetdZEC2OPivdSUWG6+cPjv7UPZP7cePv9xbOENj+Pno9VxnbDZRljvM/kOGyup
	 HLfVrLzJCVd/DjiL6h0y3buRJ9dDkKOvZDYfsQ2GZ1q7CiRz8gvgJsP5Gttrp9H4gG
	 BAMSQ3Ncd60+w==
Date: Wed, 5 Jun 2024 19:43:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5] net: ethernet: mtk_eth_soc: ppe: add
 support for multiple PPEs
Message-ID: <20240605194305.194286d8@kernel.org>
In-Reply-To: <20240602173247.12651-1-eladwf@gmail.com>
References: <20240602173247.12651-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_194310_397315_90B7E2EA 
X-CRM114-Status: UNSURE (   8.81  )
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

On Sun,  2 Jun 2024 20:32:40 +0300 Elad Yifee wrote:
>  struct mtk_mac {
>  	int				id;
> +	u8				ppe_idx;

I thought Daniel's suggestion was to remove this field.
I don't see your rebuke to that point or how it's addressed in the code.
Also it would be good if you CCed Daniel, always CC people who gave you
feedback.

