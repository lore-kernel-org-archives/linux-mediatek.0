Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFACC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 06:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvyi09WPdyQ3M8UH7hIOQDQySoKcQHJSRonU/fnJjNY=; b=nmhrs3Qw2e59v8
	KIKYuGbTbGlvkY9KpgGmlwrxvxcPzci+vxQHJDkyIX+sNngiRBkBoyznARO4wIVmQTDuLP3b5Xb57
	zPIBSLpPFXVpWCoNlPUf+QbMSRoTPkRc+JdInq4z7ePqUAP4rdM0NPIT7td6OUaun2d51Ol+10aDz
	3/CtK2q13Nuij1aliYDy5s6JOZSFrQnpsrCdanBCNXFhsVm4ZS8psYuIgwpFwL6TGkNsjKd8Ap77+
	kN9sXda1jS+mzqolHLXJLPWilsr5XnxSGghkml66S3b0Wl24Wc01fwjEfwFwNfXyctZcMaRrBBr0P
	OXZzuFSQGwNBoX3E2iNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7WnA-001EaK-LU; Wed, 12 Jan 2022 06:07:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Wn2-001EY4-D7
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 06:07:23 +0000
X-UUID: 5fea295176994ab3b570b7ef301a7330-20220111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YqD8SOJgcaAdTlvaf9jG6Uqi1/BgXvA6PM+t37sJ6Ho=; 
 b=js3qdirHfa/Td7xZfOMA3+fHSOsAX6KnL3pYqBFrlKtuaqCsVBGec/srrcIRp05Px6sXqJJqw94MEoHdM8/Se5lH3IDqt2c6U5poeOBOVRUxVmQqE0RzBwSdh8Y04l7Gl6gtDAktsMLW0dAuMKD8MniCyUWqukDRMNKYqOoSZvc=;
X-UUID: 5fea295176994ab3b570b7ef301a7330-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2028423220; Tue, 11 Jan 2022 23:07:16 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 22:07:15 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 14:07:12 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 12 Jan 2022 14:07:11 +0800
Message-ID: <eb8ea30914511d6effda1412775dfcf520a68ad6.camel@mediatek.com>
Subject: Re: [PATCH v2 3/5] mt76: mt7915: add support for MT7986
From: bo.jiao <bo.jiao@mediatek.com>
To: Kalle Valo <kvalo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
 <linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, "Xing
 Song" <xing.song@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Date: Wed, 12 Jan 2022 14:07:11 +0800
In-Reply-To: <87fspujked.fsf@tynnyri.adurom.net>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
 <87fspujked.fsf@tynnyri.adurom.net>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_220721_883846_A67B6A0E 
X-CRM114-Status: GOOD (  12.91  )
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

hi Kalle,

got it, i will fix it ASAP.
thanks.

On Tue, 2022-01-11 at 18:40 +0200, Kalle Valo wrote:
> Bo Jiao <bo.jiao@mediatek.com> writes:
> 
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > 
> > This adds MT7986 SoC integrated multi-band 4x4 WiFi 6/6E.
> > 
> > Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> > Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> [...]
> 
> > +static int mt7986_wmac_adie_patch_7975(struct mt7915_dev *dev, u8
> > adie)
> > +{
> > +	if (/* disable CAL LDO and fine tune RFDIG LDO */
> > +	    mt76_wmac_spi_write(dev, adie, 0x348, 0x00000002) ||
> > +	    mt76_wmac_spi_write(dev, adie, 0x378, 0x00000002) ||
> > +	    mt76_wmac_spi_write(dev, adie, 0x3a8, 0x00000002) ||
> > +	    mt76_wmac_spi_write(dev, adie, 0x3d8, 0x00000002) ||
> > +	    /* set CKA driving and filter */
> > +	    mt76_wmac_spi_write(dev, adie, 0xa1c, 0x30000aaa) ||
> > +	    /* set CKB LDO to 1.4V */
> > +	    mt76_wmac_spi_write(dev, adie, 0xa84, 0x8470008a) ||
> > +	    /* turn on SX0 LTBUF */
> > +	    mt76_wmac_spi_write(dev, adie, 0x074, 0x00000002) ||
> > +	    /* CK_BUF_SW_EN = 1 (all buf in manual mode.) */
> > +	    mt76_wmac_spi_write(dev, adie, 0xaa4, 0x01001fc0) ||
> > +	    /* BT mode/WF normal mode 00000005 */
> > +	    mt76_wmac_spi_write(dev, adie, 0x070, 0x00000005) ||
> > +	    /* BG thermal sensor offset update */
> > +	    mt76_wmac_spi_write(dev, adie, 0x344, 0x00000088) ||
> > +	    mt76_wmac_spi_write(dev, adie, 0x374, 0x00000088) ||
> > +	    mt76_wmac_spi_write(dev, adie, 0x3a4, 0x00000088) ||
> > +	    mt76_wmac_spi_write(dev, adie, 0x3d4, 0x00000088) ||
> > +	    /* set WCON VDD IPTAT to "0000" */
> > +	    mt76_wmac_spi_write(dev, adie, 0xa80, 0x44d07000) ||
> > +	    /* change back LTBUF SX3 drving to default value */
> > +	    mt76_wmac_spi_write(dev, adie, 0xa88, 0x3900aaaa) ||
> > +	    /* SM input cap off */
> > +	    mt76_wmac_spi_write(dev, adie, 0x2c4, 0x00000000) ||
> > +	    /* set CKB driving and filter */
> > +	    mt76_wmac_spi_write(dev, adie, 0x2c8, 0x00000072))
> > +		return -ETIMEDOUT;
> > +
> > +	return 0;
> > +}
> 
> I commmented about this monster in v1, see my comments there.
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
