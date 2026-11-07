Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7F8606A33E
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rbrtZEVB;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=csmVjV4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EFSYc/8RJSUPREtTU6WARYqr0oenygs477L3MFgvPg8=; b=rbrtZEVB+l7Ydz
	MxUjtVRC3i4wiRQJtkHTvPp7nMtWveVLW64XiucKGmEdB3Xqiy+fj65sTM2uD10dLFLsbYhiPR+Od
	0Mp9flFjwceyPnz0syZuoKndyBCW/SBmxVDJYWQe0ZbtmNmu5MRzpzqk6ransSnuBm42m3SwUz8+x
	XhH3iEXVBr51jj6vJ65rWuFZ2QG0CFpWy2ngs06FGHG4aUJ774LVLz8H94LmESagjwJD50Zy3r8WD
	xhfkv/Vvkzai/cNOv1m2n2y2PAOkAH6Vb/RiTsASENfBV+1lZLjT6Ou1xHWO3GfJSKnLspIXe4In8
	91QGYmXiVngpPt4wLjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhOJ-0000000EolF-1Aot;
	Sat, 07 Nov 2026 14:27:35 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhOE-0000000Eokf-37da;
	Sat, 07 Nov 2026 14:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=csmVjV4rrZDKiNmtqYZutsh3R9feJf2oFkZ4Jvdj7q0iXrE3g2D2hE8jOqKCT0wbE/sq/wD6b7dRn
	 zg2gsWrLB0WmgmS5MYXw7SV9qySyqiPxowKTUqI7FMtqdkRN8w+EZlsOAo3PikNtTyVzp3xxttXNv0
	 ypd++17KLQClEZ40=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76aef353ba89-b8172;
	Sat, 07 Nov 2026 22:27:14 +0800 (CST)
X-RM-TRANSID: 2ee76aef353ba89-b8172
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [198.18.0.79] (unknown[112.23.104.16])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16aef353f7d0-47dd1;
	Sat, 07 Nov 2026 22:27:14 +0800 (CST)
X-RM-TRANSID: 2ee16aef353f7d0-47dd1
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yanqing Wang <ot_yanqing.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yana06070@163.com
Subject: Re: [PATCH net-next] net: ethernet: mtk-star-emac: fix device_node
 leak in mtk_star_probe()
Date: Sat, 07 Nov 2026 22:27:13 +0800
Message-ID: <1794061633000.60641.4001961669981893081@cmss.chinamobile.com>
In-Reply-To: <179406131565.488859.1019307996230359534@kernel.org>
References: <1794061182000.57993.3986467551914992480@cmss.chinamobile.com>
 <179406131565.488859.1019307996230359534@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_062731_387580_AB3D2D1A 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 22:21, netdev-bot+sinfo wrote:
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Hi,

I don't have any MediaTek hardware with this Ethernet MAC, so the
change is compile-tested only, with CONFIG_NET_MEDIATEK_STAR_EMAC
enabled on x86_64.

Thanks,
Xia Yan



