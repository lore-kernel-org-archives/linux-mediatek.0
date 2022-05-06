Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03465C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 05:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Et53PwShfHwilBghKodRDrrRwyx1JYxvcUlOjrKYqtA=; b=FRHE4r2ES1oMgK
	lofAA/ETdPeAa7A0u3y5SEuJ3Nq0eseUaObfH3gfkInR9sZbHR1pGxnrDxJV11PN8g3Y2f7LwAoGe
	U37FktOCeELCZJDmdfgczQJLDgJBs534oa27bu9YsEA7usBCt/vRs0VM39avPo2hb06JwMG9xNGE+
	9vvB6y8TPmBfgkeqsqi7b5hXIzhfKKX8B3r+x4OsWv8he2Y7RXedzItxbxZaiIqJlTaIAHs7sUoOU
	2ee/a0u5xZhM04aBXDigh6BqL21bjWORlarlf8bQ8dyt8mDQarzWpzo7zbkPbZhCrCLHk3oJEsHNi
	cvBiAI9WpR5lf+6VX5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmqaE-001S3g-FD; Fri, 06 May 2022 05:32:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmqaB-001S2i-PU
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 05:32:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E37AB832E6;
 Fri,  6 May 2022 05:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B0EC385AA;
 Fri,  6 May 2022 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651815166;
 bh=nR9V7jemUNjIp2es8J4WtsRQp+BbXrKQQN6R5IkFuUU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Fm0bc+wCZo6cf3GSxPNHL0bSM/rTEGqq/cCNLwQx3lA9WQK+Ov3cVHxNG1HF5z0tw
 yvfW37DusyWJCmuDZbDlb9GSVF1IRjXdCBxe2RkiFayBAWjvTwQ04SD4HwU9DT8kvv
 ATcFHz6dlwjtTYNXbpxk6rpcHT/h/0jHougtvGc5Z/vQpnfRrxgnirIzBjm9wxFrf8
 7b2gdeRQ/AJqLEk+9sOxqgCqTjKa0EHOmjw0Y5WVgZauJ0979ckt83c7gcaEMOC+KD
 40MTKQdJ6IrQ4MO48wxRM8bN8/+v6zF+Rt5WWmbFmCS+bqt7DBblLxnGzscWgo3xnM
 IwVKWL5Re2tvw==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless-next 2/3] wifi: mt76: switch to
 netif_napi_add_tx()
References: <20220504163316.549648-1-kuba@kernel.org>
 <20220504163316.549648-3-kuba@kernel.org>
Date: Fri, 06 May 2022 08:32:41 +0300
In-Reply-To: <20220504163316.549648-3-kuba@kernel.org> (Jakub Kicinski's
 message of "Wed, 4 May 2022 09:33:15 -0700")
Message-ID: <87wnezxm2u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_223252_007278_03D50269 
X-CRM114-Status: UNSURE (   7.48  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> Switch to the new API not requiring passing in NAPI_POLL_WEIGHT.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Felix, I'll assign this to me on patchwork and apply directly to
wireless-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
