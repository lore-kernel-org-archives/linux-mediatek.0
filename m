Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E820DC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 01:30:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78591610A5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 01:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78591610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vhewLhuznTB/7jPWJFAZ+UYzr02Dqkmbn9QdwcbW3c4=; b=Px1V8Wo8yaoUsRfo4/czSqbw8
	2aIOPtTSdNslyOh2VRw1q3cU7GSZlz3GSLa1aQhVt/sCZ+CKX7QXRWE7iheTuoXcKWunyExM6cMu6
	6lju2gG6NuZQA4Iyqj0aqSwtkpIxSNnaZ7VNxcdmTCvZZ7YAE1GjkXjjK308T12z1yoNUnBG+4qkK
	p1mv2WRsjXiGk6QYkQAE1s2NepHcooF6J+nnbbNAKYrr5aXL14iSpsyUsdLUBPU0CGmBFagc/geKO
	RvQeHpfuZ4e5Oo1H6S/c3GUGPg3kmJH8iKYxWNG95zecGFQUCLfxG1CD4g7o9iHB86o+Gk/rlTYFs
	7AAeeH/8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lepJw-005lTV-Od; Fri, 07 May 2021 01:30:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepJm-005lQ0-9n; Fri, 07 May 2021 01:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=U2f4lwRTl6Sq8MKJTf5waJFrZocVoKmmodtxVAvrn2Y=; b=OAsYHVaBrDn2VaLJL40smZ5SIB
 Lsw3mRUBtlOADfuuWnb2hpcwoBhSiqp2JvilXjCC84zFOf8+LYofmKsB+EMG/p26iQ3Z+qinxt5m0
 VPrwfQOrv7aPEN6t3t1B1WoFjqy7ahDpHfhccfnvM0wxodHMT85ZWIQ5LDCm3pqmN7DuQGKHjU5Py
 uuYe/AXr11uyGbwcbgApaa6C+jQIfaR53zrB8hUvIjxVfv7AEwvEgFZpCPAqt1dIkR8Wh+/JwIxr9
 VBlIBWylAa0ITUUDzBnV790fVd7/80xjZ8XawtfAy9pbLfSPNGow6zmpDU3fhNqY4xKaSQu0psaeb
 GdBtACyA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepJe-006VPM-Qm; Fri, 07 May 2021 01:30:09 +0000
X-UUID: 0a2efcf17a284ea790a8129068eb99c6-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U2f4lwRTl6Sq8MKJTf5waJFrZocVoKmmodtxVAvrn2Y=; 
 b=kZ18lCiUw3TgV558F55Bb/E45exPUhGhZKqT7iimJlYHpVl754LzBHQR+N1o713NUFzuscZHhEvFqa0hll3bZXBS3sOqW5VGakL9/KzSHYGWpT0oRM7LAHlKky7cV7mGMMQfBLlD/zAul0f/bfxFycPZSPTjVNE8ZmpbJcif7fY=;
X-UUID: 0a2efcf17a284ea790a8129068eb99c6-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1255309936; Thu, 06 May 2021 18:30:02 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 18:28:07 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 May 2021 09:28:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 09:28:04 +0800
Message-ID: <1620350884.10796.4.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/3] usb: xhci-mtk: use bitfield instead of bool
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Fri, 7 May 2021 09:28:04 +0800
In-Reply-To: <a3d1a695-3138-f322-3b4f-5d00e9c85a50@gmail.com>
References: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
 <a3d1a695-3138-f322-3b4f-5d00e9c85a50@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B66C12DD37D5DBACDC72E5D8E7E26DD366849082BA3EF9E5C2458D502063B1992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_183006_890629_69C3E219 
X-CRM114-Status: GOOD (  12.05  )
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

On Thu, 2021-05-06 at 11:50 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 06.05.2021 9:31, Chunfeng Yun wrote:
> 
> > Use bitfield instead of bool in struct
> > 
> > Refer to coding-style.rst 17) Using bool:
> > "If a structure has many true/false values, consider consolidating
> > them into a bitfield with 1 bit members, or using an appropriate
> > fixed width type, such as u8."
> > 
> > Due to @has_ippc's default vaule is 0, no need set it again if fail
> 
>     Value. :-)
Will fix it, thanks
> 
> > to get ippc base address
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
