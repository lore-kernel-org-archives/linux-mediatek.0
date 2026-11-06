Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F231B606A326
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aoX6AzMQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gqpaewYi;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=hYEFDAVr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4zS1QWUHwSOBAkfOexvAjjcm+lZUFWgZmqWL0fBlrBg=; b=aoX6AzMQdCGMhZ
	3CTKBd2TORER2oLOXwwHpJKFgp23lGZf8FOdwNbXGuVH6nHvG89JM1xve9CHMiQbCMYEHR6pGewSS
	SK8gPqImiqTSr+wO/iPu9dq6PT0cTSlIzUgfYWDVUt6iBsMZtL30DSveQGchubdBAq+q8qwQDcWyE
	nkRKcFRSng8t00mniOA8KREztHamDNHc4zUtQm2OJ1hsEGAn8unrRZU+Nbzj5dxmeWhu65B8ZBhp+
	e8aFOhcwyZsfufd6I0jjM3n7+/6MKXbF+5rMA7rfC9phnm+6kDfEUHYF3KxpbAThfCG0tcmZXKRbH
	jkf2s4I5Ob1wCmIywtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOhp-0000000DOyw-2Mbc;
	Fri, 06 Nov 2026 18:30:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOhn-0000000DOyo-3BW8
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Nov 2026 18:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4zS1QWUHwSOBAkfOexvAjjcm+lZUFWgZmqWL0fBlrBg=; b=gqpaewYiF1A7drszCNSI+wkGbz
	0vUBYuW3RLqOmd+TLSjMKkubC4xkFJBc+71pwrBNBoZwJ7GSycSHEo//nJCPLE39LWPKp0GALIM6i
	Tjljzlf+y1SdLaQEsbbhLnCuO4kosQjASmqzcpsOflKAfLSWF4lo75b6SGn9ZItVg+P2WHr/6ol9w
	hzFT2aVWrSDDAtTnin/7XLuFUDla8CSEgK1Q30zs3b0C70DcGgP66xf6VK9GxVPJ1sJ0Tr3WMD6T1
	x1BcXSeRQHeUt0TPYWQc3F8DFU9w6qszYITQ5nz3IeY4C+5r53K3Zw+1XSpFDakTLx5R84KmZYxGw
	GuAZFBjw==;
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOhk-00000004ZwW-1Wxp
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 18:30:26 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=62/U3bQuxJc81dT7FTL+9I7s8M81bhkBluzi6hVHCNc=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793989818; v=1; x=1794594618;
 b=hYEFDAVr3hJkAlzUWrBqpJfDJQLTDtWCPm7A0w6+EzQiDKWX1SgSlPc/IbP26/uLHAkhqo4D
 jnVZNqUQdZF+/3nAv+rbw8xAz7FTN02XZezTamVnoALKZKAtpXuVPkVkapKDufss1UirTDBwXf+
 ZlvnesR/rBUPI+Koctzh2uUdP5HL3Vclj47iZ2e32/cYZYvfiviW6NAIUnkafo/5i6SUNfouved
 XriIYJlR108d8u0oP6iLpqd9yaNByg/ycT4e75GzFWJ9CcM2Q7VAIAYWjKjd+oLfq2raxZ4YUFO
 ZB1M+IIZCnJEFgxEWHQP93M2zyuVd9aM/uIJnnw80kBdg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7e8b92ecf7e6c38e;
	Fri, 06 Nov 2026 18:30:14 +0000
X-Mizu-Trace-ID: 7e8b92ecf7e6c38e
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Sven Besser <sven.besser@sql-ag.de>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: mt7925: add the common scan IEs back to probe requests
Date: Fri,  6 Nov 2026 11:30:06 -0700
Message-ID: <20261106183006.12356-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <FRVP281MB5672F901E7D26533F6DBCBCBA0762@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
References: <20261102190811.7498-1-lucid_duck@justthetip.ca> <FRVP281MB5672F901E7D26533F6DBCBCBA0762@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_183024_419326_C72C819C 
X-CRM114-Status: GOOD (  10.19  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 08:19:33AM +0000, Sven Besser wrote:
> Without the patch the adapter is never found. With it, it shows up within
> seconds, GO negotiation, WPS and DHCP succeed, and screen mirroring works.
>
> Tested-by: Sven Besser <sven.besser@sql-ag.de>

Great news on the real sink, Sven, thanks for trying it.

Funny timing: a couple of hours later Felix picked up MediaTek's fix for the same bug, so mine's superseded. Theirs uses the separate IE set you'd wondered about:

  https://lore.kernel.org/r/20261106083004.3156085-10-james-ly.huang@mediatek.com

I tried theirs on my MT7925U. It still finds my test peer, but WPS and P2P now land ahead of HT instead of at the end. No idea if any sink cares. Yours would tell us.

> while the station interface is associated to an AP on a channel the GO
> can't use (5 GHz channel 100, DFS, or 2.4 GHz channel 13), we become GO
> on another channel (5 GHz 36/40/44) and group formation fails.

Their series also changes how the GO asks for its channel:

  https://lore.kernel.org/r/20261106083004.3156085-7-james-ly.huang@mediatek.com

If you get a chance to try Felix's mt76 branch with your sink, it'd answer both. No rush.

Felix, Sven tracked this one down on 7 October, if you can still add him:

  Reported-by: Sven Besser <sven.besser@sql-ag.de>
  Closes: https://lore.kernel.org/linux-wireless/FRVP281MB5672AE5BBD61EF0802D42370A0942@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM/

Devin

