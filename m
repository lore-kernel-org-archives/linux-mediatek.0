Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8q/lCHV94hgtlfLXzPWvETzkIxRURrN13TqkDPD4fTk=; b=aokt4b9E6V1AmX
	2ZgNCWMjCCfgeuVmb7cXuCJMnkqb0/uHoLXe4tQboTA4gFAglFAx1AT4Ke23HKUJ7Uo3A4jQlCgcg
	Xsab/r6hw8s0y9DEXYcI7SAZGos2gFn7CKd/yntgXaIw7rkt2Q1l3B/hGfYKrm1ZTg/TFGFrsnZGA
	5ZVFVRv0/CFGFAY04AgGRLAh01iqVe9jPPrGtaEli+uXtlz7KSsJmOwaFJIEHkSab/+evJeJMArwO
	rYjktR8jCu6+/pK6Tc3nH+E6bFPGh77/4lAnvWjwR1hsYtxL/9PyTtzKg7bz2Y7rifn2e7wu0cpFI
	O2nbaLBtBO2+Uqbzi15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqKeb-008Xso-JH; Thu, 25 Nov 2021 19:43:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqKeX-008XsT-Rg
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 19:43:31 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mqKeP-0002Mm-Pj; Thu, 25 Nov 2021 20:43:21 +0100
Date: Thu, 25 Nov 2021 19:43:13 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mt76: eeprom: tolerate corrected bit-flips
Message-ID: <YZ/nUd3pil+DQTjI@makrotopia.org>
References: <YZ/XvfwzqUyjmBCm@makrotopia.org>
 <8ed35f3f-b0a2-dd93-e78c-33233bc6497a@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ed35f3f-b0a2-dd93-e78c-33233bc6497a@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_114329_940201_6EE606FD 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, Nov 25, 2021 at 07:44:26PM +0100, Felix Fietkau wrote:
> 
> On 2021-11-25 19:36, Daniel Golle wrote:
> > mtd_read() returns -EUCLEAN in case of corrected bit-flips.
> > As data was read, don't error out in this case.
> > 
> > Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > index 2d58aa31db934..0eb98f7ff7ec0 100644
> > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > @@ -65,7 +65,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
> >   	offset = be32_to_cpup(list);
> >   	ret = mtd_read(mtd, offset, len, &retlen, eep);
> >   	put_mtd_device(mtd);
> > -	if (ret) {
> > +	if (ret && !mtd_is_bitflip(err)) {
> I don't think this will even compile (err vs ret)

Oops, that has sneaked in when making use of the macro last minute.
I'll send v2.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
