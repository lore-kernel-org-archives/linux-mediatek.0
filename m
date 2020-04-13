Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB994C2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 14:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3B52072C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 14:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDienOM5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uxk6Tc+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3B52072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BK+7h1Iq0FXnes3o4/TghmPuLC7MtjF34hPYaeYJws=; b=HDienOM5qlFonz
	3CTsreuYPK+eMe29YPdyYhsgkI1NgYzjJ5+zyu0f/iNTAQKXakEjjVL2XqaHZQO7JoFGEbbSkE9GD
	JXjjlk0lFXOA8rwtARpwfyuJLR1G0Ml5lY1IPpZuSXqw25kSk149zj3aDGmQpTLKyfsyqxH858Grb
	bQ0DYndysYi5DK+/Sb67GuHmnXO6oE0VHuz2BGWKtGP5kjAFz8GwjY/ooWHr94dZvQDG0YFLBWsAx
	oZL8C/phnLJmtbRfFaDJbhZviYjs2e7K+3lP3cZIBVmstPUjI9cpnqYngvTxOHu27s4WXNG5bZbhp
	4hDt1VVpeCttZ3oIRzgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO0AE-0007ht-VY; Mon, 13 Apr 2020 14:34:18 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO0AC-0007gw-IL
 for linux-mediatek@lists.infradead.org; Mon, 13 Apr 2020 14:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586788454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EqyFmXGGL5gH7qnh4uLURlAxbznvoOmx0g2Mhp4F6Po=;
 b=Uxk6Tc+oWKKAsGPlwJ43iq94AL0RWGL23btlAUaOhNYBXb6d5xBYJwHR/q5+Z8hSl/v/80
 tJtwLDK4+7nZOgqTNxXi/JdMfjYosMvSNe3juuSu448qqlOVOrmOMGuxrkSMN7vzK0Hh4j
 sd6qEEZWFTygb1+7688AWQUOnch/MvA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-3nrCXUTQNriOwQhPhtNdEA-1; Mon, 13 Apr 2020 10:32:20 -0400
X-MC-Unique: 3nrCXUTQNriOwQhPhtNdEA-1
Received: by mail-vk1-f197.google.com with SMTP id i26so4244654vkk.21
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2020 07:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EqyFmXGGL5gH7qnh4uLURlAxbznvoOmx0g2Mhp4F6Po=;
 b=B1nj554BlDn0jPiKaSkI6Y7Fgm4PpHfD99+UCENxYaLWas8Ak3peeyl0nr+YhItE1G
 2Pu7qVVuIyM3fPL8LZi7An5HmxleZB2aVOZjNznhUyutN4RdhFyyxDDG0L1d/1qakyYM
 xp5LVnOQG3oWgbTAzv32gS9qGYoPd5KWN702WbPtTmVnMSocn0Q5YlA11PXdZrNWPlAD
 cLMCOqbQ2nMkAh+tWU18y3sFKdUmQUgB3xPJVBYtW4eUQrDkcgR+H5zGziyrSp92TwMQ
 wjgFpgKiPczD0y1J/G+CAuKFpCPLJ2rpeFIRDo2uBtjQaIc8n6GSVVXrW3wPeHBADJlQ
 kxew==
X-Gm-Message-State: AGi0Puap3XmEEMJQecEG2MjcblH2Dv6Tyz3Iy+eUkEFaTvSjUyJhDoiz
 37mF5P3hzU2xYIcEN6mIg4zqR9uy4DPuBjQD6ytUOaFWKmzQ5p3XT0oaJdci/3gGG9UhGAoMVPi
 FMWXgdsU1DuhU/TcUQCiJ8+3+Lr5R/i0ugdoVzhjx2pasCrfW
X-Received: by 2002:a67:ed14:: with SMTP id l20mr11552269vsp.233.1586788340015; 
 Mon, 13 Apr 2020 07:32:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzuR6Ua5fS/D+pEUWq54ijuuvcxRCg6rajTuAm7fR56pI8I+sx8N2oN9MaIiBTLp6D4yvnSaU8KiJFAq+oHk0=
X-Received: by 2002:a67:ed14:: with SMTP id l20mr11552251vsp.233.1586788339731; 
 Mon, 13 Apr 2020 07:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586451954.git.lorenzo@kernel.org>
In-Reply-To: <cover.1586451954.git.lorenzo@kernel.org>
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Date: Mon, 13 Apr 2020 16:33:12 +0200
Message-ID: <CAJ0CqmXQM-NvadLJF1=vVKTABUQOiUGrwhEoVPtnK0oc=QyGMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] introduce usb support to mt7615 driver
To: Lorenzo Bianconi <lorenzo@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_073416_681912_A7CB0344 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>
> Introduce support for mt7663u 802.11ac 2x2:2 chipset to mt7615 driver.
> Create mt7615-common module as container for mmio and usb shared code
>
> Changes since v1:
> - rebased ontop of mt76 master branch
>
> Lorenzo Bianconi (2):
>   mt76: mt7615: move core shared code in mt7615-common module
>   mt76: mt7615: introduce mt7663u support

Hi Felix,

please hold on with this series, I will post a new one rebased ontop
of mt76 master branch

Regards,
Lorenzo

>
>  drivers/net/wireless/mediatek/mt76/Makefile   |   2 +-
>  drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
>  .../net/wireless/mediatek/mt76/mt7615/Kconfig |  18 +-
>  .../wireless/mediatek/mt76/mt7615/Makefile    |  10 +-
>  .../wireless/mediatek/mt76/mt7615/debugfs.c   |   1 +
>  .../net/wireless/mediatek/mt76/mt7615/dma.c   |  39 --
>  .../wireless/mediatek/mt76/mt7615/eeprom.c    |   1 +
>  .../net/wireless/mediatek/mt76/mt7615/init.c  | 192 +--------
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   | 249 ++++-------
>  .../net/wireless/mediatek/mt76/mt7615/mac.h   |   5 +-
>  .../net/wireless/mediatek/mt76/mt7615/main.c  |  66 +--
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  18 +-
>  .../net/wireless/mediatek/mt76/mt7615/mcu.h   |   5 +
>  .../net/wireless/mediatek/mt76/mt7615/mmio.c  |  30 ++
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  22 +-
>  .../wireless/mediatek/mt76/mt7615/pci_init.c  | 187 +++++++++
>  .../wireless/mediatek/mt76/mt7615/pci_mac.c   | 184 ++++++++
>  .../net/wireless/mediatek/mt76/mt7615/regs.h  |  26 ++
>  .../net/wireless/mediatek/mt76/mt7615/usb.c   | 396 ++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7615/usb_init.c  | 144 +++++++
>  .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |  93 ++++
>  21 files changed, 1257 insertions(+), 432 deletions(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
>
> --
> 2.25.2
>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
