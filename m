Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D52CC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 20:59:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3971F610FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 20:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3971F610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvO3pjhZS6wR5OqHB1zPbmbT37VAalQpYH+iIcYciKQ=; b=TePq/f1j8Wqh+P
	5X7kajUXEAjz4UbFwfU+/pcCUIlAngCQo33wgd7Q4/1M/991gQU/F9JhBlpqqGGN0dMO1eQm+GC01
	Ir+jaz3Kzy5QH+oG8bJeVNrVtyccSpwSqKS7SYNVWvFbCMFwiwCK5qkmGXjVXd0jv7dxnQq2wImEC
	nLt2Ja6G/kXuSyhhplEtk8JWKXG87Pf8F6dJbYfbkgn5PopGNz43StRwq1iwebeVx1kS7DArtIN8I
	LV1kJLxcQG+IKhrcVG4feuz88t0pQ62GYwxzy8/U860ImJmswJfIpbICk69Zq+5Km/0USLw0VqX8V
	GO4UsJj3XOtb0K4L19uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAf1y-000EPG-FO; Mon, 02 Aug 2021 20:59:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAf1k-000EMW-0L; Mon, 02 Aug 2021 20:59:13 +0000
Received: by mail-ed1-x52b.google.com with SMTP id n2so26247835eda.10;
 Mon, 02 Aug 2021 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w+kjeXZn22Jr79nUGbix7ah/oSHxdioLF/ZCkl2Qub4=;
 b=q9nemMRF/WSOv+S3b/pGwEpZvXruqpf++H8j70fVBSnlwIpv1taA9OCzTyFsY9vCzA
 Hx4o8eXwqyVsauqgTyQ0EaZi34B5MrwytQIPv0+p5ODgyG4RZSwxztKW1jXgQ7ejvVlq
 234NpGtbrFngZaqL5g0uPZqRuhbBz4FUBUJAHqXkvL0hmZX5AIzqNhClFegwv+mc5PeK
 zQlbjihmAOTdT6PeiFB46OgCiIiwNZT3DUP5GmPX5s0rWgYqy5tkpArIxFclX0vun91r
 YvC1qgs8AAE+P7zMzqA5KFJkeRImFCtLdtHHktjiOpiuFM4HML5dO6EBZfTNz3tJuO09
 q99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w+kjeXZn22Jr79nUGbix7ah/oSHxdioLF/ZCkl2Qub4=;
 b=ZsMZ0C3L4aRJoiCFZSpN8onO8A1QP+pVW94jA69xiYKU7OyDXtZ7DHUCpsqOWnzj5V
 YDkDoe7/9PTncL+9GRMD9V1MeqE221CnUXjW4xgVAU8Sdl91oNrqREVwbjaxoKU2EO0S
 3NNsFy22v2p0rC+TN1xivk5Ce7CZu3yeLnd+xIx7Lj3T2R4mn0gP8huRcoFwi67B3gO/
 ujkfrdqalof9/JR3/tjoCdBr3xnuVPVoGwmw0cNj8eKJk0gwU4gtFaYW2DnMvq6pSwHP
 Y78clMUWidXZrgwhjWhMsOM4OP/B9E92wfK448t1IkRdBdfEtX6+MXAbJRL9f1TGDirK
 9Nxg==
X-Gm-Message-State: AOAM533Ok/or2q8cRHOBIFXJZgmMEmb5oArSOm02FYvX41BOOmiCKLgh
 OlDuz4+X/afjrf4KiYhU50c=
X-Google-Smtp-Source: ABdhPJxjms0X24JkdPMRhTWj+Di0kYgwkkrV0BbXstM0ANBHXMWsT+FTOdCVkDSPzkC2EulX+M60jg==
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr21666585edb.36.1627937950208; 
 Mon, 02 Aug 2021 13:59:10 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id w6sm6881617edq.58.2021.08.02.13.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:59:09 -0700 (PDT)
Date: Mon, 2 Aug 2021 23:59:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 4/4] Revert "mt7530 mt7530_fdb_write only set
 ivl bit vid larger than 1"
Message-ID: <20210802205908.queaqshisqk24pkf@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-5-dqfext@gmail.com>
 <20210802134409.dro5zjp5ymocpglf@skbuf>
 <20210802154838.1817958-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802154838.1817958-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_135912_118046_FAC4C29E 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Aug 02, 2021 at 11:48:38PM +0800, DENG Qingfang wrote:
> On Mon, Aug 02, 2021 at 04:44:09PM +0300, Vladimir Oltean wrote:
> > Would you mind explaining what made VID 1 special in Eric's patch in the
> > first place?
>
> The default value of all ports' PVID is 1, which is copied into the FDB
> entry, even if the ports are VLAN unaware. So running `bridge fdb show`
> will show entries like `dev sw0p0 vlan 1 self` even on a VLAN-unaware
> bridge.
>
> Eric probably thought VID 1 is the FDB of all VLAN-unaware bridges, but
> that is not true. And his patch probably cause a new issue that FDB is
> inaccessible in a VLAN-**aware** bridge with PVID 1.
>
> This series sets PVID to 0 on VLAN-unaware ports, so `bridge fdb show`
> will no longer print `vlan 1` on VLAN-unaware bridges, and we don't
> need special case in port_fdb_{add,del} for assisted learning.

All things seriously worth mentioning in the commit message.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
