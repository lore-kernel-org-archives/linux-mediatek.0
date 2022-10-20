Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2795BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2O9o64HjZ+lxx4ZdLzdCMvjHNZgl1JSyVR7a/m76hIo=; b=VD9VYa02CqQWka
	2tysnjpP4GkTQf9+qVu+ypLHy/hv2rS8Y10Ksmk+O/tFv4c08VrPtXA9IVSKKbeuAnp9WkUVQ3Xr4
	O3yMYb2I5FY2mDcfkfnb/uvaaIZeSif7tWJDMzG+F1DHBN139lZmH/PWDKIIa7SIhdkKDDdzfbxxX
	wctphwxSdmle5/TBEasRjRg2meFY8E17OxZhLsbxEqdND2KjczUZSknywzgKjuQheRb0iGibiUa1/
	FKnW3/oO83drhJ3J+WR65TtufsOXTYa3/msT5pnUnIt+EqFWGJd2Vk9L1Inz1qD7DqM0g97ZgLG6L
	RTIkcjjXQyhFsC0M94Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olawf-001Hj9-MP; Thu, 20 Oct 2022 19:11:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olawT-001Hcw-AJ; Thu, 20 Oct 2022 19:10:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F356CCE263E;
	Thu, 20 Oct 2022 19:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14FCC433D6;
	Thu, 20 Oct 2022 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666293048;
	bh=TfMfMB4r5AcA/VOzO1008S1j+Nb6+A2DEu+mlP3xJlU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rSU5YobpaloCf8sYMx8FcDfFj/hBXeLUD7i6GPRK/xFYPI6ETgO8P0Ub9M9AgyZpx
	 vtMWdiOgoLOqYWytZK/a66HG3wTRctQgGhROQxKdpL7gX+g93zpc+YMwoyViEEULAg
	 Pjf/izSMxIFzs2HXyrAUM6mrBitrqqYcL0ZTMLj/C64aJhWMX269kAw5yBlIEheR1S
	 TR/qM0DWiEC9SAg/vqEDuPhxjQWrXjFkB7+FGvkFmmaaLJEbYi67cZfXWMXnguw8fz
	 Ub2CPOsURNWtwSEFdSQHxo12KeXb5MSdYOoTEEpE7AYrukmNi/iiyTAvkDvVAqFMh6
	 jKJqmhlIFAfPQ==
Date: Thu, 20 Oct 2022 12:10:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <20221020121046.6b6b25a7@kernel.org>
In-Reply-To: <20221020144431.126124-1-linux@fw-web.de>
References: <20221020144431.126124-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_121057_566455_FBF0B1C7 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 20 Oct 2022 16:44:31 +0200 Frank Wunderlich wrote:
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")

nit, the correct formatting of tags would be:

From: Alexander Couzens <lynxis@fe80.eu>

Implement mtk_pcs_ops for the SGMII pcs to read the current state
of the hardware.

Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---

