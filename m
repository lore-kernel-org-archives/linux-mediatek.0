Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1B9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 14:27:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2AE64E5C
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 14:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2AE64E5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XB7Q1eBrnQr05AejggvbI2gglWLZBirpkKyT/jsAII4=; b=l5uk9yyvZhEuSnS4bZapTqqQi
	gfXmpggUvoRJfYN4Enu/5l+8fJhB6rNmZhhPYeg/t96HYH6oOnRQn4ikmRwhJZAJHJ8m+i40u7j2x
	AbgL9CO4yJkXzZbp5rVwlYcQbcFfx3/A8PZrrhT6D0wA0uYwafGRhV1VQupIONSYQs3bI0OX9Y9f1
	TD6zyAKcg8wCC00JoIvF4sVYBiQYxvu2D4Z5PLtGkHz5C9mcQ/t6nx/lOi4LhWKF6AyJo5PBNS12T
	yncWbw4pm2kJupDSANHzvSWGJFgYpWMee3fH6nSSmJuSVfPeG0gC6FVWQnT9miTy/HDA4vt0ED7km
	yjDUPnyqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEYeV-0003dl-S9; Tue, 23 Feb 2021 14:27:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEYeT-0003cf-7W
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 14:27:02 +0000
X-UUID: e1cec04d5749403293321863806de698-20210223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CLesqB4Joy9jR+iPKmM1ObofPqxpQ5q//oLAgblgD5M=; 
 b=M7pocVhMd9vlFcbbNlL5FOvcApHOs1oVx2nF9vwARN5N8/PVxM9uyhIw6XSMcVDEdzWpD+ulHTDcgWPmd8wFcb1t18Hdd68HyFP1G1MnQ1UlX15+oHao9foWhikYBAkows1H+IgenD6b3TqJqFqaVs+gGklfh7l2FxI1+7wIxLY=;
X-UUID: e1cec04d5749403293321863806de698-20210223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 475688575; Tue, 23 Feb 2021 06:26:54 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 06:16:52 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 22:16:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Feb 2021 22:16:50 +0800
Message-ID: <1614089810.6667.7.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] mt76: mt7615: remove hdr->fw_ver check
From: Ryder Lee <ryder.lee@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 23 Feb 2021 22:16:50 +0800
In-Reply-To: <YDTG6xGgCjbinhte@lore-desk>
References: <61d40a20375f888c122ee0e186168fc2db863fc3.1614058187.git.ryder.lee@mediatek.com>
 <d0ed6b4f2dbac66ac9e31f3725bc4db5cc50f1f3.1614058187.git.ryder.lee@mediatek.com>
 <YDTG6xGgCjbinhte@lore-desk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E703899C3C53470BE47EEE8151A47F80A15AD4E0526457DD38AFCDE7A5449DA12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_092701_474301_D6259E76 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-02-23 at 10:12 +0100, Lorenzo Bianconi wrote:
> > Only mt7615 uses v1 version. Also, some of released firmware doesn't
> > have hdr->fw_ver.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > index 393ce09d3956..65c6ab14fe6f 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > @@ -1449,8 +1449,7 @@ static int mt7615_load_n9(struct mt7615_dev *dev, const char *name)
> >  		 sizeof(dev->mt76.hw->wiphy->fw_version),
> >  		 "%.10s-%.15s", hdr->fw_ver, hdr->build_date);
> >  
> > -	if (!is_mt7615(&dev->mt76) &&
> > -	    !strncmp(hdr->fw_ver, "2.0", sizeof(hdr->fw_ver))) {
> > +	if (!is_mt7615(&dev->mt76)) {
> >  		dev->fw_ver = MT7615_FIRMWARE_V2;
> >  		dev->mcu_ops = &sta_update_ops;
> >  	} else {
> 
> so there are some v2 fw version w/o fw_ver field, correct? Is this fw in
> linux-firmware?
> 
I will post it.

Actually all MTK stock firmwares don't include that version info, so
considering users may use binaries from some manufactures. I think this
can make life more easier. This patch should work for all firmwares we
can find everywhere. Even 7615 v2 can be backward compatible to v1. 

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
