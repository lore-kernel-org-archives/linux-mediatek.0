Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDBFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 23:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eWdYeAABAMnoEoSZbvIqfAvjGuNN+NLL8O7DVcc5tw=; b=Sr99QpUo6PRSKrgXoFJTz4sEG7
	J/cJ8S3021GZlux/XwC1n4lnhAjvYqogocW8pPgS367sSljsjAIhnxVWdC4eoilBWODoG9RUe+bB1
	RGRmRlBWlIjju22sU2IZtDGmoo6KOyjlgnuDdUVOOkFpEl3U4zXzzCKQRXoA/HkoGj+CY8VGSVLAt
	PeZuZdDm05JkIhilHsyUsLNS+SWJU186h7y3i9HnrqDitPFHGfMNhVZLkbHZSff8YOCBDE2nUOPkU
	/XM3UcCXNFPaXJPd6yt+KTevTJyOMhFk7LRYlquRMY2CmuHUw5gD3+h3amM9JYtFhnJ1Wiv75P5xD
	OugCRp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1F5U-001blj-6G; Fri, 02 Dec 2022 23:04:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1F5R-001bkj-22
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 23:04:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id 140so6243389pfz.6
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 15:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3eWdYeAABAMnoEoSZbvIqfAvjGuNN+NLL8O7DVcc5tw=;
        b=LPDjcXKRkJF0ChWSvwqdMs4z+WaNIJwO0yY5Q59nGeM3pDMHVwIb6cPYLQgWVJguAB
         ciAtCM4G0YFdDjeGOSSxDSrCrEHGWnroQqTT/uQy4yjM39FpLTUwFW+H4Sr88a8juay4
         4lauU6rk4+hFPwNW6zqanjTHmoMbiFkIJBgIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eWdYeAABAMnoEoSZbvIqfAvjGuNN+NLL8O7DVcc5tw=;
        b=pelxbzQAuY3jvc/thgigIeKjcL/GSriUHc+mWelUMaGmA2/iNrw18LSrEDQM8kIPqu
         Kive8H9OpElS36TBjVryEBK94M6nTME5c933R9bRoqMD+fqwrFKsYlhf23hnbEcwecfW
         8uP5TbEip/+cQSeNZV7DV9DRgrsqnrjBir+ojKv5hqM3eehq4xGa+NhBshPyJMBVlSSW
         Gn+PVHpZXS/2TQKoAeULD9baJj9NHwVV7000m4h+Fg/5i2njQ65MB0T+bcBErBCzTms1
         v/ucJrXQxdpd2alRl9OYADeL2gfdesMvZTMl88L1LBLk2jmGyNlHAaPx8Ev+ZT3XRidv
         ybvg==
X-Gm-Message-State: ANoB5pkBIh/udeP3OR2kGmry1rHNqt+PKEaAvFzIkmEDvcW4sHjweOYK
	MQO0CjLrWJniJKNr21E0JUUaow==
X-Google-Smtp-Source: AA0mqf6wCldb+aTkXQCqBjXUJrvffCgFhxrhyXTrWtI0GxUZ1d4eeeVzDPxJ8FdEPH3kPGZuS+RPDw==
X-Received: by 2002:a63:e34b:0:b0:477:de0a:3233 with SMTP id o11-20020a63e34b000000b00477de0a3233mr34109179pgj.467.1670022291026;
        Fri, 02 Dec 2022 15:04:51 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090a4d0300b00218998eb828sm7058622pjg.45.2022.12.02.15.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 15:04:50 -0800 (PST)
Date: Fri, 2 Dec 2022 15:04:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: Bo Jiao =?utf-8?B?KOeEpuazoik=?= <Bo.Jiao@mediatek.com>,
	MeiChia Chiu =?utf-8?B?KOmCsee+juWYiSk=?= <MeiChia.Chiu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"gustavo@embeddedor.com" <gustavo@embeddedor.com>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	Sean Wang <Sean.Wang@mediatek.com>,
	"kvalo@kernel.org" <kvalo@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	Sujuan Chen =?utf-8?B?KOmZiOe0oOWonyk=?= <Sujuan.Chen@mediatek.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: Coverity: mt7915_mcu_get_chan_mib_info(): Memory - illegal
 accesses
Message-ID: <202212021504.A1942911@keescook>
References: <202212021424.34C0F695E4@keescook>
 <1a16599dd5e4eed86bae112a232a3599af43a5f2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a16599dd5e4eed86bae112a232a3599af43a5f2.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_150453_185554_7C7776B0 
X-CRM114-Status: GOOD (  22.21  )
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

On Fri, Dec 02, 2022 at 10:56:19PM +0000, Ryder Lee wrote:
> On Fri, 2022-12-02 at 14:24 -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected
> > by
> > Coverity from a scan of next-20221202 as part of the linux-next scan
> > project:
> > 
> https://urldefense.com/v3/__https://scan.coverity.com/projects/linux-next-weekly-scan__;!!CTRNKA9wMg0ARbw!j7j_C0KpO4VD2yMOodvpeIexTGq4fhy2yq6nokNua9u4LToiUOLk4ou8JFFNrXkrh80d5BK2k44faRQstHE9$ 
> >  
> > 
> > You're getting this email because you were associated with the
> > identified
> > lines of code (noted below) that were touched by commits:
> > 
> >   Thu Feb 3 13:57:56 2022 +0100
> >     417a4534d223 ("mt76: mt7915: update mt7915_chan_mib_offs for
> > mt7916")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1527801:  Memory - illegal accesses  (OVERRUN)
> > drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:3005 in
> > mt7915_mcu_get_chan_mib_info()
> > 2999     		start = 5;
> > 3000     		ofs = 0;
> > 3001     	}
> > 3002
> > 3003     	for (i = 0; i < 5; i++) {
> > 3004     		req[i].band = cpu_to_le32(phy->mt76->band_idx);
> > vvv     CID 1527801:  Memory - illegal accesses  (OVERRUN)
> > vvv     Overrunning array "offs" of 9 4-byte elements at element
> > index 9 (byte offset 39) using index "i + start" (which evaluates to
> > 9).
> > 3005     		req[i].offs = cpu_to_le32(offs[i + start]);
> > 3006
> > 3007     		if (!is_mt7915(&dev->mt76) && i == 3)
> > 3008     			break;
> > 3009     	}
> > 3010
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> > 
> 
> I think this is a false postive as the subsequent check 'if
> (!is_mt7915(&dev->mt76) && i == 3)' should break array "offs" of 8.

Ah, okay. What if is_mt7915(&dev->mt76) is always true?

-Kees

> 
> Ryder
> 
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1527801 ("Memory - illegal accesses")
> > Fixes: 417a4534d223 ("mt76: mt7915: update mt7915_chan_mib_offs for
> > mt7916")
> > 
> > Thanks for your attention!
> > 

-- 
Kees Cook

