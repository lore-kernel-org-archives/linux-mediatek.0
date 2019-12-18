Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FA8C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 08:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8987E24691
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 08:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgPQt5zC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pjCqawpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8987E24691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bF5oWIn5jTYCimb4S48yOpj34G5JrPmD3iZbuV22P/I=; b=fgPQt5zC1vA83/
	cR0GgTbCGxCtWn8RshQNfOHZIIXCk8SWWq5WpfveYrbsGtK711iW4i13KHJJg/1K5LlnL3MKTXR4g
	ipCb7a8ab0xtvAD1As2vv7wY0L70NIosHXcwNvv9oqMyNkDBAZOxUPCAhM+b0isgNw9fsrtSjsesd
	UVrFXyEoPsHE7YZCFIi0djPyT5Z2XHq5K2Q5cs+QB9t2F050QYQ1BgAF74/2IDV5gS6itwg5l1cvw
	7lThD0eASH6qZTstT0vL3tFceELrW0+N8+KKM8Bn7D8AY+2gsvCn8VBH3s+b/lNYpQWCevb75+zsX
	VPM5H/gndkJdFtPzuuqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihUUF-0003LH-81; Wed, 18 Dec 2019 08:15:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihUTv-0001vA-CQ; Wed, 18 Dec 2019 08:14:56 +0000
X-UUID: 9fcf6e68e8b14a8b8fd763dbaa61942d-20191218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Elil3OPD7BxgukHrj970HA8QSwLyzRiTBYIu7u0CL3U=; 
 b=pjCqawprPuYx1Dv0fBfU4v8esvm5TCTrUBCyWIlWUwXPjoMXiifMA7rZZrgblypdkw4zygr9ls9zS3L47zOepYNzDLQr7dkV0ot6p5LqeVO/ZsXS96T8d8a4Fbmm76DTCVg6JYyJKkbQn1xrZ6g7mtsJxhArEK/YLS8oRsJC0Aw=;
X-UUID: 9fcf6e68e8b14a8b8fd763dbaa61942d-20191218
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2135008670; Wed, 18 Dec 2019 00:14:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 00:15:00 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 16:14:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 18 Dec 2019 16:13:51 +0800
Message-ID: <1576656880.9598.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 06/14] soc: mediatek: cmdq: return send msg error code
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 18 Dec 2019 16:14:40 +0800
In-Reply-To: <1576656006.5933.3.camel@mtkswgap22>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-8-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1575604966.6151.1.camel@mtksdaap41> <1576656006.5933.3.camel@mtkswgap22>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_001455_436521_6D65F65D 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-12-18 at 16:00 +0800, Dennis-YC Hsieh wrote:
> Hi Bibby,
> 
> On Fri, 2019-12-06 at 12:02 +0800, Bibby Hsieh wrote:
> > On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> > > Return error code to client if send message fail,
> > > so that client has chance to error handling.
> > > 
> > This patches seems like a fix patch.
> > Please add fixes, thanks.
> > 
> > Bibby
> 
> Do you mean add *fixes* in title?
> How about *fixes flush async function return error when send fail* ?
> 
> 
Hi, Dennis,

Please refer to
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
and find "fixes". 

Thanks :D

Bibby
> Regards,
> Dennis
> 
> > > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/mtk-cmdq-helper.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > > index 274f6f311d05..8421b4090304 100644
> > > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > > @@ -353,11 +353,11 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
> > >  		spin_unlock_irqrestore(&client->lock, flags);
> > >  	}
> > >  
> > > -	mbox_send_message(client->chan, pkt);
> > > +	err = mbox_send_message(client->chan, pkt);
> > >  	/* We can send next packet immediately, so just call txdone. */
> > >  	mbox_client_txdone(client->chan, 0);
> > >  
> > > -	return 0;
> > > +	return err;
> > >  }
> > >  EXPORT_SYMBOL(cmdq_pkt_flush_async);
> > >  
> > 
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
