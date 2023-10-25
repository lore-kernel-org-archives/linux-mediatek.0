Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFDDC25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmP2YRuizUuerRDNyE4iFg0TR9SSSm+0Y5jwwUPuRvI=; b=OoVhdO5L8bzt5lzBsC3stjUuZj
	7uBeAeu/qPXb+S9wQROuO+8dqFe7v0Au1X5geHlDDXnQmCSwb2nENgJvrgtUEzGEfHKNOUgcgeVqQ
	3+S74+pnLhhP+h++d00G4cHbinfy0AqBaFxTcwrtMp0MyQobrD2D8OPi4jTzkA0tIt8JBXXA2hxtm
	u4ybXsVf/7utXXXiH3kGjy/Aj5iYA1RxaRohBoVRP6chYZgvXkcniiggcFd1TxHp4wrhaX6/OliwK
	MqtkVSZ6qSgGW4ycxBaEPF9Jup7aLfXyOkjCygG/84m4YctAc9YZgOvv8clwO4sAgFCWrQ4lKd+Zo
	7lRlKKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZIG-00BiXf-0D;
	Wed, 25 Oct 2023 08:31:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZIC-00BiWo-1m;
	Wed, 25 Oct 2023 08:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 857D4B82C12;
	Wed, 25 Oct 2023 08:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFBBC433C7;
	Wed, 25 Oct 2023 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698222665;
	bh=CyIWhy0pHycfYVtak8DO+r/Jaf/wzo6fskC25Qh8mM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtKwMQgXxz4nmRPPvo7RQzo4wbcZjarceOGyS6h4jsFYfF7HjcaqxcBIGnKa6KPz7
	 ND9qLf6evNK/0C2G0r1B8b2KQSswHuWAVLsjy+7skYyK/nXKBpdsjd+KZGd6MYHw0M
	 TkylYjWTw3/l/BHOLSYwgvhQlsi0Nolvx7Ly0biw=
Date: Wed, 25 Oct 2023 10:31:02 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>
Cc: "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	CC Chou =?utf-8?B?KOWRqOW/l+adsCk=?= <cc.chou@mediatek.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"avri.altman@wdc.com" <avri.altman@wdc.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li@mediatek.com>,
	Tun-yu Yu =?utf-8?B?KOa4uOaVpuiBvyk=?= <Tun-yu.Yu@mediatek.com>,
	Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Powen Kao =?utf-8?B?KOmrmOS8r+aWhyk=?= <Powen.Kao@mediatek.com>,
	Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Stanley Chu =?utf-8?B?KOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] core: ufs: fix racing issue between force complete
 and isr
Message-ID: <2023102547-cornfield-pedometer-89e9@gregkh>
References: <20231024084324.12197-1-alice.chao@mediatek.com>
 <yq1y1frctgw.fsf@ca-mkp.ca.oracle.com>
 <dd57ef80bcf451e2daab2b08b8f6a6e11b4e4003.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd57ef80bcf451e2daab2b08b8f6a6e11b4e4003.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_013108_738867_5440E68B 
X-CRM114-Status: UNSURE (   8.28  )
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

On Wed, Oct 25, 2023 at 07:20:53AM +0000, Alice Chao (趙珮均) wrote:
> Can we take it to the LTS version(6.1)?

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

