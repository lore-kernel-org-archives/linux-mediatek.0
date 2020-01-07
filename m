Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFDFC282DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 18:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FC7206F0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 18:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W2O73kQs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYAMnJvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FC7206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTZnuSwXw/NrBzaj1FA1TvzP+P9weCMNriVCev/hTSE=; b=W2O73kQssmODVP
	4qdHpZ0XVSIgUg8Nr9RIIsmkZLkM/h7Ae6PjSDeicuWL3jfkSlbr6y4C3y7lQORmt83OjrwBLpYFg
	lpt6U2deC/QViVijQpp1fA/+CGriMEoiR7KM/GYcZDlvh1ZXBb2NVBsaKEGZcMg4vekytINCeoLS1
	v4RdKDX8zOcGdJGOCZdmGRIihsAvGyLLGYi/h2CWC2mMu2+Zv9cwzYVKIGGX68mWZoBCkZyfrphOU
	J/quWSCdCWLGp2XJCTT0moNDvoaBX8+Km/AfWsfAg1a/sVVOruwyvToDtIjMVQcWhTwIVyG63yI3w
	PhrcZ5QErOJSrQx8HpTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iotc4-00011d-8D; Tue, 07 Jan 2020 18:29:56 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iotbu-0000tZ-Pl; Tue, 07 Jan 2020 18:29:49 +0000
Received: by mail-pl1-x643.google.com with SMTP id f20so52820plj.5;
 Tue, 07 Jan 2020 10:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R00xNPsCF8UW/szKUy4WCcj0M7xSEsY8VrV3QDe1Oo0=;
 b=CYAMnJvk6SbEGhlwkKO0AU34UPtn7TFji5Ps19RbS8eRYq8wo3OUwKlS4XmNeopGmw
 QiFXRSNjOagwTIFztbuUUjbF6qBGjG5EqWUDnsTeDPvXGaymxUKOIkhLgXUhBk+u31iH
 KIugAhILIf72swrEM10d9I+R/hnEGyBQRfbBvyp9X5+3vTsquRDSlYzvCKLyAO71jQqU
 BRua/j4i2V6W3EhyxNLWaidgQSdHiAZQIMFRrHPCkrJLvjxQ+6Fva0moX1B3Za4LNly3
 grRreqi+zjsyRIBFuQd8pvJSluNizRXJPQij7kV+xmds96HDCKPquqbMibZf42oeDtAx
 5Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=R00xNPsCF8UW/szKUy4WCcj0M7xSEsY8VrV3QDe1Oo0=;
 b=XXozdpHQPPJeBXyKzHUkjDY85Z7rCb+7VsNd9XZpB25L+pO+WKe7UaJZwVzEnkXK4h
 cQGqX6tsrDpE+rIqtPfYdZhPigMK9crFYR6+105wufg8/DfRDqRpIhPDm5cA7c0gW4rZ
 IfInpZnHdG094A3Om3Rj7BIa3/IBE3tWLcnbyh/9czHhBCMaP4MknQ+oiXRHSVKVCm0X
 wwU0R/B66Jlsz8MimZVbPGudATB9MJThTyjd+sYq3Z3TRMyjUZlSbuOUJIS34uRlWyhy
 1d4F61g0YUjlpK9VUKNrCL7n4vDzBy08PbIdAVzlQTrn9I5NRIvHDV+GraPyj13NqAe2
 p26A==
X-Gm-Message-State: APjAAAVdgs9t4rE1dRr9EeidKCBdZQSfHA+e63K9sA2VkfPPN1wjO0Cq
 g3X6fFk5icm+Qq3GYWxQ3gU=
X-Google-Smtp-Source: APXvYqwFTbjgTXASmix+3u3414wvuMf8vHp4E+Qp8r0vx/3MvZxQpaU4ZHNyie4f5G1akERvond2Jw==
X-Received: by 2002:a17:90a:26e1:: with SMTP id
 m88mr1162523pje.101.1578421786005; 
 Tue, 07 Jan 2020 10:29:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u3sm436809pga.72.2020.01.07.10.29.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 10:29:45 -0800 (PST)
Date: Tue, 7 Jan 2020 10:29:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20200107182944.GB22909@roeck-us.net>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200106215721.GB31059@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106215721.GB31059@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_102946_838575_7C6E7F7C 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 freddy.hsin@mediatek.com, linux-watchdog@vger.kernel.org, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 yingjoe.chen@mediatek.com, matthias.bgg@gmail.com, chang-an.chen@mediatek.com,
 wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 06, 2020 at 03:57:21PM -0600, Rob Herring wrote:
> On Mon, 6 Jan 2020 11:11:35 +0800, Jiaxin Yu wrote:
> > Add #reset-cells property and update example
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
> >  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
> >  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
> >  3 files changed, 46 insertions(+), 3 deletions(-)
> >  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> > 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

v9 and a couple of versions before that did not include the update to
the bindings file. I got lost in the many versions and don't recall if
that was ever tagged as Reviewed-by: in an earlier version.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
