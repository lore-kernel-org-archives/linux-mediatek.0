Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856B1C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 12:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E15E61C71
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 12:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E15E61C71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYbWYMMStZAu4GYc0NA6WEjeVj39P7q8uJJ9LdrAemA=; b=dtRJkfxUfuX0iT
	PfH0pZOq0U0E3coTLr5lJlGn2kKrNzBYS9S2qR12x8eelLrZjAQnjh3vVv+5L89PU2GTyBia0dFLk
	EZQA2dDPMHRwAkqMOvXFetbEoFmIAd+AK0ef0iw3m2TQzmZoMlxbY274ySgqo28Zymemv33Tp8BHe
	6GJcxHj367Tm/057xX4fyW4+jp55yGMWRES8izFPsiufg1VdZBPzW/C/kSIr1cXqKKXFijeAnjklh
	r7icgrqrprMrZ480GyKWXsGAC4NZtTvZUV4Bi6mRllwD/GI707ULMoTgJHgA5aG7Fz6+zR5PUdF5x
	kV/AR7xukoPt2jBbv3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxpxG-007qeV-8w; Mon, 28 Jun 2021 12:01:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxpxD-007qda-5d; Mon, 28 Jun 2021 12:01:33 +0000
X-UUID: 50afed9bb78743c08e3baddd91f77433-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=glrhrzaIhE7vhNz3vuSdEIfHQkSaoPCRC4KtXtyz+5E=; 
 b=SRQCeNphtjYkTbA9alHnMjs3fZPik3jmTkHA3AZXUqaJkPJozGoW5KYp5sky2/NbjW61lesgSjTyV7p/VMYoCP6cJhjzI9Tsa4vwmmD/QueUGMrDZqbOm/t8FcX4F+ZcTEb8FWwE1nTzH1kvU2u81DT00PZwyQ7yy3eu9WC0LPA=;
X-UUID: 50afed9bb78743c08e3baddd91f77433-20210628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233119317; Mon, 28 Jun 2021 05:01:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 05:01:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 20:01:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Jun 2021 20:01:07 +0800
Message-ID: <1624881667.26480.2.camel@mhfsdcap03>
Subject: Re: [v4,3/3] watchdog: mediatek: mt8195: add wdt support
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>
Date: Mon, 28 Jun 2021 20:01:07 +0800
In-Reply-To: <CA+Px+wX7yBvuzj=KWf0MhLkTQOi4Rfn8F6z_+g-T66K3iMfb=w@mail.gmail.com>
References: <20210623123854.21941-1-Christine.Zhu@mediatek.com>
 <20210623123854.21941-4-Christine.Zhu@mediatek.com>
 <CA+Px+wX7yBvuzj=KWf0MhLkTQOi4Rfn8F6z_+g-T66K3iMfb=w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_050131_265957_920E0305 
X-CRM114-Status: UNSURE (   8.59  )
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

On Fri, 2021-06-25 at 13:11 +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 23, 2021 at 8:44 PM Christine Zhu
> <Christine.Zhu@mediatek.com> wrote:
> > From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> >
> > Support MT8195 watchdog device.
> >
> > Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>
> Still missed this part per suggestion in [1].
> 
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20210623092917.4447-2-Christine.Zhu@mediatek.com/#24270619

Thx for your advice,I have uploaded v5 to fix it.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
