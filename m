Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30163C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YH6CbTJDH/TKzNJQ6ho3kCkaU7wC/vGAng2Kc097CWs=; b=djoEIr4FClAo4oBJiYg29pQ6Ur
	XHfmmFCUNlou170C29y/YIT78nkS9USz1ma6aIUUt3TycPo61HoA/xuPaFa3FkfrHMkkdaxWlKj9x
	ztIBUriuHIQxJj4gLGduJ+TjAl8IwZYXSFFsEw+DbOwRBuMRHR4TC60POSBtxIl7qlHQAVCa6l689
	LY8lgBzQ0uM4dCK4UjXAuZ89dx69NGu+4Y0vJeMN4+FxLhC37SEAj4J7V1DansT8Z24j/OI4nA9Ue
	zGqy7uFlknkBD85kI4Ue3kLthjnXkIGYrO1jwc83MQdynivt9LMpCbq3d7QmqnlyLeHebfejEiFCC
	sQtthgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8bj-00AFaG-D4; Thu, 25 Aug 2022 08:52:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8bh-00AFYc-BO
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 08:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YH6CbTJDH/TKzNJQ6ho3kCkaU7wC/vGAng2Kc097CWs=;
	t=1661417577; x=1662627177; b=L+iwpr5ECr0csVNku0xsOlG+NCGWXNObATzVjVDEglyfjIS
	zcUjZV2PvZa4sorf3FtLZtEYhB3eeiuLVedWxvH8LnH+tDjuG/D8wdcMKWpBQoWt1xJGxhlUUZW8q
	JCTaUpi6K0ziMD7T514cYLBCug+xMEXxX2Toyd5w2o3L/mBNiU4dW1+ZWJENDsdbAznMjtFGB/yXi
	ZyNEioP7N4Q5tDag0R1eSMNmBHyk2Ksaj6mnemUN5HLtkQThG7dxs666yWpfkE5FFi6XRN9fA3luI
	b1mBKnDApLguySELTGTCtLuCccvsQP2VRMk6DR80Go52xZGR8fITkqoLEwsnE3/g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oR8ba-00GzWC-31;
	Thu, 25 Aug 2022 10:52:51 +0200
Message-ID: <f761660377bc070d060da7359b950a7936aac1b4.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: read ethtool's sta_stats from sinfo
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Thu, 25 Aug 2022 10:52:50 +0200
In-Reply-To: <ccfce8848c7bf7199ab90ccf3b4b14e1c7633385.1659060644.git.ryder.lee@mediatek.com>
References: 	<ccfce8848c7bf7199ab90ccf3b4b14e1c7633385.1659060644.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_015257_434624_27D7FDBA 
X-CRM114-Status: UNSURE (   4.86  )
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

On Fri, 2022-07-29 at 10:15 +0800, Ryder Lee wrote:
> Driver may update sinfo directly through .sta_statistics, so this
> patch makes sure that ethool gets the correct statistics.
>=20

This doesn't apply, please rebase on wireless-next.

johannes

