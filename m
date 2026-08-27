Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3937C5DF9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=; b=FPnntu9aCbX8AgLxgjckLlrTAs
	wxOVAS6rrGObC2v7+7t3erPehjyei1cze5K4lSWx7uYxCRsBPkhcgtff0fZlfhhFt83VrIxi00bkk
	8Hd0BqWMr3wcS+0sR7RhaiQBjuwSX9t7w/QWPBBwiTP5wnvNWqr8eFSctQM8AymXWqX0BsfdHAjkN
	XwlIbQe7NOZfhWjZMlQT+vhOwe5URTCJQfczJaknjFfkbc7Dw1lIX3g4TONdjOWfunO+PkQKkTPyI
	oEMNOHSlHQMZXix9M80w5MRzCab8uA4Pyt+xzQeVB1DAztbVTE63OcDukIFX4flea5t1egNqfRwya
	0T+/MAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVP4-00000003d60-2ri6;
	Thu, 27 Aug 2026 08:24:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVP2-00000003d5Z-1b1E
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 08:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787819043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
	b=XN8A2ypArsPssEjGL4cwe3d3+RsGOMGdrEZEk56DgZaevI0GiuY4PGUynue++Yl0iFZhVX
	XlssKPkw4DBci6DKUpgS4Q2gtaRJC/0FTp7gy4mKa7uSVbERAd4gFv4JebRHnfxiiDVHnw
	UFXjcdTRxLALBFBt9n/hBPDMyMe+zCU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-nB7uPZ6fMxGKH-ol6gb16w-1; Thu, 27 Aug 2026 04:24:02 -0400
X-MC-Unique: nB7uPZ6fMxGKH-ol6gb16w-1
X-Mimecast-MFC-AGG-ID: nB7uPZ6fMxGKH-ol6gb16w_1787819041
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482e8a59be6so23730f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 01:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819041; x=1788423841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
        b=lwPtD5Qp535SMbWBJ5qONh5kBgSg0+P+SlGMxf4gmZvNhVlZMYY/Qn9ivXCqwY2RK2
         qIJAWTPnfQZj5OImGgQGmfkgVKR6RazcEI+FjcCTlWLTWCFiDRdWWKSeTEp3pm35qPn/
         FqbtVAYlXcy2GS7QsTUs8WkrIO4M+ylQIgFrt0vA6yr5JwxiHz/+ku40jXqtOwLnLrSA
         f6EU8NPDXL9b3AWehWZg1xNYJCv2whsv+VoDp5JIk/pq9Zmk9djh4cxRQ1BVId+oRCNZ
         GRBRp0bZ258CuDxDHG4JG+tboSq/ONBVMb67DzdVl77C7EZsZEBVbTHBQXJnhCF48mVz
         yVEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAappQSxLS0xhfl+SZYQFOAfhcWsgEV/TKUE1mR8KRjCSEJOZR1WXvGLzQb5ninI9mgYPhURCkGKVedlJdVQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kO6ZGqB1dH98nwPYIO1ur9giutSuKF9d0y78feywU5qrxKJmHQ
	JNk0yvZA9R10arwEZAbZ5Wqamcf0ktceZzrcZ2fq+mifRwT8sIFUIlf4h9zknCaA0lt8hL2XwYr
	Tb35ESDJKVzrv/5OlWns79U0Iis+8Po72bLruZJC1lubQqwC4LJ8M14/rzk6fMEF/C1FhQpF6mw
	==
X-Gm-Gg: AR+sD11tvUrADFQyciPuZ/sDg/AIWEcTZWYFPcz1ybbsP9VstY2rHTmI5bJm4KtDpRF
	ocFbPT+/ae3SB/JbLrZKyp6CFBkQxteG8BnLAyNRBRmANvUm4L0cULzGyrxhPa3Afo7JJAe6Jrc
	OVSNGpfuH7sM6PV9LfENCtxK7LxMhzVJneXIEUH8t3vgv36WRloqyZ6UY1GQANf9WZ8PJepe0sX
	ybU2I5/UyRWNeAownJHGpK0ZTJU4nx7qA3xZmNKl91lA1TeRxBsHRZlqXYN2hmfti+eu6zSz8hF
	ALoJn453eiLsxPMDzRiW/5XnRW9XK79fX6Lc39r3rWGzmix5SAHUnHmn/vfk5KxnAxITVN5pfE0
	tDNViXxZR9ldts2oJQs1kxZwpsZDbss9G0ZC7HLuqWMW1H4LyqV031vjCfrVxsWfGMVDxczg=
X-Received: by 2002:a05:6000:4543:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-482e26d99efmr12170107f8f.20.1787819040897;
        Thu, 27 Aug 2026 01:24:00 -0700 (PDT)
X-Received: by 2002:a05:6000:4543:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-482e26d99efmr12170052f8f.20.1787819040481;
        Thu, 27 Aug 2026 01:24:00 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm7526943f8f.6.2026.08.27.01.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:23:59 -0700 (PDT)
Message-ID: <96bd39b4-136b-4941-9cb8-3e35c5680f0a@redhat.com>
Date: Thu, 27 Aug 2026 10:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 1/2] net: phy: mediatek: differentiate MT7530
 GE PHY from EcoNet FE PHY
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 daniel@makrotopia.org, naseefkm@gmail.com, joey@tinyisr.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827065930.2618729-1-cjd@cjdns.fr>
 <20260827065930.2618729-2-cjd@cjdns.fr>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260827065930.2618729-2-cjd@cjdns.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dqkRVATLmOd85Kdk5vq61fUdeQc_C6DGH9VYG3_rBTs_1787819041
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_012404_569212_1707653F 
X-CRM114-Status: UNSURE (   7.44  )
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

On 8/27/26 8:59 AM, Caleb James DeLisle wrote:
> MT7530 gigabit PHY has the same ID as an EcoNet EN751221 10/100
> PHY. Differentiate by checking whether the PHY supports 1000BASE-T
> which is always supported by MT7530.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


