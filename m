Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B14EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnyMdq/zCg6afoxn4K3WFZZVONqCI8++yxt5PZrSnEk=; b=Wkc8Mt8Uk7Cl8SeMOr2T8GOU66
	M1QZSbSVe/0RRGF2SynWD2VBHtUhiTLzxRKs2Vg5YWQzyDjUN5r7QX/4BWmP6aAqa8KHY3JGYsotN
	V3fZxFLHUtXbfrnwJne6edyPp3Mtyb/KI9HFFsMi1hdRAUPgr9/jKvTgzpiMjJlIlakgYIT6W7gOd
	v54eYj25GLKDb9qrO2GN4g9uQWtrl7Tm1LDOeTgn6gPWr0MBlRXqgY5yLLEO+LWeY1jVJPCDfKwx/
	/CBmOxV4HEUJpTAEpABpFts7xyjkZXusnRnPjHIqTYTjuYNQivFlFXqEvL+5EWzgA4FCmZkqSf2i3
	7TprHKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGeBz-00D81g-0w;
	Tue, 04 Jul 2023 11:27:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGeBx-00D80A-0Y
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 11:27:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so8495894e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jul 2023 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688470049; x=1691062049;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nnyMdq/zCg6afoxn4K3WFZZVONqCI8++yxt5PZrSnEk=;
        b=f30roDxd0/BTdGzbX9TEKt65h4s4jSNpEisuzK9By6lfblCPOYok6aScqg/rDCFD5g
         HUlA8LYh7Rfi+6EaG9F2UmNOjtyMLAfRHYsaIOaiTn4A2tnv5vVRBAokLjPXCOT+L3Jg
         iCZTOFMUrSBvYI8Wz63qgfLqYvTG16btmtxyFjbqIZ8Tg0wdqCaIrIL4GZU8eLzrw13v
         G0VsuVJT4T5gtAAnJrmcS6yRUjXWLVHGAS1xDxXoSwK9quS1Khhc+MOfnvcp1gUtkA+X
         VCkoOaTLa9/CAbA7NpVVH1WNWSBjS2CKZUeU4GswyKzKa0YHGIeSoudLCxCW9dcoKAjn
         Kl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688470049; x=1691062049;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnyMdq/zCg6afoxn4K3WFZZVONqCI8++yxt5PZrSnEk=;
        b=W6/nFncLUv1OtpiYKvXip8HxadIRYHnfRnHZSkWltwA+nX6GEHBvxHXhJkKooe7rPi
         E7+CPCGUC9yjo8DyfG+fhLAhHEDbczi2LyAjanjGBhWg1EH1fFCyqtKpq6fZsftIachE
         AuipaNnAw6GAscnvmFoOPpKr0ymU8xUhCEzu4yEz7gisvdE584HfoLuefJ3siKelZBM3
         IDOuhXBChhzDoMGfowVMG7gCSTBmiAfWJ5jY+mpqonXBnaPsdjgcCTy4VLC7HSPgBH/u
         1i82Q1W1XYNXRq6KvwqXLfrbLznF/+INZtlcZqWDfkE1503vXUIt2r8e0HBapIez+nMi
         /jig==
X-Gm-Message-State: ABy/qLbUNbki87T34iMSIU/BVn8FVM6Sj3nBLkB8COnr/Kxb7AqrE4z7
	eO2qmeYrI7hhzUqJbiiDI0dBX5pXkdLgVlKlMFo=
X-Google-Smtp-Source: APBJJlHOIEgsXs6yY3qROZzIj2Mx1Q2TN045Joa2hhomcE5NNXX3JPBvo8wbCt7qNWkxL3sl4WLusQ==
X-Received: by 2002:a05:6512:3da2:b0:4f8:7781:9870 with SMTP id k34-20020a0565123da200b004f877819870mr11931360lfv.60.1688470048818;
        Tue, 04 Jul 2023 04:27:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n5-20020adfe345000000b0030e5bd253aasm28106018wrj.39.2023.07.04.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 04:27:27 -0700 (PDT)
Date: Tue, 4 Jul 2023 14:27:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: nbd@nbd.name
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] mt76: mt7915: add support for passing chip/firmware
 debug data to user space
Message-ID: <8ea4bced-068a-493c-9634-09ad9bf76621@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_042733_250331_6AAF35FA 
X-CRM114-Status: UNSURE (   6.71  )
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

Hello Felix Fietkau,

The patch 988845c9361a: "mt76: mt7915: add support for passing
chip/firmware debug data to user space" from Dec 26, 2021, leads to
the following Smatch static checker warning:

	kernel/relay.c:798 relay_flush()
	warn: sleeping in atomic context

Both the mt7915 and mt7916 drivers have this bug.

drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
  1263  static void
  1264  mt7915_debugfs_write_fwlog(struct mt7915_dev *dev, const void *hdr, int hdrlen,
  1265                           const void *data, int len)
  1266  {
  1267          static DEFINE_SPINLOCK(lock);
  1268          unsigned long flags;
  1269          void *dest;
  1270  
  1271          spin_lock_irqsave(&lock, flags);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Holding a spinlock.

  1272          dest = relay_reserve(dev->relay_fwlog, hdrlen + len + 4);
  1273          if (dest) {
  1274                  *(u32 *)dest = hdrlen + len;
  1275                  dest += 4;
  1276  
  1277                  if (hdrlen) {
  1278                          memcpy(dest, hdr, hdrlen);
  1279                          dest += hdrlen;
  1280                  }
  1281  
  1282                  memcpy(dest, data, len);
  1283                  relay_flush(dev->relay_fwlog);

Flushing is a sleeping operation.  It takes a mutex.  It can't be done
while holding a spinlock.

  1284          }
  1285          spin_unlock_irqrestore(&lock, flags);
  1286  }


regards,
dan carpenter

