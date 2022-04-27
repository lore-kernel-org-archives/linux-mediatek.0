Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C11C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 00:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSfBorf9tn3Rq1GFGI4RRXZKqAsES2IK1PrMDdWbxKk=; b=t7MBRee5AnN3/J
	KUuA75zHkscLOG39js72PoJx1OS87rn6ipVU4wAhs3lIRlNY87Ni8XjEPHxQbIb7JHfzwcxwdXjhi
	jUgWwxpOH/fs96oi6SFkkMYKJcR+1bJeU6hYinjMWloXBg3En0RBz/5g1WhU6mPtUnfffciR+Ca8z
	xCnUS9zbyK8w0jcj987C/0rL52lM8z3QcJPCT4NsM0afMk9fuSXTXexHVvzv+/WQZZjZNl4mavcW5
	EH1TkV3kUuBZK/tzeIozi0FXWdlbbG9GAG2Q/3kLe6z3WnSdgifAMaL/jAMtcb0z0NR6hDIfW2cIB
	nMARud1x5+pe7/FUAaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njVdQ-00GliC-4E; Wed, 27 Apr 2022 00:34:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njVdF-00GlgL-BF; Wed, 27 Apr 2022 00:34:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBC4EB823FC;
 Wed, 27 Apr 2022 00:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00051C385A4;
 Wed, 27 Apr 2022 00:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651019650;
 bh=w8xOCgz07U6QLDdN1TlVIYIPxUDnYGMJhvye/e+Xq+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i9r5Swi9RF5uZq/NT+5UF3nO28x9iQj0yhn1AYSzHRrk56Fx4JQMatRTMp/kiXZ9E
 kJcDheQ/d1uxHds9JWEt1NlA1kyH07azSfZF0pZ3R1QbafOHBovFZagC5/j9Wpo2Iy
 peLf1f2GQXjI/vvxLlYJ9yovB/xCBulmqYBSRoHj3UGWg2evkuuUzenyYCKSxIor8l
 LuqBLLpqC6jkBo1Zm7ui2ookfgRfMQmVdWRw9r+svF4uo58J+Wa2sONpWWy6qJb0XW
 Ws+fTi4FsnzMufJ/k4Y8PrvIXed5fXAKWL+0VHvurBQcu1AsJ1kxh303j6mFHGqJX5
 rFVCYMk69V7Jw==
Date: Tue, 26 Apr 2022 17:34:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle
 <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt753x: fix pcs conversion regression
Message-ID: <20220426173408.24ddf574@kernel.org>
In-Reply-To: <E1nj6FW-007WZB-5Y@rmk-PC.armlinux.org.uk>
References: <E1nj6FW-007WZB-5Y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_173413_570416_9580F365 
X-CRM114-Status: GOOD (  10.97  )
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

On Mon, 25 Apr 2022 22:28:02 +0100 Russell King (Oracle) wrote:
> Reported-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Fixes: cbd1f243bc41 ("net: dsa: mt7530: partially convert to phylink_pcs")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> Fixes line added so people know which net-next commit is affected;
> this is only in net-next at present. If you think it's unnecessary,
> please remove when applying the patch, or let me know and I will
> resend.

Not at all, FWIW it's very useful.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
